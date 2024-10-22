//
//  shapeView.m
//  testUIBezierPath
//
//  Created by billionsfinance-resory on 15/11/2.
//  Copyright © 2015年 Resory. All rights reserved.
//

#import "RYCuteView.h"
#define MIN_HEIGHT 64       //RYCuteView 图形最小高度

@interface RYCuteView ()

@property(nonatomic,assign)CGFloat mHeight;
@property(nonatomic,assign)CGFloat curveX;  // r5点x坐标
@property(nonatomic,assign)CGFloat curveY;  // r5点y坐标
@property(nonatomic,strong)UIView *curveView;   // r5红点
@property(nonatomic,strong)CAShapeLayer *shapeLayer;
@property(nonatomic,strong)CADisplayLink *displayLink;
@property(nonatomic,assign)BOOL isAnimating;

@end

@implementation RYCuteView

static NSString *kX = @"curveX";
static NSString *kY = @"curveY";
- (void)dealloc {

    NSLog(@"%s",__FUNCTION__);
    [self removeObserver:self forKeyPath:kX];
    [self removeObserver:self forKeyPath:kY];
}

-(instancetype)init{
    if (self = [super init]) {
        [self addObserver:self
               forKeyPath:kX
                  options:NSKeyValueObservingOptionNew
                  context:nil];
        [self addObserver:self
               forKeyPath:kY
                  options:NSKeyValueObservingOptionNew 
                  context:nil];
        [self configShapeLayer];
        [self configCurveView];
        [self configAction];
    }return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSString *,id> *)change
                      context:(void *)context {
    if ([keyPath isEqualToString:kX] || [keyPath isEqualToString:kY]) {
        [self updateShapeLayerPath];
    }
}
#pragma mark - Configuration
- (void)configAction{
    _mHeight = 100; // 手势移动时相对高度
    _isAnimating = NO;  // 是否处于动效状态
    // 手势
    UIPanGestureRecognizer *pan = [UIPanGestureRecognizer.alloc initWithTarget:self
                                                                          action:@selector(handlePanAction:)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:pan];
    // CADisplayLink默认每秒运行60次calculatePath是算出在运行期间_curveView的坐标，从而确定_shapeLayer的形状
    _displayLink = [CADisplayLink displayLinkWithTarget:self
                                               selector:@selector(calculatePath)];
    [_displayLink addToRunLoop:NSRunLoop.currentRunLoop
                       forMode:NSDefaultRunLoopMode];
    // 在手势结束的时候才调用calculatePath方法，所以一开始是暂停的
    _displayLink.paused = YES;
}

- (void)configShapeLayer{
    _shapeLayer = CAShapeLayer.layer;
    _shapeLayer.fillColor = UIColor.colorWithHexString(@"#37A6F0").CGColor;
    [self.layer addSublayer:_shapeLayer];
}

- (void)configCurveView{
    // _curveView就是r5点
    self.curveX = JobsMainScreen_WIDTH()/2.0;   // r5点x坐标
    self.curveY = MIN_HEIGHT;   // r5点y坐标
    _curveView = [UIView.alloc initWithFrame:CGRectMake(_curveX, _curveY, 3, 3)];
    _curveView.backgroundColor = JobsRedColor;
    [self addSubview:_curveView];
}
#pragma mark - Action
- (void)handlePanAction:(UIPanGestureRecognizer *)pan{
    if(!_isAnimating){
        if(pan.state == UIGestureRecognizerStateChanged){
            // 手势移动时，_shapeLayer跟着手势向下扩大区域
            CGPoint point = [pan translationInView:self];
            // 这部分代码使r5红点跟着手势走
            _mHeight = point.y*0.7 + MIN_HEIGHT;
            self.curveX = JobsMainScreen_WIDTH() / 2.0 + point.x;
            self.curveY = _mHeight > MIN_HEIGHT ? _mHeight : MIN_HEIGHT;
            _curveView.frame = CGRectMake(_curveX,
                                          _curveY,
                                          _curveView.frame.size.width,
                                          _curveView.frame.size.height);
        }else if (pan.state == UIGestureRecognizerStateCancelled ||
                 pan.state == UIGestureRecognizerStateEnded ||
                 pan.state == UIGestureRecognizerStateFailed){
            _isAnimating = YES; // 手势结束时,_shapeLayer返回原状并产生弹簧动效
            _displayLink.paused = NO;   //开启displaylink,会执行方法calculatePath.
            // 弹簧动效
            //http://blog.csdn.net/youshaoduo/article/details/53203211
            @jobs_weakify(self)
            [UIView animateWithDuration:1.0
                                  delay:0.0
                 usingSpringWithDamping:0.5
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                @jobs_strongify(self)
                // 曲线点(r5点)是一个view.所以在block中有弹簧效果.然后根据他的动效路径,在calculatePath中计算弹性图形的形状
                self->_curveView.frame = CGRectMake(JobsMainScreen_WIDTH() / 2.0, MIN_HEIGHT, 3, 3);
            } completion:^(BOOL finished) {
                if(finished){
                    self->_displayLink.paused = YES;
                    self->_isAnimating = NO;
                }
            }];
        }
    }
}

- (void)updateShapeLayerPath{
    // 更新_shapeLayer形状
    UIBezierPath *tPath = UIBezierPath.bezierPath;
    [tPath moveToPoint:CGPointMake(0, 0)];  // r1点
    [tPath addLineToPoint:CGPointMake(JobsMainScreen_WIDTH(), 0)];  // r2点
    [tPath addLineToPoint:CGPointMake(JobsMainScreen_WIDTH(), MIN_HEIGHT)];  // r4点
    [tPath addQuadCurveToPoint:CGPointMake(0, MIN_HEIGHT)
                  controlPoint:CGPointMake(_curveX, _curveY)]; // r3,r4,r5确定的一个弧线
    [tPath closePath];
    _shapeLayer.path = tPath.CGPath;
}

- (void)calculatePath{
    // 由于手势结束时,r5执行了一个UIView的弹簧动画,把这个过程的坐标记录下来,并相应的画出_shapeLayer形状
    CALayer *layer = _curveView.layer.presentationLayer;
    self.curveX = layer.position.x;
    self.curveY = layer.position.y;
}

@end
