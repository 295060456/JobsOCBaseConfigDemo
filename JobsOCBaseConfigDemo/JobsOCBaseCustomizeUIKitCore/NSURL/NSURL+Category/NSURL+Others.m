//
//  NSURL+Others.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import "NSURL+Others.h"

@implementation NSURL (Others)
/// 对系统方法 fileURLWithPath 的二次封装
+(JobsReturnURLByStringBlock _Nonnull)fileURLWithPath{
    return ^NSURL *_Nullable(__kindof NSString *_Nullable data){
        return [NSURL fileURLWithPath:data];
    };
}
///  能否正常打开Url
-(BOOL)jobsCanOpenUrl{
    return [UIApplication.sharedApplication canOpenURL:self];
}
/// 图片URL路径补齐
-(NSURL *_Nullable)imageURLPlus{
    if(!This.BaseUrl_Image || !This.BaseUrl) return self;
    if(!self.absoluteString.containsString(HTTP) && isValue(self.absoluteString)){
        return (isValue(This.BaseUrl_Image) ? This.BaseUrl_Image : This.BaseUrl).add(self.absoluteString).jobsUrl;
    }else return self;
}
/// 一般的URL路径补齐
-(NSURL *_Nullable)normalURLPlus{
    if(!This.BaseUrl_Image) return self;
    if(!self.absoluteString.containsString(HTTP) && isValue(self.absoluteString)){
        return This.BaseUrl_Image.add(self.absoluteString).jobsUrl;
    }else return self;
}
/// NSString + NSURL => NSURL
-(JobsReturnURLByStringBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSURL *_Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        if(!data) data = @"";
        /// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return self.absoluteString.add(data).jobsUrl;
    };
}
/// NSURL + NSURL => NSURL
-(JobsReturnURLByURLBlock _Nonnull)Add{
    @jobs_weakify(self)
    return ^NSURL *_Nullable(NSURL *_Nullable data) {
        @jobs_strongify(self)
        /// 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return self.absoluteString.add(data.absoluteString ? : @"").jobsUrl;
    };
}
/// NSURL => NSURLRequest
-(NSMutableURLRequest *)URLRequest{
    return NSURLRequest.initBy(self).mutableCopy;
}

@end
