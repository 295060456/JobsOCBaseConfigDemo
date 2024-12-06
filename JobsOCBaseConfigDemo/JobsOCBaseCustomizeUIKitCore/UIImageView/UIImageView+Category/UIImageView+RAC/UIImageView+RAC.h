//
//  UIImageView+RAC.h
//  FM
//
//  Created by Admin on 6/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (RAC)
/// RAC 监听UIImageView.image属性的变化：当输入值的时候，进行网络请求发送图片文件
-(void)uploadImageBlock:(jobsByImageBlock _Nullable)uploadImageBlock
          nilImageBlock:(jobsByVoidBlock _Nullable)nilImageBlock;

@end

NS_ASSUME_NONNULL_END
