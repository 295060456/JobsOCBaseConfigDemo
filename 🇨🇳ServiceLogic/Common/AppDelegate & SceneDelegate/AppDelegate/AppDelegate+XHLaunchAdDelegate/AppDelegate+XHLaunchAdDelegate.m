//
//  AppDelegate+XHLaunchAdDelegate.m
//  UBallLive
//
//  Created by Jobs on 2020/10/11.
//

#import "AppDelegate+XHLaunchAdDelegate.h"

BOOL xhLaunchAdShowFinish;
@implementation AppDelegate (XHLaunchAdDelegate)

/// 广告点击回调
/// @param launchAd  launchAd
/// @param openModel 打开页面参数(此参数即你配置广告数据设置的configuration.openModel)
/// @param clickPoint 点击位置
- (BOOL)xhLaunchAd:(XHLaunchAd *)launchAd
  clickAtOpenModel:(id)openModel
        clickPoint:(CGPoint)clickPoint{
    [self jobsOpenURL:openModel];
    return YES;
}
/// 跳过按钮点击回调(注意:自定义跳过按钮不会走此回调)
/// @param launchAd launchAd
/// @param skipButton 跳过按钮
-(void)xhLaunchAd:(XHLaunchAd *)launchAd
  clickSkipButton:(UIButton *)skipButton{
    
}
/// 图片本地读取/或下载完成回调
/// @param launchAd XHLaunchAd
/// @param image 读取/下载的image
/// @param imageData 读取/下载的imageData
-(void)xhLaunchAd:(XHLaunchAd *)launchAd
imageDownLoadFinish:(UIImage *)image
        imageData:(NSData *)imageData{
    [self delay:1
          doSth:^(id data) {
        
    }];
}

///  video本地读取/或下载完成回调
/// @param launchAd XHLaunchAd
/// @param pathURL 本地保存路径
-(void)xhLaunchAd:(XHLaunchAd *)launchAd
videoDownLoadFinish:(NSURL *)pathURL{
    
}
/// 视频下载进度回调
/// @param launchAd XHLaunchAd
/// @param progress 下载进度
/// @param total 总大小
/// @param current  当前已下载大小
-(void)xhLaunchAd:(XHLaunchAd *)launchAd
videoDownLoadProgress:(float)progress
            total:(unsigned long long)total
          current:(unsigned long long)current{
    
}
/// 倒计时回调
/// @param launchAd XHLaunchAd
/// @param customSkipView customSkipView
/// @param duration 倒计时时间
-(void)xhLaunchAd:(XHLaunchAd *)launchAd
   customSkipView:(UIView *)customSkipView
         duration:(NSInteger)duration{
    
}
/// 广告显示完成
-(void)xhLaunchAdShowFinish:(XHLaunchAd *)launchAd{
    NSLog(@"");
    xhLaunchAdShowFinish = YES;
}
/// 如果你想用SDWebImage等框架加载网络广告图片,请实现此代理,注意:实现此方法后,图片缓存将不受XHLaunchAd管理
/// @param launchAd XHLaunchAd
/// @param launchAdImageView launchAdImageView
/// @param url 图片url
-(void)xhLaunchAd:(XHLaunchAd *)launchAd
launchAdImageView:(UIImageView *)launchAdImageView
              URL:(NSURL *)url{
    
}

@end
