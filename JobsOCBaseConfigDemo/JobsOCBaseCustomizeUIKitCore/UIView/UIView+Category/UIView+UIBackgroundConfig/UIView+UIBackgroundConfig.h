//
//  UIView+UIBackgroundConfig.h
//  Casino
//
//  Created by Jobs on 2021/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 
 【矛盾点】：众所周知，在iOS 14 之前，是不能够调整诸如 UITableViewHeaderFooterView的宽度
 【解决矛盾】：于是在 iOS 14以后推出 UIBackgroundConfiguration 这个属性
 【使用说明】：但是这个属性的初始化方法被标记 NS_UNAVAILABLE 不能使用new 和 init
 
 1、只能使用如下的初始化方法：
 
 #################################################################
 
 + (instancetype)clearConfiguration;
 + (instancetype)listPlainCellConfiguration;
 + (instancetype)listPlainHeaderFooterConfiguration;
 + (instancetype)listGroupedCellConfiguration;
 + (instancetype)listGroupedHeaderFooterConfiguration;

 + (instancetype)listSidebarHeaderConfiguration API_UNAVAILABLE(tvos, watchos);
 + (instancetype)listSidebarCellConfiguration API_UNAVAILABLE(tvos, watchos);
 + (instancetype)listAccompaniedSidebarCellConfiguration API_UNAVAILABLE(tvos, watchos);

 + (instancetype)new NS_UNAVAILABLE;
 - (instancetype)init NS_UNAVAILABLE;

 - (instancetype)updatedConfigurationForState:(id<UIConfigurationState>)state;
 
 #################################################################
 
 2、UIBackgroundConfiguration 的影响范围：
    2.1、UITableViewHeaderFooterView
    2.2、UITableViewCell
    2.3、UICollectionViewCell
    2.4、UICollectionReusableView
 
 */
@interface UIView (UIBackgroundConfig)

@property(nonatomic,strong)UIBackgroundConfiguration *backgroundConfig API_AVAILABLE(ios(14.0));

@end

NS_ASSUME_NONNULL_END
