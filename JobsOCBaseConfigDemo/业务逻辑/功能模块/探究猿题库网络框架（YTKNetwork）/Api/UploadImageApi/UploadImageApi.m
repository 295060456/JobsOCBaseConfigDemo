//
//  UploadImageApi.m
//  Solar
//
//  Created by tangqiao on 8/7/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import "UploadImageApi.h"

@implementation UploadImageApi {
    UIImage *_image;
}

-(id)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        _image = image;
    }return self;
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

-(NSString *)requestUrl {
    return [self.BaseUrl stringByAppendingString:@"/iphone/image/upload"];
}

-(AFConstructingBlock)constructingBodyBlock {
    @jobs_weakify(self)
    return ^(id<AFMultipartFormData> formData) {
        @jobs_strongify(self)
        NSData *data = UIImageJPEGRepresentation(self->_image, 0.9);
        NSString *name = @"image";
        NSString *formKey = @"image";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:data
                                    name:formKey
                                fileName:name
                                mimeType:type];
    };
}

-(id)jsonValidator {
    return @{@"imageId": NSString.class};
}
/// 设置自定义的 HTTP Header
- (NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary {
    // 在这里添加你想要的 HTTP header
    JobsUserModel *loginModel = self.readUserInfo();
    return @{
        @"Content-Type": @"application/json", // 设置 Content-Type
        @"Authorization": loginModel.token // 设置 Authorization
    };
}
/// 如果当前请求是GET，下列方法不可用
- (NSURLRequest *)buildCustomUrlRequest{
    if(self.requestMethod == YTKRequestMethodGET) return nil;
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.parameters
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.requestUrl.jobsUrl
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:30];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];//GET请求
    [request setHTTPBody:jsonData];//body 数据
    self.printRequestMessage(request);
    NSLog(@"");
    return request;
}

-(NSString *)responseImageId {
    NSDictionary *dict = self.responseJSONObject;
    return dict[@"imageId"];
}

@end
