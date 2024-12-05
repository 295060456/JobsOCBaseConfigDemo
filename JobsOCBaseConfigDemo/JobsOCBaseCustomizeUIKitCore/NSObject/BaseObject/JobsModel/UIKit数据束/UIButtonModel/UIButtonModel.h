//
//  UIButtonModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "BaseButtonProtocol.h"
#import "UIViewModelProtocol.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButtonModel : BaseModel<BaseButtonProtocol,UIViewModelProtocol>
#pragma mark —— <BaseButtonProtocol>
//@property(nonatomic,strong,nullable)UIFont *titleFont;/// 主标题字体
//@property(nonatomic,strong,nullable)UIFont *subTitleFont;///（新Api才有的）副标题字体
//@property(nonatomic,strong,nullable)UIImage *backgroundImage;/// 背景图片
//@property(nonatomic,strong,nullable)UIImage *normalImage;/// 正常情况下的image
#pragma mark —— 对方位
@property(nonatomic,assign)CGFloat btn_x;
@property(nonatomic,assign)CGFloat btn_y;
@property(nonatomic,assign)CGFloat btn_right;
@property(nonatomic,assign)CGFloat btn_bottom;
@property(nonatomic,assign)CGFloat btn_offset_x;
@property(nonatomic,assign)CGFloat btn_offset_y;
@property(nonatomic,assign)CGFloat btn_width;
@property(nonatomic,assign)CGFloat btn_height;
#pragma mark —— #import "UIButton+UI.h" 针对初始化方法的统一配置
@property(nonatomic,strong,nullable)UIButtonConfiguration *btnConfiguration;/// 来自新Api的配置文件。UIButtonConfiguration.filledButtonConfiguration;
@property(nonatomic,strong,nullable)UIBackgroundConfiguration *background;/// 自定义按钮背景的配置
@property(nonatomic,assign)UIButtonConfigurationTitleAlignment buttonConfigTitleAlignment;/// 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
@property(nonatomic,assign)NSTextAlignment textAlignment;/// 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】。也对应新Api里面的title的对齐方式
@property(nonatomic,assign)NSTextAlignment subTextAlignment;/// 也对应新Api里面的subTitle的对齐方式
@property(nonatomic,strong,nullable)UIImage *highlightImage;/// = selected_Image 高亮情况下的image
@property(nonatomic,strong,nullable)NSAttributedString *attributedTitle;/// 主标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
@property(nonatomic,strong,nullable)NSAttributedString *selectedAttributedTitle;///（只限于老Api，新Api里面没有）UIControlStateSelected状态下的标题富文本。设置富文本，请关注：#import "NSObject+RichText.h"
@property(nonatomic,strong,nullable)NSAttributedString *attributedSubtitle;///（新Api才有的）副标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
@property(nonatomic,copy,nullable)NSString *title;/// 主标题
@property(nonatomic,copy,nullable)NSString *subTitle;///（新Api才有的）副标题
@property(nonatomic,strong,nullable)UIColor *titleCor;/// 主标题文字颜色
@property(nonatomic,strong,nullable)UIColor *subTitleCor;/// 副标题文字颜色
@property(nonatomic,assign)UILabelShowingType titleShowingType;/// 主标题的显示方式
@property(nonatomic,assign)UILabelShowingType subTitleShowingType;/// 副标题的显示方式
@property(nonatomic,assign)NSLineBreakMode titleLineBreakMode;/// 主标题换行模式
@property(nonatomic,assign)NSLineBreakMode subtitleLineBreakMode;/// （新Api才有的）副标题换行模式
@property(nonatomic,strong,nullable)UIColor *baseBackgroundColor;/// 背景颜色
@property(nonatomic,assign)CGFloat imagePadding;/// 图像与标题之间的间距
@property(nonatomic,assign)CGFloat titlePadding;/// 标题和副标题标签之间的距离
@property(nonatomic,assign)NSDirectionalRectEdge imagePlacement;/// ❤️图片和文字的位置关系❤️
@property(nonatomic,assign)UIControlContentHorizontalAlignment contentHorizontalAlignment;/// 针对内容的横向对齐方式
@property(nonatomic,assign)UIControlContentVerticalAlignment contentVerticalAlignment;/// 针对内容的竖向对齐方式
@property(nonatomic,assign)NSDirectionalEdgeInsets contentInsets;/// 定位内边距的方向
@property(nonatomic,assign)CGFloat cornerRadiusValue;/// 圆切角—作用于所有的角
@property(nonatomic,assign)UIRectCorner roundingCorners;/// ❤️这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见 圆切角—作用于指定的方位   ❤️这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见
@property(nonatomic,assign)CGSize roundingCornersRadii;/// 圆切角—指定方位的Size大小
@property(nonatomic,strong,nullable)UIColor *layerBorderCor;/// 描边的颜色
@property(nonatomic,assign)CGFloat borderWidth;/// 描边线的宽度
#pragma mark —— 对系统方法的补充
@property(nonatomic,copy,nullable)NSString *selected_title;
@property(nonatomic,copy,nullable)NSString *selected_subTitle;
@property(nonatomic,strong,nullable)UIFont *selected_titleFont;
@property(nonatomic,strong,nullable)UIFont *selected_subTitleFont;
@property(nonatomic,strong,nullable)NSAttributedString *selected_attributedSubtitle;
@property(nonatomic,strong,nullable)UIImage *selected_backgroundImage;
@property(nonatomic,strong,nullable)UIColor *selected_baseBackgroundColor;
@property(nonatomic,strong,nullable)UIColor *selected_titleCor;
@property(nonatomic,strong,nullable)UIColor *selected_subtitleCor;
@property(nonatomic,strong,nullable)UIColor *selected_layerBorderCor;/// 描边的颜色
@property(nonatomic,assign)CGFloat selected_borderWidth;/// 描边线的宽度
#pragma mark —— 针对批量设置的UIButton的数据源
/// 未选择状态的数据源
@property(nonatomic,strong,nullable)NSArray <NSString *>*normal_titles;// title
@property(nonatomic,strong,nullable)NSArray <UIFont *>*normal_titleFonts;// titleFont
@property(nonatomic,strong,nullable)NSArray <UIColor *>*normal_titleCors;// titleCor
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*normal_attributedTitles;// attributedTitle

