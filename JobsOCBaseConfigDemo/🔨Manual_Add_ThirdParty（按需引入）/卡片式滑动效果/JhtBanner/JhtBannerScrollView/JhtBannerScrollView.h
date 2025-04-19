//
//  JhtBannerScrollView.h
//  JhtBannerScrollView
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/2.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "MacroDef_Size.h"
#import "DefineConstString.h" /// 常量字符串的定义
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
#import "JhtBannerScrollViewProtocol.h"
#import "UIGestureRecognizer+Extra.h"
#import "NSObject+Extras.h"
#import "NSRunLoop+Extra.h"
#import "JhtBannerCardView.h"

#ifndef WidthScale375
#define WidthScale375 (([[UIScreen mainScreen] bounds].size.width) / 375)
#endif /* WidthScale375 */

static const NSString * _Nullable subviewClassName = @"JhtBannerCardView";

@class JhtBannerScrollView;
/// banner view（整条view）
@interface JhtBannerScrollView : UIView <UIScrollViewDelegate>
/// 滚动方向：default: BV_Orientation_Horizontal
Prop_assign()JhtBannerViewOrientation orientation;
/// 非当前页的透明比例（蒙板View alpha）default: 0.4
Prop_assign()CGFloat minCoverViewAlpha;
/// View之间 左右间距 default: 20.0
Prop_assign()CGFloat leftRightMargin;
/// 两侧小View与中间View 高度差 default: 15.0
Prop_assign()CGFloat topBottomMargin;
/// 是否开启自动滚动 default: YES
Prop_assign()BOOL isOpenAutoScroll;
/// 是否开启无限轮播 default: YES
Prop_assign()BOOL isCarousel;
/// 自动切换视图 时间 default: 3.0
Prop_assign()NSTimeInterval autoTime;
/// 当前是第几页
@property(nonatomic,assign,readonly)NSInteger currentIndex;
/// pageControl（自定义扩展）
@property(nonatomic,strong,nullable)UIPageControl *pageControl;

@property(nonatomic,assign,nullable)id<JhtBannerScrollViewDataSource> dataSource;
@property(nonatomic,assign,nullable)id<JhtBannerScrollViewDelegate> delegate;

+(JobsReturnJhtBannerScrollViewByFrame _Nonnull)initByFrame;
/// 刷新视图
-(void)reloadData;
/// 获取可重复使用的卡片View（cardView）
-(UIView *_Nullable)dequeueReusableView;
/// 滚动到指定的页面
-(jobsByNSUIntegerBlock _Nonnull)scrollToPageByPageNumber;
/// 继续滚动
-(void)continueScroll;
/// 暂停滚动
-(void)pauseScroll;

@end
