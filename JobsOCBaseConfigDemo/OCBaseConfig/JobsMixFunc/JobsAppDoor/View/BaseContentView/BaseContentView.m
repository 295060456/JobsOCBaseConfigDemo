//
//  BaseContentView.m
//  JobsAppDoor
//
//  Created by Jobs on 2020/12/7.
//

#import "BaseContentView.h"

@interface BaseContentView ()

@property(nonatomic,assign)CGRect initialContentViewRect;// 登录框 初始frame值

@end

@implementation BaseContentView

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.initialContentViewRect = self.frame;
}
/*
 *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
 *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
 *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
 *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
 *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
 *    dampingRatio 阻尼
 *    velocity 速度
 */
-(void)showContentViewWithOffsetY:(CGFloat)offsetY{
    @jobs_weakify(self)
    [UIView animateWithDuration:2
                          delay:0.1
         usingSpringWithDamping:0.3
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        self.centerX = JobsMainScreen_WIDTH(nil) / 2;
        self.centerY -= offsetY;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)removeContentViewWithOffsetY:(CGFloat)offsetY{
    @jobs_weakify(self)
    [UIView animateWithDuration:2
                          delay:0.1
         usingSpringWithDamping:0.3
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        self.x = -(self.width + self.x);
        self.y = self.initialContentViewRect.origin.y;
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark —— LazyLoad

@end
