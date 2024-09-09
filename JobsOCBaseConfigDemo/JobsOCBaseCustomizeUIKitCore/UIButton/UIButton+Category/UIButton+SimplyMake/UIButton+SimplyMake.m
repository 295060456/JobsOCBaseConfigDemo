//
//  UIButton+SimplyMake.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "UIButton+SimplyMake.h"

@implementation UIButton (SimplyMake)
/// 仅仅依靠标题创建
+(JobsReturnButtonByTitleBlock)initByTitle{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title){
        return [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:nil
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:title
                                                   subTitle:nil
                                                  titleFont:nil
                                               subTitleFont:nil
                                                   titleCor:JobsBlackColor
                                                subTitleCor:nil
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
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
            return nil;
        }
                                            clickEventBlock:^id(BaseButton *x){;
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}
/// 依靠标题和字体
+(JobsReturnButtonByTitleAndFontBlock)initByTitleAndFont{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nonnull font){
        return [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:nil
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:title
                                                   subTitle:nil
                                                  titleFont:font
                                               subTitleFont:nil
                                                   titleCor:nil
                                                subTitleCor:nil
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
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
            return nil;
        }
                                            clickEventBlock:^id(BaseButton *x){
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}
/// 依靠标题
+(JobsReturnButtonByTitleAndFontAndTitleCorBlock)initByTitleAndFontAndTitleCor{
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nonnull font,
                                         UIColor *_Nonnull titleCor){
        return [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:nil
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:title
                                                   subTitle:nil
                                                  titleFont:font
                                               subTitleFont:nil
                                                   titleCor:titleCor
                                                subTitleCor:nil
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
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
            return nil;
        }
                                            clickEventBlock:^id(BaseButton *x){
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}

+(JobsReturnButtonByNormalImageBlock)initByNormalImage{
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        return [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:image
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:nil
                                                   subTitle:nil
                                                  titleFont:nil
                                               subTitleFont:nil
                                                   titleCor:nil
                                                subTitleCor:nil
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
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
            return nil;
        }
                                            clickEventBlock:^id(BaseButton *x){
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}

+(JobsReturnButtonByBackgroundImageBlock)initByBackgroundImage{
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        return [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                 background:nil
                                 buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                              textAlignment:NSTextAlignmentCenter
                                           subTextAlignment:NSTextAlignmentCenter
                                                normalImage:image
                                             highlightImage:nil
                                            attributedTitle:nil
                                    selectedAttributedTitle:nil
                                         attributedSubtitle:nil
                                                      title:nil
                                                   subTitle:nil
                                                  titleFont:nil
                                               subTitleFont:nil
                                                   titleCor:nil
                                                subTitleCor:nil
                                         titleLineBreakMode:NSLineBreakByWordWrapping
                                      subtitleLineBreakMode:NSLineBreakByWordWrapping
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
            return nil;
        }
                                            clickEventBlock:^id(BaseButton *x){
            if(UIButton.clickBlock) UIButton.clickBlock(x);
            return nil;
        }];
    };
}

-(JobsReturnButtonByClickBlock)onClick{
    return ^UIButton *(jobsByBtnBlock block) {
        UIButton.clickBlock = block;
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

@end
