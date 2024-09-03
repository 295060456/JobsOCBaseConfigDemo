//
//  UIWindow+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/10.
//

#import "UIWindow+Extra.h"

@implementation UIWindow (Extra)

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if (self.objectBlock) self.objectBlock(self);
}
/// 横屏模式下的Window（宽高互换）
-(__kindof UIWindow *)landscape{
    if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
        self.frame = self.landscapeWindowFrame();
    }return self;
}
/// 横屏模式下Window的宽高互换
-(JobsReturnCGRectByVoidBlock)landscapeWindowFrame{
    return ^CGRect(){
        return CGRectMake(self.x,
                          self.y,
                          MAX(self.height,self.width),
                          MIN(self.height,self.width));
    };
}

@end
