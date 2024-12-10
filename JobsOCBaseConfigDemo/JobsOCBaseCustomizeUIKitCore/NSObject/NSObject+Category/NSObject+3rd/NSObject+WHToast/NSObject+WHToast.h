//
//  NSObject+WHToast.h
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WHToast)
#pragma mark —— 仅文字，展示在屏幕中间
+(jobsByStringBlock _Nonnull)jobsToastMsg;
-(jobsByStringBlock _Nonnull)jobsToastMsg;
#pragma mark —— 成功图标和文字，展示在屏幕中间
+(jobsByStringBlock _Nonnull)jobsToastSuccessMsg;
-(jobsByStringBlock _Nonnull)jobsToastSuccessMsg;
#pragma mark —— 失败图标和文字，展示在屏幕中间
+(jobsByStringBlock _Nonnull)jobsToastErrMsg;
-(jobsByStringBlock _Nonnull)jobsToastErrMsg;
#pragma mark —— 延时操作
+(jobsByStringBlock _Nonnull)jobsToastLoadingMsg;
-(jobsByStringBlock _Nonnull)jobsToastLoadingMsg;
#pragma mark —— 手动关闭WHToast，在主线程
+(jobsByVoidBlock _Nonnull)jobsToastHide;
-(jobsByVoidBlock _Nonnull)jobsToastHide;

@end

NS_ASSUME_NONNULL_END
