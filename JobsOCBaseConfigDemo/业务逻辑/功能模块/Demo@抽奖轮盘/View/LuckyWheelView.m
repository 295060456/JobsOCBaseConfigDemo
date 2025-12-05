//
//  LuckyWheelView.m
//  JobsOCBaseConfigDemo
//

#import "LuckyWheelView.h"

@interface LuckyWheelView ()

Prop_strong()UIView *plateView;
Prop_strong()UIButton *centerButton;
/// 真正画扇形的图层
Prop_strong()NSMutableArray<CAShapeLayer *> *sliceLayers;
/// 当前盘面角度（rad）
Prop_assign()CGFloat currentAngle;
/// 减速器
Prop_strong(nullable)ScrollDecelerator *decelerator;
/// 定时器（使用 CADisplayLink 模拟 JobsTimer.displayLink）
Prop_strong(nullable)CADisplayLink *displayLink;
Prop_assign()CGFloat timerInterval;
/// 手势
Prop_strong()UIPanGestureRecognizer *panGesture;
Prop_strong()UITapGestureRecognizer *tapRecognizer;
Prop_strong()UILongPressGestureRecognizer *longPressRecognizer;
/// Pan 拖动计算
Prop_assign()CGFloat lastTouchAngle;
Prop_assign()CFTimeInterval lastTouchTimestamp;
Prop_assign()CGFloat angularVelocityFromPan;
/// 减速率（默认 UIScrollViewDecelerationRateNormal）
Prop_assign()CGFloat decelerationRate;
/// 认为“停下”的角速度阈值（rad/s）
Prop_assign()CGFloat stopThreshold;
/// 回调
Prop_copy(nullable)void (^segmentTapHandlerInternal)(LuckyWheelSegment *segment);
Prop_copy(nullable)void (^segmentLongPressHandlerInternal)(LuckyWheelSegment *segment,
                                                           UILongPressGestureRecognizer *gr);
@end

@implementation LuckyWheelView

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self commonInit];
    }return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;

    _pointerDirection     = LuckyWheelPointerDirectionUp;
    _spinDuration         = 3.0;
    _timerInterval        = 1.0 / 60.0;
    _panRotationEnabled   = YES;
    _decelerationRate     = UIScrollViewDecelerationRateNormal;
    _stopThreshold        = 0.05;
    _sliceLayers          = [NSMutableArray array];

    // 盘面
    self.plateView = [[UIView alloc] initWithFrame:CGRectZero];
    self.plateView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.plateView];

    [self.plateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    // 中心按钮
    [self setupCenterButton];

    // 手势
    [self setupGestures];
}

- (void)setupCenterButton {
    self.centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.centerButton.backgroundColor = [UIColor systemGreenColor];
    self.centerButton.titleLabel.numberOfLines = 2;
    self.centerButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.centerButton setTitle:@"点我\n抽奖" forState:UIControlStateNormal];
    [self.centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.centerButton.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    self.centerButton.layer.cornerRadius = 30.0;
    self.centerButton.clipsToBounds = YES;

    [self.centerButton addTarget:self
                          action:@selector(handleCenterButtonTap:)
                forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.centerButton];

    [self.centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(60.0);
        make.height.mas_equalTo(60.0);
    }];

    // 长按手势给按钮做视觉反馈
    UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleCenterButtonLongPress:)];
    lp.minimumPressDuration = 0.8;
    [self.centerButton addGestureRecognizer:lp];
}

- (void)setupGestures {
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                              action:@selector(handlePan:)];
    [self addGestureRecognizer:self.panGesture];

    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                  action:@selector(handleSegmentTapGesture:)];
    self.tapRecognizer.cancelsTouchesInView = NO;
    [self addGestureRecognizer:self.tapRecognizer];

    self.longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                             action:@selector(handleSegmentLongPressGesture:)];
    self.longPressRecognizer.minimumPressDuration = 0.5;
    self.longPressRecognizer.allowableMovement = 12.0;
    [self addGestureRecognizer:self.longPressRecognizer];

    // Tap / LongPress 与 Pan 冲突时，让 Pan 优先
    [self.tapRecognizer requireGestureRecognizerToFail:self.panGesture];
    [self.longPressRecognizer requireGestureRecognizerToFail:self.panGesture];
}

#pragma mark - Property

