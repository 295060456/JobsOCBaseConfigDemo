//
//  UIButton+UI.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Strong@Weak.h"
#import "JobsBlock.h"
#import "MacroDef_Cor.h"
#import "BaseButtonProtocol.h"
#import "UIView+Extras.h"
#import "UIView+Gesture.h"
#import "NSObject+DynamicInvoke.h"
#import "JobsSEL_IMP.h"
#import "NSObject+NSMutableParagraphStyle.h"
#import "UIButton+ImageTitleSpacing.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 NSLineBreakByWordWrapping：这是默认的换行模式，会在单词边界换行。适用于希望保留单词完整性的场合。例如，如果单词太长而无法放入当前行，那么该单词将移动到下一行。
 NSLineBreakByCharWrapping：在字符边界处换行，而不是单词边界。适用于需要最大限度地利用行宽的场合，即使这意味着单词会被拆分。
 */
#warning 富文本兼容一切
/// ⚠️当font描绘的文字,或者文字大于UIButton的frame,UIButton的Title将不会显现⚠️
@interface UIButton (UI)<BaseProtocol,BaseButtonProtocol>
#pragma mark —— 一些功能性
/// 为了兼容新的Api，批量设定UIButton
/// 新Api较老的Api，增加了subTitle
/// 资料来源：https://www.jianshu.com/p/12426709420e
/// - Parameters:
///   - btnConfiguration: 来自新Api的配置文件。UIButtonConfiguration.filledButtonConfiguration;
///   - background: 自定义按钮背景的配置
///   - buttonConfigTitleAlignment: 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
///   - textAlignment: 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】。也对应新Api里面的title的对齐方式
///   - subTextAlignment:也对应新Api里面的subTitle的对齐方式
///   - normalImage: 正常情况下的image
///   - highlightImage: 高亮情况下的image
///   - attributedTitle: 主标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
///   - selectedAttributedTitle:（只限于老Api，新Api里面没有）UIControlStateSelected状态下的标题富文本。设置富文本，请关注：#import "NSObject+RichText.h"
///   - attributedSubtitle:（新Api才有的）副标题的富文本（优先级高于普通文本）。设置富文本，请关注：#import "NSObject+RichText.h"
///   - title: 主标题
///   - subTitle:（新Api才有的）副标题
///   - titleFont: 主标题字体
///   - subTitleFont:（新Api才有的）副标题字体
///   - titleCor: 主标题文字颜色
///   - subTitleCor: 副标题文字颜色
///   - titleLineBreakMode: 主标题换行模式
///   - subtitleLineBreakMode:（新Api才有的）副标题换行模式
///   - baseBackgroundColor: 背景颜色
///   - backgroundImage:背景图片
///   - imagePadding: ❤️图像与标题之间的间距❤️
///   - titlePadding: 标题和副标题标签之间的距离
///   - imagePlacement: ❤️图片和文字的位置关系❤️
///   - contentHorizontalAlignment: 针对内容的横向对齐方式
///   - contentVerticalAlignment: 针对内容的竖向对齐方式
///   - contentInsets: 定位内边距的方向
///   - cornerRadiusValue: 圆切角—作用于所有的角
///   - roundingCorners: 圆切角—作用于指定的方位   ❤️这个属性如果不是UIRectCornerAllCorners，在某些情况下，按钮会不可见
///   - roundingCornersRadii: 圆切角—指定方位的Size大小
///   - layerBorderCor: 描边的颜色
///   - borderWidth: 描边线的宽度
///   - primaryAction: 新Api的点击事件
///   - longPressGestureEventBlock: 按钮的长按事件
///   - clickEventBlock: 老Api的点击事件，利用RAC实现
///   如果同时设置 clickEventBlock 和 primaryAction，会优先响应新的Api，再响应老的Api
-(instancetype)jobsInitBtnByConfiguration:(UIButtonConfiguration *_Nullable)btnConfiguration
                               background:(UIBackgroundConfiguration *_Nullable)background
               buttonConfigTitleAlignment:(UIButtonConfigurationTitleAlignment)buttonConfigTitleAlignment/// 针对文本的对齐方式 UIButtonConfiguration.titleAlignment 【新Api】
                            textAlignment:(NSTextAlignment)textAlignment/// 针对文本的对齐方式 UIButton.titleLabel.titleAlignment【老Api】
                         subTextAlignment:(NSTextAlignment)subTextAlignment
                              normalImage:(UIImage *_Nullable)normalImage
                           highlightImage:(UIImage *_Nullable)highlightImage
                          attributedTitle:(NSAttributedString *_Nullable)attributedTitle
                  selectedAttributedTitle:(NSAttributedString *_Nullable)selectedAttributedTitle
                       attributedSubtitle:(NSAttributedString *_Nullable)attributedSubtitle
                                    title:(NSString *_Nullable)title
                                 subTitle:(NSString *_Nullable)subTitle
                                titleFont:(UIFont *_Nullable)titleFont
                             subTitleFont:(UIFont *_Nullable)subTitleFont
                                 titleCor:(UIColor *_Nullable)titleCor
                              subTitleCor:(UIColor *_Nullable)subTitleCor
                       titleLineBreakMode:(NSLineBreakMode)titleLineBreakMode/// 对应老Api中的：UIButton.lineBreakMode
                    subtitleLineBreakMode:(NSLineBreakMode)subtitleLineBreakMode
                      baseBackgroundColor:(UIColor *_Nullable)baseBackgroundColor
                          backgroundImage:(UIImage *_Nullable)backgroundImage
                             imagePadding:(CGFloat)imagePadding
                             titlePadding:(CGFloat)titlePadding
                           imagePlacement:(NSDirectionalRectEdge)imagePlacement/// 定义图文关系
               contentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment /// 针对内容
                 contentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment /// 针对内容
                            contentInsets:(NSDirectionalEdgeInsets)contentInsets/// 对应老Api中的：UIButton.contentEdgeInsets
                        cornerRadiusValue:(CGFloat)cornerRadiusValue
                          roundingCorners:(UIRectCorner)roundingCorners
                     roundingCornersRadii:(CGSize)roundingCornersRadii
                           layerBorderCor:(UIColor *_Nullable)layerBorderCor
                              borderWidth:(CGFloat)borderWidth
                            primaryAction:(UIAction *_Nullable)primaryAction
               longPressGestureEventBlock:(JobsReturnIDBySelectorBlock _Nullable)longPressGestureEventBlock
                          clickEventBlock:(JobsReturnIDByIDBlock _Nullable)clickEventBlock;
