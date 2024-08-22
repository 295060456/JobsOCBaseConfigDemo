//
//  NSObject+WHToast.m
//  Casino
//
//  Created by Jobs on 2021/12/2.
//

#import "NSObject+WHToast.h"

@implementation NSObject (WHToast)
#pragma mark —— 仅文字，展示在屏幕中间
+(jobsByStringBlock _Nonnull)jobsToastMsg{
    return ^(NSString *_Nullable msg) {
        [WHToast showMessage:msg
                    duration:1.5
               finishHandler:nil];
    };
}

-(jobsByStringBlock _Nonnull)jobsToastMsg{
    return ^(NSString *_Nullable msg) {
        NSObject.jobsToastMsg(msg);
    };
}
#pragma mark —— 成功图标和文字，展示在屏幕中间
+(jobsByStringBlock _Nonnull)jobsToastSuccessMsg{
    return ^(NSString *_Nullable successMsg) {
        [WHToast showSuccessWithMessage:successMsg
                               duration:1.5
                          finishHandler:nil];
    };
}

-(jobsByStringBlock _Nonnull)jobsToastSuccessMsg{
    return ^(NSString *_Nullable successMsg) {
        NSObject.jobsToastSuccessMsg(successMsg);
    };
}
#pragma mark —— 失败图标和文字，展示在屏幕中间
+(jobsByStringBlock _Nonnull)jobsToastErrMsg{
    return ^(NSString *_Nullable errMsg) {
        [WHToast showErrorWithMessage:errMsg
                             duration:1.5
                        finishHandler:nil];
    };
}

-(jobsByStringBlock _Nonnull)jobsToastErrMsg{
    return ^(NSString *_Nullable errMsg) {
        NSObject.jobsToastErrMsg(errMsg);
    };
}
#pragma mark —— 延时操作
+(jobsByStringBlock _Nonnull)jobsToastLoadingMsg{
    return ^(NSString *_Nullable errMsg) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *path = [NSBundle.mainBundle pathForResource:@"toastLoading" ofType:@"gif"];
            NSData *data = [NSData dataWithContentsOfFile:path];
            UIImage *image = [UIImage sd_imageWithGIFData:data];
            [WHToast showImage:image
                       message:errMsg
                      duration:LONG_LONG_MAX
                 finishHandler:nil];
        });
    };
}

-(jobsByStringBlock _Nonnull)jobsToastLoadingMsg{
    return ^(NSString *_Nullable errMsg) {
        NSObject.jobsToastLoadingMsg(errMsg);
    };
}
#pragma mark —— 手动关闭WHToast，在主线程
+(jobsByVoidBlock _Nonnull)jobsToastHide{
    return ^() {
        dispatch_async(dispatch_get_main_queue(), ^{
            [WHToast hide];// UI更新代码
        });
    };
}

-(jobsByVoidBlock _Nonnull)jobsToastHide{
    return ^() {
        NSObject.jobsToastHide();
    };
}

@end
