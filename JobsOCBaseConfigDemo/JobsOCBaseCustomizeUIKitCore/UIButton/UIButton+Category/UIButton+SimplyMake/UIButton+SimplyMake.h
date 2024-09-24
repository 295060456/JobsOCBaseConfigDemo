//
//  UIButton+SimplyMake.h
//  FM
//
//  Created by User on 9/9/24.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "UIButton+UI.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 对按钮创建方法的二次封装
@interface UIButton (SimplyMake)

@property(nonatomic,copy)jobsByBtnBlock clickBlock;
@property(nonatomic,copy)jobsByBtnBlock longPressGestureBlock;
#pragma mark —— 依靠单一数据进行简单创建
/// 仅仅依靠标题内容（普通文本）进行创建
+(JobsReturnButtonByTitleBlock _Nonnull)initByTitle;
/// 依靠标题内容和字体大小进行创建
+(JobsReturnButtonByTitleAndFontBlock _Nonnull)initByTitle_font;
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorBlock _Nonnull)initByTitle_font_titleCor;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorAndImageBlock _Nonnull)initByTitle_font_titleCor_image;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮背景图片进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorAndImageBlock _Nonnull)initByTitle_font_titleCor_bgImage;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片、按钮背景图片进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorAndImageAndBgImageBlock _Nonnull)initByTitle_font_titleCor_image_bgImage;
/// 仅仅靠按钮图片进行创建
+(JobsReturnButtonByNormalImageBlock _Nonnull)initByNormalImage;
/// 仅仅依靠按钮背景图进行创建
+(JobsReturnButtonByBackgroundImageBlock _Nonnull)initByBackgroundImage;
/// 依靠文字内容、字体大小、文字颜色、按钮图片、图文距离进行创建
+(JobsReturnButtonByStyle1Block _Nonnull)initByStyle1;
/// 图文混排（图片在上边 ）
+(JobsReturnButtonByStyle2Block _Nonnull)initByStyleTop;
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle2Block _Nonnull)initByStyleLeft;
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle2Block _Nonnull)initByStyleBottom;
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle2Block _Nonnull)initByStyleRight;
#pragma mark —— 依靠数据束进行创建
+(instancetype)jobsInit;
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock _Nonnull)initByViewModel;
/// 依靠UIButtonModel进行创建
+(JobsReturnButtonByButtonModelBlock _Nonnull)initByButtonModel;
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock _Nonnull)initByTextModel;
#pragma mark —— 对功能性进行补充
-(JobsReturnButtonByClickBlock _Nonnull)onClick;
-(JobsReturnButtonByClickBlock _Nonnull)onLongPressGesture;
-(JobsReturnButtonByCorBlock _Nonnull)bgColor;
-(JobsReturnButtonByFloatBlock _Nonnull)cornerRadiusValue;

@end

NS_ASSUME_NONNULL_END
/**
 -(BaseButton *)playBtn{
     if(!_playBtn){
         _playBtn = BaseButton.initByTitle_font_titleCor_bgImage(title,
                                                                 nil,
                                                                 JobsBlackColor,
                                                                 JobsIMG(@"弹窗取消按钮背景图"))
         .bgColor(JobsWhiteColor)
         .cornerRadiusValue(buttonModel.cornerRadiusValue)
         .onClick(^(UIButton *btn){
             btn.selected = !btn.selected;
             btn.jobsResetBtnBgImage(btn.selected ? JobsIMG(@"弹窗取消按钮背景图") : JobsIMG(@"弹窗取消按钮背景图"));
             
             btn.jobsResetBtnlayerBorderCor(HEXCOLOR(0xAE8330));/// 重设Btn的描边线段的颜色
             btn.jobsResetBtnlayerBorderWidth(0.5f);/// 重设Btn的描边线段的宽度
             btn.jobsResetBtnCornerRadiusValue(JobsWidth(8));/// 重设Btn的圆切角
             
         }).onLongPressGesture(^(id data){
             NSLog(@"");
         })
         .layerByBorderCor(HEXCOLOR(0xAE8330))
         .layerByBorderWidth(0.5f)
         .cornerCutToCircleWithCornerRadius(JobsWidth(8));
         self.contentView.addSubview(_playBtn);
         [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
             make.center.equalTo(self.contentView);
         }];
     }return _playBtn;
 }
 */
