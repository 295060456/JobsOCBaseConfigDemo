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
Prop_copy(nullable)NSArray <NSString *>*normal_titles;// title
Prop_copy(nullable)NSArray <UIFont *>*normal_titleFonts;// titleFont
Prop_copy(nullable)NSArray <UIColor *>*normal_titleCors;// titleCor
Prop_copy(nullable)NSArray <NSAttributedString *>*normal_attributedTitles;// attributedTitle

Prop_copy(nullable)NSArray <NSString *>*normal_subTitles;// subTitle
Prop_copy(nullable)NSArray <UIFont *>*normal_subTitleFonts;// subTitleFont
Prop_copy(nullable)NSArray <UIColor *>*normal_subTitleCors;// subTitleCor
Prop_copy(nullable)NSArray <NSAttributedString *>*normal_attributedSubtitles;// attributedSubtitle

Prop_copy(nullable)NSArray <UIColor *>*normal_baseBackgroundColors;// baseBackgroundColor
Prop_copy(nullable)NSArray <UIImage *>*normal_backgroundImages;// backgroundImage
Prop_copy(nullable)NSArray <UIImage *>*normal_images;// jobsResetBtnImage
Prop_copy(nullable)NSArray <NSNumber *>*imagePaddings;// imagePadding 图像与标题之间的间距
/// 已选择状态的数据源
Prop_copy(nullable)NSArray <NSString *>*selected_titles;// selectedTitle
Prop_copy(nullable)NSArray <UIFont *>*selected_titleFonts;// selectedTitleFont
Prop_copy(nullable)NSArray <UIColor *>*selected_titleCors;// selectedTitleCor
Prop_copy(nullable)NSArray <NSAttributedString *>*selected_attributedTitles;// selectedAttributedSubTitle

Prop_copy(nullable)NSArray <NSString *>*selected_subTitles;// selectedSubTitle
Prop_copy(nullable)NSArray <UIFont *>*selected_subTitleFonts;// selectedSubTitleFont
Prop_copy(nullable)NSArray <UIColor *>*selected_subTitleCors;// selectedSubTitleCor
Prop_copy(nullable)NSArray <NSAttributedString *>*selected_attributedSubtitles;// normal_attributedSubtitles

Prop_copy(nullable)NSArray <UIColor *>*selected_baseBackgroundColors;// selectedBaseBackgroundColor
Prop_copy(nullable)NSArray <UIImage *>*selected_backgroundImages;// highlightBackgroundImage
Prop_copy(nullable)NSArray <UIImage *>*selected_Images;// highlightImage
Prop_copy(nullable)NSArray <NSNumber *>*selected_imagePaddings;// imagePadding 图像与标题之间的间距
#pragma mark —— 点击事件 <UIViewModelOthersProtocol>
Prop_strong(nullable)UIAction *primaryAction;/// 新Api的点击事件
/// 一般用于 UIButtonModel
Prop_copy(nullable)JobsRetIDByIDBlock clickEventBlock;/// 老Api的点击事件，利用RAC实现
Prop_copy(nullable)JobsRetIDByIDBlock longPressGestureEventBlock;/// 按钮的长按事件
/// 一般用于 UIButton
Prop_copy(nullable)jobsByBtnBlock onClickBlock;
Prop_copy(nullable)jobsByBtnBlock onLongPressGestureEventBlock;
#pragma mark —— UI约束（Masonry）
Prop_copy(nullable)jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 按钮挂载的对象 <BaseViewProtocol>
Prop_strong(nullable)id data;
Prop_strong(nullable)__kindof UIView *view;
#pragma mark —— 保留(测试)字段
Prop_copy(nullable)JobsReturnRACDisposableByReturnIDByIDBlocks jobsReturnedTestBlock;
Prop_copy(nullable)jobsByVoidBlock jobsTestBlock;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIButtonModel *_Nonnull jobsMakeButtonModel(jobsByButtonModelBlock _Nonnull block){
    UIButtonModel *data = UIButtonModel.alloc.init;
    if (block) block(data);
    return data;
}
