//
//  AppDelegate+Func.m
//  UBallLive
//
//  Created by Jobs on 2020/10/11.
//

#import "AppDelegate+Func.h"

@implementation AppDelegate (Func)
#pragma mark —— 启动调用功能
+(void)launchFunc1{
    
}

-(void)launchFunc2{
    UIApplication.sharedApplication.idleTimerDisabled = NO;//保持屏幕常亮
    /*
     * 禁止App系统文件夹document同步
     * 苹果要求：可重复产生的数据不得进行同步,什么叫做可重复数据？这里最好禁止，否则会影响上架，被拒！
     */
    [FileFolderHandleTool banSysDocSynchronization];
#ifdef DEBUG
    [UIFont getAvailableFont];/// 打印全员字体
#endif
    [self makeTABAnimatedConfig];
    [self makeIQKeyboardManagerConfig];
    [self makeGKNavigationBarConfig];/// 自定义导航栏
//    [self makeJobsLaunchAdConfig];/// 开屏广告
//    [self makeReachabilityConfig];/// 网络环境监测
}
#pragma mark —— 开屏广告
-(void)makeJobsLaunchAdConfig{
    // 配置并展示开屏广告
//    {
//        JobsLaunchAdMgr *adManager = [JobsLaunchAdMgr sharedInstance];
//            adManager.adURL = [NSURL URLWithString:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"]; // Replace with your ad URL
//            adManager.imageDisplayDuration = 5.0; // Duration to display the image
//            adManager.adMode = JobsLaunchAdModeNormal; // Choose the ad mode
//            adManager.buttonTitle = @"Skip";
//            adManager.buttonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 20, 50, 30);
//            
//            // Set up callbacks if needed
//            adManager.singleTapCallback = ^{
//                // Handle single tap
//                NSLog(@"Ad single tapped");
//            };
//            
//            adManager.doubleTapCallback = ^{
//                // Handle double tap
//                NSLog(@"Ad double tapped");
//            };
//            
//            adManager.shakeCallback = ^{
//                // Handle shake gesture
//                NSLog(@"Device shaken");
//            };
//            
//            // Show the ad
//            [adManager showAd];
//    }
    {
        JobsLaunchAdMgr *adManager = JobsLaunchAdMgr.sharedManager;
        adManager.buttonTitle = JobsInternationalization(@"跳过广告");
        adManager.buttonModel = SkipButtonModeCountdown;
        adManager.countdownDuration = 5;
        adManager.redirectURL = @"https://www.google.com";
        adManager.onSingleTap = ^{
            NSLog(@"用户单击了广告");
        };
        adManager.onDoubleTap = ^{
            NSLog(@"用户双击了广告");
        };
        adManager.onLongPress = ^{
            NSLog(@"用户长按了广告");
        };
        adManager.onShake = ^{
            NSLog(@"用户摇晃了设备");
        };
        
        // 本地图片资源示例
//        NSString *localImagePath = [NSBundle.mainBundle pathForResource:@"1242x2688" ofType:@"png"];
//        [adManager showAdWithLocalResource:localImagePath isVideo:NO];
        
        // 本地视频资源示例
//         NSString *localVideoPath = [NSBundle.mainBundle pathForResource:@"welcome_video" ofType:@"mp4"];
//         [adManager showAdWithLocalResource:localVideoPath isVideo:YES];
        
        // URL图片资源示例
//         [adManager showAdWithURLResource:@"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80_%D0%9F%D1%83%D1%82%D0%B8%D0%BD_%2808-03-2024%29_%28cropped%29.jpg/220px-%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80_%D0%9F%D1%83%D1%82%D0%B8%D0%BD_%2808-03-2024%29_%28cropped%29.jpg" isVideo:NO shouldPreload:YES];
        
        // URL视频资源示例
         [adManager showAdWithURLResource:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4" isVideo:YES shouldPreload:YES];
    }

}
#pragma mark —— 欢迎引导页面
-(void)guide{
    if (self.isAppFirstLaunch) {
        self.window.rootViewController = JobsWelcomeVC.new;
    }else{
        self.window.rootViewController = AppDelegate.tabBarVC;
    }
}
#pragma mark —— 存取用户信息Demo
-(void)saveAndReadUserInfoDemo{
    JobsUserModel *userModel = JobsUserModel.new;
    userModel.token = @"12345";
    userModel.uid = @"54321";
    
    [self saveUserInfo:userModel];
    NSLog(@"");
    JobsUserModel *f = [self readUserInfo];
    NSLog(@"");
}
#pragma mark —— 读取Plist配置文件
-(void)readPlistConfig{
    static dispatch_once_t readPlistConfigDispatchOnce;
    dispatch_once(&readPlistConfigDispatchOnce, ^{
        id plistConfig = [self readLocalPlistWithFileName:@"MetaData"];
        NSLog(@"plistConfig = %@",plistConfig);
    });
}
#pragma mark —— 全局配置 TABAnimated
-(void)makeTABAnimatedConfig{
    [TABAnimated.sharedAnimated initWithOnlySkeleton];
    TABAnimated.sharedAnimated.openLog = YES;
}
#pragma mark —— 全局配置键盘
-(void)makeIQKeyboardManagerConfig{
    IQKeyboardManager *keyboardManager = IQKeyboardManager.sharedManager; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 启用手势触摸:控制点击背景是否收起键盘
    keyboardManager.shouldToolbarUsesTextFieldTintColor = YES; // 控制键盘上的工具条文字颜色是否用户自定义,(使用TextField的tintColor属性IQToolbar，否则色调的颜色是黑色 )
    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    keyboardManager.enableAutoToolbar = NO; // 控制是否显示键盘上的工具条,当需要支持内联编辑(Inline Editing), 这就需要隐藏键盘上的工具条(默认打开)
    keyboardManager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
    keyboardManager.placeholderFont = [UIFont boldSystemFontOfSize:17]; // 设置占位文字的字体
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
}
#pragma mark —— 全局配置GKNavigationBar
-(void)makeGKNavigationBarConfig{
    [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure * _Nonnull configure) {
        // 导航栏背景色
        configure.backgroundColor = JobsClearColor;
        // 导航栏标题颜色
        configure.titleColor = HEXCOLOR(0x3D4A58);
        // 导航栏标题字体
        configure.titleFont = notoSansBold(16);
        // 导航栏返回按钮样式
        configure.backStyle = GKNavigationBarBackStyleBlack;
        // 导航栏左右item间距
        configure.gk_navItemLeftSpace = JobsWidth(12.0f);
        configure.gk_navItemRightSpace = JobsWidth(12.0f);
#warning 这里的Api有变化 先注释，否则无法编译通过
//        configure.shiledItemSpaceVCs = @[@"PUPhotoPickerHostViewController"];
    }];
}
#pragma mark —— 本地推送通知
// Handle notification when app is running
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    if(completionHandler) completionHandler(UNAuthorizationOptionAlert + UNAuthorizationOptionSound);
}