@property(nonatomic,strong,nullable)NSArray <NSString *>*normal_subTitles;// subTitle
@property(nonatomic,strong,nullable)NSArray <UIFont *>*normal_subTitleFonts;// subTitleFont
@property(nonatomic,strong,nullable)NSArray <UIColor *>*normal_subTitleCors;// subTitleCor
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*normal_attributedSubtitles;// attributedSubtitle

@property(nonatomic,strong,nullable)NSArray <UIColor *>*normal_baseBackgroundColors;// baseBackgroundColor
@property(nonatomic,strong,nullable)NSArray <UIImage *>*normal_backgroundImages;// backgroundImage
@property(nonatomic,strong,nullable)NSArray <UIImage *>*normal_images;// jobsResetBtnImage
@property(nonatomic,strong,nullable)NSArray <NSNumber *>*imagePaddings;// imagePadding 图像与标题之间的间距
/// 已选择状态的数据源
@property(nonatomic,strong,nullable)NSArray <NSString *>*selected_titles;// selected_title
@property(nonatomic,strong,nullable)NSArray <UIFont *>*selected_titleFonts;// selected_titleFont
@property(nonatomic,strong,nullable)NSArray <UIColor *>*selected_titleCors;// selected_titleCor
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*selected_attributedTitles;// selected_attributedSubtitle

@property(nonatomic,strong,nullable)NSArray <NSString *>*selected_subTitles;// selected_subTitle
@property(nonatomic,strong,nullable)NSArray <UIFont *>*selected_subTitleFonts;// selected_subTitleFont
@property(nonatomic,strong,nullable)NSArray <UIColor *>*selected_subTitleCors;// selected_subtitleCor
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*selected_attributedSubtitles;// normal_attributedSubtitles

