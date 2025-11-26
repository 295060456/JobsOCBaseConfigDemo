//
//  JobsPresentedVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/25/23.
//

#import "JobsPresentedVC.h"

@interface JobsPresentedVC ()

@end

@implementation JobsPresentedVC

- (void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
    if (JobsDebug) {
        toast([NSString stringWithFormat:@"%@%@",@"成功销毁了控制器".tr,NSStringFromClass(self.class)]);
        JobsLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self)
    }
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    JobsLog(@"%f",self.presentUpHeight);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
