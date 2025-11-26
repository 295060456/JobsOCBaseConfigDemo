//
//  UIButton+UI.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsMakes.h"
#import "MacroDef_Strong@Weak.h"
#import "MacroDef_Cor.h"
#import "BaseProtocol.h"
#import "BaseButtonProtocol.h"
#import "JobsSEL_IMP.h"
#import "NSObject+DynamicInvoke.h"
#import "NSObject+NSMutableParagraphStyle.h"
#import "UIView+Extras.h"
#import "UIView+Gesture.h"
#import "UIButton+ImageTitleSpacing.h"
#import "UIButton+UIButtonConfiguration.h"
#import "UIButton+TextView.h"
#import "UIButton+UIControlState.h"
#import "UIButtonConfiguration+Extra.h"

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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
@interface UIButton (UI)<BaseButtonProtocol,BaseProtocol>
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
///   - backgroundhighlightImage:背景图片（高亮）
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
///   - selected:选中状态
///   - primaryAction: 新Api的点击事件
///   - longPressGestureEventBlock: 按钮的长按事件
///   - clickEventBlock: 老Api的点击事件，利用RAC实现
///   如果同时设置 clickEventBlock 和 primaryAction，会优先响应新的Api，再响应老的Api
-(__kindof UIButton *)jobsInitBtnByConfiguration:(UIButtonConfiguration *_Nullable)btnConfiguration
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
                        highlightBackgroundImage:(UIImage *_Nullable)highlightBackgroundImage
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
                                        selected:(BOOL)selected
                                   primaryAction:(UIAction *_Nullable)primaryAction
                      longPressGestureEventBlock:(JobsRetIDByIDBlock _Nullable)longPressGestureEventBlock
                                 clickEventBlock:(JobsRetIDByIDBlock _Nullable)clickEventBlock;
/// @property (nonatomic, readwrite, assign) UIButtonConfigurationSize buttonSize; 这个属性，不是我们想要的UIFont。设置UIFont必须在富文本里面进行设置
-(UIConfigurationTextAttributesTransformer)jobsSetConfigTextAttributesTransformerByTitleFont:(UIFont *_Nullable)titleFont
                                                                                 btnTitleCor:(UIColor *_Nullable)titleCor;
