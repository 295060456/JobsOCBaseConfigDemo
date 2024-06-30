//
//  NSObject+WHToast.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+WHToast.h"

@implementation NSObject (WHToast)
#pragma mark —— 仅文字，展示在屏幕中间
-(void)jobsToastMsg:(NSString *)msg{
    [WHToast showMessage:msg
                duration:1.5
           finishHandler:nil];
}

+(void)jobsToastMsg:(NSString *)msg{
    [WHToast showMessage:msg
                duration:1.5
           finishHandler:nil];
}
#pragma mark —— 成功图标和文字，展示在屏幕中间
-(void)jobsToastSuccessMsg:(NSString *)successMsg{
    [WHToast showSuccessWithMessage:successMsg
                           duration:1.5
                      finishHandler:nil];
}

+(void)jobsToastSuccessMsg:(NSString *)successMsg{
    [WHToast showSuccessWithMessage:successMsg
                           duration:1.5
                      finishHandler:nil];
}
#pragma mark —— 失败图标和文字，展示在屏幕中间
-(void)jobsToastErrMsg:(NSString *)errMsg{
    [WHToast showErrorWithMessage:errMsg
                         duration:1.5
                    finishHandler:nil];
}

+(void)jobsToastErrMsg:(NSString *)errMsg{
    [WHToast showErrorWithMessage:errMsg
                         duration:1.5
                    finishHandler:nil];
}
#pragma mark —— 延时操作
-(void)jobsToastLoadingMsg:(NSString *)errMsg{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *path = [NSBundle.mainBundle pathForResource:@"toastLoading" ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        UIImage *image = [UIImage sd_imageWithGIFData:data];
        [WHToast showImage:image
                   message:errMsg
                  duration:LONG_LONG_MAX
             finishHandler:nil];
    });
}

+(void)jobsToastLoadingMsg:(NSString *)errMsg{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *path = [NSBundle.mainBundle pathForResource:@"toastLoading" ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        UIImage *image = [UIImage sd_imageWithGIFData:data];
        [WHToast showImage:image
                   message:errMsg
                  duration:LONG_LONG_MAX
             finishHandler:nil];
    });
}
#pragma mark —— 手动关闭WHToast，在主线程
-(void)jobsToastHide{
    dispatch_async(dispatch_get_main_queue(), ^{
        [WHToast hide];// UI更新代码
    });
}

+(void)jobsToastHide{
    dispatch_async(dispatch_get_main_queue(), ^{
        [WHToast hide];// UI更新代码
    });
}
#pragma mark —— 当前进度
-(void)jobsToastLoadSchedule:(CGFloat)Schedule{
//    dispatch_async(dispatch_get_main_queue(), ^{
//       // UI更新代码
//        WHToast.sharedInstance.toastView.messageLabel.text = [NSString stringWithFormat:@"当前进度：%.2f",Schedule];
//    });
}

+(void)jobsToastLoadSchedule:(CGFloat)Schedule{
//    dispatch_async(dispatch_get_main_queue(), ^{
//       // UI更新代码
//        WHToast.sharedInstance.toastView.messageLabel.text = [NSString stringWithFormat:@"当前进度：%.2f",Schedule];
//    });
}

@end
