//
//  NSURL+Others.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineConstString.h" /// 常量字符串的定义

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Others)
/// 对系统方法 fileURLWithPath 的二次封装
+(JobsRetURLByStrBlock _Nonnull)fileURLWithPath;
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/// 图片URL路径补齐
-(NSURL *_Nullable)imageURLPlus;
/// 一般的URL路径补齐
-(NSURL *_Nullable)normalURLPlus;
/// NSString + NSURL => NSURL
-(JobsRetURLByStrBlock _Nonnull)add;
/// NSURL + NSURL => NSURL
-(JobsRetURLByURLBlock _Nonnull)Add;
/// NSURL => NSMutableURLRequest
-(NSMutableURLRequest *)URLRequest;

@end

NS_ASSUME_NONNULL_END
