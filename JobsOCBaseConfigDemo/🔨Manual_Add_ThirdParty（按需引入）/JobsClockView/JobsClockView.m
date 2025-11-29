//
//  JobsClockView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import "JobsClockView.h"

@interface JobsClockView ()
/// 外圈表盘
Prop_strong() CAShapeLayer *dialLayer;
/// 12 个整点刻度
Prop_strong() CAShapeLayer *tickLayer;
/// 中心小圆点
Prop_strong() CAShapeLayer *centerDotLayer;
/// 1～12 数字标签
Prop_strong() NSArray<UILabel *> *numberLabels;
/// 时针 / 分针 / 秒针
Prop_strong() CALayer *hourHand;
Prop_strong() CALayer *minuteHand;
Prop_strong() CALayer *secondHand;
/// OC 版 JobsTimer
Prop_strong() JobsTimer *timer;

@end

@implementation JobsClockView

- (void)dealloc {
    [self stop];
}

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = UIColor.clearColor;
        [self setupDialLayers];
        [self setupNumberLabels];
        [self setupHandLayers];
    }return self;
}

#pragma mark - Setup

- (void)setupDialLayers {
    self.dialLayer = [CAShapeLayer layer];
    self.dialLayer.fillColor = UIColor.clearColor.CGColor;
    if (@available(iOS 13.0, *)) {
        self.dialLayer.strokeColor = [UIColor labelColor].CGColor;
    } else {
        self.dialLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    }
    self.dialLayer.lineWidth = 2.0;
    [self.layer addSublayer:self.dialLayer];

    self.tickLayer = [CAShapeLayer layer];
    self.tickLayer.fillColor = UIColor.clearColor.CGColor;
    if (@available(iOS 13.0, *)) {
        self.tickLayer.strokeColor = [UIColor labelColor].CGColor;
    } else {
        self.tickLayer.strokeColor = [UIColor blackColor].CGColor;
    }
    self.tickLayer.lineWidth = 2.0;
    [self.layer addSublayer:self.tickLayer];

    self.centerDotLayer = [CAShapeLayer layer];
    if (@available(iOS 13.0, *)) {
        self.centerDotLayer.fillColor = [UIColor labelColor].CGColor;
    } else {
        self.centerDotLayer.fillColor = [UIColor blackColor].CGColor;
    }
    self.centerDotLayer.strokeColor = UIColor.clearColor.CGColor;
    [self.layer addSublayer:self.centerDotLayer];
}

- (void)setupNumberLabels {
    NSMutableArray<UILabel *> *arr = NSMutableArray.array;
    for (NSInteger i = 1; i <= 12; i++) {
        UILabel *label = UILabel.new;
        label.text = [NSString stringWithFormat:@"%ld", (long)i];
        label.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
        if (@available(iOS 13.0, *)) {
            label.textColor = [UIColor labelColor];
        } else {
            label.textColor = [UIColor blackColor];
        }
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [arr addObject:label];
    }
    self.numberLabels = arr.copy;
}