/// 通过 Transformer 得到 字体
-(JobsRetFontByConfigurationTextAttributesTransformerBlock _Nonnull)getTitleFontByTransformer;
/// 通过 Transformer 得到 文字颜色
-(JobsRetCorByConfigTextAttributesTransformerBlock _Nonnull)getTitleColorByTransformer;
/// RAC 点击事件2次封装
-(RACDisposable *)jobsBtnClickEventBlock:(JobsRetIDByIDBlock _Nullable)subscribeNextBlock;
-(JobsReturnRACDisposableByReturnIDByIDBlocks _Nonnull)jobsBtnClickEventByBlock;
/// 设置按钮的长按手势
-(void)jobsBtnLongPressGestureEventBlock:(JobsRetIDByIDBlock _Nullable)longPressGestureEventBlock;
-(jobsByRetIDByIDBlocks _Nonnull)jobsBtnLongPressGestureEventByBlock;
/// 方法名字符串（带参数、参数之间用"："隔开）、作用对象、参数
-(JobsRetIDByThreeIDBlock _Nonnull)btnClickActionWithParamarrays;
/// 方法名字符串（不带参数）、作用对象
-(JobsRetIDByTwoIDBlock _Nonnull)btnClickActionWithMethodName;
/// 代码触发点击调用
-(jobsByVoidBlock _Nonnull)actionByCode;
/// UIButton 上的 image 旋转一定的角度angle
-(void)changeAction:(CGFloat)angle;
/// 当Button不可用的时候，需要做些什么
-(jobsByBOOLBlock _Nonnull)enabledBlock;
#pragma mark —— 一些通用修改（Api已做向下兼容）
/// 主标题是否多行显示
-(jobsByBOOLBlock _Nonnull)makeNewLineShows;
#pragma mark —— 一些通用修改.主标题（Api已做向下兼容）
///【兼容】重设Btn主标题的文字内容 优先级高于jobsResetTitle
-(JobsRetBtnByStringBlock _Nonnull)jobsResetBtnTitle;
///【兼容】重设Btn主标题的文字颜色
-(JobsRetBtnByCorBlock _Nonnull)jobsResetBtnTitleCor;
///【兼容】重设Btn的主标题字体
-(JobsRetBtnByFontBlock _Nonnull)jobsResetBtnTitleFont;
///【兼容】重设Btn的主标题对其方式
-(JobsRetBtnByNSIntegerBlock _Nonnull)jobsResetBtnTitleAlignment;
#pragma mark —— 一些通用修改.副标题
///【最新的Api】重设Btn副标题的文字内容
-(JobsRetBtnByStringBlock _Nonnull)jobsResetBtnSubTitle API_AVAILABLE(ios(16.0));
///【最新的Api】重设Btn副标题的文字颜色
-(JobsRetBtnByCorBlock _Nonnull)jobsResetBtnSubTitleCor API_AVAILABLE(ios(16.0));
///【兼容】重设Btn的副标题字体
-(JobsRetBtnByFontBlock _Nonnull)jobsResetBtnSubTitleFont API_AVAILABLE(ios(16.0));
#pragma mark —— 一些通用修改.按钮图片
///【兼容】重设Btn.Image
-(JobsRetBtnByImageBlock _Nonnull)jobsResetBtnImage;
#pragma mark —— 一些通用修改.按钮背景图片
///【兼容】重设Btn的背景图片
-(JobsRetBtnByImageBlock _Nonnull)jobsResetBtnBgImage;
#pragma mark —— 一些通用修改.按钮颜色
///【兼容】重设Btn的背景颜色
-(JobsRetBtnByCorBlock _Nonnull)jobsResetBtnBgCor;
#pragma mark —— 一些通用修改.Layer
///【合并】统一设置按钮Layer的线宽+颜色+圆切角
-(JobsReturnViewByLocationModelBlock _Nonnull)jobsResetBtnLayerBy;
///【兼容】重设Btn的圆切角
-(JobsRetBtnByCGFloatBlock _Nonnull)jobsResetBtnCornerRadiusValue;
///【兼容】重设Btn的描边线段的颜色
-(JobsRetBtnByCorBlock _Nonnull)jobsResetBtnLayerBorderCor;
///【兼容】重设Btn的描边线段的宽度
-(JobsRetBtnByCGFloatBlock _Nonnull)jobsResetBtnLayerBorderWidth;
#pragma mark —— 一些通用修改.富文本
///【兼容】重设Btn主标题富文本
-(JobsRetBtnByAttributedStringBlock _Nonnull)jobsResetBtnNormalAttributedTitle;
///【兼容】重设Btn副标题富文本
-(JobsRetBtnByAttributedStringBlock _Nonnull)jobsResetBtnNormalAttributedSubTitle;
/// 用 UITextView 替换 UIButton.titleLabel
-(JobsRetBtnByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedTitle;
/// 用 UITextView 替换 UIButton.subtitleLabel
-(JobsRetBtnByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedSubTitle;
#pragma mark —— 一些通用修改.间距
///【兼容】重设Btn的图文间距和相对位置
-(JobsRetBtnByImagePlacementAndPaddingBlock _Nonnull)jobsResetImagePlacement_Padding API_AVAILABLE(ios(16.0));
///【兼容】获取按钮图片（普通状态下）
-(UIImage *_Nullable)imageForNormalState;
///【兼容】获取按钮背景图片（普通状态下）
-(UIImage *_Nullable)backgroundImageForNormalState;
///【兼容】获取按钮富文本字符串内容
-(NSString *_Nullable)titleForConfigurationAttributedText;
///【兼容】获取按钮富文本内容（更通用）
-(NSAttributedString *_Nullable)titleForConfigurationAttributed;
///【兼容】获取按钮富文本内容（普通状态下）
-(NSAttributedString *_Nullable)attributedTitleForNormalState;
///【兼容】获取按钮主文字内容
-(NSString *_Nullable)titleForNormalState;
///【兼容】获取按钮主文字颜色
-(UIColor *_Nullable)titleColorForNormalState;

@end
#pragma clang diagnostic pop
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
     .bgColorBy(JobsWhiteColor)
     .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
     .jobsResetImagePadding(1)
     .jobsResetBtnImage(@"APPLY NOW".img))
     .jobsResetBtnBgImage(@"APPLY NOW".img)
     .jobsResetBtnTitleCor(JobsWhiteColor)
     .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
     .jobsResetBtnTitle(@"APPLY NOW".tr)
     .onClickBy(^(UIButton *x){
         JobsLog(@"");
     }).onLongPressGestureBy(^(id data){
         JobsLog(@"");
     });
 
 _headBtn = BaseButton.jobsInit()
    .imageURL(@"".jobsUrl)
    .placeholderImage(@"用户默认头像".img))
    .options(SDWebImageRefreshCached)/// 强制刷新缓存
    .completed(^(UIImage * _Nullable image,
                 NSError * _Nullable error,
                 SDImageCacheType cacheType,
                 NSURL * _Nullable imageURL) {
        if (error) {
            JobsLog(@"图片加载失败: %@-%@", error,imageURL);
        } else {
            JobsLog(@"图片加载成功");
        }
    }).onClickBy(^(UIButton *x){
        @jobs_strongify(self)
        if (self.objBlock) self.objBlock(x);
    }).onLongPressGestureBy(^(id data){
    JobsLog(@"");
 }).bgNormalLoad();
 
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         @jobs_weakify(self)
         _applyNowBtn = BaseButton.initByAttributedString(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = @"#666666".cor;
                 data1.targetString = self.richTextMutArr[0];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = @"#BA9B77".cor;
                 data1.targetString = self.richTextMutArr[1];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = @"#666666".cor;
                 data1.targetString = self.richTextMutArr[2];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
         }))).bgColorBy(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"APPLY NOW".img))
             .jobsResetBtnBgImage(@"APPLY NOW".img))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(@"APPLY NOW".tr)
             .onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 if (self.objBlock) self.objBlock(x);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             });
     }return _applyNowBtn;
 }
 
 */