- (void)setSegments:(NSArray<LuckyWheelSegment *> *)segments {
    _segments = [segments copy];
    [self setNeedsLayout];
}

- (NSArray<UIColor *> *)colors {
    NSMutableArray *arr = [NSMutableArray array];
    for (LuckyWheelSegment *seg in self.segments) {
        UIColor *color = seg.backgroundColor ?: [UIColor clearColor];
        [arr addObject:color];
    }
    return arr;
}

- (void)setColors:(NSArray<UIColor *> *)colors {
    NSMutableArray<LuckyWheelSegment *> *segs = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        LuckyWheelSegment *seg = [[LuckyWheelSegment alloc] initWithText:nil
                                                                textFont:[UIFont systemFontOfSize:14]
                                                               textColor:[UIColor blackColor]
                                                          attributedText:nil
                                                         backgroundColor:color
                                                        placeholderImage:nil
                                                          imageURLString:nil];
        [segs addObject:seg];
    }
    self.segments = segs;
}

- (void)setPanRotationEnabled:(BOOL)panRotationEnabled {
    _panRotationEnabled = panRotationEnabled;
    self.panGesture.enabled = panRotationEnabled;
}

#pragma mark - Layout / Draw

- (void)layoutSubviews {
    [super layoutSubviews];

    self.plateView.frame = self.bounds;
    [self rebuildSlices];
    [self bringSubviewToFront:self.centerButton];
}

- (void)rebuildSlices {
    // 清理旧图层
    for (CAShapeLayer *layer in self.sliceLayers) {
        [layer removeFromSuperlayer];
    }
    [self.sliceLayers removeAllObjects];

    // 清理旧 label / imageView
    NSArray<UIView *> *subviewsCopy = [self.plateView.subviews copy];
    for (UIView *v in subviewsCopy) {
        [v removeFromSuperview];
    }

    if (self.segments.count == 0 ||
        self.plateView.bounds.size.width <= 0 ||
        self.plateView.bounds.size.height <= 0) {
        return;
    }

    CGRect bounds = self.plateView.bounds;
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGFloat radius = MIN(bounds.size.width, bounds.size.height) / 2.0;

    NSInteger count = self.segments.count;
    CGFloat twoPi = (CGFloat)(M_PI * 2.0);
    CGFloat anglePerSlice = twoPi / (CGFloat)count;

    for (NSInteger index = 0; index < count; index++) {
        LuckyWheelSegment *segment = self.segments[index];

        CGFloat startAngle = (CGFloat)(-M_PI_2) + (CGFloat)index * anglePerSlice;
        CGFloat endAngle = startAngle + anglePerSlice;

        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:center];
        [path addArcWithCenter:center
                        radius:radius
                    startAngle:startAngle
                      endAngle:endAngle
                     clockwise:YES];
        [path closePath];

        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        UIColor *fillColor = segment.backgroundColor ?: [UIColor clearColor];
        layer.fillColor = fillColor.CGColor;

        [self.plateView.layer addSublayer:layer];
        [self.sliceLayers addObject:layer];

        // ===== 文本：整体“对准圆心” =====================
        CGFloat midAngle = (startAngle + endAngle) / 2.0;
        NSAttributedString *attr = [self attributedStringForSegment:segment];
        if (attr.length > 0) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.numberOfLines = 0;
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor clearColor];
            label.attributedText = attr;

            CGFloat textRadius = radius * 0.55;
            CGPoint textCenter = CGPointMake(center.x + cos(midAngle) * textRadius,
                                             center.y + sin(midAngle) * textRadius);

            CGFloat maxTextWidth = anglePerSlice * radius * 0.5;
            CGFloat maxTextHeight = radius * 1.4;
            CGSize maxSize = CGSizeMake(maxTextWidth, maxTextHeight);

            CGRect rect = [attr boundingRectWithSize:maxSize
                                             options:(NSStringDrawingUsesLineFragmentOrigin |
                                                      NSStringDrawingUsesFontLeading)
                                             context:nil];

            CGFloat w = MIN(maxTextWidth, ceil(rect.size.width));
            CGFloat h = MIN(maxTextHeight, ceil(rect.size.height));

            label.bounds = CGRectMake(0, 0, w, h);
            label.center = textCenter;

            CGFloat rotation = midAngle - (CGFloat)M_PI_2;
            label.transform = CGAffineTransformMakeRotation(rotation);

            [self.plateView addSubview:label];
        }

        // ===== 图片：文字外侧的圆形 ImageView ============
        if (segment.placeholderImage) {
            CGFloat imageRadius = radius * 0.8;
            CGPoint imageCenter = CGPointMake(center.x + cos(midAngle) * imageRadius,
                                              center.y + sin(midAngle) * imageRadius);
            CGFloat imageSize = radius * 0.22;

            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            imageView.image = segment.placeholderImage;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            imageView.bounds = CGRectMake(0, 0, imageSize, imageSize);
            imageView.center = imageCenter;
            imageView.layer.cornerRadius = imageSize / 2.0;

            // 如果你想支持网络图，可以在这里用你项目里的图片加载库：
            // [imageView <xxx_setImageWithURL:[NSURL URLWithString:segment.imageURLString] placeholderImage:segment.placeholderImage>];

            [self.plateView addSubview:imageView];
        }
    }

    // 中心标记小圆点（方便调试）
    CGFloat dotRadius = 3.0;
    UIBezierPath *dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(center.x - dotRadius,
                                                                              center.y - dotRadius,
                                                                              dotRadius * 2.0,
                                                                              dotRadius * 2.0)];
    CAShapeLayer *dotLayer = [CAShapeLayer layer];
    dotLayer.path = dotPath.CGPath;
    dotLayer.fillColor = [UIColor whiteColor].CGColor;
    [self.plateView.layer addSublayer:dotLayer];
    [self.sliceLayers addObject:dotLayer];
}

