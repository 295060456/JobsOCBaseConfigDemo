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
/// Data
@property(nonatomic,assign)CGFloat taggedNavView_height;
@property(nonatomic,assign)CGFloat taggedNavView_width;
@property(nonatomic,assign)CGFloat taggedNavView_bgScroll_offset;
@property(nonatomic,assign)CGSize toggleView_size;
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*scrollContentViews;
@property(nonatomic,strong)NSMutableArray <NSString *>*taggedNavTitles;
@property(nonatomic,weak)__kindof UIButton *currentSelectedBtn;

-(JobsToggleNavView *)taggedNavView;
-(UIScrollView *)bgScroll;

@end

NS_ASSUME_NONNULL_END