@property(nonatomic,strong,nullable)NSArray <UIColor *>*selected_baseBackgroundColors;// selected_baseBackgroundColor
@property(nonatomic,strong,nullable)NSArray <UIImage *>*selected_backgroundImages;// selected_backgroundImage
@property(nonatomic,strong,nullable)NSArray <UIImage *>*selected_Images;// highlightImage
@property(nonatomic,strong,nullable)NSArray <NSNumber *>*selected_imagePaddings;// imagePadding 图像与标题之间的间距
#pragma mark —— 按钮挂载的对象
@property(nonatomic,strong,nullable)id data;
@property(nonatomic,strong,nullable)__kindof UIView *view;
#pragma mark —— 点击
@property(nonatomic,assign)BOOL selected;
@property(nonatomic,assign)BOOL enabled;
@property(nonatomic,strong,nullable)UIAction *primaryAction;/// 新Api的点击事件
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock longPressGestureEventBlock;/// 按钮的长按事件
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock clickEventBlock;/// 老Api的点击事件，利用RAC实现
@property(nonatomic,copy,nullable)jobsByBtnBlock onClickBlock;
@property(nonatomic,copy,nullable)jobsByBtnBlock onLongPressGestureEventBlock;
#pragma mark —— UI约束（Masonry）
@property(nonatomic,copy,nullable)jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 其他
@property(nonatomic,assign)CGFloat leftViewWidth;
@property(nonatomic,assign)CGFloat rightViewWidth;
@property(nonatomic,assign)CGFloat titleWidth;
@property(nonatomic,assign)CGFloat subTitleWidth;
#pragma mark —— 保留字段
@property(nonatomic,copy,nullable)JobsReturnRACDisposableByReturnIDByIDBlock jobsReturnedTestBlock;
@property(nonatomic,copy,nullable)jobsByVoidBlock jobsTestBlock;
#pragma mark —— 计时器
@property(nonatomic,strong)NSTimerManager *timerManager;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UIButtonModel *_Nonnull jobsMakeButtonModel(jobsByButtonModelBlock _Nonnull block){
    UIButtonModel *data = UIButtonModel.alloc.init;
    if (block) block(data);
    return data;
}

#ifndef INIT_BUTTON_MODE
#define INIT_BUTTON_MODE \
-(UIButtonModel *)buttonModel{ \
    if(!_buttonModel){ \
        _buttonModel = UIButtonModel.new; \
        _buttonModel.btnConfiguration = nil; \
        _buttonModel.background = nil; \
        _buttonModel.buttonConfigTitleAlignment = UIButtonConfigurationTitleAlignmentAutomatic; \
        _buttonModel.textAlignment = NSTextAlignmentCenter; \
        _buttonModel.subTextAlignment = NSTextAlignmentCenter; \
        _buttonModel.normalImage = nil; \
        _buttonModel.highlightImage = nil; \
        _buttonModel.attributedTitle = nil; \
        _buttonModel.selectedAttributedTitle = nil; \
        _buttonModel.attributedSubtitle = nil; \
        _buttonModel.title = nil; \
        _buttonModel.subTitle = nil; \
        _buttonModel.titleFont = bayonRegular(JobsWidth(16)); \
        _buttonModel.subTitleFont = nil; \
        _buttonModel.titleCor = JobsCor(@"#ABABAB"); \
        _buttonModel.subTitleCor = nil; \
        _buttonModel.titleLineBreakMode = NSLineBreakByWordWrapping; \
        _buttonModel.subtitleLineBreakMode = NSLineBreakByWordWrapping; \
        _buttonModel.baseBackgroundColor = JobsWhiteColor; \
        _buttonModel.backgroundImage = nil; \
        _buttonModel.imagePadding = JobsWidth(0); \
        _buttonModel.titlePadding = JobsWidth(0); \
        _buttonModel.imagePlacement = NSDirectionalRectEdgeNone; \
        _buttonModel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter; \
        _buttonModel.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter; \
        _buttonModel.contentInsets = jobsSameDirectionalEdgeInsets(0); \
        _buttonModel.cornerRadiusValue = JobsWidth(0); \
        _buttonModel.roundingCorners = UIRectCornerAllCorners; \
        _buttonModel.roundingCornersRadii = CGSizeZero; \
        _buttonModel.layerBorderCor = nil; \
        _buttonModel.borderWidth = JobsWidth(0); \
        _buttonModel.primaryAction = nil; \
        _buttonModel.longPressGestureEventBlock = nil; \
        _buttonModel.clickEventBlock = nil; \
    }return _buttonModel; \
}
#endif /**INIT_BUTTON_MODE**/
