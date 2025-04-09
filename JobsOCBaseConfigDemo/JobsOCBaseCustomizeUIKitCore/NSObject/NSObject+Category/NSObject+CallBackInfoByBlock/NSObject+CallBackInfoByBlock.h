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
Prop_copy(nullable)jobsByStringBlock stringBlock;/// 入参为NSString，无返回值的回调
-(void)actionObjBlock:(jobsByIDBlock _Nullable)objBlock;
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock _Nullable)gestureRecognizerBlock;
-(void)actionSelBlock:(jobsBySELBlock _Nullable)selBlock;
-(void)actionStringBlock:(jobsByStringBlock _Nullable)stringBlock;

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

Prop_copy(nullable)JobsSelectorBlock selectorBlock;
-(void)actionSelectorBlock:(JobsSelectorBlock _Nullable)SelectorBlock;

Prop_copy(nullable)JobsReturnIDByVoidBlock retIDByVoidBlock;/// 无入参，返回值为ID的回调
-(void)actionRetIDByVoidBlock:(JobsReturnIDByVoidBlock _Nullable)retIDByVoidBlock;

Prop_copy(nullable)JobsReturnIDByGestureRecognizerBlock retIDByGestureRecognizerBlock;/// 入参为UIGestureRecognizer，返回值为ID的回调
Prop_copy(nullable)JobsReturnIDBySELBlock retIDBySELBlock;/// 入参为SEL，返回值为ID的回调
Prop_copy(nullable)JobsReturnIDByStringBlock retIDByStringBlock;/// 入参为NSString，返回值为ID的回调
Prop_copy(nullable)JobsReturnNSIntegerByIDBlock retIntegerByIDBlock;
Prop_copy(nullable)JobsReturnNSUIntegerByIDBlock retUIntegerByIDBlock;
Prop_copy(nullable)JobsReturnCGFloatByIDBlock retCGFloatByIDBlock;
Prop_copy(nullable)JobsReturnBOOLByIDBlock retBoolByIDBlock;
Prop_copy(nullable)JobsReturnIntByIDBlock retIntByIDBlock;
Prop_copy(nullable)JobsReturnUnsignedIntByIDBlock retUnsignedIntByIDBlock;
Prop_copy(nullable)JobsReturnFloatByIDBlock retFloatByIDBlock;
Prop_copy(nullable)JobsReturnDoubleByIDBlock retDoubleByIDBlock;
Prop_copy(nullable)JobsReturnCharByIDBlock retCharByIDBlock;
Prop_copy(nullable)JobsReturnUnsignedCharByIDBlock retUnsignedCharByIDBlock;
Prop_copy(nullable)JobsReturnShortByIDBlock retShortByIDBlock;
Prop_copy(nullable)JobsReturnUnsignedShortByIDBlock retUnsignedShortByIDBlock;
Prop_copy(nullable)JobsReturnLongByIDBlock retLongByIDBlock;
Prop_copy(nullable)JobsReturnUnsignedLongByIDBlock retUnsignedLongByIDBlock;
Prop_copy(nullable)JobsReturnUnsignedLongLongByIDBlock retUnsignedLongLongByIDBlock;
-(void)actionRetIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock _Nullable)retIDByGestureRecognizerBlock;
-(void)actionRetIDBySELBlock:(JobsReturnIDBySELBlock _Nullable)retIDBySELBlock;
-(void)actionRetIDByStringBlock:(JobsReturnIDByStringBlock _Nullable)retIDByStringBlock;
-(void)actionRetIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock _Nullable)retIntegerByIDBlock;
-(void)actionRetUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock _Nullable)retUIntegerByIDBlock;
-(void)actionRetCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock _Nullable)retCGFloatByIDBlock;
-(void)actionRetBoolByIDBlock:(JobsReturnBOOLByIDBlock _Nullable)retBoolByIDBlock;
-(void)actionRetIntByIDBlock:(JobsReturnIntByIDBlock _Nullable)retIntByIDBlock;
-(void)actionRetUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock _Nullable)retUnsignedIntByIDBlock;
-(void)actionRetFloatByIDBlock:(JobsReturnFloatByIDBlock _Nullable)retFloatByIDBlock;
-(void)actionRetDoubleByIDBlock:(JobsReturnDoubleByIDBlock _Nullable)retDoubleByIDBlock;
-(void)actionRetCharByIDBlock:(JobsReturnCharByIDBlock _Nullable)retCharByIDBlock;
-(void)actionRetUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock _Nullable)retUnsignedCharByIDBlock;
-(void)actionRetShortByIDBlock:(JobsReturnShortByIDBlock _Nullable)retShortByIDBlock;
-(void)actionRetUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock _Nullable)retUnsignedShortByIDBlock;
-(void)actionRetLongByIDBlock:(JobsReturnLongByIDBlock _Nullable)retLongByIDBlock;
-(void)actionRetUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock _Nullable)retUnsignedLongByIDBlock;
-(void)actionRetUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock _Nullable)retUnsignedLongLongByIDBlock;

