//
//  NSObject+CallBackInfoByBlock.h
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
/**
【命名规则】：
    1、无返回值省略Return
    2、无入参标志为Void
    3、入参、返回值同一类型，标识为ReturnBy
    4、有返回值前缀Jobs、无返回值前缀jobs
 */
NS_ASSUME_NONNULL_BEGIN
/// 在 Objective-C 中，向 nil 对象发送消息不会崩溃
/// 但是如果你尝试对 nil 对象调用分类中的方法，可能会导致问题。
/// 这是因为 nil 对象并不会执行任何方法实现，分类中的方法也不会被调用。
@interface NSObject (CallBackInfoByBlock)
#pragma mark —— 单入参Block
Prop_copy(nullable)jobsByVoidBlock voidBlock;/// 无入参，无返回值的回调
-(void)actionVoidBlock:(jobsByVoidBlock _Nullable)voidBlock;

Prop_copy(nullable)jobsByIDBlock objBlock;/// 入参为ID类型，无返回值的回调
Prop_copy(nullable)jobsByGestureRecognizerBlock gestureRecognizerBlock;/// 入参为UIGestureRecognizer，无返回值的回调
Prop_copy(nullable)jobsBySELBlock selBlock;/// 入参为SEL，无返回值的回调
Prop_copy(nullable)jobsByStrBlock stringBlock;/// 入参为NSString，无返回值的回调
-(void)actionObjBlock:(jobsByIDBlock _Nullable)objBlock;
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock;
-(void)actionSelBlock:(jobsBySELBlock _Nullable)selBlock;
-(void)actionStringBlock:(jobsByStrBlock _Nullable)stringBlock;

Prop_copy(nullable)jobsByNSIntegerBlock integerBlock;/// 入参为NSInteger，无返回值的回调
Prop_copy(nullable)jobsByNSUIntegerBlock uIntegerBlock;/// 入参为NSUInteger，无返回值的回调
Prop_copy(nullable)jobsByCGFloatBlock cGFloatBlock;/// 入参CGFloat，无返回值的回调
Prop_copy(nullable)jobsByBOOLBlock bOOLBlock;/// 入参为BOOL，无返回值的回调
Prop_copy(nullable)jobsByIntBlock intBlock;/// 入参为Int，无返回值的回调
Prop_copy(nullable)jobsByUnsignedIntBlock unsignedIntBlock;/// 入参为UnsignedInt，无返回值的回调
Prop_copy(nullable)jobsByFloatBlock floatBlock;/// 入参为Float，无返回值的回调
Prop_copy(nullable)jobsByDoubleBlock doubleBlock;/// 入参为Double，无返回值的回调
Prop_copy(nullable)jobsByCharBlock charBlock;/// 入参为Char，无返回值的回调
Prop_copy(nullable)jobsByUnsignedCharBlock unsignedCharBlock;/// 入参为IUnsignedChar，无返回值的回调
Prop_copy(nullable)jobsByShortBlock shortBlock;/// 入参为Short，无返回值的回调
Prop_copy(nullable)jobsByUnsignedShortBlock unsignedShortBlock;/// 入参为UnsignedShort，无返回值的回调
Prop_copy(nullable)jobsByLongBlock longBlock;/// 入参为Long，无返回值的回调
Prop_copy(nullable)jobsByUnsignedLongBlock unsignedLongBlock;/// 入参为UnsignedLong，无返回值的回调
Prop_copy(nullable)jobsByUnsignedLongLongBlock unsignedLongLongBlock;/// 入参为IUnsignedLongLong，无返回值的回调
-(void)actionIntegerBlock:(jobsByNSIntegerBlock _Nullable)integerBlock;
-(void)actionUIntegerBlock:(jobsByNSUIntegerBlock _Nullable)uIntegerBlock;
-(void)actionCGFloatBlock:(jobsByCGFloatBlock _Nullable)CGFloatBlock;
-(void)actionBOOLBlock:(jobsByBOOLBlock _Nullable)bOOLBlock;
-(void)actionIntBlock:(jobsByIntBlock _Nullable)IntBlock;
-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock _Nullable)UnsignedIntBlock;
-(void)actionFloatBlock:(jobsByFloatBlock _Nullable)FloatBlock;
-(void)actionDoubleBlock:(jobsByDoubleBlock _Nullable)DoubleBlock;
-(void)actionCharBlock:(jobsByCharBlock _Nullable)CharBlock;
-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock _Nullable)UnsignedCharBlock;
-(void)actionShortBlock:(jobsByShortBlock _Nullable)ShortBlock;
-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock _Nullable)UnsignedShortBlock;
-(void)actionLongBlock:(jobsByLongBlock _Nullable)LongBlock;
-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock _Nullable)UnsignedLongBlock;
-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock _Nullable)UnsignedLongLongBlock;

