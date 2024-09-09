//
//  UIButton+SimplyMake.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "UIButton+SimplyMake.h"

@implementation UIButton (SimplyMake)
#pragma mark —— 依靠单一数据进行简单创建
/// 仅仅依靠标题内容（普通文本）进行创建
+(JobsReturnButtonByTitleBlock)initByTitle{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title){
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.buttonModel.title = title;
        return self.initByViewModel(viewModel);
    };
}
/// 依靠标题内容和字体大小进行创建
+(JobsReturnButtonByTitleAndFontBlock)initByTitleAndFont{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nonnull font){
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.buttonModel.title = title;
        viewModel.buttonModel.titleFont = font;
        return self.initByViewModel(viewModel);
    };
}
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsReturnButtonByTitleAndFontAndTitleCorBlock)initByTitleAndFontAndTitleCor{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nonnull font,
                                         UIColor *_Nonnull titleCor){
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.buttonModel.title = title;
        viewModel.buttonModel.titleFont = font;
        viewModel.buttonModel.titleCor = titleCor;
        return self.initByViewModel(viewModel);
    };
}
/// 仅仅靠按钮图片进行创建
+(JobsReturnButtonByNormalImageBlock)initByNormalImage{
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.image = image;
        return self.initByViewModel(viewModel);
    };
}
/// 仅仅依靠按钮背景图进行创建
+(JobsReturnButtonByBackgroundImageBlock)initByBackgroundImage{
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.buttonModel.backgroundImage = image;
        return self.initByViewModel(viewModel);
    };
}
/// 依靠文字内容、字体大小、文字颜色、按钮图片、图文距离进行创建
+(JobsReturnButtonByStyle1Block)initByStyle1{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull string,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull textCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         NSDirectionalRectEdge directionalRectEdge,/// 图文相对位置
                                         CGFloat x){/// 图文距离
        UIViewModel *viewModel = UIViewModel.new;
        viewModel.image = image;
        viewModel.buttonModel.title = string;
        viewModel.buttonModel.titleFont = font;
        viewModel.buttonModel.titleCor = textCor;
        viewModel.directionalRectEdge = directionalRectEdge;
        return self.initByViewModel(viewModel);
    };
}
/// 图文混排（图片在上边 ）
+(JobsReturnButtonByStyle2Block)initByStyleTop{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull string,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull textCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        return self.initByStyle1(string,font,textCor,image,NSDirectionalRectEdgeTop,x);
    };
}
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle2Block)initByStyleLeft{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull string,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull textCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        return self.initByStyle1(string,font,textCor,image,NSDirectionalRectEdgeLeading,x);
    };
}
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle2Block)initByStyleBottom{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull string,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull textCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        return self.initByStyle1(string,font,textCor,image,NSDirectionalRectEdgeBottom,x);
    };
}
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle2Block)initByStyleRight{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull string,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull textCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        return self.initByStyle1(string,font,textCor,image,NSDirectionalRectEdgeTrailing,x);
    };
}
#pragma mark —— 依靠数据束进行创建
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock)initByViewModel{
    return ^__kindof UIButton *_Nullable(UIViewModel *_Nonnull data){
        return [self.alloc jobsInitBtnByConfiguration:data.buttonConfiguration
                                           background:data.backgroundConfiguration
                           buttonConfigTitleAlignment:data.buttonConfigurationTitleAlignment//UIButtonConfigurationTitleAlignmentAutomatic
                                        textAlignment:data.textAlignment//NSTextAlignmentCenter
                                     subTextAlignment:data.subTextAlignment//NSTextAlignmentCenter
                                          normalImage:data.image
                                       highlightImage:data.buttonModel.highlightImage
                                      attributedTitle:data.buttonModel.attributedTitle
                              selectedAttributedTitle:data.buttonModel.selectedAttributedTitle
                                   attributedSubtitle:data.buttonModel.attributedSubtitle
                                                title:data.buttonModel.title
                                             subTitle:data.buttonModel.subTitle
                                            titleFont:data.buttonModel.titleFont
                                         subTitleFont:data.buttonModel.subTitleFont
                                             titleCor:data.buttonModel.titleCor
                                          subTitleCor:data.buttonModel.subTitleCor
                                   titleLineBreakMode:data.buttonModel.titleLineBreakMode// NSLineBreakByWordWrapping
                                subtitleLineBreakMode:data.buttonModel.subtitleLineBreakMode//NSLineBreakByWordWrapping
                                  baseBackgroundColor:data.buttonModel.baseBackgroundColor//JobsWhiteColor
                                      backgroundImage:data.buttonModel.backgroundImage
                                         imagePadding:data.buttonModel.imagePadding
                                         titlePadding:data.buttonModel.titlePadding
                                       imagePlacement:data.buttonModel.imagePlacement//NSDirectionalRectEdgeNone
                           contentHorizontalAlignment:data.buttonModel.contentHorizontalAlignment//UIControlContentHorizontalAlignmentCenter
                             contentVerticalAlignment:data.buttonModel.contentVerticalAlignment//UIControlContentVerticalAlignmentCenter
                                        contentInsets:data.buttonModel.contentInsets
                                    cornerRadiusValue:data.buttonModel.cornerRadiusValue
                                      roundingCorners:UIRectCornerAllCorners
                                 roundingCornersRadii:data.buttonModel.roundingCornersRadii
                                       layerBorderCor:data.buttonModel.layerBorderCor
                                          borderWidth:data.buttonModel.borderWidth
                                        primaryAction:data.buttonModel.primaryAction
                           longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                          id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            if(UIButton.longPressGestureBlock) UIButton.longPressGestureBlock(arg);
            return nil;
        }
                                      clickEventBlock:^id(BaseButton *x){
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock)initByTextModel{
    return ^__kindof UIButton *_Nullable(UITextModel *_Nonnull data){
        return [self.alloc jobsInitBtnByConfiguration:nil
                                           background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                        textAlignment:NSTextAlignmentCenter
                                     subTextAlignment:NSTextAlignmentCenter
                                          normalImage:nil
                                       highlightImage:nil
                                      attributedTitle:data.attributedText
                              selectedAttributedTitle:nil
                                   attributedSubtitle:data.attributedSubText
                                                title:data.text
                                             subTitle:data.subText
                                            titleFont:data.font
                                         subTitleFont:data.subFont
                                             titleCor:data.textCor
                                          subTitleCor:data.subTextCor
                                   titleLineBreakMode:data.lineBreakMode
                                subtitleLineBreakMode:data.subLineBreakMode
                                  baseBackgroundColor:JobsWhiteColor
                                      backgroundImage:nil
                                         imagePadding:JobsWidth(0)
                                         titlePadding:JobsWidth(0)
                                       imagePlacement:NSDirectionalRectEdgeNone
                           contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                             contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                        contentInsets:jobsSameDirectionalEdgeInsets(0)
                                    cornerRadiusValue:JobsWidth(0)
                                      roundingCorners:UIRectCornerAllCorners
                                 roundingCornersRadii:CGSizeZero
                                       layerBorderCor:nil
                                          borderWidth:JobsWidth(0)
                                        primaryAction:nil
                           longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                          id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            if(UIButton.longPressGestureBlock) UIButton.longPressGestureBlock(arg);
            return nil;
        }
                                      clickEventBlock:^id(BaseButton *x){
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}
#pragma mark —— 一些公有方法
-(JobsReturnButtonByClickBlock)onClick{
    return ^UIButton *(jobsByBtnBlock block) {
        UIButton.clickBlock = block;
        return self;
    };
}

-(JobsReturnButtonByClickBlock)onLongPressGesture{
    return ^UIButton *(jobsByBtnBlock block) {
        UIButton.longPressGestureBlock = block;
        return self;
    };
}
#pragma mark —— @property(nonatomic,copy)jobsByBtnBlock clickBlock;
JobsKey(_clickBlock)
@dynamic clickBlock;
+(jobsByBtnBlock)clickBlock{
    return Jobs_getAssociatedObject(_clickBlock);
}

+(void)setClickBlock:(jobsByBtnBlock)clickBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_clickBlock, clickBlock);
}
#pragma mark —— @property(nonatomic,copy,class)jobsByBtnBlock longPressGestureBlock;
JobsKey(_longPressGestureBlock)
@dynamic longPressGestureBlock;
+(jobsByBtnBlock)longPressGestureBlock{
    return Jobs_getAssociatedObject(_longPressGestureBlock);
}

+(void)setLongPressGestureBlock:(jobsByBtnBlock)longPressGestureBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGestureBlock, longPressGestureBlock);
}

@end
