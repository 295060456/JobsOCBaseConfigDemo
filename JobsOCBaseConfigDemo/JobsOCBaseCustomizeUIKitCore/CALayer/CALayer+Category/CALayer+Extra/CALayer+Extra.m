//
//  CALayer+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import "CALayer+Extra.h"

@implementation CALayer (Extra)
/// 适用于通过字符串来创建对象动画的场景
-(JobsRetCALayerByCAPropertyAnimationBlock _Nonnull)addAnimationBy{
    @jobs_weakify(self)
    return ^ __kindof CALayer *_Nullable(__kindof CAPropertyAnimation *_Nullable animation){
        @jobs_strongify(self)
        if(animation.keyPath){
            [self addAnimation:animation forKey:animation.keyPath];
        }return self;
    };
}

-(JobsRetCALayerByCAPropertyAnimationBlock _Nonnull)removeAnimationBy{
    @jobs_weakify(self)
    return ^ __kindof CALayer *_Nullable(__kindof CAPropertyAnimation *_Nullable animation){
        @jobs_strongify(self)
        [self removeAnimationForKey:animation.keyPath];
        return self;
    };
}

-(JobsRetCAPropertyAnimationByCAPropertyAnimationBlock _Nonnull)addAnimation{
    @jobs_weakify(self)
    return ^ __kindof CAPropertyAnimation *_Nullable(__kindof CAPropertyAnimation *_Nullable animation){
        @jobs_strongify(self)
        if(animation.keyPath){
            [self addAnimation:animation forKey:animation.keyPath];
        }return animation;
    };
}

-(JobsRetCAPropertyAnimationByCAPropertyAnimationBlock _Nonnull)removeAnimation{
    @jobs_weakify(self)
    return ^ __kindof CAPropertyAnimation *_Nullable(__kindof CAPropertyAnimation *_Nullable animation){
        @jobs_strongify(self)
        [self removeAnimationForKey:animation.keyPath];
        return animation;
    };
}

-(CAAnimation *)anim_shake:(NSArray *)rotations
                  duration:(NSTimeInterval)duration
               repeatCount:(NSUInteger)repeatCount{
    CAKeyframeAnimation *kfa = @"transform.rotation.z".keyframeAnimation;/// 创建关键帧动画
    kfa.values = rotations;/// 指定值
    kfa.duration = duration;/// 时长
    kfa.repeatCount = repeatCount;/// 重复次数
    kfa.removedOnCompletion = YES;/// 完成删除
    self.addAnimationBy(kfa);/// 添加
    return kfa;
}

