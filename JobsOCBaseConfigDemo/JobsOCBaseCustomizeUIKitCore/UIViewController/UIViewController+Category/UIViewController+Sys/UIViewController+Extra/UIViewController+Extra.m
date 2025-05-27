//
//  UIViewController+Extra.m
//  FM_Normal
//
//  Created by Jobs on 2025/4/18.
//

#import "UIViewController+Extra.h"

@implementation UIViewController (Extra)

-(JobsReturnVCByVCBlock _Nonnull)addChildViewController{
    @jobs_weakify(self)
    return ^__kindof UIViewController *_Nullable(__kindof UIViewController *_Nonnull vc){
        @jobs_strongify(self)
        [self addChildViewController:vc];
        return self;
    };
}
/// 关闭系统自带的右滑关闭手势
-(jobsByVoidBlock _Nonnull)clzPopGesture{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        self.fd_interactivePopDisabled = YES;
    };
}
/// 打开系统自带的右滑关闭手势
-(jobsByIDBlock _Nonnull)openPopGestureBy{
    @jobs_weakify(self)
    return ^(id <UIGestureRecognizerDelegate>_Nullable data){
        @jobs_strongify(self)
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = data;
        self.fd_interactivePopDisabled = NO;
    };
}

@end
