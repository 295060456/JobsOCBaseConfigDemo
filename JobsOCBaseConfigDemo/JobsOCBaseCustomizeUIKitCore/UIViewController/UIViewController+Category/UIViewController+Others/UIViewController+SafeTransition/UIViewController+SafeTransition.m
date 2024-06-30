//
//  UIViewController+SafeTransition.m
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import "UIViewController+SafeTransition.h"

@implementation JobsRecordPresentedViewController

static JobsRecordPresentedViewController *static_JobsRecordPresentedVC = nil;
+(instancetype)sharedInstance{
    @synchronized(self){
        if (!static_JobsRecordPresentedVC) {
            static_JobsRecordPresentedVC = JobsRecordPresentedViewController.new;
        }
    }return static_JobsRecordPresentedVC;
}
#pragma mark —— lazyLoad
-(NSMutableArray<UIViewController *> *)presentedVCMutArr{
    if (!_presentedVCMutArr) {
        _presentedVCMutArr = NSMutableArray.array;
    }return _presentedVCMutArr;
}

@end

@implementation UIViewController (SafeTransition)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self.class,
                      @selector(presentViewController:animated:completion:),
                      @selector(swiz_presentViewController:animated:completion:));
        
        MethodSwizzle(self.class,
                      @selector(dismissViewControllerAnimated:completion:),
                      @selector(swiz_dismissViewControllerAnimated:completion:));
    });
}

-(void)swiz_dismissViewControllerAnimated:(BOOL)animated
                               completion:(void(^)(void))completion{
    [JobsRecordPresentedViewController.sharedInstance.presentedVCMutArr removeAllObjects];
    [self swiz_dismissViewControllerAnimated:animated completion:completion];
}

-(void)swiz_presentViewController:(UIViewController *_Nonnull)vc
                         animated:(BOOL)animated
                       completion:(void(^)(void))completion {
    if(!vc) return;
    if ([vc isKindOfClass:UIImagePickerController.class]) {
        /// 在使用UIImagePickerController进行拍照时，如果没有相机权限，则需要弹出提示框提醒用户
        UIImagePickerController *imgPicker = (UIImagePickerController *)vc;
        if (imgPicker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            completion = ^{
                completion();
                AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
                if (status == AVAuthorizationStatusDenied ||
                    status == AVAuthorizationStatusRestricted) {
                    [WHToast jobsToastMsg:JobsInternationalization(@"请在iPhone的“设置-隐私-相机”选项中，允许App访问您的相机。")];
                }
            };
        }
    }
    
    if ([self checkPresented:vc]) {
        [JobsRecordPresentedViewController.sharedInstance.presentedVCMutArr addObject:vc];
        [self swiz_presentViewController:vc
                                animated:animated
                              completion:completion];
    }
}
/**
 presented 模态推出的ViewController和用NavigationViewController推出的差异在于：
 presented并没有一个数组进行记录
 那么在某些情况下就很有可能一次性多次presented相同的ViewController
 
 于是我们全局一个单例类用一个数组进行记录presented的ViewController
 【因为OC的数组、字典、集合是类簇，并不希望我们对此进行继承】
 如果下一次presented和数组里面进行记录的ViewController是同一个类型，那么不允许presented
 */
-(BOOL)checkPresented:(UIViewController *)viewController{
    for (UIViewController *vc in JobsRecordPresentedViewController.sharedInstance.presentedVCMutArr) {
        if ([viewController isKindOfClass:vc.class]) {
            return NO;
        }
    }return YES;
}

@end

