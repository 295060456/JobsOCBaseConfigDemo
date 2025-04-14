//
//  VoidByUnCertainParameters.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/27.
//

#ifndef VoidByUnCertainParameters_h
#define VoidByUnCertainParameters_h
/// 第一个参数写：有多少个实际参数
typedef void(^jobsDynArgsBlock)(NSInteger argCount,id _Nullable firstArg,...);
typedef void(^jobsByStringAndNSUIntegerBlock)(__kindof NSString *_Nullable data1,NSUInteger data2);

#endif /* VoidByUnCertainParameters_h */
