//
//  RPTaggedNavView.h
//  RPTaggedNavView
//
//  Created by Tao on 2018/8/8.
//  Copyright © 2018年 Tao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "BaseButton.h"
#import "UIButton+UI.h"
#import "UIView+Measure.h"

@interface JobsToggleNavView : BaseView
/// 数据源
@property(nonatomic,strong)NSArray <NSString *>* _Nonnull dataArr;
/// 标签文字颜色_未选中时
@property(nonatomic,strong,null_resettable)UIColor *tagTextColor_normal;
/// 标签文字颜色_选中时
@property(nonatomic,strong,null_resettable)UIColor *tagTextColor_selected;
/// 标签文字颜色_未选中时
@property(nonatomic,assign)CGFloat tagTextFont_normal;
/// 标签文字颜色_选中时
@property(nonatomic,assign)CGFloat tagTextFont_selected;
/// 滑块颜色
@property(nonatomic,strong,null_resettable)UIColor *sliderColor;
/// 滑块宽度
@property(nonatomic,assign)CGFloat sliderW;
/// 滑块高度
@property(nonatomic,assign)CGFloat sliderH;
/// 当前选择的 index
@property(nonatomic,assign,readonly)NSUInteger current_index;
/// 选择某一个标签
-(void)selectingOneTagWithIndex:(NSInteger )index;

@end
