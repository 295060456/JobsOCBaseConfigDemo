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
+(UIImage *_Nullable)imageByMIMEString:(NSString *_Nonnull)MIMEString{
    NSData *imageData = [NSData dataByMIMEString:MIMEString];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
///【实例方法】以MIME编码的数据 转换成 UIImage对象
-(UIImage *_Nullable)imageByMIMEString:(NSString *_Nonnull)MIMEString{
    NSData *imageData = [NSData dataByMIMEString:MIMEString];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}
///【类方法】UIImage对象 转换成 以MIME编码的数据
+(NSString *_Nullable)MIMEStringByImage:(UIImage *_Nonnull)image{
    NSData *imageData = UIImagePNGRepresentation(image); // or UIImageJPEGRepresentation(self, compressionQuality)
    NSString *MIMEString = imageData.MIMEStringByImage;
    return MIMEString;
}
///【实例方法】UIImage对象 转换成 以MIME编码的数据
-(NSString *_Nullable)MIMEStr{
    NSData *imageData = UIImagePNGRepresentation(self); // or UIImageJPEGRepresentation(self, compressionQuality)
    NSString *MIMEString = imageData.MIMEStringByImage;
    return MIMEString;
}

@end
