//
//  RYCuteView.m
//  testUIBezierPath
//
//  Created by billionsfinance-resory on 15/11/2.
//  Updated by Jobs on 2025/11/21
//  https://www.jianshu.com/p/21db20189c40
//

#import "RYCuteView.h"
/// 默认最小高度
static const CGFloat kDefaultMinHeight = 64.f;
@interface RYCuteView ()
/// 手势移动时相对高度
Prop_assign() CGFloat mHeight;
/// r5 点 x 坐标
Prop_assign() CGFloat curveX;
/// r5 点 y 坐标
Prop_assign() CGFloat curveY;
/// r5 红点
Prop_strong() UIView *curveView;
/// 果冻形状图层
Prop_strong() CAShapeLayer *shapeLayer;
/// 是否处于动效状态（手指已抬起 + 弹簧动画进行中）
Prop_assign() BOOL isAnimating;
/// 利用 CADisplayLink 封装的统一定时器（60 FPS 追踪 presentationLayer）
Prop_strong() JobsTimer *displayTimer;

@end

@implementation RYCuteView
#pragma mark - Life Cycle
- (void)dealloc {
    JobsLog(@"%s", __FUNCTION__);
    // 保险起见，销毁前停掉定时器
    [self.displayTimer stop];
}

- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }return self;
}

// 如果你有从 frame / coder 初始化的场景，可以顺手也补上
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
#pragma mark - Common Init
- (void)commonInit {
    self.userInteractionEnabled = YES;
    self.MIN_HEIGHT  = kDefaultMinHeight;   // 默认图形最小高度
    self.mHeight     = 100.f;              // 手势移动时相对高度
    self.isAnimating = NO;                 // 初始无动效

    @jobs_weakify(self)
    // curveX / curveY 任一变化，都重绘 shapeLayer.path
    [[[RACObserve(self, curveX)
       merge:RACObserve(self, curveY)]
      takeUntil:self.rac_willDeallocSignal]
     subscribeNext:^(__unused id  _Nullable x) {
        @jobs_strongify(self)
        if (!self) return;
        self.shapeLayer.path = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable bezier) {
            @jobs_strongify(self)
            if (!self) return;
            // r1
            bezier.moveTo(CGPointZero);
            // r2
            bezier.add(CGPointMake(JobsMainScreen_WIDTH(), 0));
            // r4
            bezier.add(CGPointMake(JobsMainScreen_WIDTH(), self.MIN_HEIGHT));
            // r3,r4,r5 确定的弧线
            [bezier addQuadCurveToPoint:CGPointMake(0, self.MIN_HEIGHT)
                           controlPoint:CGPointMake(self.curveX, self.curveY)];
            [bezier closePath];
        }).CGPath;
    }];

    // 触发 lazy getter，确保图层和红点都挂上去
    self.shapeLayer.opacity = 1.0;
    self.curveX = JobsMainScreen_WIDTH() / 2.0;   // r5 初始 x
    self.curveY = self.MIN_HEIGHT;                // r5 初始 y
    self.curveView.alpha = 1.0;

    [self configAction];
}
#pragma mark - 手势 & 动效
- (void)configAction {
    @jobs_weakify(self)
    // 手势：内部仍然用你的 DSL
    self.addGesture([jobsMakePanGesture(^(UIPanGestureRecognizer * _Nullable gesture) {

    }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
        @jobs_strongify(self)
        if (!self) return;

        if (!self.isAnimating) {
            UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gesture;

            if (pan.state == UIGestureRecognizerStateChanged) {
                // 手势移动中，shape 层跟着往下“拉”
                CGPoint point = [pan translationInView:self];

                // 这部分代码让 r5 红点跟着手势走
                self.mHeight = point.y * 0.7 + self.MIN_HEIGHT;
                self.curveX  = JobsMainScreen_WIDTH() / 2.0 + point.x;
                self.curveY  = self.mHeight > self.MIN_HEIGHT ? self.mHeight : self.MIN_HEIGHT;

                self.curveView.resetOrigin(CGPointMake(self.curveX, self.curveY));
            }
            else if (pan.state == UIGestureRecognizerStateCancelled ||
                     pan.state == UIGestureRecognizerStateEnded     ||
                     pan.state == UIGestureRecognizerStateFailed) {

                // 手势结束：开始弹簧动画 + 开启 JobsTimer 追踪 r5 的实际运动轨迹
                self.isAnimating = YES;

                // 开启 displayLink 型定时器（60 FPS）
                [self.displayTimer start];

                @jobs_weakify(self)
                [UIView animateWithDuration:1.0
                                      delay:0.0
                     usingSpringWithDamping:0.5
                      initialSpringVelocity:0
                                    options:UIViewAnimationOptionCurveEaseInOut
                                 animations:^{
                    @jobs_strongify(self)
                    if (!self) return;
                    // 曲线点(r5) 是一个 view，有弹簧效果
                    self->_curveView.frame = CGRectMake(JobsMainScreen_WIDTH() / 2.0,
                                                        self.MIN_HEIGHT,
                                                        3,
                                                        3);
                } completion:^(BOOL finished) {
                    @jobs_strongify(self)
                    if (!self) return;

                    if (finished) {
                        // 动画结束，停掉定时器，标记为非动效状态
                        [self.displayTimer stop];
                        self.isAnimating = NO;
                    }
                }];
            }
        }
    }]);
}
#pragma mark - Lazy Load
- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        @jobs_weakify(self)
        _shapeLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            if (!self) return;
            layer.fillColor = UIColor.colorWithHexString(@"#37A6F0").CGColor;
            [self.layer addSublayer:layer];
        });
    }return _shapeLayer;
}

- (UIView *)curveView {
    if (!_curveView) {
        @jobs_weakify(self)
        _curveView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            if (!self) return;
            view.backgroundColor = JobsRedColor;
            view.frame = CGRectMake(self.curveX, self.curveY, 3, 3);
            [self addSubview:view];
        });
    }return _curveView;
}

- (JobsTimer *)displayTimer {
    if (!_displayTimer) {
        @jobs_weakify(self)
        _displayTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            // 使用 CADisplayLink 模式，和屏幕刷新同步
            timer.timerType    = JobsTimerTypeDisplayLink;
            timer.timeInterval = 1.0 / 60.0;               // 语义字段（DisplayLink 内部按屏幕 FPS）
            timer.repeats      = YES;
            timer.queue        = dispatch_get_main_queue(); // 虽然 DisplayLink 不用 queue，但语义保持统一

            timer.startTime    = 0;   // 非倒计时模式
            timer.time         = 0;

            // 每一帧，从 presentationLayer 读取 r5 的真实位置，驱动 curveX / curveY
            timer.onTicker = ^(JobsTimer * _Nullable t) {
                @jobs_strongify(self)
                if (!self) return;

                CALayer *presentation = (CALayer *)self.curveView.layer.presentationLayer;
                if (!presentation) {
                    // 理论上动画结束后 presentationLayer 可能为 nil，防御性结束一次
                    [self.displayTimer stop];
                    self.isAnimating = NO;
                    return;
                }

                self.curveX = presentation.position.x;
                self.curveY = presentation.position.y;
            };

            // 这里不需要 onFinish，结束逻辑在 UIView 动画 completion 里处理
            timer.onFinish = nil;
        });
    }return _displayTimer;
}

@end
