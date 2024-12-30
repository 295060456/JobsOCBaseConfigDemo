//
//  ReturnByUnCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef ReturnByUnCertainParameters_h
#define ReturnByUnCertainParameters_h
/// 第一个参数写：有多少个实际参数
/// 返回对象
typedef id _Nullable(^JobsReturnIDByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef NSNumber *_Nullable(^JobsReturnNSNumberByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
/// 返回基本数据类型
typedef NSInteger(^JobsReturnNSIntegerByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef NSUInteger(^JobsReturnNSUIntegerByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef float(^JobsReturnFloatByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef CGFloat(^JobsReturnCGFloatByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
/// 返回结构体
typedef CGSize(^JobsReturnCGSizeByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef CGRect(^JobsReturnCGRectByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef CGPoint(^JobsReturnCGPointByDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);

#endif /* ReturnByUnCertainParameters_h */
