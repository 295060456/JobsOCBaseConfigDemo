//
//  JhtBannerScrollViewProtocol.h
//  JhtBannerScrollView
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/10.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//

#import "JobsBlock.h"
#ifndef JhtBannerScrollViewProtocol_h
#define JhtBannerScrollViewProtocol_h
@class JhtBannerScrollView;
#pragma mark —— JhtBannerScrollViewDelegate
@protocol JhtBannerScrollViewDelegate <NSObject>
@optional
/// 当前显示cardView Size
-(JobsReturnCGSizeByJhtBannerScrollView _Nonnull)sizeForCurrentCardViewInBannerView;
/// 滚动到了某一个cardView
- (void)bannerView:(JhtBannerScrollView *_Nonnull)bannerView didScrollToCardViewWithIndex:(NSInteger)index;
/// 点击了第几个cardView
-(void)bannerView:(JhtBannerScrollView *_Nonnull)bannerView
didSelectCardView:(UIView *_Nonnull)cardView
withCardViewIndex:(NSInteger)index;

@end
#pragma mark —— JhtBannerScrollViewDataSource
@protocol JhtBannerScrollViewDataSource <NSObject>
@required
/// 显示cardView 个数
-(JobsReturnNSIntegerByJhtBannerScrollView _Nonnull)numberOfCardViewInBannerView;
/// 单个cardView
-(UIView *_Nonnull)bannerView:(JhtBannerScrollView *_Nonnull)bannerView cardViewForBannerViewAtIndex:(NSInteger)index;

@end

#endif /* JhtBannerScrollViewProtocol_h */
