//
//  UIButtonModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "AppToolsProtocol.h"
#import "BaseButtonProtocol.h"
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButtonModel : BaseModel <BaseButtonProtocol,AppToolsProtocol>
#pragma mark —— 对方位 <UILocationProtocol>
#pragma mark —— 对 UIButton + UI <BaseButtonProtocol>
Prop_assign()CGFloat leftViewWidth;
Prop_assign()CGFloat rightViewWidth;
Prop_assign()CGFloat titleWidth;
Prop_assign()CGFloat subTitleWidth;
#pragma mark —— 针对批量设置的UIButton的数据源
/// 未选择状态的数据源
Prop_strong(nullable)NSArray <NSString *>*normal_titles;// title
Prop_strong(nullable)NSArray <UIFont *>*normal_titleFonts;// titleFont
Prop_strong(nullable)NSArray <UIColor *>*normal_titleCors;// titleCor
Prop_strong(nullable)NSArray <NSAttributedString *>*normal_attributedTitles;// attributedTitle

Prop_strong(nullable)NSArray <NSString *>*normal_subTitles;// subTitle
Prop_strong(nullable)NSArray <UIFont *>*normal_subTitleFonts;// subTitleFont
Prop_strong(nullable)NSArray <UIColor *>*normal_subTitleCors;// subTitleCor
Prop_strong(nullable)NSArray <NSAttributedString *>*normal_attributedSubtitles;// attributedSubtitle

Prop_strong(nullable)NSArray <UIColor *>*normal_baseBackgroundColors;// baseBackgroundColor
Prop_strong(nullable)NSArray <UIImage *>*normal_backgroundImages;// backgroundImage
Prop_strong(nullable)NSArray <UIImage *>*normal_images;// jobsResetBtnImage
Prop_strong(nullable)NSArray <NSNumber *>*imagePaddings;// imagePadding 图像与标题之间的间距
/// 已选择状态的数据源
Prop_strong(nullable)NSArray <NSString *>*selected_titles;// selectedTitle
Prop_strong(nullable)NSArray <UIFont *>*selected_titleFonts;// selectedTitleFont
Prop_strong(nullable)NSArray <UIColor *>*selected_titleCors;// selectedTitleCor
Prop_strong(nullable)NSArray <NSAttributedString *>*selected_attributedTitles;// selectedAttributedSubTitle

Prop_strong(nullable)NSArray <NSString *>*selected_subTitles;// selectedSubTitle
Prop_strong(nullable)NSArray <UIFont *>*selected_subTitleFonts;// selectedSubTitleFont
Prop_strong(nullable)NSArray <UIColor *>*selected_subTitleCors;// selectedSubTitleCor
Prop_strong(nullable)NSArray <NSAttributedString *>*selected_attributedSubtitles;// normal_attributedSubtitles

Prop_strong(nullable)NSArray <UIColor *>*selected_baseBackgroundColors;// selectedBaseBackgroundColor
Prop_strong(nullable)NSArray <UIImage *>*selected_backgroundImages;// highlightBackgroundImage
Prop_strong(nullable)NSArray <UIImage *>*selected_Images;// highlightImage
Prop_strong(nullable)NSArray <NSNumber *>*selected_imagePaddings;// imagePadding 图像与标题之间的间距
#pragma mark —— 点击事件
Prop_strong(nullable)UIAction *primaryAction;/// 新Api的点击事件
Prop_copy(nullable)JobsReturnIDByIDBlock longPressGestureEventBlock;/// 按钮的长按事件
Prop_copy(nullable)JobsReturnIDByIDBlock clickEventBlock;/// 老Api的点击事件，利用RAC实现
Prop_copy(nullable)jobsByBtnBlock onClickBlock;
Prop_copy(nullable)jobsByBtnBlock onLongPressGestureEventBlock;
#pragma mark —— UI约束（Masonry）
Prop_copy(nullable)jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 计时器
Prop_strong(nullable)NSTimerManager *timerManager;
#pragma mark —— 按钮挂载的对象
Prop_strong(nullable)id data;
Prop_strong(nullable)__kindof UIView *view;
#pragma mark —— 保留字段
Prop_copy(nullable)JobsReturnRACDisposableByReturnIDByIDBlock jobsReturnedTestBlock;
Prop_copy(nullable)jobsByVoidBlock jobsTestBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIButtonModel *_Nonnull jobsMakeButtonModel(jobsByButtonModelBlock _Nonnull block){
    UIButtonModel *data = UIButtonModel.alloc.init;
    if (block) block(data);
    return data;
}
