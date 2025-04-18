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

@end
