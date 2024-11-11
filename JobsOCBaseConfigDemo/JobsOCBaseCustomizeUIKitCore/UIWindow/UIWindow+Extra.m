//
//  UIWindow+Extra.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/10.
//

#import "UIWindow+Extra.h"

@implementation UIWindow (Extra)

+(JobsReturnWindowByWindowSceneBlock _Nonnull)initByScene{
    return ^__kindof UIWindow *_Nullable(UIWindowScene *_Nullable data){
        return [UIWindow.alloc initWithWindowScene:data];
    };
}

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
-(JobsReturnCGRectByVoidBlock _Nonnull)landscapeWindowFrame{
    return ^CGRect(){
        @jobs_weakify(self)
        return jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
            @jobs_strongify(self)
            data.jobsX = self.x;
            data.jobsY = self.y;
            data.jobsWidth = MAX(self.height,self.width);
            data.jobsHeight = MIN(self.height,self.width);
        });
    };
}

@end
