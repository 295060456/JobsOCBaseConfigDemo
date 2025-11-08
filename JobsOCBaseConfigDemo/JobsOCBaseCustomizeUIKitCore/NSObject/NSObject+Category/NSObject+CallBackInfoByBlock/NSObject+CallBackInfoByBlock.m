//
//  NSObject+CallBackInfoByBlock.m
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import "NSObject+CallBackInfoByBlock.h"
/// 在 Objective-C 中，向 nil 对象发送消息不会崩溃
/// 但是如果你尝试对 nil 对象调用分类中的方法，可能会导致问题。
/// 这是因为 nil 对象并不会执行任何方法实现，分类中的方法也不会被调用。
@implementation NSObject (CallBackInfoByBlock)
#pragma mark —— UIView
-(JobsReturnViewByIDBlocks _Nullable)JobsBlock1{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(jobsByIDBlock _Nullable data){
        @jobs_strongify(self)
        [self setObjBlock:data];
        return (UIView *)self;
    };
}

-(JobsReturnIDByRetIDVoidBlocks _Nullable)JobsBlock2{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(JobsRetIDByVoidBlock _Nullable data){
        @jobs_strongify(self)
        [self setRetIDByVoidBlock:data];
        return (UIView *)self;
    };
}

-(JobsReturnIDByRetIDByIDBlocks _Nullable)JobsBlock3{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(JobsRetIDByIDBlock _Nullable data){
        @jobs_strongify(self)
        [self setRetObjBlock:data];
        return (UIView *)self;
    };
}
#pragma mark —— UIViewController
-(JobsReturnVCByIDBlocks _Nullable)JobsBlock4{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(jobsByIDBlock _Nullable data){
        @jobs_strongify(self)
        [self setObjBlock:data];
        return (UIViewController *)self;
    };
}

-(JobsReturnVCByRetIDByVoidBlocks _Nullable)JobsBlock5{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(JobsRetIDByVoidBlock _Nullable data){
        @jobs_strongify(self)
        [self setRetIDByVoidBlock:data];
        return (UIViewController *)self;
    };
}