Prop_copy(nullable)jobsByTwoIDBlock selectorBlock;
-(void)actionSelectorBlock:(jobsByTwoIDBlock _Nullable)SelectorBlock;

Prop_copy(nullable)JobsRetIDByVoidBlock retIDByVoidBlock;/// 无入参，返回值为ID的回调
-(void)actionRetIDByVoidBlock:(JobsRetIDByVoidBlock _Nullable)retIDByVoidBlock;

Prop_copy(nullable)JobsRetIDByGestureBlock retIDByGestureRecognizerBlock;/// 入参为UIGestureRecognizer，返回值为ID的回调
Prop_copy(nullable)JobsRetIDBySELBlock retIDBySELBlock;/// 入参为SEL，返回值为ID的回调
Prop_copy(nullable)JobsRetIDByStrBlock retIDByStringBlock;/// 入参为NSString，返回值为ID的回调
Prop_copy(nullable)JobsRetNSIntegerByIDBlock retIntegerByIDBlock;
Prop_copy(nullable)JobsRetNSUIntegerByIDBlock retUIntegerByIDBlock;
Prop_copy(nullable)JobsRetCGFloatByIDBlock retCGFloatByIDBlock;
Prop_copy(nullable)JobsRetBOOLByIDBlock retBoolByIDBlock;
Prop_copy(nullable)JobsRetIntByIDBlock retIntByIDBlock;
Prop_copy(nullable)JobsRetUnsignedIntByIDBlock retUnsignedIntByIDBlock;
Prop_copy(nullable)JobsRetFloatByIDBlock retFloatByIDBlock;
Prop_copy(nullable)JobsRetDoubleByIDBlock retDoubleByIDBlock;
Prop_copy(nullable)JobsRetCharByIDBlock retCharByIDBlock;
Prop_copy(nullable)JobsRetUnsignedCharByIDBlock retUnsignedCharByIDBlock;
Prop_copy(nullable)JobsRetShortByIDBlock retShortByIDBlock;
Prop_copy(nullable)JobsRetUnsignedShortByIDBlock retUnsignedShortByIDBlock;
Prop_copy(nullable)JobsRetLongByIDBlock retLongByIDBlock;
Prop_copy(nullable)JobsRetUnsignedLongByIDBlock retUnsignedLongByIDBlock;
Prop_copy(nullable)JobsRetUnsignedLongLongByIDBlock retUnsignedLongLongByIDBlock;
-(void)actionRetIDByGestureRecognizerBlock:(JobsRetIDByGestureBlock _Nullable)retIDByGestureRecognizerBlock;
-(void)actionRetIDBySELBlock:(JobsRetIDBySELBlock _Nullable)retIDBySELBlock;
-(void)actionRetIDByStringBlock:(JobsRetIDByStrBlock _Nullable)retIDByStringBlock;
-(void)actionRetIntegerByIDBlock:(JobsRetNSIntegerByIDBlock _Nullable)retIntegerByIDBlock;
-(void)actionRetUIntegerByIDBlock:(JobsRetNSUIntegerByIDBlock _Nullable)retUIntegerByIDBlock;
-(void)actionRetCGFloatByIDBlock:(JobsRetCGFloatByIDBlock _Nullable)retCGFloatByIDBlock;
-(void)actionRetBoolByIDBlock:(JobsRetBOOLByIDBlock _Nullable)retBoolByIDBlock;
-(void)actionRetIntByIDBlock:(JobsRetIntByIDBlock _Nullable)retIntByIDBlock;
-(void)actionRetUnsignedIntByIDBlock:(JobsRetUnsignedIntByIDBlock _Nullable)retUnsignedIntByIDBlock;
-(void)actionRetFloatByIDBlock:(JobsRetFloatByIDBlock _Nullable)retFloatByIDBlock;
-(void)actionRetDoubleByIDBlock:(JobsRetDoubleByIDBlock _Nullable)retDoubleByIDBlock;
-(void)actionRetCharByIDBlock:(JobsRetCharByIDBlock _Nullable)retCharByIDBlock;
-(void)actionRetUnsignedCharByIDBlock:(JobsRetUnsignedCharByIDBlock _Nullable)retUnsignedCharByIDBlock;
-(void)actionRetShortByIDBlock:(JobsRetShortByIDBlock _Nullable)retShortByIDBlock;
-(void)actionRetUnsignedShortByIDBlock:(JobsRetUnsignedShortByIDBlock _Nullable)retUnsignedShortByIDBlock;
-(void)actionRetLongByIDBlock:(JobsRetLongByIDBlock _Nullable)retLongByIDBlock;
-(void)actionRetUnsignedLongByIDBlock:(JobsRetUnsignedLongByIDBlock _Nullable)retUnsignedLongByIDBlock;
-(void)actionRetUnsignedLongLongByIDBlock:(JobsRetUnsignedLongLongByIDBlock _Nullable)retUnsignedLongLongByIDBlock;

