//
//  NSString+Base85.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/25.
//

#import <Foundation/Foundation.h>
#import "NSData+Base85.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Base85)
#pragma mark —— Base85 <==> NSString
///【类方法】普通的NSString对象 转换成 以Base85编码的字符串
+(NSString *_Nullable)base85String:(NSString *_Nonnull)string;
///【实例方法】普通的NSString对象 转换成 以Base85编码的字符串
-(NSString *_Nullable)base85String;
///【类方法】以Base85编码的字符串 转换成 普通的NSString对象
+(NSString *_Nullable)stringByBase85String:(NSString *_Nonnull)base85String;
///【实例方法】以Base85编码的字符串 转换成 普通的NSString对象
-(NSString *_Nullable)stringByBase85String;
#pragma mark —— Base85 ==> NSData
///【类方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
+(NSData *_Nullable)dataByBase85String:(NSString *_Nonnull)base85String;
///【实例方法】接受一个包含Base85编码数据的NSString对象作为输入，并将其解码为对应的原始字节序列
-(NSData *_Nullable)dataByBase85String;
#pragma mark —— Base85 ==> UIImage
///【类方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
+(UIImage *_Nullable)imageByBase85String:(NSString *_Nonnull)base85String;
///【实例方法】从给定的以Base85编码的字符串中解码并转换为UIImage对象
-(UIImage *_Nullable)imageByBase85String;

@end

NS_ASSUME_NONNULL_END