/// UIButtonConfiguration 创建的UIbutton修改字体以及颜色的方法
/// 注意⚠️因为UIConfigurationTextAttributesTransformer是没有办法直接获取到里面的字体的，只能从外面生成以后直接赋值，也就是每次修改需要给一个完整的UIConfigurationTextAttributesTransformer对象进UIButtonConfiguration
-(void)jobsSetBtnTitleFont:(UIFont *_Nullable)titleFont
               btnTitleCor:(UIColor *_Nullable)titleCor;

-(void)jobsSetBtnSubTitleFont:(UIFont *_Nullable)subTitleFont
               btnSubTitleCor:(UIColor *_Nullable)subTitleCor;
/// @property (nonatomic, readwrite, assign) UIButtonConfigurationSize buttonSize; 这个属性，不是我们想要的UIFont。设置UIFont必须在富文本里面进行设置
-(UIConfigurationTextAttributesTransformer)jobsSetConfigTextAttributesTransformerByTitleFont:(UIFont *_Nullable)titleFont
                                                                                 btnTitleCor:(UIColor *_Nullable)titleCor;
/// 通过 Transformer 得到 字体
-(JobsReturnFontByConfigurationTextAttributesTransformerBlock _Nonnull)getTitleFontFromTransformer;
/// 通过 Transformer 得到 文字颜色
-(JobsReturnColorByConfigurationTextAttributesTransformerBlock _Nonnull)getTitleColorFromTransformer;
/// RAC 点击事件2次封装
-(RACDisposable *)jobsBtnClickEventBlock:(JobsReturnIDByIDBlock _Nullable)subscribeNextBlock;
/// 设置按钮的长按手势
-(void)jobsBtnLongPressGestureEventBlock:(JobsReturnIDBySelectorBlock _Nullable)longPressGestureEventBlock;
/// 方法名字符串（带参数、参数之间用"："隔开）、作用对象、参数
-(JobsReturnIDByThreeIDBlock _Nonnull)btnClickActionWithParamarrays;
/// 方法名字符串（不带参数）、作用对象
-(JobsReturnIDByTwoIDBlock _Nonnull)btnClickActionWithMethodName;
/// 代码触发点击调用
-(jobsByVoidBlock _Nonnull)actionByCode;
/// UIButton 上的 image 旋转一定的角度angle
-(void)changeAction:(CGFloat)angle;
/// 当Button不可用的时候，需要做些什么
-(jobsByBOOLBlock _Nonnull)enabledBlock;
/// 重设UIButtonConfiguration并使之生效  JobsReturnButtonConfigurationByButtonConfigurationBlock
-(__kindof UIButton *)jobsUpdateButtonConfiguration:(jobsByButtonConfigurationBlock _Nullable)configurationBlock;
-(UIButtonConfiguration *)JobsUpdateButtonConfiguration:(jobsByButtonConfigurationBlock _Nullable)configurationBlock;
#pragma mark —— 一些通用修改.主标题（Api已做向下兼容）
/// 主标题是否多行显示
-(jobsByBOOLBlock _Nonnull)makeNewLineShows;
///【兼容】重设Btn主标题的文字内容 优先级高于jobsResetTitle
-(JobsReturnButtonByTitleBlock _Nonnull)jobsResetBtnTitle;
///【兼容】重设Btn主标题的文字颜色
-(JobsReturnButtonByCorBlock _Nonnull)jobsResetBtnTitleCor;
///【兼容】重设Btn的主标题字体
-(JobsReturnButtonByFontBlock _Nonnull)jobsResetBtnTitleFont;
///【兼容】重设Btn的主标题对其方式
-(JobsReturnButtonByNSIntegerBlock _Nonnull)jobsResetBtnTitleAlignment;
#pragma mark —— 一些通用修改.副标题
///【最新的Api】重设Btn副标题的文字内容
-(JobsReturnButtonByTitleBlock _Nonnull)jobsResetBtnSubTitle API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn副标题的文字颜色
-(JobsReturnButtonByCorBlock _Nonnull)jobsResetBtnSubTitleCor API_AVAILABLE(ios(16.0));
///【兼容】重设Btn的副标题字体
-(JobsReturnButtonByFontBlock _Nonnull)jobsResetBtnSubTitleFont;
///【最新的Api】修改副标题的对齐方式
-(JobsReturnButtonByTextAlignmentBlock _Nonnull)jobsResetSubTitleTextAlignment API_AVAILABLE(ios(16.0));
#pragma mark —— 一些通用修改.按钮图片
///【兼容】重设Btn.Image
-(JobsReturnButtonByImageBlock _Nonnull)jobsResetBtnImage;
#pragma mark —— 一些通用修改.按钮背景图片
///【兼容】重设Btn的背景图片
-(JobsReturnButtonByImageBlock _Nonnull)jobsResetBtnBgImage;
#pragma mark —— 一些通用修改.按钮颜色
///【兼容】重设Btn的背景颜色
-(JobsReturnButtonByCorBlock _Nonnull)jobsResetBtnBgCor;
#pragma mark —— 一些通用修改.Layer
///【合并】重设Btn的描边：线宽和线段的颜色
-(JobsReturnButtonByColor_FloatBlock _Nonnull)jobsResetBtnLayerBorderCorAndWidth;
///【兼容】重设Btn的圆切角
-(JobsReturnButtonByCGFloatBlock _Nonnull)jobsResetBtnCornerRadiusValue;
///【兼容】重设Btn的描边线段的颜色
-(JobsReturnButtonByColorBlock _Nonnull)jobsResetBtnLayerBorderCor;
///【兼容】重设Btn的描边线段的宽度
-(JobsReturnButtonByCGFloatBlock _Nonnull)jobsResetBtnLayerBorderWidth;
#pragma mark —— 一些通用修改.富文本
///【兼容】重设Btn富文本
-(JobsReturnButtonByAttributedStringBlock _Nonnull)jobsResetBtnNormalAttributedTitle;
#pragma mark —— 一些通用修改.间距
///【兼容】重设Btn的图文间距和相对位置
-(JobsReturnButtonByImagePlacementAndPaddingBlock _Nonnull)jobsResetImagePlacement_Padding API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn的图文相对位置
-(JobsReturnButtonByImagePlacementBlock _Nonnull)jobsResetImagePlacement API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn的图文间距
-(JobsReturnButtonByImagePlacementBlock _Nonnull)jobsResetImagePadding API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn主标题与副标题之间的距离
-(JobsReturnButtonByCGFloatBlock _Nonnull)jobsResetTitlePadding API_AVAILABLE(ios(16.0));
#pragma mark —— UIButton.带状态 set
///【老Api】设置 Btn 已选择状态下的 按钮图片
-(JobsReturnButtonByImageBlock _Nonnull)selectedImage;
///【老Api】设置 Btn 已选择状态下的 按钮背景图片
-(JobsReturnButtonByImageBlock _Nonnull)selectedBackgroundImage;
///【老Api】设置 Btn 已选择状态下的 按钮主标题
-(JobsReturnButtonByTitleBlock _Nonnull)selectedTitle;
///【老Api】设置 Btn 已选择状态下的 按钮主标题的颜色
-(JobsReturnButtonByColorBlock _Nonnull)selectedTitleColor;
///【老Api】设置 Btn 已选择状态下的 按钮主标题的富文本内容
-(JobsReturnButtonByAttributedStringBlock _Nonnull)selectedAttributedTitle;
/**
 1、一一对应UIButtonConfiguration.h文件里面的属性
 2、只有通过UIButtonConfiguration创建的UIButton，这个UIbutton的configuration属性才不为空
 3、要修改通过UIButtonConfiguration创建的UIButton的各属性值，只有通过下列方式方可以
 */