Prop_copy(nullable)JobsRetIDByIDBlock retObjBlock;/// 返回值为ID的回调
Prop_copy(nullable)JobsRetByNSIntegerBlock retIntegerBlock;/// 返回值为NSInteger的回调
Prop_copy(nullable)JobsRetByNSUIntegerBlock retUIntegerBlock;/// 返回值为UInteger的回调
Prop_copy(nullable)JobsRetCGFloatByCGFloatBlock retCGFloatBlock;/// 返回值为CGFloat的回调
Prop_copy(nullable)JobsRetBOOLByBOOLBlock retBoolBlock;/// 返回值为BOOL的回调
Prop_copy(nullable)JobsRetBOOLByNSUIntegerBlock retBoolByUIntegerBlock;/// 入参为NSUInteger，返回值为BOOL的回调
Prop_copy(nullable)JobsRetIntByIntBlock retIntBlock;/// 返回值为Int的回调
Prop_copy(nullable)JobsRetByUnsignedIntBlock retUnsignedIntBlock;/// 返回值为UnsignedInt的回调
Prop_copy(nullable)JobsRetByFloatBlock retFloatBlock;/// 返回值为Float的回调
Prop_copy(nullable)JobsRetByDoubleBlock retDoubleBlock;/// 返回值为Double的回调
Prop_copy(nullable)JobsRetByCharBlock retCharBlock;/// 返回值为Char的回调
Prop_copy(nullable)JobsRetByUnsignedCharBlock retUnsignedCharBlock;/// 返回值为UnsignedChar的回调
Prop_copy(nullable)JobsRetByShortBlock retShortBlock;/// 返回值为Short的回调
Prop_copy(nullable)JobsRetByUnsignedShortBlock retUnsignedShortBlock;/// 返回值为UnsignedShort的回调
Prop_copy(nullable)JobsRetByLongBlock retLongBlock;/// 返回值为Long的回调
Prop_copy(nullable)JobsRetByUnsignedLongBlock retUnsignedLongBlock;/// 返回值为UnsignedLong的回调
Prop_copy(nullable)JobsRetByUnsignedLongLongBlock retUnsignedLongLongBlock;/// 返回值为UnsignedLongLong的回调
-(void)actionRetObjBlock:(JobsRetIDByIDBlock _Nullable)retObjBlock;
-(void)actionRetIntegerBlock:(JobsRetByNSIntegerBlock _Nullable)retIntegerBlock;
-(void)actionRetUIntegerBlock:(JobsRetByNSUIntegerBlock _Nullable)retUIntegerBlock;
-(void)actionRetCGFloatBlock:(JobsRetCGFloatByCGFloatBlock _Nullable)retCGFloatBlock;
-(void)actionRetBoolBlock:(JobsRetBOOLByBOOLBlock _Nullable)retBoolBlock;
-(void)actionRetBoolByUIntegerBlock:(JobsRetBOOLByNSUIntegerBlock _Nullable)retBoolByUIntegerBlock;
-(void)actionRetIntBlock:(JobsRetIntByIntBlock _Nullable)retIntBlock;
-(void)actionRetUnsignedIntBlock:(JobsRetByUnsignedIntBlock _Nullable)retUnsignedIntBlock;
-(void)actionRetFloatBlock:(JobsRetByFloatBlock _Nullable)retFloatBlock;
-(void)actionRetDoubleBlock:(JobsRetByDoubleBlock _Nullable)retDoubleBlock;
-(void)actionRetCharBlock:(JobsRetByCharBlock _Nullable)retCharBlock;
-(void)actionRetUnsignedCharBlock:(JobsRetByUnsignedCharBlock _Nullable)retUnsignedCharBlock;
-(void)actionRetShortBlock:(JobsRetByShortBlock _Nullable)retShortBlock;
-(void)actionRetUnsignedShortBlock:(JobsRetByUnsignedShortBlock _Nullable)retUnsignedShortBlock;
-(void)actionRetLongBlock:(JobsRetByLongBlock _Nullable)retLongBlock;
-(void)actionRetUnsignedLongBlock:(JobsRetByUnsignedLongBlock _Nullable)retUnsignedLongBlock;
-(void)actionRetUnsignedLongLongBlock:(JobsRetByUnsignedLongLongBlock _Nullable)retUnsignedLongLongBlock;

