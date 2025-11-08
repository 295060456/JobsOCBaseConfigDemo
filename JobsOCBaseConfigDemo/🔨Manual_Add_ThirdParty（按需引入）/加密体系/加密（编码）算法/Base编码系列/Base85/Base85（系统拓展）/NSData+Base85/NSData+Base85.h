//
//  NSData+Base85.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsMakes.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Base85)
#pragma mark —— NSData ==> Base85
///【类方法】将NSData对象 转换为 以Base85编码的字符串
+(JobsRetStrByDataBlock _Nonnull)dataToBase85String;
///【实例方法】将NSData对象 转换为 以Base85编码的字符串
-(NSString *_Nullable)dataToBase85String;
#pragma mark —— Base85 ==> NSData
///【类方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
+(JobsRetDataByStrBlock _Nonnull)dataByBase85String;
///【实例方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
-(JobsRetDataByStrBlock _Nonnull)dataByBase85String;

@end

NS_ASSUME_NONNULL_END