#pragma mark —— 【最新的Api】UIButton.configuration的各项属性值的修改
-(JobsReturnButtonByTitleAlignmentBlock _Nonnull)jobsResetTitleAlignment API_AVAILABLE(ios(16.0));
-(JobsReturnButtonByBOOLBlock _Nonnull)jobsResetAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBackgroundBlock _Nonnull)jobsResetBackground API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetBackgroundImage API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByCornerStyleBlock _Nonnull)jobsResetCornerStyle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySizeBlock _Nonnull)jobsResetButtonSize API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByMacIdiomStyleBlock _Nonnull)jobsResetMacIdiomStyle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBaseBackgroundColorBlock _Nonnull)jobsResetBaseBackgroundColor API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByImageBlock _Nonnull)jobsResetImage API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByImageColorTransformerBlock _Nonnull)jobsResetImageColorTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock _Nonnull)jobsResetPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByShowsActivityIndicatorBlock _Nonnull)jobsResetShowsActivityIndicator API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock _Nonnull)jobsResetActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetTitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleBlock _Nonnull)jobsResetSubTitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByAttributedTitleBlock _Nonnull)jobsResetAttributedTitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock _Nonnull)jobsResetTitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetTitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)jobsResetSubTitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySubtitleBlock _Nonnull)jobsResetSubtitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByAttributedSubtitleBlock _Nonnull)jobsResetAttributedSubtitle API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock _Nonnull)jobsResetSubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock _Nonnull)jobsResetSubtitleLineBreakMode API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByIndicatorBlock _Nonnull)jobsResetIndicator API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByIndicatorColorTransformerBlock _Nonnull)jobsResetIndicatorColorTransformer API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByContentInsetsBlock _Nonnull)jobsResetContentInsets API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetTitleBaseForegroundColor API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)jobsResetSubTitleBaseForegroundColor API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByFontBlock _Nonnull)jobsResetTitleFont API_AVAILABLE(ios(16.0));
-(JobsReturnButtonConfigurationByFontBlock _Nonnull)jobsResetSubTitleFont API_AVAILABLE(ios(16.0));
#pragma mark —— UIButton.UIControlStateNormal.get
///【兼容】获取按钮图片（普通状态下）
-(nullable UIImage *)imageForNormalState;
///【兼容】获取按钮背景图片（普通状态下）
-(nullable UIImage *)backgroundImageForNormalState;
///【兼容】获取按钮富文本字符串内容
-(nullable NSString *)titleForConfigurationAttributedText;
///【兼容】获取按钮富文本内容（更通用）
-(nullable NSAttributedString *)titleForConfigurationAttributed;
///【兼容】获取按钮富文本内容（普通状态下）
-(nullable NSAttributedString *)attributedTitleForNormalState;
///【兼容】获取按钮主文字内容
-(nullable NSString *)titleForNormalState;
///【兼容】获取按钮主文字颜色
-(nullable UIColor *)titleColorForNormalState;
#pragma mark —— UIButton.带状态的 get
/// 获取 Btn 已选择状态下的按钮图片
-(nullable UIImage *)imageForSelectedState;
/// 获取 Btn 已选择状态下的背景图片
-(nullable UIImage *)backgroundImageForSelectedState;
/// 获取 Btn 已选择状态下的 主标题的文本内容
-(nullable NSString *)titleForSelectedState;
/// 获取 Btn 已选择状态下的 主标题的文本颜色
-(nullable UIColor *)titleColorForSelectedState;
/// 获取 Btn 已选择状态下的 主标题的富文本内容
-(nullable NSAttributedString *)attributedTitleForSelectedState;

