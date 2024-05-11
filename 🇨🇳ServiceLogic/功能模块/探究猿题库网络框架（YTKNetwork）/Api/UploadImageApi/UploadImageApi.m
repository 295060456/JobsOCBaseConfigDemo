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
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(_image, 0.9);
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
    return @{ @"imageId": [NSString class] };
}

-(NSString *)responseImageId {
    NSDictionary *dict = self.responseJSONObject;
    return dict[@"imageId"];
}

@end