Prop_copy(nullable)JobsReturnIDByIDBlock retObjBlock;/// 返回值为ID的回调
Prop_copy(nullable)JobsReturnByNSIntegerBlock retIntegerBlock;/// 返回值为NSInteger的回调
Prop_copy(nullable)JobsReturnByNSUIntegerBlock retUIntegerBlock;/// 返回值为UInteger的回调
Prop_copy(nullable)JobsReturnCGFloatByCGFloatBlock retCGFloatBlock;/// 返回值为CGFloat的回调
Prop_copy(nullable)JobsReturnBOOLByBOOLBlock retBoolBlock;/// 返回值为BOOL的回调
Prop_copy(nullable)JobsReturnBOOLByNSUIntegerBlock retBoolByUIntegerBlock;/// 入参为NSUInteger，返回值为BOOL的回调
Prop_copy(nullable)JobsReturnIntByIntBlock retIntBlock;/// 返回值为Int的回调
Prop_copy(nullable)JobsReturnByUnsignedIntBlock retUnsignedIntBlock;/// 返回值为UnsignedInt的回调
Prop_copy(nullable)JobsReturnByFloatBlock retFloatBlock;/// 返回值为Float的回调
Prop_copy(nullable)JobsReturnByDoubleBlock retDoubleBlock;/// 返回值为Double的回调
Prop_copy(nullable)JobsReturnByCharBlock retCharBlock;/// 返回值为Char的回调
Prop_copy(nullable)JobsReturnByUnsignedCharBlock retUnsignedCharBlock;/// 返回值为UnsignedChar的回调
Prop_copy(nullable)JobsReturnByShortBlock retShortBlock;/// 返回值为Short的回调
Prop_copy(nullable)JobsReturnByUnsignedShortBlock retUnsignedShortBlock;/// 返回值为UnsignedShort的回调
Prop_copy(nullable)JobsReturnByLongBlock retLongBlock;/// 返回值为Long的回调
Prop_copy(nullable)JobsReturnByUnsignedLongBlock retUnsignedLongBlock;/// 返回值为UnsignedLong的回调
Prop_copy(nullable)JobsReturnByUnsignedLongLongBlock retUnsignedLongLongBlock;/// 返回值为UnsignedLongLong的回调
-(void)actionRetObjBlock:(JobsReturnIDByIDBlock _Nullable)retObjBlock;
-(void)actionRetIntegerBlock:(JobsReturnByNSIntegerBlock _Nullable)retIntegerBlock;
-(void)actionRetUIntegerBlock:(JobsReturnByNSUIntegerBlock _Nullable)retUIntegerBlock;
-(void)actionRetCGFloatBlock:(JobsReturnCGFloatByCGFloatBlock _Nullable)retCGFloatBlock;
-(void)actionRetBoolBlock:(JobsReturnBOOLByBOOLBlock _Nullable)retBoolBlock;
-(void)actionRetBoolByUIntegerBlock:(JobsReturnBOOLByNSUIntegerBlock _Nullable)retBoolByUIntegerBlock;
-(void)actionRetIntBlock:(JobsReturnIntByIntBlock _Nullable)retIntBlock;
-(void)actionRetUnsignedIntBlock:(JobsReturnByUnsignedIntBlock _Nullable)retUnsignedIntBlock;
-(void)actionRetFloatBlock:(JobsReturnByFloatBlock _Nullable)retFloatBlock;
-(void)actionRetDoubleBlock:(JobsReturnByDoubleBlock _Nullable)retDoubleBlock;
-(void)actionRetCharBlock:(JobsReturnByCharBlock _Nullable)retCharBlock;
-(void)actionRetUnsignedCharBlock:(JobsReturnByUnsignedCharBlock _Nullable)retUnsignedCharBlock;
-(void)actionRetShortBlock:(JobsReturnByShortBlock _Nullable)retShortBlock;
-(void)actionRetUnsignedShortBlock:(JobsReturnByUnsignedShortBlock _Nullable)retUnsignedShortBlock;
-(void)actionRetLongBlock:(JobsReturnByLongBlock _Nullable)retLongBlock;
-(void)actionRetUnsignedLongBlock:(JobsReturnByUnsignedLongBlock _Nullable)retUnsignedLongBlock;
-(void)actionRetUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock _Nullable)retUnsignedLongLongBlock;

Prop_copy(nullable)JobsReturnIDBySelectorBlock retIDBySelectorBlock;
-(void)actionRetIDBySelectorBlock:(JobsReturnIDBySelectorBlock _Nullable)retIDBySelectorBlock;
/// 一些复合型Block
-(JobsReturnViewByBlock1 _Nullable)JobsBlock1;
-(JobsReturnViewByBlock2 _Nullable)JobsBlock2;
-(JobsReturnViewByBlock3 _Nullable)JobsBlock3;
#pragma mark —— 多入参Block
//Prop_copy(nullable)jobsDynArgsBlock dynArgsBlock;
//Prop_copy(nullable)JobsReturnIDByDynArgsBlock retIDByDynArgsBlock;
//Prop_copy(nullable)JobsReturnCGSizeByDynArgsBlock retCGSizeByDynArgsBlock;
//Prop_copy(nullable)JobsReturnCGRectByDynArgsBlock retCGRectByDynArgsBlock;
//Prop_copy(nullable)JobsReturnCGPointByDynArgsBlock retCGPointByDynArgsBlock;

@end

NS_ASSUME_NONNULL_END
