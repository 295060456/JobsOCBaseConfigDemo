//
//  NSData+Base64.m
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

@interface NSData (Base64)
#pragma mark —— NSData ==> Base64
///【类方法】NSData 转换成 以Base64编码的字符串
+(JobsReturnStringByDataBlock _Nonnull)base64StringFromData;
///【实例方法】NSData 转换成 以Base64编码的字符串
-(NSString *_Nullable)base64StringFromData;
#pragma mark —— Base64 ==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsReturnDataByStringBlock _Nonnull)dataByBase64String;
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(JobsReturnDataByStringBlock _Nonnull)dataByBase64String;

@end
