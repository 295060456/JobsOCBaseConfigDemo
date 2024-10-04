//
//  NSObject+DynamicInvoke.h
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import <Foundation/Foundation.h>
#import "JobsSEL_IMP.h"
#import "JobsBlock.h"
#import "NSObject+Random.h"
#import "NSObject+Time.h"
#import "NSValue+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DynamicInvoke)

@property(nonatomic,strong)JobsSEL_IMP *selImp;
@property(nonatomic,strong)NSMutableDictionary <NSString *, NSValue *>*methodCache;/// 定义一个全局字典来缓存已经添加的方法
#pragma mark —— 参数 和 相关调用
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
/// @param targetObj 靶点，方法在哪里
/// @param methodName 不带参数的方法名
+(void)targetObj:(nonnull NSObject *)targetObj callingMethodWithName:(nullable NSString *)methodName;
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
-(jobsByStringBlock _Nonnull)callingMethodWithName;
/// 使用 dispatch_once 来执行只需运行一次的线程安全代码
-(jobsByStringBlock _Nonnull)dispatchOnceInvokingWithMethodName;
/// NSInvocation的使用，方法多参数传递
/// @param methodName 方法名
/// @param targetObj 靶点，方法在哪里
/// @param paramarrays 参数数组
+(id)methodName:(NSString *_Nonnull)methodName
      targetObj:(id _Nonnull)targetObj
    paramarrays:(NSArray *_Nullable)paramarrays;
/// 获取方法返回值
/// @param inv inv
/// @param sig 方法签名
+(id)getMethodReturnValueWithInv:(NSInvocation *)inv sig:(NSMethodSignature *)sig;
/// 判断本程序是否存在某个类
+(JobsReturnBOOLByStringBlock _Nonnull)judgementAppExistClassWithName;
/// 判断某个实例对象是否存在某个【不带参数的方法】
+(BOOL)judgementObj:(nonnull NSObject *)obj existMethodWithName:(nullable NSString *)methodName;
/// 用block来代替selector。
-(SEL _Nullable)jobsSelectorBlock:(JobsReturnIDBySelectorBlock)selectorBlock;
/// 替代系统 @selector(selector) ,用Block的方式调用代码，使得代码逻辑和形式上不割裂
/// - Parameters:
///   - block: 最终的执行体
///   - selectorName: 实际调用的方法名（可不填），用于对外输出和定位调用实际使用的方法
///   - target: 执行目标
SEL _Nullable selectorBlocks(JobsReturnIDBySelectorBlock _Nullable block,
                             NSString *_Nullable selectorName,
                             id _Nullable target);

@end

NS_ASSUME_NONNULL_END
