//
//  NSString+Image.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/29/25.
//

#import "NSString+Image.h"

@implementation NSString (Image)
/// 获取本地图像
-(nullable UIImage *)img{
    NSString *raw = [self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!isValue(raw)) { return nil; }
    // 1) 拒绝网络：同步接口不触网
    if (self.isContainsUrl) { return nil; }
    // 2) dataURL: data:image/png;base64,xxxx
    if ([raw hasPrefix:@"data:image/"]) {
        UIImage *img = self.imageByDataURL(raw);
        if (!img && isValue(self)) {
            JobsLog(@"dataURL 解码失败：%@", self);
        }
        return img;
    }
    // 3) Bundle 命名图片
    UIImage *named = [UIImage imageNamed:raw];
    if (named) { return named; }
    // 4) 绝对/相对路径文件
    if ([raw hasPrefix:@"/"] ||
        [raw containsString:@".png"] ||
        [raw containsString:@".jpg"] ||
        [raw containsString:@".jpeg"] ||
        [raw containsString:@".webp"] ||
        [raw containsString:@".gif"]) {
        UIImage *fileImg = [UIImage imageWithContentsOfFile:raw];
        if (fileImg) { return fileImg; }
    }

    if (!named && isValue(self)) {
        JobsLog(@"文件名为%@的图片获取失败，请检查", self);
    }return nil;
}
/// 获取网络图像
-(void)fetchImageByPlaceholder:(UIImage *)placeholder
                    completion:(jobsByImageBlock _Nullable)completion{
    if (!completion) { return; }
    // 本地 / 同步路径
    if (!self.isContainsUrl) {
        completion(self.img ?: placeholder);
        return;
    }
    NSURL *url = self.jobsUrl;
    if (!url) { completion(placeholder); return; }
    // 先查缓存
    UIImage *cached = [SDImageCache.sharedImageCache imageFromCacheForKey:url.absoluteString];
    if (cached) {
        completion(cached);
        return;
    }
    // 异步拉取
    [SDWebImageManager.sharedManager loadImageWithURL:url
                                              options:(SDWebImageRetryFailed | SDWebImageHighPriority)
                                             progress:nil
                                            completed:^(UIImage * _Nullable image,
                                                        NSData * _Nullable data,
                                                        NSError * _Nullable error,
                                                        SDImageCacheType cacheType,
                                                        BOOL finished,
                                                        NSURL * _Nullable imageURL) {
        if (error) {
            JobsLog(@"SDWebImage 加载失败：%@, error=%@", imageURL.absoluteString, error);
            completion(placeholder);
        } else {
            completion(image ?: placeholder);
        }
    }];
}

-(JobsReturnImageByStringBlock _Nonnull)imageByDataURL{
    return ^UIImage *(__kindof NSString *_Nullable dataURL){
        // 形如：data:image/png;base64,iVBORw0KGgo...
        NSRange comma = [dataURL rangeOfString:@","];
        if (comma.location == NSNotFound) { return nil; }
        NSString *b64 = [dataURL substringFromIndex:comma.location + 1];
        NSData *data = [NSData.alloc initWithBase64EncodedString:b64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        if (!data) { return nil; }
        return [UIImage imageWithData:data scale:UIScreen.mainScreen.scale];
    };
}

@end