- (NSAttributedString *)attributedStringForSegment:(LuckyWheelSegment *)segment {
    if (segment.attributedText.length > 0) {
        return segment.attributedText;
    }
    if (segment.text.length == 0) {
        return nil;
    }
    UIFont *font = segment.textFont ?: [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    UIColor *color = segment.textColor ?: [UIColor blackColor];
    NSDictionary *attrs = @{
        NSFontAttributeName: font,
        NSForegroundColorAttributeName: color
    };
    return [[NSAttributedString alloc] initWithString:segment.text attributes:attrs];
}

#pragma mark - Center Button actions

- (void)handleCenterButtonTap:(UIButton *)sender {
    // 统一走减速旋转逻辑
    [self startSpinWithScrollLikeDeceleration];
    // 如果你有通用弹跳 & 震动封装，可以在这里调用
    // [sender jobs_playTapBounceWithHaptic:JobsHapticLight];
}

- (void)handleCenterButtonLongPress:(UILongPressGestureRecognizer *)gr {
    UIButton *btn = (UIButton *)gr.view;
    if (gr.state == UIGestureRecognizerStateBegan) {
        btn.alpha = 0.6;
    } else if (gr.state == UIGestureRecognizerStateEnded ||
               gr.state == UIGestureRecognizerStateCancelled) {
        btn.alpha = 1.0;
    }
}

#pragma mark - Segment 点击 / 长按

- (void)handleSegmentTapGesture:(UITapGestureRecognizer *)gr {
    if (gr.state != UIGestureRecognizerStateEnded) return;
    // 旋转中不响应点击
    if (self.displayLink) return;

    CGPoint point = [gr locationInView:self];

    // 点到中心按钮区域 -> 交给按钮自己处理
    if (CGRectContainsPoint(self.centerButton.frame, point)) {
        return;
    }

    NSInteger index = [self segmentIndexForPoint:point];
    if (index < 0 || index >= (NSInteger)self.segments.count) return;

    LuckyWheelSegment *segment = self.segments[index];
    if (self.segmentTapHandlerInternal) {
        self.segmentTapHandlerInternal(segment);
    }
}

- (void)handleSegmentLongPressGesture:(UILongPressGestureRecognizer *)gr {
    // 旋转中不响应长按
    if (self.displayLink) return;

    CGPoint point = [gr locationInView:self];

    // 点到中心按钮区域 -> 不算扇形长按
    if (CGRectContainsPoint(self.centerButton.frame, point)) {
        return;
    }

    NSInteger index = [self segmentIndexForPoint:point];
    if (index < 0 || index >= (NSInteger)self.segments.count) return;

    LuckyWheelSegment *segment = self.segments[index];
    if (self.segmentLongPressHandlerInternal) {
        self.segmentLongPressHandlerInternal(segment, gr);
    }
}

#pragma mark - 手势拖动旋转

- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    if (!self.panRotationEnabled) return;
    if (self.displayLink) return;

    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGPoint location = [gesture locationInView:self];

    if (gesture.state == UIGestureRecognizerStateBegan &&
        CGRectContainsPoint(self.centerButton.frame, location)) {
        // 从按钮区域开始的拖动忽略
        return;
    }

    CGFloat dx = location.x - center.x;
    CGFloat dy = location.y - center.y;
    CGFloat angle = atan2(dy, dx);
    CFTimeInterval now = CACurrentMediaTime();

    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.lastTouchAngle = angle;
            self.lastTouchTimestamp = now;
            self.angularVelocityFromPan = 0;
        } break;

        case UIGestureRecognizerStateChanged: {
            CGFloat step = angle - self.lastTouchAngle;
            CGFloat pi = (CGFloat)M_PI;
            if (step > pi) {
                step -= 2.0 * pi;
            } else if (step < -pi) {
                step += 2.0 * pi;
            }

            self.currentAngle += step;
            self.plateView.transform = CGAffineTransformMakeRotation(self.currentAngle);

            CFTimeInterval dt = now - self.lastTouchTimestamp;
            if (dt > 0) {
                self.angularVelocityFromPan = step / (CGFloat)dt;
            }
            self.lastTouchAngle = angle;
            self.lastTouchTimestamp = now;
        } break;

        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed: {
            CGFloat v = self.angularVelocityFromPan;
            self.angularVelocityFromPan = 0;
            if (fabs(v) > 0.1) {
                [self startSpinWithScrollLikeDecelerationWithInitialVelocity:v];
            }
        } break;

        default:
            break;
    }
}

