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
@property(nonatomic,assign)BOOL isAnimating;

@end

@implementation RYCuteView

- (void)dealloc{
    JobsLog(@"%s",__FUNCTION__);
}

-(instancetype)init{
    if (self = [super init]) {
        @jobs_weakify(self)
        self.userInteractionEnabled = YES;
        [[RACObserve(self, curveX) merge:RACObserve(self, curveY)] subscribeNext:^(id  _Nullable x) {
            @jobs_strongify(self)
            /// 更新_shapeLayer形状
            self.shapeLayer.path = jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable data) {
                @jobs_strongify(self)
                data.moveTo(CGPointZero);/// r1点
                data.add(CGPointMake(JobsMainScreen_WIDTH(), 0));/// r2点
                data.add(CGPointMake(JobsMainScreen_WIDTH(), MIN_HEIGHT));/// r4点
                [data addQuadCurveToPoint:CGPointMake(0, MIN_HEIGHT)
                             controlPoint:CGPointMake(self.curveX, self.curveY)]; /// r3,r4,r5确定的一个弧线
                [data closePath];
            }).CGPath;
        }];
        self.mHeight = 100; // 手势移动时相对高度
        self.isAnimating = NO;  // 是否处于动效状态
        self.shapeLayer.opacity = 1;
        self.curveX = JobsMainScreen_WIDTH() / 2.0;   // r5点x坐标
        self.curveY = MIN_HEIGHT;   // r5点y坐标
        self.curveView.alpha = 1;
        [self configAction];
    }return self;
}
#pragma mark —— 一些私有方法
- (void)configAction{
    @jobs_weakify(self)
    self.addGesture([jobsMakePanGesture(^(UIPanGestureRecognizer * _Nullable gesture) {
        
    }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
        @jobs_strongify(self)
        if(!self.isAnimating){
            if(gesture.state == UIGestureRecognizerStateChanged){
                /// 手势移动时，_shapeLayer跟着手势向下扩大区域
                CGPoint point = [gesture translationInView:self];
                /// 这部分代码使r5红点跟着手势走
                self.mHeight = point.y * 0.7 + MIN_HEIGHT;
                self.curveX = JobsMainScreen_WIDTH() / 2.0 + point.x;
                self.curveY = self.mHeight > MIN_HEIGHT ? self.mHeight : MIN_HEIGHT;
                self.curveView.resetOrigin(CGPointMake(self.curveX, self.curveY));
            }else if (gesture.state == UIGestureRecognizerStateCancelled ||
                      gesture.state == UIGestureRecognizerStateEnded ||
                      gesture.state == UIGestureRecognizerStateFailed){
                self.isAnimating = YES; // 手势结束时,_shapeLayer返回原状并产生弹簧动效
                self.resumeRACTimerBy(self.racModel);
                @jobs_weakify(self)
                [UIView animateWithDuration:1.0
                                      delay:0.0
                     usingSpringWithDamping:0.5
                      initialSpringVelocity:0
                                    options:UIViewAnimationOptionCurveEaseInOut
                                 animations:^{
                    @jobs_strongify(self)
                    /// 曲线点(r5点)是一个view.所以在block中有弹簧效果.然后根据他的动效路径,在calculatePath中计算弹性图形的形状
                    self->_curveView.frame = CGRectMake(JobsMainScreen_WIDTH() / 2.0, MIN_HEIGHT, 3, 3);
                } completion:^(BOOL finished) {
                    if(finished){
                        self.pauseRACTimer(self.racModel.racDisposable);// 在手势结束的时候才调用calculatePath方法，所以一开始是暂停的
                        self->_isAnimating = NO;
                    }
                }];
            }
        }
    }]);
    /// 默认每秒运行60次calculatePath是算出在运行期间_curveView的坐标，从而确定_shapeLayer的形状
    self.racModel = [self startRACTimer:1.0 / 60.0 /// 每帧的时间间隔（60 FPS，约 1/60 秒）
                                byBlock:^{
        @jobs_strongify(self)
        // 由于手势结束时,r5执行了一个UIView的弹簧动画,把这个过程的坐标记录下来,并相应的画出_shapeLayer形状
        CALayer *layer = self.curveView.layer.presentationLayer;
        self.curveX = layer.position.x;
        self.curveY = layer.position.y;
    }];
    self.pauseRACTimer(self.racModel.racDisposable);// 在手势结束的时候才调用calculatePath方法，所以一开始是暂停的
}
#pragma mark —— LazyLoad
-(CAShapeLayer *)shapeLayer{
    if(!_shapeLayer){
        @jobs_weakify(self)
        _shapeLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.fillColor = UIColor.colorWithHexString(@"#37A6F0").CGColor;
            self.layer.add(layer);
        });
    }return _shapeLayer;
}

-(UIView *)curveView{
    if(!_curveView){
        @jobs_weakify(self)
        _curveView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsRedColor;
            view.frame = CGRectMake(self.curveX, self.curveY, 3, 3);
            self.addSubview(view);
        });
    }return _curveView;
}

@end
