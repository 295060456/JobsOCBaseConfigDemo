//
//  SplashAdManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/6/24.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JobsBlock.h"
#import "MacroDef_String.h"
#import "MacroDef_Func.h"
#import "MacroDef_Cor.h"
#import "MacroDef_Notification.h"
#import "UIView+Gesture.h"
#import "NSString+Others.h"
#import "UIButton+Timer.h"
#import "NSObject+DynamicInvoke.h"
#import "NSObject+OpenURL.h"

typedef NS_ENUM(NSUInteger, SkipButtonMode) {
    SkipButtonModeNormal,
    SkipButtonModeCountdown
};

NS_ASSUME_NONNULL_BEGIN
/**
    OC 开屏广告的Demo，要求：
     1、将这个开屏广告做成单例。单例的属性进行配置。内部不使用协议
     1、最大程度的向下匹配兼容老旧的系统
     2、适配最新版的iOS系统
     3、右上角会有一个按钮
          3.1、按钮名称可以配置，如果没有配置，则显示默认的“跳过”
         3.2、按钮的位置可以传入一个Frame进行配置，如果没有传入，则默认显示在右上角（距离上20，右10）
         3.3、按钮可以有普通模式和倒计时模式
              3.3.1、普通模式：视频资源播放1次结束、图片资源默认5秒（可自定义）后为展示结束
             3.3.2、倒计时模式：只要设定了倒计时，只要倒计时为0，则为资源展示结束
         3.4、资源展示结束以后，移除掉开屏广告，进入我们的根控制器
     4、展示资源内容：
         4.1、本地资源
             4.1.1、本地视频
             4.1.2、本地图片（包括静态图、动态图）
             4.1.3、动画资源SVG、Lottie
         4.2、URL资源
             4.2.1、URL视频
             4.2.2、URL图片（包括静态图、动态图）
             4.2.3、有一个属性进行配置：是否执行预加载
             4.2.4、当预加载的时候，检测当前网络，如果为WIFI则下载，如果是非WIFI环境，则弹出框，让用户选择此时，是否下载资源
     5、如果当前播放的资源是视频，那么在右上角出现按钮，控制是否播放视频声音
     6、监控用户操作，用Block作为回调
         6.1、用户双击屏幕
         6.2、用户单击屏幕
             如果没有配置，默认单击屏幕执行跳转
             跳转的网页需要配置，如果没有配置，则跳转google
         6.3、用户摇晃手机
 */
@interface JobsLaunchAdMgr : NSObject

@property(nonatomic,copy)NSString *buttonTitle;
@property(nonatomic,assign)CGRect buttonFrame;
@property(nonatomic,assign)SkipButtonMode buttonMode;
@property(nonatomic,assign)NSInteger countdownDuration;
@property(nonatomic,copy)NSString *redirectURL;

@property(nonatomic,copy)jobsByVoidBlock onDoubleTap;
@property(nonatomic,copy)jobsByVoidBlock onSingleTap;
@property(nonatomic,copy)jobsByVoidBlock onLongPress;
@property(nonatomic,copy)jobsByVoidBlock onShake;

+ (instancetype)sharedManager;
+ (void)destroyInstance;
- (void)showAdWithLocalResource:(NSString *)resourcePath
                        isVideo:(BOOL)isVideo;
- (void)showAdWithURLResource:(NSString *)url 
                      isVideo:(BOOL)isVideo
                shouldPreload:(BOOL)shouldPreload;

@end

NS_ASSUME_NONNULL_END
