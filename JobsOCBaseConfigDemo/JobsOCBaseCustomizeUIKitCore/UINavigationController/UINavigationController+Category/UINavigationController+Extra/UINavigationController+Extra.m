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

@end
