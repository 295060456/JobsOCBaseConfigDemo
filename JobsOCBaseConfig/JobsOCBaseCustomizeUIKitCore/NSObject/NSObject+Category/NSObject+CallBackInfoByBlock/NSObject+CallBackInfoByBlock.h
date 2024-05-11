//
//  NSObject+CallBackInfoByBlock.h
//  DouDong-II
//
//  Created by Jobs on 2021/2/26.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
/**
【命名规则】：
    1、无返回值省略Return
    2、无入参标志为Void
    3、入参、返回值同一类型，标识为ReturnBy
    4、有返回值前缀Jobs、无返回值前缀jobs
 */
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CallBackInfoByBlock)
#pragma mark —— 1.1、无入参 ｜ 没有返回值
@property(nonatomic,assign)jobsByVoidBlock voidBlock;/// 无入参，无返回值的回调
-(void)actionVoidBlock:(jobsByVoidBlock)voidBlock;
#pragma mark —— 1.2、（单一）入参 ｜ 无返回值
@property(nonatomic,assign)jobsByIDBlock objectBlock;/// 入参为ID类型，无返回值的回调
@property(nonatomic,assign)jobsByGestureRecognizerBlock gestureRecognizerBlock;/// 入参为UIGestureRecognizer，无返回值的回调
@property(nonatomic,assign)jobsBySELBlock selBlock;///入参为SEL，无返回值的回调
@property(nonatomic,assign)jobsByStringBlock stringBlock;///入参为NSString，无返回值的回调
-(void)actionObjectBlock:(jobsByIDBlock)objectBlock;
-(void)actionGestureRecognizerBlock:(jobsByGestureRecognizerBlock)gestureRecognizerBlock;
-(void)actionSELBlock:(jobsBySELBlock)selBlock;
-(void)actionStringBlock:(jobsByStringBlock)stringBlock;
#pragma mark —— 1.3、（单一）入参为基本数据类型 ｜ 无返回值
@property(nonatomic,assign)jobsByNSIntegerBlock NSIntegerBlock;/// 入参为NSInteger，无返回值的回调
@property(nonatomic,assign)jobsByNSUIntegerBlock NSUIntegerBlock;/// 入参为NSUInteger，无返回值的回调
@property(nonatomic,assign)jobsByCGFloatBlock CGFloatBlock;/// 入参CGFloat，无返回值的回调
@property(nonatomic,assign)jobsByBOOLBlock BOOLBlock;/// 入参为BOOL，无返回值的回调
@property(nonatomic,assign)jobsByIntBlock IntBlock;/// 入参为Int，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedIntBlock UnsignedIntBlock;/// 入参为UnsignedInt，无返回值的回调
@property(nonatomic,assign)jobsByFloatBlock FloatBlock;/// 入参为Float，无返回值的回调
@property(nonatomic,assign)jobsByDoubleBlock DoubleBlock;/// 入参为Double，无返回值的回调
@property(nonatomic,assign)jobsByCharBlock CharBlock;/// 入参为Char，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedCharBlock UnsignedCharBlock;/// 入参为IUnsignedChar，无返回值的回调
@property(nonatomic,assign)jobsByShortBlock ShortBlock;/// 入参为Short，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedShortBlock UnsignedShortBlock;/// 入参为UnsignedShort，无返回值的回调
@property(nonatomic,assign)jobsByLongBlock LongBlock;/// 入参为Long，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedLongBlock UnsignedLongBlock;/// 入参为UnsignedLong，无返回值的回调
@property(nonatomic,assign)jobsByUnsignedLongLongBlock UnsignedLongLongBlock;/// 入参为IUnsignedLongLong，无返回值的回调
-(void)actionNSIntegerBlock:(jobsByNSIntegerBlock)NSIntegerBlock;
-(void)actionNSUIntegerBlock:(jobsByNSUIntegerBlock)NSUIntegerBlock;
-(void)actionCGFloatBlock:(jobsByCGFloatBlock)CGFloatBlock;
-(void)actionBOOLBlock:(jobsByBOOLBlock)BOOLBlock;
-(void)actionIntBlock:(jobsByIntBlock)IntBlock;
-(void)actionUnsignedIntBlock:(jobsByUnsignedIntBlock)UnsignedIntBlock;
-(void)actionFloatBlock:(jobsByFloatBlock)FloatBlock;
-(void)actionDoubleBlock:(jobsByDoubleBlock)DoubleBlock;
-(void)actionCharBlock:(jobsByCharBlock)CharBlock;
-(void)actionUnsignedCharBlock:(jobsByUnsignedCharBlock)UnsignedCharBlock;
-(void)actionShortBlock:(jobsByShortBlock)ShortBlock;
-(void)actionUnsignedShortBlock:(jobsByUnsignedShortBlock)UnsignedShortBlock;
-(void)actionLongBlock:(jobsByLongBlock)LongBlock;
-(void)actionUnsignedLongBlock:(jobsByUnsignedLongBlock)UnsignedLongBlock;
-(void)actionUnsignedLongLongBlock:(jobsByUnsignedLongLongBlock)UnsignedLongLongBlock;
#pragma mark —— 1.4、多入参（任意数据类型） ｜ 无返回值
@property(nonatomic,assign)JobsSelectorBlock SelectorBlock;
-(void)actionSelectorBlock:(JobsSelectorBlock)SelectorBlock;
#pragma mark —— 2.1、无入参 ｜ 有返回值
@property(nonatomic,assign)JobsReturnIDByVoidBlock returnObjectByVoidBlock;/// 无入参，返回值为ID的回调
-(void)actionReturnIDByVoidBlock:(JobsReturnIDByVoidBlock)returnObjectByVoidBlock;
#pragma mark —— 2.2、（单一）入参 ｜ （其他数据类型）返回值
@property(nonatomic,assign)JobsReturnIDByGestureRecognizerBlock returnObjectByGestureRecognizerBlock;/// 入参为UIGestureRecognizer，返回值为ID的回调
@property(nonatomic,assign)JobsReturnIDBySELBlock returnObjectBySELBlock;/// 入参为SEL，返回值为ID的回调
@property(nonatomic,assign)JobsReturnIDByStringBlock returnObjectByStringBlock;/// 入参为NSString，返回值为ID的回调
@property(nonatomic,assign)JobsReturnNSIntegerByIDBlock returnNSIntegerByIDBlock;
@property(nonatomic,assign)JobsReturnNSUIntegerByIDBlock returnNSUIntegerByIDBlock;
@property(nonatomic,assign)JobsReturnCGFloatByIDBlock returnCGFloatByIDBlock;
@property(nonatomic,assign)JobsReturnBOOLByIDBlock returnBOOLByIDBlock;
@property(nonatomic,assign)JobsReturnIntByIDBlock returnIntByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedIntByIDBlock returnUnsignedIntByIDBlock;
@property(nonatomic,assign)JobsReturnFloatByIDBlock returnFloatByIDBlock;
@property(nonatomic,assign)JobsReturnDoubleByIDBlock returnDoubleByIDBlock;
@property(nonatomic,assign)JobsReturnCharByIDBlock returnCharByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedCharByIDBlock returnUnsignedCharByIDBlock;
@property(nonatomic,assign)JobsReturnShortByIDBlock returnShortByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedShortByIDBlock returnUnsignedShortByIDBlock;
@property(nonatomic,assign)JobsReturnLongByIDBlock returnLongByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedLongByIDBlock returnUnsignedLongByIDBlock;
@property(nonatomic,assign)JobsReturnUnsignedLongLongByIDBlock returnUnsignedLongLongByIDBlock;
-(void)actionReturnIDByGestureRecognizerBlock:(JobsReturnIDByGestureRecognizerBlock)returnObjectByGestureRecognizerBlock;
-(void)actionReturnIDBySELBlock:(JobsReturnIDBySELBlock)returnObjectBySELBlock;
-(void)actionReturnIDByStringBlock:(JobsReturnIDByStringBlock)returnObjectByStringBlock;
-(void)actionReturnNSIntegerByIDBlock:(JobsReturnNSIntegerByIDBlock)returnNSIntegerByIDBlock;
-(void)actionReturnNSUIntegerByIDBlock:(JobsReturnNSUIntegerByIDBlock)returnNSUIntegerByIDBlock;
-(void)actionReturnCGFloatByIDBlock:(JobsReturnCGFloatByIDBlock)returnCGFloatByIDBlock;
-(void)actionReturnBOOLByIDBlock:(JobsReturnBOOLByIDBlock)returnBOOLByIDBlock;
-(void)actionReturnIntByIDBlock:(JobsReturnIntByIDBlock)returnIntByIDBlock;
-(void)actionReturnUnsignedIntByIDBlock:(JobsReturnUnsignedIntByIDBlock)returnUnsignedIntByIDBlock;
-(void)actionReturnFloatByIDBlock:(JobsReturnFloatByIDBlock)returnFloatByIDBlock;
-(void)actionReturnDoubleByIDBlock:(JobsReturnDoubleByIDBlock)returnDoubleByIDBlock;
-(void)actionReturnCharByIDBlock:(JobsReturnCharByIDBlock)returnCharByIDBlock;
-(void)actionReturnUnsignedCharByIDBlock:(JobsReturnUnsignedCharByIDBlock)returnUnsignedCharByIDBlock;
-(void)actionReturnShortByIDBlock:(JobsReturnShortByIDBlock)returnShortByIDBlock;
-(void)actionReturnUnsignedShortByIDBlock:(JobsReturnUnsignedShortByIDBlock)returnUnsignedShortByIDBlock;
-(void)actionReturnLongByIDBlock:(JobsReturnLongByIDBlock)returnLongByIDBlock;
-(void)actionReturnUnsignedLongByIDBlock:(JobsReturnUnsignedLongByIDBlock)returnUnsignedLongByIDBlock;
-(void)actionReturnUnsignedLongLongByIDBlock:(JobsReturnUnsignedLongLongByIDBlock)returnUnsignedLongLongByIDBlock;
#pragma mark —— 2.3、（单一）入参 ｜ 返回（入参类型）值
@property(nonatomic,assign)JobsReturnIDByIDBlock returnObjectBlock;/// 返回值为ID的回调
@property(nonatomic,assign)JobsReturnByNSIntegerBlock returnNSIntegerBlock;/// 返回值为NSInteger的回调
@property(nonatomic,assign)JobsReturnByNSUIntegerBlock returnNSUIntegerBlock;/// 返回值为UInteger的回调
@property(nonatomic,assign)JobsReturnByCGFloatBlock returnCGFloatBlock;/// 返回值为CGFloat的回调
@property(nonatomic,assign)JobsReturnByBOOLBlock returnBOOLBlock;/// 返回值为BOOL的回调
@property(nonatomic,assign)JobsReturnByIntBlock returnIntBlock;/// 返回值为Int的回调
@property(nonatomic,assign)JobsReturnByUnsignedIntBlock returnUnsignedIntBlock;/// 返回值为UnsignedInt的回调
@property(nonatomic,assign)JobsReturnByFloatBlock returnFloatBlock;/// 返回值为Float的回调
@property(nonatomic,assign)JobsReturnByDoubleBlock returnDoubleBlock;/// 返回值为Double的回调
@property(nonatomic,assign)JobsReturnByCharBlock returnCharBlock;/// 返回值为Char的回调
@property(nonatomic,assign)JobsReturnByUnsignedCharBlock returnUnsignedCharBlock;/// 返回值为UnsignedChar的回调
@property(nonatomic,assign)JobsReturnByShortBlock returnShortBlock;/// 返回值为Short的回调
@property(nonatomic,assign)JobsReturnByUnsignedShortBlock returnUnsignedShortBlock;/// 返回值为UnsignedShort的回调
@property(nonatomic,assign)JobsReturnByLongBlock returnLongBlock;/// 返回值为Long的回调
@property(nonatomic,assign)JobsReturnByUnsignedLongBlock returnUnsignedLongBlock;/// 返回值为UnsignedLong的回调
@property(nonatomic,assign)JobsReturnByUnsignedLongLongBlock returnUnsignedLongLongBlock;/// 返回值为UnsignedLongLong的回调
-(void)actionReturnObjectBlock:(JobsReturnIDByIDBlock)returnObjectBlock;
-(void)actionReturnNSIntegerBlock:(JobsReturnByNSIntegerBlock)returnNSIntegerBlock;
-(void)actionReturnNSUIntegerBlock:(JobsReturnByNSUIntegerBlock)returnNSUIntegerBlock;
-(void)actionReturnCGFloatBlock:(JobsReturnByCGFloatBlock)returnCGFloatBlock;
-(void)actionReturnBOOLBlock:(JobsReturnByBOOLBlock)returnBOOLBlock;
-(void)actionReturnIntBlock:(JobsReturnByIntBlock)returnIntBlock;
-(void)actionReturnUnsignedIntBlock:(JobsReturnByUnsignedIntBlock)returnUnsignedIntBlock;
-(void)actionReturnFloatBlock:(JobsReturnByFloatBlock)returnFloatBlock;
-(void)actionReturnDoubleBlock:(JobsReturnByDoubleBlock)returnDoubleBlock;
-(void)actionReturnCharBlock:(JobsReturnByCharBlock)returnCharBlock;
-(void)actionReturnUnsignedCharBlock:(JobsReturnByUnsignedCharBlock)returnUnsignedCharBlock;
-(void)actionReturnShortBlock:(JobsReturnByShortBlock)returnShortBlock;
-(void)actionReturnUnsignedShortBlock:(JobsReturnByUnsignedShortBlock)returnUnsignedShortBlock;
-(void)actionReturnLongBlock:(JobsReturnByLongBlock)returnLongBlock;
-(void)actionReturnUnsignedLongBlock:(JobsReturnByUnsignedLongBlock)returnUnsignedLongBlock;
-(void)actionReturnUnsignedLongLongBlock:(JobsReturnByUnsignedLongLongBlock)returnUnsignedLongLongBlock;
#pragma mark —— 2.4、多入参（任意数据类型） ｜ 有返回（其他类型）值
@property(nonatomic,assign)JobsReturnIDBySelectorBlock returnIDBySelectorBlock;
-(void)actionReturnIDBySelectorBlock:(JobsReturnIDBySelectorBlock)returnIDBySelectorBlock;

@end

NS_ASSUME_NONNULL_END
