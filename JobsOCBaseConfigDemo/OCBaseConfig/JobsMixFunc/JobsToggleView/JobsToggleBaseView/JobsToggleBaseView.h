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
@property(nonatomic,assign)CGSize toggleView_size;/// 本控件的尺寸
@property(nonatomic,assign)CGSize taggedNavSingleBtn_size;/// 单个导航按钮的尺寸【一般是统一样式】默认JobsWidth(80)、JobsWidth(44)
@property(nonatomic,assign)CGFloat taggedNavView_height;/// 一整个导航栏的高度。默认JobsWidth(44)
@property(nonatomic,assign)CGFloat taggedNavView_width;/// 一整个导航栏的宽度
@property(nonatomic,assign)CGFloat taggedNavView_bgScroll_offset;/// 导航栏和可滑动子视图之间垂直方向上的距离
@property(nonatomic,strong)UIColor *taggedNavViewBgColor;/// 导航栏的背景颜色
@property(nonatomic,strong)NSMutableArray <__kindof UIView<BaseViewProtocol> *>*scrollContentViews;/// 可滑动的子视图的【唯一的】数据源
@property(nonatomic,weak)__kindof UIButton *currentSelectedBtn;
/// 当前显示的View
-(jobsByNSIntegerBlock _Nonnull)switchViewsBy;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsToggleBaseView *_Nonnull jobsMakeToggleBaseView(jobsByToggleBaseViewBlock _Nonnull block){
    JobsToggleBaseView *data = JobsToggleBaseView.alloc.init;
    if (block) block(data);
    return data;
}
