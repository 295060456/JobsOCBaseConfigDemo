//
//  UIImage+MIME.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import "UIImage+MIME.h"

@implementation UIImage (MIME)
#pragma mark —— MIME编码的数据 <==> UIImage对象
///【类方法】以MIME编码的数据 转换成 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByMIMEString{
    return ^UIImage *_Nullable(NSString *_Nullable MIMEString){
        return UIImage.imageWithData(NSData.dataByMIMEString(MIMEString));
    };
}
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(JobsReturnImageByStringBlock _Nonnull)imageByMIMEString{
    return ^UIImage *_Nullable(NSString *_Nullable MIMEString){
        return UIImage.imageByMIMEString(MIMEString);
    };
}
///【类方法】UIImage对象 转换成 以MIME编码的数据
+(JobsReturnStringByImageBlock _Nonnull)MIMEStringByImage{
    return ^__kindof NSString *_Nullable(UIImage *_Nullable image){
        NSData *imageData = UIImagePNGRepresentation(image); // or UIImageJPEGRepresentation(self, compressionQuality)
        return imageData.MIMEStringByImage;
    };
}
///【实例方法】UIImage对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStr{
    return UIImage.MIMEStringByImage(self);
}

@end
