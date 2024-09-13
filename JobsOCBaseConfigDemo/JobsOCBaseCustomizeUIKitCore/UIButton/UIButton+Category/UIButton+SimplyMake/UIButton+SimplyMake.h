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
+(JobsReturnButtonByTitleBlock)initByTitle;
/// 依靠标题内容和字体大小进行创建
+(JobsReturnButtonByTitleAndFontBlock)initByTitle_font;
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorBlock)initByTitle_font_titleCor;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorAndImageBlock)initByTitle_font_titleCor_image;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮背景图片进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorAndImageBlock)initByTitle_font_titleCor_bgImage;
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片、按钮背景图片进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorAndImageAndBgImageBlock)initByTitle_font_titleCor_image_bgImage;
/// 仅仅靠按钮图片进行创建
+(JobsReturnButtonByNormalImageBlock)initByNormalImage;
/// 仅仅依靠按钮背景图进行创建
+(JobsReturnButtonByBackgroundImageBlock)initByBackgroundImage;
/// 依靠文字内容、字体大小、文字颜色、按钮图片、图文距离进行创建
+(JobsReturnButtonByStyle1Block)initByStyle1;
/// 图文混排（图片在上边 ）
+(JobsReturnButtonByStyle2Block)initByStyleTop;
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle2Block)initByStyleLeft;
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle2Block)initByStyleBottom;
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle2Block)initByStyleRight;
#pragma mark —— 依靠数据束进行创建
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock)initByViewModel;
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock)initByTextModel;
#pragma mark —— 对功能性进行补充
-(JobsReturnButtonByClickBlock)onClick;
-(JobsReturnButtonByClickBlock)onLongPressGesture;
-(JobsReturnButtonByCorBlock)bgColor;
-(JobsReturnButtonByFloatBlock)cornerRadiusValue;

@end

NS_ASSUME_NONNULL_END
/**
 -(BaseButton *)playBtn{
     if(!_playBtn){
         _playBtn = BaseButton.initByNormalImage(JobsIMG(@"play"))
             .bgColor(JobsWhiteColor)
             .cornerRadiusValue(JobsWidth(8))
             .onClick(^(UIButton *btn){
                 NSLog(@"");
             }).onLongPressGesture(^(id data){
                 NSLog(@"");
             });
         self.contentView.addSubview(_playBtn);
         [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
             make.center.equalTo(self.contentView);
         }];
     }return _playBtn;
 }
 */

/**
 BaseButton *btn = BaseButton
     .initByTitle_font_titleCor(buttonModel.title,
                                    buttonModel.titleFont,
                                    buttonModel.titleCor)
 .bgColor(buttonModel.baseBackgroundColor)
 .cornerRadiusValue(buttonModel.cornerRadiusValue)
 .onClick(^(UIButton *x){
     @jobs_strongify(self)
     if (self.objectBlock) self.objectBlock(x);
 }).onLongPressGesture(^(id data){
     NSLog(@"");
 });
 btn.jobsResetBtnlayerBorderCor(buttonModel.layerBorderCor);
 btn.jobsResetBtnlayerBorderWidth(buttonModel.borderWidth);
 */