- (void)setupHandLayers {
    self.hourHand = [CALayer layer];
    self.hourHand.backgroundColor = [UIColor blackColor].CGColor;
    self.hourHand.cornerRadius = 3.0;
    [self.layer addSublayer:self.hourHand];

    self.minuteHand = [CALayer layer];
    if (@available(iOS 13.0, *)) {
        self.minuteHand.backgroundColor = [UIColor darkGrayColor].CGColor;
    } else {
        self.minuteHand.backgroundColor = [UIColor darkGrayColor].CGColor;
    }
    self.minuteHand.cornerRadius = 2.0;
    [self.layer addSublayer:self.minuteHand];

    self.secondHand = [CALayer layer];
    self.secondHand.backgroundColor = [UIColor redColor].CGColor;
    self.secondHand.cornerRadius = 1.0;
    [self.layer addSublayer:self.secondHand];
}
#pragma mark - Layout
- (void)layoutSubviews {
    [super layoutSubviews];

    [self layoutDialAndNumbers];
    [self layoutHandLayers];
    [self updateHandsAnimated:NO];
}
/// 布局表盘 + 刻度 + 数字
- (void)layoutDialAndNumbers {
    CGFloat width  = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat size   = MIN(width, height);
    if (size <= 0) return;

    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds),
                                 CGRectGetMidY(self.bounds));

    CGFloat inset  = size * 0.05;
    CGFloat radius = size / 2.0 - inset;
    // 表盘外圈
    CGRect circleRect = CGRectMake(center.x - radius,
                                   center.y - radius,
                                   radius * 2.0,
                                   radius * 2.0);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    self.dialLayer.frame = self.bounds;
    self.dialLayer.path  = circlePath.CGPath;
    // 12 个整点刻度
    UIBezierPath *tickPath = UIBezierPath.bezierPath;
    CGFloat tickLen = 8.0;
    for (NSInteger i = 0; i < 12; i++) {
        // 0 -> 12 点，顺时针
        CGFloat angle = (CGFloat)i / 12.0 * 2.0 * M_PI - M_PI_2;
        CGPoint outer = CGPointMake(center.x + cos(angle) * radius,
                                    center.y + sin(angle) * radius);
        CGPoint inner = CGPointMake(center.x + cos(angle) * (radius - tickLen),
                                    center.y + sin(angle) * (radius - tickLen));
        [tickPath moveToPoint:inner];
        [tickPath addLineToPoint:outer];
    }
    self.tickLayer.frame = self.bounds;
    self.tickLayer.path  = tickPath.CGPath;

    // 中心小圆点
    CGFloat dotRadius = 4.0;
    CGRect dotRect = CGRectMake(center.x - dotRadius,
                                center.y - dotRadius,
                                dotRadius * 2.0,
                                dotRadius * 2.0);
    UIBezierPath *dotPath = [UIBezierPath bezierPathWithOvalInRect:dotRect];
    self.centerDotLayer.frame = self.bounds;
    self.centerDotLayer.path  = dotPath.CGPath;

    // 1～12 数字布局
    CGFloat numberRadius = radius - 20.0;
    [self.numberLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull label,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
        CGFloat value = (CGFloat)(idx + 1); // 1...12
        CGFloat angle = value / 12.0 * 2.0 * M_PI - M_PI_2;

        CGPoint labelCenter = CGPointMake(center.x + cos(angle) * numberRadius,
                                          center.y + sin(angle) * numberRadius);

        CGSize labelSize;
        if ([label respondsToSelector:@selector(intrinsicContentSize)]) {
            labelSize = label.intrinsicContentSize;
        } else {
            [label sizeToFit];
            labelSize = label.bounds.size;
        }

        label.frame = CGRectMake(labelCenter.x - labelSize.width / 2.0,
                                 labelCenter.y - labelSize.height / 2.0,
                                 labelSize.width,
                                 labelSize.height);
    }];
}
/// 布局三根指针
- (void)layoutHandLayers {
    CGFloat width  = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat size   = MIN(width, height);
    if (size <= 0) return;

    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds),
                                 CGRectGetMidY(self.bounds));

    CGFloat hourLen   = size * 0.25;
    CGFloat minuteLen = size * 0.35;
    CGFloat secondLen = size * 0.40;

    self.hourHand.bounds   = CGRectMake(0, 0, 6.0, hourLen);
    self.minuteHand.bounds = CGRectMake(0, 0, 4.0, minuteLen);
    self.secondHand.bounds = CGRectMake(0, 0, 2.0, secondLen);

    NSArray<CALayer *> *hands = @[self.hourHand, self.minuteHand, self.secondHand];
    for (CALayer *hand in hands) {
        hand.anchorPoint = CGPointMake(0.5, 1.0);
        hand.position    = center;
    }
}
#pragma mark —— 一些公共方法
-(void)start{
    self.startByTimerType(JobsTimerTypeGCD);
}

-(jobsByNSUIntegerBlock _Nonnull)startByTimerType{
    @jobs_weakify(self)
    return ^(JobsTimerType timerType){
        @jobs_strongify(self)
        [self stop];
        // 先对齐当前时间
        [self updateHandsAnimated:NO];
        @jobs_weakify(self)
        self.timer = jobsMakeTimer(^(JobsTimer * _Nonnull timer) {
            @jobs_strongify(self)
            timer.byTimerType(timerType)
            .byTimeInterval(1.0)                 // 每秒 tick 一次
            .byTimeSecIntervalSinceDate(0)       // 立即开始
            .byQueue(dispatch_get_main_queue())  // UI 更新必须主线程
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)                      // 非倒计时模式
            .byTime(0)
            .byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                if (!self) return;
                [self updateHandsAnimated:YES];
            })
            .byOnFinish(^(JobsTimer * _Nullable t) {
                // 正常走表这里一般不会走到（非倒计时模式）
            });
            // 内部时间基线
            timer.accumulatedElapsed = 0;
            timer.lastStartDate      = nil;
        });
        [self.timer start];
    };
}

-(void)stop{
    if (self.timer) {
        [self.timer stop];
        self.timer = nil;
    }
}
#pragma mark - Private: 指针角度更新
- (void)updateHandsAnimated:(BOOL)animated {
    NSDate *now = NSDate.date;
    NSCalendar *calendar = NSCalendar.currentCalendar;
    NSDateComponents *comps =
    [calendar components:(NSCalendarUnitHour |
                          NSCalendarUnitMinute |
                          NSCalendarUnitSecond)
                fromDate:now];

    CGFloat hour   = comps.hour;   // 0...23
    CGFloat minute = comps.minute; // 0...59
    CGFloat second = comps.second; // 0...59

    CGFloat secAngle  = (second / 60.0) * 2.0 * M_PI;
    CGFloat minAngle  = ((minute + second / 60.0) / 60.0) * 2.0 * M_PI;
    CGFloat hourAngle = ((((int)hour % 12) + minute / 60.0 + second / 3600.0)
                         / 12.0) * 2.0 * M_PI;

    void (^applyTransforms)(void) = ^{
        self.hourHand.transform   = CATransform3DMakeRotation(hourAngle, 0, 0, 1);
        self.minuteHand.transform = CATransform3DMakeRotation(minAngle, 0, 0, 1);
        self.secondHand.transform = CATransform3DMakeRotation(secAngle, 0, 0, 1);
    };

    [CATransaction begin];
    if (animated) {
        [CATransaction setAnimationDuration:0.2];
        [CATransaction setAnimationTimingFunction:
         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    } else {
        [CATransaction setDisableActions:YES];
    }
    applyTransforms();
    [CATransaction commit];
}

@end
