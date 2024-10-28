//
//  NSURL+Others.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Others)
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl;
/// 图片URL路径补齐
-(NSURL *_Nullable)imageURLPlus;
/// 一般的URL路径补齐
-(NSURL *_Nullable)normalURLPlus;
/// NSString + NSURL => NSURL
-(JobsReturnURLByStringBlock _Nonnull)add;
/// NSURL + NSURL => NSURL
-(JobsReturnURLByURLBlock _Nonnull)Add;
/// NSURL => NSMutableURLRequest
-(NSMutableURLRequest *)URLRequest;

@end

NS_ASSUME_NONNULL_END
