//
//  GetImageApi.m
//  YTKNetworkDemo
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 yuantiku.com. All rights reserved.
//

#import "GetImageApi.h"

@implementation GetImageApi {
    NSDictionary *_Nullable _parameters;
}

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        _parameters = parameters;
    }return self;
}

-(NSString *)requestUrl{
    return self.BaseUrl.add(@"");
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

//-(BOOL)useCDN{
//    return YES;
//}

//-(NSString *)resumableDownloadPath{
//    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *cachePath = [libPath stringByAppendingPathComponent:@"Caches"];
//    NSString *filePath = [cachePath stringByAppendingPathComponent:_imageId];
//    return filePath;
//}

@end