#pragma mark - 旋转逻辑（减速）

- (void)startSpinWithScrollLikeDeceleration {
    [self startSpinWithScrollLikeDecelerationWithInitialVelocity:NAN];
}

- (void)startSpinWithScrollLikeDecelerationWithInitialVelocity:(CGFloat)initialVelocity {
    if (self.displayLink) return; // 已经在自动旋转中

    CGFloat v0 = 0;
    if (!isnan(initialVelocity)) {
        v0 = initialVelocity;
    } else if (self.customInitialVelocity != nil) {
        v0 = (CGFloat)self.customInitialVelocity.doubleValue;
    } else {
        v0 = [self velocityForTargetDuration:self.spinDuration];
    }

    // 开始旋转时统一锁死按钮
    self.centerButton.selected = YES;
    self.centerButton.userInteractionEnabled = NO;

    self.decelerator = [[ScrollDecelerator alloc] initWithVelocity:v0
                                                   decelerationRate:self.decelerationRate];

    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(handleDisplayLink:)];
    if (@available(iOS 10.0, *)) {
        self.displayLink.preferredFramesPerSecond = 60;
    }
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop]
                           forMode:NSRunLoopCommonModes];
}

- (CGFloat)velocityForTargetDuration:(NSTimeInterval)duration {
    // 防御：限制时间范围，避免数值爆炸
    double T = MAX(0.1, MIN(duration, 6.0));
    CGFloat d = self.decelerationRate;
    CGFloat eps = self.stopThreshold;

    double denom = pow(d, 1000.0 * T);
    if (denom < 1e-4) {
        return eps / 1e-4;
    } else {
        return (CGFloat)(eps / denom);
    }
}

- (void)handleDisplayLink:(CADisplayLink *)link {
    if (!self.decelerator) {
        [self stopSpin];
        return;
    }

    CGFloat dt = self.timerInterval;
    CGFloat deltaAngle = [self.decelerator stepWithDt:dt];

    self.currentAngle += deltaAngle;
    self.plateView.transform = CGAffineTransformMakeRotation(self.currentAngle);

    if ([self.decelerator isStoppedWithThreshold:self.stopThreshold]) {
        [self stopSpin];

        NSInteger idx = [self currentSegmentIndexForDirection:self.pointerDirection];
        if (idx >= 0 && idx < (NSInteger)self.segments.count) {
            LuckyWheelSegment *segment = self.segments[idx];
            if (self.segmentTapHandlerInternal) {
                self.segmentTapHandlerInternal(segment);
            }
        }
    }
}

