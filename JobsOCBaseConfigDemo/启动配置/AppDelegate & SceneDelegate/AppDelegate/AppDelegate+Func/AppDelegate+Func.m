//
//  AppDelegate+Func.m
//  UBallLive
//
//  Created by Jobs on 2020/10/11.
//

#import "AppDelegate+Func.h"

@implementation AppDelegate (Func)
#pragma mark —— 启动调用功能
+(jobsByVoidBlock _Nonnull)launchFunc1{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
    };
}

-(jobsByVoidBlock _Nonnull)launchFunc2{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        UIApplication.sharedApplication.idleTimerDisabled = NO;/// 保持屏幕常亮
        /*
         * 禁止App系统文件夹document同步
         * 苹果要求：可重复产生的数据不得进行同步,什么叫做可重复数据？这里最好禁止，否则会影响上架，被拒！
         */
        FileFolderHandleTool.banSysDocSynchronization();
        NetworkingEnvir();/// 配置网络环境
#ifdef DEBUG
        UIFont.getAvailableFont();/// 打印全员字体
#endif
        self.makeJobsNavBarConfig();/// 全局配置 JobsNavBarConfig
        self.makeTABAnimatedConfig();/// 全局配置 TABAnimated
        self.makeIQKeyboardManagerConfig();/// 全局配置键盘
        self.makeGKNavigationBarConfig();/// 自定义导航栏
//        self.makeJobsLaunchAdConfig();/// 开屏广告
        self.makeReachabilityConfig();/// 网络环境监测
        self.YTKNetworkConfig();/// YTK网络框架的配置
        self.KTVHTTP();/// KTVHTTPCache
    };
}
#pragma mark —— 开屏广告
-(jobsByVoidBlock _Nonnull)makeJobsLaunchAdConfig{
    return ^() {
        // 配置并展示开屏广告
//        {
//            JobsLaunchAdMgr *adManager = [JobsLaunchAdMgr sharedManager];
//                adManager.adURL = [NSURL URLWithString:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"]; // Replace with your ad URL
//                adManager.imageDisplayDuration = 5.0; // Duration to display the image
//                adManager.adMode = JobsLaunchAdModeNormal; // Choose the ad mode
//                adManager.buttonTitle = @"Skip";
//                adManager.buttonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 20, 50, 30);
//
//                // Set up callbacks if needed
//                adManager.singleTapCallback = ^{
//                    // Handle single tap
//                    NSLog(@"Ad single tapped");
//                };
//
//                adManager.doubleTapCallback = ^{
//                    // Handle double tap
//                    NSLog(@"Ad double tapped");
//                };
//
//                adManager.shakeCallback = ^{
//                    // Handle shake gesture
//                    NSLog(@"Device shaken");
//                };
//
//                // Show the ad
//                [adManager showAd];
//        }
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
//            NSString *localImagePath = @"1242x2688.png".pathForResourceWithFullName;
//            [adManager showAdWithLocalResource:localImagePath isVideo:NO];
            
            // 本地视频资源示例
    //         NSString *localVideoPath = @"welcome_video.mp4".pathForResourceWithFullName
    //         [adManager showAdWithLocalResource:localVideoPath isVideo:YES];
            
            // URL图片资源示例
    //         [adManager showAdWithURLResource:@"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80_%D0%9F%D1%83%D1%82%D0%B8%D0%BD_%2808-03-2024%29_%28cropped%29.jpg/220px-%D0%92%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80_%D0%9F%D1%83%D1%82%D0%B8%D0%BD_%2808-03-2024%29_%28cropped%29.jpg" isVideo:NO shouldPreload:YES];
            
            // URL视频资源示例
             [adManager showAdWithURLResource:@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4"
                                      isVideo:YES
                                shouldPreload:YES];
        }
    };
}
#pragma mark —— YTKNetworkConfig
-(jobsByVoidBlock _Nonnull)YTKNetworkConfig{
    return ^(){
        @jobs_weakify(self)
        jobsMakeYTKNetworkConfig(^(__kindof YTKNetworkConfig *_Nullable data) {
            @jobs_strongify(self)
            data.baseUrl = This.BaseUrl;
            data.cdnUrl = @"";
            //data.urlFilters = nil;
            //data.cacheDirPathFilters = nil;
            data.securityPolicy = AFSecurityPolicy.initByModeNone;
            data.debugLogEnabled = YES;
            data.sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration;
            [data addUrlFilter:[YTKUrlArgumentsFilter filterWithArguments:jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data) {
                @jobs_strongify(self)
                [data setValue:self.appVersion forKey:@"version"];
            })]];
        });
    };
}
#pragma mark —— KTVHTTPCache
-(jobsByVoidBlock _Nonnull)KTVHTTP{
    return ^(){
        NSError *error = nil;
        [KTVHTTPCache proxyStart:&error];
        if(error) NSLog(@"error = %@",error.description)
    };
}
#pragma mark —— 欢迎引导页面
-(jobsByVoidBlock _Nonnull)guide{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.window.rootViewController = self.isAppFirstLaunch ? JobsWelcomeVC.new : AppDelegate.tabBarVC;
    };
}
#pragma mark —— 存取用户信息Demo
-(jobsByVoidBlock _Nonnull)saveAndReadUserInfoDemo{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.saveUserInfo(jobsMakeUserModel(^(__kindof JobsUserModel<NSCoding> * _Nullable userModel) {
            userModel.token = @"12345";
            userModel.uid = @"54321";
        }));
//        JobsUserModel *f = self.readUserInfo;
//        NSLog(@"");
    };
}
#pragma mark —— 读取Plist配置文件
-(jobsByVoidBlock _Nonnull)readPlistConfig{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        static dispatch_once_t readPlistConfigDispatchOnce;
        dispatch_once(&readPlistConfigDispatchOnce, ^{
            id plistConfig = self.readLocalPlistWithFileName(@"MetaData");
            NSLog(@"plistConfig = %@",plistConfig);
        });
    };
}
#pragma mark —— 全局配置 TABAnimated
-(jobsByVoidBlock _Nonnull)makeTABAnimatedConfig{
    return ^(){
        [TABAnimated.sharedAnimated initWithOnlySkeleton];
        /// 是否开启控制台Log提醒，默认不开启
        TABAnimated.sharedAnimated.openLog = YES;
        ///开启后，会在每一个动画元素上增加一个红色的数字，该数字表示该动画元素所在的下标，方便快速定位某个动画元素。
//        TABAnimated.sharedAnimated.openAnimationTag = YES;
//        TABAnimated.sharedAnimated.animationType;/// 全局动画类型
//        TABAnimated.sharedAnimated.animatedHeightCoefficient;/// 动画高度与视图原有高度的比例系数，该属性仅仅对`UILabel`生效。
//        TABAnimated.sharedAnimated.animatedColor;/// 全局动画内容颜色，默认值为0xEEEEEE
        TABAnimated.sharedAnimated.animatedBackgroundColor = JobsLightGrayColor;/// 全局动画背景颜色，默认值为UIColor.whiteColor
//        TABAnimated.sharedAnimated.useGlobalCornerRadius;/// 是否开启全局圆角。开启后，全局圆角默认值为: 动画高度/2.0
//        TABAnimated.sharedAnimated.animatedCornerRadius;/// 全局圆角的值。优先级：此属性 < view自身的圆角
//        TABAnimated.sharedAnimated.useGlobalAnimatedHeight;/// 是否需要全局动画高度
//        TABAnimated.sharedAnimated.animatedHeight;/// 全局动画高度
//        TABAnimated.sharedAnimated.scrollEnabled;/// 是否可以在滚动，默认可以滚动
//        TABAnimated.sharedAnimated.closeCache;/// 关闭缓存功能，默认开启
//        TABAnimated.sharedAnimated.darkAnimatedBackgroundColor;/// 暗黑模式下，动画背景色
//        TABAnimated.sharedAnimated.darkAnimatedColor;/// 暗黑模式下，动画内容的颜色
//        TABAnimated.sharedAnimated.darkModeType;/// 暗黑模式选择，跟随系统、强制普通模式、强制暗黑模式
//        TABAnimated.sharedAnimated.classicAnimation;/// 经典动画全局配置
//        TABAnimated.sharedAnimated.dropAnimation;/// 下坠动画全局配置
//        TABAnimated.sharedAnimated.binAnimation;/// 呼吸灯动画全局配置
//        TABAnimated.sharedAnimated.shimmerAnimation;/// 闪光灯动画全局配置
    };
}
#pragma mark —— 全局配置键盘
-(jobsByVoidBlock _Nonnull)makeIQKeyboardManagerConfig{
    return ^(){
        jobsMakeIQKeyboardManager(^(__kindof IQKeyboardManager * _Nullable manager) {
            manager.enable = YES; /// 控制整个功能是否启用
            manager.shouldResignOnTouchOutside = YES; /// 启用手势触摸:控制点击背景是否收起键盘
            manager.shouldToolbarUsesTextFieldTintColor = YES; /// 控制键盘上的工具条文字颜色是否用户自定义,(使用TextField的tintColor属性IQToolbar，否则色调的颜色是黑色 )
            manager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
            manager.enableAutoToolbar = NO; /// 控制是否显示键盘上的工具条,当需要支持内联编辑(Inline Editing), 这就需要隐藏键盘上的工具条(默认打开)
            manager.shouldShowToolbarPlaceholder = YES; // 是否显示占位文字
            manager.placeholderFont = UIFontWeightBoldSize(JobsWidth(17)); // 设置占位文字的字体
            manager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
        });
    };
}
#pragma mark —— 全局配置GKNavigationBar
-(jobsByVoidBlock _Nonnull)makeGKNavigationBarConfig{
    return ^(){
        [GKConfigure setupCustomConfigure:^(GKNavigationBarConfigure * _Nonnull configure) {
            // 导航栏背景色
            configure.backgroundColor = JobsClearColor;
            // 导航栏标题颜色
            configure.titleColor = HEXCOLOR(0x3D4A58);
            // 导航栏标题字体
            configure.titleFont = UIFontWeightBoldSize(16);
            // 导航栏返回按钮样式
            configure.backStyle = GKNavigationBarBackStyleBlack;
            // 导航栏左右item间距
            configure.gk_navItemLeftSpace = JobsWidth(12.0f);
            configure.gk_navItemRightSpace = JobsWidth(12.0f);
    #warning 这里的Api有变化 先注释，否则无法编译通过
    //        configure.shiledItemSpaceVCs = @[@"PUPhotoPickerHostViewController"];
        }];
    };
}
#pragma mark —— 全局配置JobsNavBarConfig
-(jobsByVoidBlock _Nonnull)makeJobsNavBarConfig{
    return ^(){
        static_navBarConfig = JobsNavBarConfig.SharedInstance();
//        static_navBarConfig.backBtnModel = self.makeBackBtnModel;
    };
}
#pragma mark —— 本地推送通知
-(jobsByVoidBlock _Nonnull)localNotifications{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        jobsMakeUNUserNotificationCenter(^(__kindof UNUserNotificationCenter * _Nullable center) {
            @jobs_strongify(self)
            center.delegate = self;
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert +
                                                     UNAuthorizationOptionSound +
                                                     UNAuthorizationOptionBadge)
                                  completionHandler:^(BOOL granted,
                                                      NSError *_Nullable error) {
                if (granted) {
                    NSLog(@"Notification permission granted.");
                } else {
                    NSLog(@"Notification permission denied.");
                }
            }];
        });
    };
}
#pragma mark —— 网络环境监测
-(jobsByVoidBlock _Nonnull)makeReachabilityConfig{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        // Allocate a reachability object
        Reachability *reach = @"www.google.com".makeReachability;
        // Tell the reachability that we DON'T want to be reachable on 3G/EDGE/CDMA
        reach.reachableOnWWAN = NO;
        // Here we set up a NSNotification observer. The Reachability that caused the notification
        // is passed in the object parameter
        [reach startNotifier];
        @jobs_weakify(self)
        [self addNotificationName:kReachabilityChangedNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            NSLog(@"通知传递过来的 = %@",notification.object);
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.jobsPost(kReachabilityChangedNotification);
        });
    };
}

@end
