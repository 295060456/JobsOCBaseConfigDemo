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
    return ^__kindof UIView *_Nullable(JobsReturnIDByVoidBlock _Nullable data){
        @jobs_strongify(self)
        [self setRetIDByVoidBlock:data];
        return (UIView *)self;
    };
}

-(JobsReturnIDByRetIDByIDBlocks _Nullable)JobsBlock3{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(JobsReturnIDByIDBlock _Nullable data){
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
    return ^__kindof UIViewController *_Nullable(JobsReturnIDByVoidBlock _Nullable data){
        @jobs_strongify(self)
        [self setRetIDByVoidBlock:data];
        return (UIViewController *)self;
    };
}

-(JobsReturnVCByRetIDByIDBlocks _Nullable)JobsBlock6{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(JobsReturnIDByIDBlock _Nullable data){
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
JobsDynamicPropSetAndGet(jobsByStringBlock, stringBlock, StringBlock)
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
JobsDynamicPropSetAndGet(JobsReturnIDByVoidBlock, retIDByVoidBlock, RetIDByVoidBlock)
JobsDynamicPropSetAndGet(JobsReturnIDByGestureRecognizerBlock, retIDByGestureRecognizerBlock, RetIDByGestureRecognizerBlock)
JobsDynamicPropSetAndGet(JobsReturnIDBySELBlock, retIDBySELBlock, RetIDBySELBlock)
JobsDynamicPropSetAndGet(JobsReturnIDByStringBlock, retIDByStringBlock, RetIDByStringBlock)
JobsDynamicPropSetAndGet(JobsReturnNSIntegerByIDBlock, retIntegerByIDBlock, RetIntegerByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnNSUIntegerByIDBlock, retUIntegerByIDBlock, RetUIntegerByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnCGFloatByIDBlock, retCGFloatByIDBlock, RetCGFloatByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnBOOLByIDBlock, retBoolByIDBlock, RetBoolByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnIntByIDBlock, retIntByIDBlock, RetIntByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnUnsignedIntByIDBlock, retUnsignedIntByIDBlock, RetUnsignedIntByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnFloatByIDBlock, retFloatByIDBlock, RetFloatByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnDoubleByIDBlock, retDoubleByIDBlock, RetDoubleByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnCharByIDBlock, retCharByIDBlock, RetCharByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnUnsignedCharByIDBlock, retUnsignedCharByIDBlock, RetUnsignedCharByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnShortByIDBlock, retShortByIDBlock, RetShortByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnUnsignedShortByIDBlock, retUnsignedShortByIDBlock, RetUnsignedShortByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnLongByIDBlock, retLongByIDBlock, RetLongByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnUnsignedLongByIDBlock, retUnsignedLongByIDBlock, RetUnsignedLongByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnUnsignedLongLongByIDBlock, retUnsignedLongLongByIDBlock, RetUnsignedLongLongByIDBlock)
JobsDynamicPropSetAndGet(JobsReturnIDByIDBlock, retObjBlock, RetObjBlock)
JobsDynamicPropSetAndGet(JobsReturnByNSIntegerBlock, retIntegerBlock, RetIntegerBlock)
JobsDynamicPropSetAndGet(JobsReturnByNSUIntegerBlock, retUIntegerBlock, RetUIntegerBlock)
JobsDynamicPropSetAndGet(JobsReturnCGFloatByCGFloatBlock, retCGFloatBlock, RetCGFloatBlock)
JobsDynamicPropSetAndGet(JobsReturnBOOLByBOOLBlock, retBoolBlock, RetBoolBlock)
JobsDynamicPropSetAndGet(JobsReturnBOOLByNSUIntegerBlock, retBoolByUIntegerBlock, RetBoolByUIntegerBlock)
JobsDynamicPropSetAndGet(JobsReturnIntByIntBlock, retIntBlock, RetIntBlock)
JobsDynamicPropSetAndGet(JobsReturnByUnsignedIntBlock, retUnsignedIntBlock, RetUnsignedIntBlock)
JobsDynamicPropSetAndGet(JobsReturnByFloatBlock, retFloatBlock, RetFloatBlock)
JobsDynamicPropSetAndGet(JobsReturnByDoubleBlock, retDoubleBlock, RetDoubleBlock)
JobsDynamicPropSetAndGet(JobsReturnByCharBlock, retCharBlock, RetCharBlock)
JobsDynamicPropSetAndGet(JobsReturnByUnsignedCharBlock, retUnsignedCharBlock, RetUnsignedCharBlock)
JobsDynamicPropSetAndGet(JobsReturnByShortBlock, retShortBlock, RetShortBlock)
JobsDynamicPropSetAndGet(JobsReturnByUnsignedShortBlock, retUnsignedShortBlock, RetUnsignedShortBlock)
JobsDynamicPropSetAndGet(JobsReturnByLongBlock, retLongBlock, RetLongBlock)
JobsDynamicPropSetAndGet(JobsReturnByUnsignedLongBlock, retUnsignedLongBlock, RetUnsignedLongBlock)
JobsDynamicPropSetAndGet(JobsReturnByUnsignedLongLongBlock, retUnsignedLongLongBlock, RetUnsignedLongLongBlock)
JobsDynamicPropSetAndGet(JobsReturnIDByTwoIDBlock, retIDBySelectorBlock, RetIDBySelectorBlock)

@end
