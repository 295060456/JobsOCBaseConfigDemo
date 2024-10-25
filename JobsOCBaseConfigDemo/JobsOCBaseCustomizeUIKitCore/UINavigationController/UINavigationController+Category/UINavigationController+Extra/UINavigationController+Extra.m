//
//  UINavigationController+Extra.m
//  Casino
//
//  Created by Jobs on 2022/1/4.
//

#import "UINavigationController+Extra.h"

@implementation UINavigationController (Extra)

+(JobsReturnNavCtrByVCBlock _Nonnull)initByRootVC{
    return ^__kindof UINavigationController *_Nullable(__kindof UIViewController *_Nonnull vc){
        return [UINavigationController.alloc initWithRootViewController:vc];
    };
}

-(UIViewController *)rootViewController{
    return self.viewControllers.firstObject;
}

@end
