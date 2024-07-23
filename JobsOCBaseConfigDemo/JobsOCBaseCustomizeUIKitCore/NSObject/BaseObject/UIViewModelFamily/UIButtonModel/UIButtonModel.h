//
//  UIButtonModel.h
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "BaseButtonProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButtonModel : BaseModel<BaseButtonProtocol>
#pragma mark —— #import "UIButton+UI.h" 针对初始化方法的统一配置
@property(nonatomic,strong,nullable)UIButtonConfiguration *btnConfiguration;
@property(nonatomic,strong,nullable)UIBackgroundConfiguration *background;
@property(nonatomic,assign)UIButtonConfigurationTitleAlignment buttonConfigTitleAlignment;
@property(nonatomic,assign)NSTextAlignment textAlignment;
@property(nonatomic,assign)NSTextAlignment subTextAlignment;
@property(nonatomic,strong,nullable)UIImage *normalImage;
@property(nonatomic,strong,nullable)UIImage *highlightImage;
@property(nonatomic,strong,nullable)NSAttributedString *attributedTitle;
@property(nonatomic,strong,nullable)NSAttributedString *selectedAttributedTitle;
@property(nonatomic,strong,nullable)NSAttributedString *attributedSubtitle;
@property(nonatomic,copy,nullable)NSString *title;
@property(nonatomic,copy,nullable)NSString *subTitle;
@property(nonatomic,strong,nullable)UIFont *titleFont;
@property(nonatomic,strong,nullable)UIFont *subTitleFont;
@property(nonatomic,strong,nullable)UIColor *titleCor;
@property(nonatomic,strong,nullable)UIColor *subTitleCor;
@property(nonatomic,assign)NSLineBreakMode titleLineBreakMode;
@property(nonatomic,assign)NSLineBreakMode subtitleLineBreakMode;
@property(nonatomic,strong,nullable)UIColor *baseBackgroundColor;
@property(nonatomic,strong,nullable)UIImage *backgroundImage;
@property(nonatomic,assign)CGFloat imagePadding;
@property(nonatomic,assign)CGFloat titlePadding;
@property(nonatomic,assign)NSDirectionalRectEdge imagePlacement;
@property(nonatomic,assign)UIControlContentHorizontalAlignment contentHorizontalAlignment;
@property(nonatomic,assign)UIControlContentVerticalAlignment contentVerticalAlignment;
@property(nonatomic,assign)NSDirectionalEdgeInsets contentInsets;
@property(nonatomic,assign)CGFloat cornerRadiusValue;
@property(nonatomic,assign)UIRectCorner roundingCorners;
@property(nonatomic,assign)CGSize roundingCornersRadii;
@property(nonatomic,strong,nullable)UIColor *layerBorderCor;
@property(nonatomic,assign)CGFloat borderWidth;
@property(nonatomic,strong,nullable)UIAction *primaryAction;
@property(nonatomic,copy,nullable)JobsSelectorBlock longPressGestureEventBlock;
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock clickEventBlock;
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
#pragma mark —— 针对批量设置的UIButton的数据源
/// 未选择状态的数据源
@property(nonatomic,strong,nullable)NSArray <NSString *>*normal_titles;
@property(nonatomic,strong,nullable)NSArray <UIFont *>*normal_titleFonts;
@property(nonatomic,strong,nullable)NSArray <UIColor *>*normal_titleCors;
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*normal_attributedTitles;

@property(nonatomic,strong,nullable)NSArray <NSString *>*normal_subTitles;
@property(nonatomic,strong,nullable)NSArray <UIFont *>*normal_subTitleFonts;
@property(nonatomic,strong,nullable)NSArray <UIColor *>*normal_subTitleCors;
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*normal_attributedSubtitles;

@property(nonatomic,strong,nullable)NSArray <UIColor *>*normal_baseBackgroundColors;
@property(nonatomic,strong,nullable)NSArray <UIImage *>*normal_backgroundImages;
@property(nonatomic,strong,nullable)NSArray <UIImage *>*normal_images;
/// 已选择状态的数据源
@property(nonatomic,strong,nullable)NSArray <NSString *>*selected_titles;
@property(nonatomic,strong,nullable)NSArray <UIFont *>*selected_titleFonts;
@property(nonatomic,strong,nullable)NSArray <UIColor *>*selected_titleCors;
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*selected_attributedTitles;

@property(nonatomic,strong,nullable)NSArray <NSString *>*selected_subTitles;
@property(nonatomic,strong,nullable)NSArray <UIFont *>*selected_subTitleFonts;
@property(nonatomic,strong,nullable)NSArray <UIColor *>*selected_subTitleCors;
@property(nonatomic,strong,nullable)NSArray <NSAttributedString *>*selected_attributedSubtitles;

@property(nonatomic,strong,nullable)NSArray <UIColor *>*selected_baseBackgroundColors;
@property(nonatomic,strong,nullable)NSArray <UIImage *>*selected_backgroundImages;
@property(nonatomic,strong,nullable)NSArray <UIImage *>*selected_Images;
#pragma mark —— 按钮挂载的对象
@property(nonatomic,strong,nullable)id data;

@end

NS_ASSUME_NONNULL_END

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