-(CAAnimation *)anim_revers:(AnimReverDirection)direction
                   duration:(NSTimeInterval)duration
                  isReverse:(BOOL)isReverse
                repeatCount:(NSUInteger)repeatCount
             timingFuncName:(NSString *)timingFuncName{
    NSString *directionStr = nil;
    if(AnimReverDirectionX == direction)directionStr = @"x";
    if(AnimReverDirectionY == direction)directionStr = @"y";
    if(AnimReverDirectionZ == direction)directionStr = @"z";
    NSString *key = @"transform.rotation.".add(directionStr);
    if([self animationForKey:key]) [self removeAnimationForKey:key];
    CABasicAnimation *reversAnim = key.basicAnimation;/// 创建普通动画
    reversAnim.fromValue = @(0);/// 起点值
    reversAnim.toValue = @(M_PI_2);/// 终点值
    reversAnim.duration = duration;/// 时长
    reversAnim.autoreverses = isReverse;/// 自动反转
    reversAnim.removedOnCompletion = YES;/// 完成删除
    reversAnim.repeatCount = repeatCount;/// 重复次数
    self.addAnimationBy(reversAnim);/// 添加
    return reversAnim;
}
/// 转场动画实例
/// - Parameters:
///   - animType: 转场动画类型
///   - subType:  转动动画方向
///   - curve:    转动动画曲线
///   - duration: 转动动画时长
-(CATransition *_Nullable)transitionWithAnimType:(TransitionAnimType)animType
                                         subType:(TransitionSubType)subType
                                           curve:(TransitionCurve)curve
                                        duration:(CGFloat)duration{
    NSString *key = @"transition";
    if([self animationForKey:key]) [self removeAnimationForKey:key];
    @jobs_weakify(self)
    CATransition *transition = jobsMakeCATransition(^(__kindof CATransition * _Nullable data) {
        @jobs_strongify(self)
        data.duration = duration;/// 动画时长
        data.type = self.animaTypeWithTransitionType(animType);/// 动画类型
        data.subtype = self.animaSubtype(subType);/// 动画方向
        data.timingFunction = [CAMediaTimingFunction functionWithName:self.curve(curve)];/// 缓动函数
        data.removedOnCompletion = YES;/// 完成动画删除
    });[self addAnimation:transition forKey:key];
    return transition;
}
/// 返回动画曲线
-(JobsRetStrByIntegerBlock _Nonnull)curve{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(TransitionCurve curve){
        /// 曲线数组
        @jobs_strongify(self)
        return (NSString *)[self objFromArray:jobsMakeMutArr(^(NSMutableArray <CAMediaTimingFunctionName>*_Nullable data) {
            data.add(kCAMediaTimingFunctionDefault);
            data.add(kCAMediaTimingFunctionEaseIn);
            data.add(kCAMediaTimingFunctionEaseInEaseOut);
            data.add(kCAMediaTimingFunctionEaseOut);
            data.add(kCAMediaTimingFunctionLinear);
        })index:curve isRamdom:(TransitionCurveRandom == curve)];
    };
}
/// 返回动画方向
-(JobsRetStrByIntegerBlock _Nonnull)animaSubtype{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(TransitionCurve subType){
        /// 设置转场动画的方向
        @jobs_strongify(self)
        return (NSString *)[self objFromArray:jobsMakeMutArr(^(NSMutableArray <CATransitionSubtype>*_Nullable data) {
            data.add(kCATransitionFromTop);
            data.add(kCATransitionFromLeft);
            data.add(kCATransitionFromBottom);
            data.add(kCATransitionFromRight);
        }) index:subType isRamdom:((NSInteger)TransitionSubtypesFromRandom == subType)];
    };
}
/// 返回动画类型
-(JobsRetStrByIntegerBlock _Nonnull)animaTypeWithTransitionType{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(TransitionCurve type){
        /// 设置转场动画的类型
        @jobs_strongify(self)
        return [self objFromArray:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(@"rippleEffect");
            data.add(@"suckEffect");
            data.add(@"pageCurl");
            data.add(@"oglFlip");
            data.add(@"cube");
            data.add(@"reveal");
            data.add(@"pageUnCurl");
        })index:type isRamdom:((NSInteger)TransitionAnimTypeRandom == type)];
    };
}
/// 添加Layer
-(JobsRetCALayerByCALayerBlock _Nonnull)addSublayer{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CALayer *_Nullable data){
        @jobs_strongify(self)
        [self addSublayer:data];
        return data;
    };
}
/// 删除Layer
-(jobsByVoidBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self removeFromSuperlayer];
    };
}
/// 统一从数据返回对象
-(id _Nullable)objFromArray:(NSArray *_Nullable)array
                      index:(NSUInteger)index
                   isRamdom:(BOOL)isRamdom{
    NSUInteger count = array.count;
    NSUInteger i = isRamdom?arc4random_uniform((u_int32_t)count) : index;
    return array[i];
}
#pragma mark —— 迎合链式语法而做的封装
-(JobsRetCALayerByCGFloatBlock _Nonnull)cornerRadiusBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.cornerRadius = data;
        return self;
    };
}

-(JobsRetCALayerByCGFloatBlock _Nonnull)borderWidthBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(JobsRetCALayerByCorBlock _Nonnull)borderColorBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.borderColor = data.CGColor;
        return self;
    };
}

-(JobsRetCALayerByBOOLBlock _Nonnull)masksToBoundsBy{
    @jobs_weakify(self)
    return ^__kindof CALayer *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

@end
