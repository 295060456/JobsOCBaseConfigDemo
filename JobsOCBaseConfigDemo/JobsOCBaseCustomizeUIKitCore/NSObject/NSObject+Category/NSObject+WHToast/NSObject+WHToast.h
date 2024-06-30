//
//  NSObject+WHToast.h
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import <Foundation/Foundation.h>

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
-(void)jobsToastMsg:(NSString *)msg;
+(void)jobsToastMsg:(NSString *)msg;
#pragma mark —— 成功图标和文字，展示在屏幕中间
-(void)jobsToastSuccessMsg:(NSString *)successMsg;
+(void)jobsToastSuccessMsg:(NSString *)successMsg;
#pragma mark —— 失败图标和文字，展示在屏幕中间
-(void)jobsToastErrMsg:(NSString *)errMsg;
+(void)jobsToastErrMsg:(NSString *)errMsg;
#pragma mark —— 延时操作
-(void)jobsToastLoadingMsg:(NSString *)errMsg;
+(void)jobsToastLoadingMsg:(NSString *)errMsg;
#pragma mark —— 手动关闭WHToast，在主线程
-(void)jobsToastHide;
+(void)jobsToastHide;
#pragma mark —— 当前进度
-(void)jobsToastLoadSchedule:(CGFloat)Schedule;
+(void)jobsToastLoadSchedule:(CGFloat)Schedule;

@end

NS_ASSUME_NONNULL_END
