//
//  UploadImageApi.m
//  Solar
//
//  Created by tangqiao on 8/7/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import "UploadImageApi.h"

@interface UploadImageApi ()

@property(nonatomic,strong)UIImage *image;

@end

@implementation UploadImageApi

+(JobsReturnIDByImageBlock)initByImage{
    @jobs_weakify(self)
    return ^id(UIImage *_Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initWithImage:data];
    };
}

-(instancetype)initWithImage:(UIImage *)image {
    if (self = [super init]) {
        self.image = image;
    }return self;
}
/// 请求的完整URL：
-(NSString *)requestUrl {
    return self.BaseUrl.add(@"/iphone/image/upload");
}
/// 请求方式
-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

-(AFConstructingBlock)constructingBodyBlock{
    @jobs_weakify(self)
    return ^(id<AFMultipartFormData> formData) {
        @jobs_strongify(self)
        NSData *data = UIImageJPEGRepresentation(self.image, 0.9);
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

-(NSString *)responseImageId {
    NSDictionary *dict = self.responseJSONObject;
    return dict[@"imageId"];
}

@end
