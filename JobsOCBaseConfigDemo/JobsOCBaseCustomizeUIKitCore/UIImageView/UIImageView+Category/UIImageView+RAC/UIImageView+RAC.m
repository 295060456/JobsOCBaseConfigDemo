//
//  UIImageView+RAC.m
//  FM
//
//  Created by Admin on 6/12/2024.
//

#import "UIImageView+RAC.h"

@implementation UIImageView (RAC)
/// RAC 监听UIImageView.image属性的变化：当输入值的时候，进行网络请求发送图片文件
-(void)uploadImageBlock:(jobsByImageBlock _Nullable)uploadImageBlock
          nilImageBlock:(jobsByVoidBlock _Nullable)nilImageBlock{
    [RACObserve(self, image) subscribeNext:^(UIImage *newImage) {
        if (newImage) {
            JobsLog(@"UIImageView 的 image 属性发生了变化：%@", newImage);
            if(uploadImageBlock) uploadImageBlock(newImage);
        } else {
            JobsLog(@"UIImageView 的 image 属性被设置为 nil");
            if(nilImageBlock) nilImageBlock();
        }
    }];
}

@end