-(JobsReturnVCByRetIDByIDBlocks _Nullable)JobsBlock6{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(JobsRetIDByIDBlock _Nullable data){
        @jobs_strongify(self)
        [self setRetObjBlock:data];
        return (UIViewController *)self;
    };
}
#pragma mark —— SET/GET
JobsDynamicPropSetAndGet(jobsByVoidBlock, voidBlock, VoidBlock)
JobsDynamicPropSetAndGet(jobsByIDBlock, objBlock, ObjBlock)
JobsDynamicPropSetAndGet(jobsByGestureRecognizerBlock, gestureRecognizerBlock, GestureRecognizerBlock)
JobsDynamicPropSetAndGet(jobsBySELBlock, selBlock, SelBlock)
JobsDynamicPropSetAndGet(jobsByStrBlock, stringBlock, StringBlock)
JobsDynamicPropSetAndGet(jobsByNSIntegerBlock, integerBlock, IntegerBlock)
JobsDynamicPropSetAndGet(jobsByNSUIntegerBlock, uIntegerBlock, UIntegerBlock)
JobsDynamicPropSetAndGet(jobsByCGFloatBlock, cGFloatBlock, CGFloatBlock)
JobsDynamicPropSetAndGet(jobsByBOOLBlock, bOOLBlock, BOOLBlock)
JobsDynamicPropSetAndGet(jobsByIntBlock, intBlock, IntBlock)
JobsDynamicPropSetAndGet(jobsByUnsignedIntBlock, unsignedIntBlock, UnsignedIntBlock)
JobsDynamicPropSetAndGet(jobsByFloatBlock, floatBlock, FloatBlock)
JobsDynamicPropSetAndGet(jobsByDoubleBlock, doubleBlock, DoubleBlock)
JobsDynamicPropSetAndGet(jobsByCharBlock, charBlock, CharBlock)
JobsDynamicPropSetAndGet(jobsByUnsignedCharBlock, unsignedCharBlock, UnsignedCharBlock)
JobsDynamicPropSetAndGet(jobsByShortBlock, shortBlock, ShortBlock)
JobsDynamicPropSetAndGet(jobsByUnsignedShortBlock, unsignedShortBlock, UnsignedShortBlock)
JobsDynamicPropSetAndGet(jobsByLongBlock, longBlock, LongBlock)
JobsDynamicPropSetAndGet(jobsByUnsignedLongBlock, unsignedLongBlock, UnsignedLongBlock)
JobsDynamicPropSetAndGet(jobsByUnsignedLongLongBlock, unsignedLongLongBlock, UnsignedLongLongBlock)
JobsDynamicPropSetAndGet(jobsByTwoIDBlock, selectorBlock, SelectorBlock)
JobsDynamicPropSetAndGet(JobsRetIDByVoidBlock, retIDByVoidBlock, RetIDByVoidBlock)
JobsDynamicPropSetAndGet(JobsRetIDByGestureBlock, retIDByGestureRecognizerBlock, RetIDByGestureRecognizerBlock)
JobsDynamicPropSetAndGet(JobsRetIDBySELBlock, retIDBySELBlock, RetIDBySELBlock)
JobsDynamicPropSetAndGet(JobsRetIDByStrBlock, retIDByStringBlock, RetIDByStringBlock)
JobsDynamicPropSetAndGet(JobsRetNSIntegerByIDBlock, retIntegerByIDBlock, RetIntegerByIDBlock)
JobsDynamicPropSetAndGet(JobsRetNSUIntegerByIDBlock, retUIntegerByIDBlock, RetUIntegerByIDBlock)
JobsDynamicPropSetAndGet(JobsRetCGFloatByIDBlock, retCGFloatByIDBlock, RetCGFloatByIDBlock)
JobsDynamicPropSetAndGet(JobsRetBOOLByIDBlock, retBoolByIDBlock, RetBoolByIDBlock)
JobsDynamicPropSetAndGet(JobsRetIntByIDBlock, retIntByIDBlock, RetIntByIDBlock)
JobsDynamicPropSetAndGet(JobsRetUnsignedIntByIDBlock, retUnsignedIntByIDBlock, RetUnsignedIntByIDBlock)
JobsDynamicPropSetAndGet(JobsRetFloatByIDBlock, retFloatByIDBlock, RetFloatByIDBlock)
JobsDynamicPropSetAndGet(JobsRetDoubleByIDBlock, retDoubleByIDBlock, RetDoubleByIDBlock)
JobsDynamicPropSetAndGet(JobsRetCharByIDBlock, retCharByIDBlock, RetCharByIDBlock)
JobsDynamicPropSetAndGet(JobsRetUnsignedCharByIDBlock, retUnsignedCharByIDBlock, RetUnsignedCharByIDBlock)
JobsDynamicPropSetAndGet(JobsRetShortByIDBlock, retShortByIDBlock, RetShortByIDBlock)
JobsDynamicPropSetAndGet(JobsRetUnsignedShortByIDBlock, retUnsignedShortByIDBlock, RetUnsignedShortByIDBlock)
JobsDynamicPropSetAndGet(JobsRetLongByIDBlock, retLongByIDBlock, RetLongByIDBlock)
JobsDynamicPropSetAndGet(JobsRetUnsignedLongByIDBlock, retUnsignedLongByIDBlock, RetUnsignedLongByIDBlock)
JobsDynamicPropSetAndGet(JobsRetUnsignedLongLongByIDBlock, retUnsignedLongLongByIDBlock, RetUnsignedLongLongByIDBlock)
JobsDynamicPropSetAndGet(JobsRetIDByIDBlock, retObjBlock, RetObjBlock)
JobsDynamicPropSetAndGet(JobsRetByNSIntegerBlock, retIntegerBlock, RetIntegerBlock)
JobsDynamicPropSetAndGet(JobsRetByNSUIntegerBlock, retUIntegerBlock, RetUIntegerBlock)
JobsDynamicPropSetAndGet(JobsRetCGFloatByCGFloatBlock, retCGFloatBlock, RetCGFloatBlock)
JobsDynamicPropSetAndGet(JobsRetBOOLByBOOLBlock, retBoolBlock, RetBoolBlock)
JobsDynamicPropSetAndGet(JobsRetBOOLByNSUIntegerBlock, retBoolByUIntegerBlock, RetBoolByUIntegerBlock)
JobsDynamicPropSetAndGet(JobsRetIntByIntBlock, retIntBlock, RetIntBlock)
JobsDynamicPropSetAndGet(JobsRetByUnsignedIntBlock, retUnsignedIntBlock, RetUnsignedIntBlock)
JobsDynamicPropSetAndGet(JobsRetByFloatBlock, retFloatBlock, RetFloatBlock)
JobsDynamicPropSetAndGet(JobsRetByDoubleBlock, retDoubleBlock, RetDoubleBlock)
JobsDynamicPropSetAndGet(JobsRetByCharBlock, retCharBlock, RetCharBlock)
JobsDynamicPropSetAndGet(JobsRetByUnsignedCharBlock, retUnsignedCharBlock, RetUnsignedCharBlock)
JobsDynamicPropSetAndGet(JobsRetByShortBlock, retShortBlock, RetShortBlock)
JobsDynamicPropSetAndGet(JobsRetByUnsignedShortBlock, retUnsignedShortBlock, RetUnsignedShortBlock)
JobsDynamicPropSetAndGet(JobsRetByLongBlock, retLongBlock, RetLongBlock)
JobsDynamicPropSetAndGet(JobsRetByUnsignedLongBlock, retUnsignedLongBlock, RetUnsignedLongBlock)
JobsDynamicPropSetAndGet(JobsRetByUnsignedLongLongBlock, retUnsignedLongLongBlock, RetUnsignedLongLongBlock)
JobsDynamicPropSetAndGet(JobsRetIDByTwoIDBlock, retIDBySelectorBlock, RetIDBySelectorBlock)

@end
