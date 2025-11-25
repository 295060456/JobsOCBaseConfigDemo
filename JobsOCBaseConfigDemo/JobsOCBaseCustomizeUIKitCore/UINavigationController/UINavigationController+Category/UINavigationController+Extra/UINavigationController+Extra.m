//
//  UINavigationController+Extra.m
//  Casino
//
//  Created by Jobs on 2022/1/4.
//

#import "UINavigationController+Extra.h"

@implementation UINavigationController (Extra)

-(UIViewController *)rootViewController{
    return self.viewControllers.firstObject;
}

-(jobsByNSUIntegerBlock _Nonnull)navDirectionBy{
    @jobs_weakify(self)
    return ^(JobsTransitionDirection data){
        @jobs_strongify(self)
        [JobsNavigationTransitionMgr setDirection:data forNavigationController:self];
    };
}

-(JobsRetNavCtrByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UINavigationController *_Nullable(id <UINavigationControllerDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

@end