@end

NS_ASSUME_NONNULL_END
/**
 UIControlContentHorizontalAlignment 是一个枚举类型，用于定义控件中内容（例如文字或图像）在水平方向上的对齐方式。
 这个枚举通常用于控制UIButton等UI控件中内容的水平对齐方式。

 以下是UIControlContentHorizontalAlignment枚举的常见值和它们的含义：
 UIControlContentHorizontalAlignmentLeft：内容水平左对齐。
 UIControlContentHorizontalAlignmentCenter：内容水平居中对齐。
 UIControlContentHorizontalAlignmentRight：内容水平右对齐。
 UIControlContentHorizontalAlignmentFill：内容水平填充整个控件的宽度，通常用于将内容拉伸以填满整个控件。

 这些对齐方式可用于控制按钮内部文本和图像在按钮内的水平位置。
 例如，你可以将按钮的内容水平居中对齐，以确保文本或图像在按钮的中心位置。
 
 调用示例：
 UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
 // 设置内容水平居中对齐
 button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
 */

/**
 
 BaseButton.jobsInit()
     .bgColor(JobsWhiteColor)
     .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
     .jobsResetImagePadding(1)
     .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
     .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
     .jobsResetBtnTitleCor(JobsWhiteColor)
     .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
     .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
     .onClick(^(UIButton *x){
         NSLog(@"");
     }).onLongPressGesture(^(id data){
         NSLog(@"");
     });
 
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         @jobs_weakify(self)
         _applyNowBtn = BaseButton.initByAttributedString(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[0];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#BA9B77");
                 data1.targetString = self.richTextMutArr[1];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[2];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
         }))).bgColor(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClick(^(UIButton *x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 if (self.objectBlock) self.objectBlock(x);
             }).onLongPressGesture(^(id data){
                 NSLog(@"");
             });
     }return _applyNowBtn;
 }
 
 */
