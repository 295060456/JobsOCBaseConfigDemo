//
//  TabBarControllerConfig.h
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsTabBarCtrlConfig : NSObject

@property(nonatomic,strong)UIViewController *vc;
@property(nonatomic,strong)NSString *title;/// 显示标题
@property(nonatomic,strong,nullable)NSString *lottieName;/// 有值则启用Lottie动画
@property(nonatomic,strong)UIImage *imageSelected; /// 选中状态的静态图
@property(nonatomic,strong)UIImage *imageUnselected;/// 未选中状态的静态图
@property(nonatomic,strong)UIColor *titleCorNormal;/// 未选中标题颜色
@property(nonatomic,strong)UIColor *titleCorSelected;/// 选中标题颜色
@property(nonatomic,strong)UIFont *fontNormal;/// 未选中字体
@property(nonatomic,strong)UIFont *fontSelected;/// 未选中字体
@property(nonatomic,assign)CGFloat humpOffsetY;/// Y轴凸起的偏移量 传0就是不凸起
@property(nonatomic,assign)NSUInteger tag;
@property(nonatomic,assign)CGRect tabBarItemFrame;/// 每一个TabbarItem 的Frame
@property(nonatomic,assign)CGSize tabBarItemSize;/// 每一个TabbarItem  的size
@property(nonatomic,assign)CGFloat tabBarItemWidth;/// 每一个TabbarItem  的宽
@property(nonatomic,assign)CGFloat tabBarItemHeight;/// 每一个TabbarItem  的高
@property(nonatomic,assign)CGFloat xOffset;/// 每一个TabbarItem 和前一个TabbarItem在x轴方向的偏移量。如果是第一个TabbarItem则是和左屏幕进行比较
@property(nonatomic,assign)CGFloat spacing;/// 每一个TabbarItem中的图文间距

@end

NS_ASSUME_NONNULL_END