Prop_copy(nullable)JobsRetIDByTwoIDBlock retIDBySelectorBlock;
-(void)actionRetIDBySelectorBlock:(JobsRetIDByTwoIDBlock _Nullable)retIDBySelectorBlock;
/// UIView
-(JobsReturnViewByIDBlocks _Nullable)JobsBlock1;
-(JobsReturnIDByRetIDVoidBlocks _Nullable)JobsBlock2;
-(JobsReturnIDByRetIDByIDBlocks _Nullable)JobsBlock3;
/// UIViewController
-(JobsReturnVCByIDBlocks _Nullable)JobsBlock4;
-(JobsReturnVCByRetIDByVoidBlocks _Nullable)JobsBlock5;
-(JobsReturnVCByRetIDByIDBlocks _Nullable)JobsBlock6;
#pragma mark —— 多入参Block
//Prop_copy(nullable)jobsDynArgsBlock dynArgsBlock;
//Prop_copy(nullable)JobsReturnIDByDynArgsBlock retIDByDynArgsBlock;
//Prop_copy(nullable)JobsReturnCGSizeByDynArgsBlock retCGSizeByDynArgsBlock;
//Prop_copy(nullable)JobsReturnCGRectByDynArgsBlock retCGRectByDynArgsBlock;
//Prop_copy(nullable)JobsReturnCGPointByDynArgsBlock retCGPointByDynArgsBlock;

@end

NS_ASSUME_NONNULL_END
