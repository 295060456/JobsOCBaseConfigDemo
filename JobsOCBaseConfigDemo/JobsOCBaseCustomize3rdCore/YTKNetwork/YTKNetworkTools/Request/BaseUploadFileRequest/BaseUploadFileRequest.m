//
//  BaseUploadFileRequest.m
//  FM
//
//  Created by Admin on 5/12/2024.
//

#import "BaseUploadFileRequest.h"

@interface BaseUploadFileRequest ()

Prop_strong()JobsFileModel *fileModel;

@end

@implementation BaseUploadFileRequest

-(JobsReturnRequestByFileModelBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^__kindof BaseUploadFileRequest *_Nullable(__kindof JobsFileModel *_Nullable model){
        @jobs_strongify(self)
        self.fileModel = model;
        return self;
    };
}
/// 使用 HTTP 序列化方式
-(YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeHTTP;
}

-(AFConstructingBlock)constructingBodyBlock {
    @jobs_weakify(self)
    return ^(id<AFMultipartFormData> formData) {
        @jobs_strongify(self)
        if (self.fileModel.file) {
            [formData appendPartWithFileData:self.fileModel.file
                                        name:@"file" /// 表单字段的名称，后端用来接收这个文件的参数名
                                    fileName:isValue(self.fileModel.fileName) ? self.fileModel.fileName : @"image.jpg" // 文件名
                                    mimeType:@"image/jpeg"]; // MIME 类型
        }
    };
}

@end
