//
//  WMZBannerView.h
//  WMZBanner
//
//  Created by wmz on 2019/9/6.
//  Copyright © 2019 wmz. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "UIImageView+SDWebImage.h"
//#import "NSString+Others.h"
#import "JobsBlock.h"

#import "WMZBannerParam.h"
#import "WMZBannerFlowLayout.h"
#import "WMZBannerControl.h"
#import "WMZBannerOverLayout.h"
#import "WMZBannerFadeLayout.h"

#import "NSObject+Image.h"

NS_ASSUME_NONNULL_BEGIN

@interface WMZBannerView : UIView
<
UICollectionViewDelegate
,UICollectionViewDataSource
>
/// 背景图
@property(strong,nonatomic)UIImageView *bgImgView;
/// 调用方法
- (instancetype)initConfigureWithModel:(WMZBannerParam *)param withView:(UIView*)parentView;
/// 调用方法
- (instancetype)initConfigureWithModel:(WMZBannerParam *)param;
+(JobsReturnWMZBannerViewByBannerParamBlock _Nonnull)initBy;
/// 更新UI
- (void)updateUI;
/// 手动调用滚动
- (void)scrolToPath:(NSIndexPath*)path animated:(BOOL)animated;

@end

@interface Collectioncell : UICollectionViewCell

Prop_strong()UIImageView *icon;
Prop_strong()WMZBannerParam *param;

@end

@interface CollectionTextCell : UICollectionViewCell

Prop_strong()UILabel *label;
Prop_strong()WMZBannerParam *param;

@end

NS_ASSUME_NONNULL_END