-(void)localNotifications{
    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert +
                                             UNAuthorizationOptionSound +
                                             UNAuthorizationOptionBadge)
                          completionHandler:^(BOOL granted,
                                              NSError * _Nullable error) {
        if (granted) {
            NSLog(@"Notification permission granted.");
        } else {
            NSLog(@"Notification permission denied.");
        }
    }];
}
#pragma mark —— 网络环境监测
-(void)makeReachabilityConfig{
    // Allocate a reachability object
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    // Tell the reachability that we DON'T want to be reachable on 3G/EDGE/CDMA
    reach.reachableOnWWAN = NO;
    // Here we set up a NSNotification observer. The Reachability that caused the notification
    // is passed in the object parameter
    @jobs_weakify(self)
    [NSNotificationCenter.defaultCenter addObserver:self
                                          selector:selectorBlocks(^id _Nullable(id  _Nullable weakSelf,
                                                                                id  _Nullable arg) {
       NSNotification *notification = (NSNotification *)arg;
       @jobs_strongify(self)
       NSLog(@"通知传递过来的 = %@",notification.object);
       return nil;
    }, nil, self)
                                              name:kReachabilityChangedNotification
                                            object:nil];
    [reach startNotifier];
    dispatch_async(dispatch_get_main_queue(), ^{
        JobsPostNotification(kReachabilityChangedNotification, self);
    });
}
/// 适配各种机型的开屏图片
-(NSString * _Nullable)imageNameOrURLString{
    NSString *imgNameOrUrlStr = JobsInternationalization(@"");
    switch (iPhScrPx()) {
        case iPhScrPxType_4_4S:{// 屏幕分辨率(px) = 640 * 960
            imgNameOrUrlStr = @"640x960.png";
        }break;
        case iPhScrPxType_5_5C_5S_SE:{// 屏幕分辨率(px) = 640 * 1136
            imgNameOrUrlStr = @"640x1136.png";
        }break;
        case iPhScrPxType_6_6S_7_8_SE2:{// 屏幕分辨率(px) = 750 * 1334
            imgNameOrUrlStr = @"750x1334.png";
        }break;
        case iPhScrPxType_6_6S_7_8Plus:{// 屏幕分辨率(px) = 1242 * 2208
            imgNameOrUrlStr = @"1242x2208.png";
        }break;
        case iPhScrPxType_X_XS_11Pro:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_Xr_11:{// 屏幕分辨率(px) = 828 * 1792
            imgNameOrUrlStr = @"828x1792.png";
        }break;
        case iPhScrPxType_XSMax_11ProMax:{// 屏幕分辨率(px) = 1242 * 2688
            imgNameOrUrlStr = @"1242x2688.png";
        }break;
        case iPhScrPxType_12mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_12_12Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"1170x2532.png";
        }break;
        case iPhScrPxType_12ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"1284x2778.png";
        }break;
        case iPhScrPxType_13mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_13_13Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"1170x2532.png";
        }break;
        case iPhScrPxType_13ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"1284x2778.png";
        }break;
        case iPhScrPxType_14:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"1125x2436.png";
        }break;
        case iPhScrPxType_14Plus:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"1284x2778.png";
        }break;
        case iPhScrPxType_14Pro:{// 屏幕分辨率(px) = 1179 * 2556
            imgNameOrUrlStr = @"1179x2556.png";
        }break;
        case iPhScrPxType_14ProMax:{// 屏幕分辨率(px) = 1290 * 2796
            imgNameOrUrlStr = @"1290x2796.png";
        }break;
            
        default:{
            imgNameOrUrlStr = @"启动页SLOGAN.png";
        }break;
    }return imgNameOrUrlStr;
}
/// 适配各种机型的开屏视频
-(NSString * _Nullable)videoNameOrURLString{
    NSString *imgNameOrUrlStr = JobsInternationalization(@"");
    switch (iPhScrPx()) {
        case iPhScrPxType_4_4S:{// 屏幕分辨率(px) = 640 * 960
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_5_5C_5S_SE:{// 屏幕分辨率(px) = 640 * 1136
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_6_6S_7_8_SE2:{// 屏幕分辨率(px) = 750 * 1334
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_6_6S_7_8Plus:{// 屏幕分辨率(px) = 1242 * 2208
            imgNameOrUrlStr = @"非iph_X.mp4";
        }break;
        case iPhScrPxType_X_XS_11Pro:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_Xr_11:{// 屏幕分辨率(px) = 828 * 1792
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_XSMax_11ProMax:{// 屏幕分辨率(px) = 1242 * 2688
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_12mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_12_12Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_12ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_13mini:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_13_13Pro:{// 屏幕分辨率(px) = 1170 * 2532
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_13ProMax:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14:{// 屏幕分辨率(px) = 1125 * 2436
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14Plus:{// 屏幕分辨率(px) = 1284 * 2778
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14Pro:{// 屏幕分辨率(px) = 1179 * 2556
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
        case iPhScrPxType_14ProMax:{// 屏幕分辨率(px) = 1290 * 2796
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
            
        default:{
            imgNameOrUrlStr = @"iph_X.mp4";
        }break;
    }return imgNameOrUrlStr;
}

@end
