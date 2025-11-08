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

#import "NSString+Others.h"
#import "NSObject+Image.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WHToast)
#pragma mark —— 仅文字，展示在屏幕中间
+(jobsByStrBlock _Nonnull)jobsToastMsg;
-(jobsByStrBlock _Nonnull)jobsToastMsg;
#pragma mark —— 成功图标和文字，展示在屏幕中间
+(jobsByStrBlock _Nonnull)jobsToastSuccessMsg;
-(jobsByStrBlock _Nonnull)jobsToastSuccessMsg;
#pragma mark —— 失败图标和文字，展示在屏幕中间
+(jobsByStrBlock _Nonnull)jobsToastErrMsg;
-(jobsByStrBlock _Nonnull)jobsToastErrMsg;
#pragma mark —— 延时操作
+(jobsByStrBlock _Nonnull)jobsToastLoadingMsg;
-(jobsByStrBlock _Nonnull)jobsToastLoadingMsg;
#pragma mark —— 手动关闭WHToast，在主线程
+(jobsByVoidBlock _Nonnull)jobsToastHide;
-(jobsByVoidBlock _Nonnull)jobsToastHide;

@end

NS_ASSUME_NONNULL_END
