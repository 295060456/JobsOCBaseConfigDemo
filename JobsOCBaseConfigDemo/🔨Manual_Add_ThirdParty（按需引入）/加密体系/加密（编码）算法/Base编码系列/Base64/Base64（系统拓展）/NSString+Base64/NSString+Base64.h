//
//  NSString+Base64.h
//  Gurpartap Singh
//
//  Created by Gurpartap Singh on 06/05/12.
//  Copyright (c) 2012 Gurpartap Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

@interface NSString (Base64)
#pragma mark —— Base64 <==> NSString
///【类方法】NSString对象 转换成  以Base64 编码的字符串
+(JobsReturnStringByStringBlock _Nonnull)base64String;
///【实例方法】NSString对象 转换成  以Base64 编码的字符串
-(NSString *_Nullable)base64String;
///【类方法】Base64 编码的字符串  转换成 NSString对象
+(JobsReturnStringByStringBlock _Nonnull)nsStringByBase64;
///【实例方法】Base64 编码的字符串  转换成 NSString对象
-(NSString *_Nullable)nsStringByBase64;
#pragma mark —— Base64 <==> UIImage
///【类方法】将以Base64编码的字符串 转换为 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByBase64String;
///【实例方法】将以Base64编码的字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByBase64String;
#pragma mark —— Base64 <==> NSData
///【类方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
+(JobsReturnDataByStringBlock _Nonnull)dataByBase64String;
///【实例方法】将给定的以Base64编码的字符串 转换为 NSData对象。实现了将Base64字符串解码为原始二进制数据的过程。
-(NSData *_Nullable)dataByBase64String;


@end