- (void)stopSpin {
    [self.displayLink invalidate];
    self.displayLink = nil;
    self.decelerator = nil;

    self.centerButton.selected = NO;
    self.centerButton.userInteractionEnabled = YES;
}

#pragma mark - Segment 命中计算

- (NSInteger)segmentIndexForPoint:(CGPoint)point {
    if (self.segments.count == 0 ||
        self.bounds.size.width <= 0 ||
        self.bounds.size.height <= 0) {
        return -1;
    }

    CGRect bounds = self.bounds;
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGFloat radius = MIN(bounds.size.width, bounds.size.height) / 2.0;

    CGFloat dx = point.x - center.x;
    CGFloat dy = point.y - center.y;
    CGFloat distance = hypot(dx, dy);

    if (distance > radius) {
        return -1;
    }

    // 触点相对圆心的绝对角度（世界坐标），[-π, π]
    CGFloat touchAngle = atan2(dy, dx);

    // 盘面已经被 currentAngle 旋转了；把触点角度“反旋转”回静止态
    CGFloat angle0 = touchAngle - self.currentAngle;
    CGFloat twoPi = (CGFloat)(M_PI * 2.0);

    while (angle0 < 0) angle0 += twoPi;
    while (angle0 >= twoPi) angle0 -= twoPi;

    // 静止态下，0 对应 -π/2（正上方）
    CGFloat startFromTop = (CGFloat)(-M_PI_2);
    CGFloat relative = angle0 - startFromTop;
    while (relative < 0) relative += twoPi;
    while (relative >= twoPi) relative -= twoPi;

    NSInteger count = self.segments.count;
    CGFloat anglePerSlice = twoPi / (CGFloat)count;
    NSInteger idx = (NSInteger)(relative / anglePerSlice);

    if (idx >= 0 && idx < count) {
        return idx;
    }
    return -1;
}

- (NSInteger)currentSegmentIndexForDirection:(LuckyWheelPointerDirection)direction {
    if (self.segments.count == 0 ||
        self.bounds.size.width <= 0 ||
        self.bounds.size.height <= 0) {
        return -1;
    }

    CGRect bounds = self.bounds;
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGFloat radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    CGFloat inset = 1.0;

    CGPoint p;
    switch (direction) {
        case LuckyWheelPointerDirectionUp:
            p = CGPointMake(center.x, center.y - radius + inset);
            break;
        case LuckyWheelPointerDirectionDown:
            p = CGPointMake(center.x, center.y + radius - inset);
            break;
        case LuckyWheelPointerDirectionLeft:
            p = CGPointMake(center.x - radius + inset, center.y);
            break;
        case LuckyWheelPointerDirectionRight:
            p = CGPointMake(center.x + radius - inset, center.y);
            break;
    }
    return [self segmentIndexForPoint:p];
}

#pragma mark - DSL

- (instancetype)byPointerDirection:(LuckyWheelPointerDirection)direction {
    self.pointerDirection = direction;
    return self;
}

- (instancetype)byColors:(NSArray<UIColor *> *)colors {
    self.colors = colors;
    return self;
}

- (instancetype)bySegments:(NSArray<LuckyWheelSegment *> *)segments {
    self.segments = segments;
    return self;
}

- (instancetype)bySpinDuration:(NSTimeInterval)duration {
    self.spinDuration = duration;
    return self;
}

- (instancetype)byInitialVelocity:(CGFloat)velocity {
    self.customInitialVelocity = @(velocity);
    return self;
}

- (instancetype)byDecelerationRate:(CGFloat)rateRaw {
    self.decelerationRate = rateRaw;
    return self;
}

- (instancetype)byStopThreshold:(CGFloat)threshold {
    self.stopThreshold = threshold;
    return self;
}

- (instancetype)byPanRotationEnabled:(BOOL)enabled {
    self.panRotationEnabled = enabled;
    return self;
}

- (instancetype)onSegmentTap:(void (^)(LuckyWheelSegment * _Nonnull))handler {
    self.segmentTapHandlerInternal = handler;
    return self;
}

- (instancetype)onSegmentLongPress:(void (^)(LuckyWheelSegment * _Nonnull, UILongPressGestureRecognizer * _Nonnull))handler {
    self.segmentLongPressHandlerInternal = handler;
    return self;
}

@end
