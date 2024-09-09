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

@property(nonatomic,copy,class)jobsByBtnBlock clickBlock;
@property(nonatomic,copy,class)jobsByBtnBlock longPressGestureBlock;
#pragma mark —— 依靠单一数据进行简单创建
/// 仅仅依靠标题内容（普通文本）进行创建
+(JobsReturnButtonByTitleBlock)initByTitle;
/// 依靠标题内容和字体大小进行创建
+(JobsReturnButtonByTitleAndFontBlock)initByTitleAndFont;
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorBlock)initByTitleAndFontAndTitleCor;
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

-(JobsReturnButtonByClickBlock)onClick;
-(JobsReturnButtonByClickBlock)onLongPressGesture;

@end

NS_ASSUME_NONNULL_END
/**
     BaseButton *d = BaseButton.initByTitle(@"444").onClick(^(UIButton *btn){
         NSLog(@"");
     }).onLongPressGesture(^(id data){
         NSLog(@"");
     });
     self.view.addSubview(d);
     d.frame = CGRectMake(100, 100, 100, 100);
 */
