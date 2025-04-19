//
//  TabBarControllerConfig.h
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef LANDSCAPE_VALUE_H
#define LANDSCAPE_VALUE_H
#define landscapeValue(s) (JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape ? (s) : 0)
#endif /* LANDSCAPE_VALUE_H */

NS_ASSUME_NONNULL_BEGIN
/// 对单个的 TabBarItem 进行的配置。这个类不能用作单例
@interface JobsTabBarItemConfig : NSObject

Prop_strong()UIViewController *vc;/// 子控制器
Prop_copy()NSString *title;/// 显示标题
@property(nonatomic,strong,nullable)NSString *lottieName;/// 有值则启用Lottie动画
Prop_strong()UIImage *imageSelected; /// 选中状态的静态图
Prop_strong()UIImage *imageUnselected;/// 未选中状态的静态图
@property(nonatomic,strong,null_resettable)UIColor *titleCorNormal;/// 未选中标题颜色
@property(nonatomic,strong,null_resettable)UIColor *titleCorSelected;/// 选中标题颜色
Prop_strong()UIFont *fontNormal;/// 未选中字体
Prop_strong()UIFont *fontSelected;/// 未选中字体
Prop_assign()CGFloat humpOffsetY;/// Y轴凸起的偏移量 传0就是不凸起
Prop_assign()NSUInteger tag;
Prop_assign()CGRect tabBarItemFrame;/// 每一个TabbarItem 的Frame
Prop_assign()CGSize tabBarItemSize;/// 每一个TabbarItem  的size
Prop_assign()CGFloat tabBarItemWidth;/// 每一个TabbarItem  的宽
Prop_assign()CGFloat tabBarItemHeight;/// 每一个TabbarItem  的高
Prop_assign()CGFloat xOffset;/// 每一个TabbarItem 和前一个TabbarItem在x轴方向的偏移量。如果是第一个TabbarItem则是和左屏幕进行比较
Prop_assign()CGFloat spacing;/// 每一个TabbarItem中的图文间距
Prop_assign()BOOL isNeedCheckLogin;
Prop_assign()BOOL isNotNeedCheckLogin;/// 优先级高于isNeedCheckLogin
Prop_assign()BOOL isNeedjump;/// 跳开处理，即不切控制器，而是做其他操作，比如弹一个提示框

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTabBarItemConfig *_Nonnull jobsMakeTabBarItemConfig(jobsByTabBarItemConfigBlock _Nonnull block){
    JobsTabBarItemConfig *data = JobsTabBarItemConfig.alloc.init;
    if (block) block(data);
    return data;
}
