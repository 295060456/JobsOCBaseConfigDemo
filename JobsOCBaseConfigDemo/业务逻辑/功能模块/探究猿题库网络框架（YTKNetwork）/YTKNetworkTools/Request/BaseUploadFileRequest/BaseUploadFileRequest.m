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

-(jobsByFileModelBlock _Nonnull)initBy{
    @jobs_weakify(self)
    return ^(__kindof JobsFileModel *_Nullable model){
        @jobs_strongify(self)
        self.fileModel = model;
    };
}
/// 使用 HTTP 序列化方式
-(YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeHTTP;
}

//-(AFConstructingBlock)constructingBodyBlock {
//    return ^(id<AFMultipartFormData> formData) {
//        NSData *imageData = UIImageJPEGRepresentation(self.image, 0.8); // 压缩图片为二进制数据
//        if (imageData) {
//            [formData appendPartWithFileData:imageData
//                                        name:@"file" /// 表单字段的名称，后端用来接收这个文件的参数名
//                                    fileName:self.fileName ?: @"image.jpg" // 文件名
//                                    mimeType:@"image/jpeg"]; // MIME 类型
//        }
//    };
//}




@end
