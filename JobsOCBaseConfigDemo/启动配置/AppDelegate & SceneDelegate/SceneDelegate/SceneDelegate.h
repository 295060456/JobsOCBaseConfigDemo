//
//  SceneDelegate.h
//  Casino
//
//  Created by Jobs on 2021/11/16.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSObject+Extras.h"
#import "AppDelegate+TabBarCtr.h"

API_AVAILABLE(ios(13.0))

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property(nonatomic,strong)UIWindow *window;
@property(nonatomic,strong)UIWindowScene *windowScene;

@end

#pragma clang diagnostic pop
