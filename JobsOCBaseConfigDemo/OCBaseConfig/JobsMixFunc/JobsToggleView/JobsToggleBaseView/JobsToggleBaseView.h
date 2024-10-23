//
//  JobsToggleBaseView.h
//  RPTaggedNavView
//
//  Created by User on 7/20/24.
//  Copyright © 2024 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "UIView+Measure.h"
#import "JobsToggleNavView.h"
#import "UIButtonModel.h"
#import "JobsToggleNavViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsToggleBaseView : BaseView
<
UIScrollViewDelegate,
JobsToggleNavViewProtocol
>
/// UI
@property(nonatomic,strong,readonly)JobsToggleNavView *taggedNavView;
@property(nonatomic,strong,readonly)UIScrollView *bgScroll;
/// Data
@property(nonatomic,assign)CGFloat taggedNavView_height;
@property(nonatomic,assign)CGFloat taggedNavView_width;
@property(nonatomic,assign)CGFloat taggedNavView_bgScroll_offset;
@property(nonatomic,assign)CGSize toggleView_size;
@property(nonatomic,strong)UIColor *taggedNavViewBgColor;
@property(nonatomic,strong)NSMutableArray <__kindof UIView<BaseViewProtocol> *>*scrollContentViews;/// 可滑动的子视图的【唯一的】数据源
@property(nonatomic,weak)__kindof UIButton *currentSelectedBtn;
/// 当前显示的View
-(jobsByNSIntegerBlock _Nonnull)switchViewsBy;

@end

NS_ASSUME_NONNULL_END
