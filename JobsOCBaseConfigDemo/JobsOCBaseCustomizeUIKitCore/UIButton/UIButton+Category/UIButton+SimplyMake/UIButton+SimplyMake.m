//
//  UIButton+SimplyMake.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "UIButton+SimplyMake.h"

@implementation UIButton (SimplyMake)
#pragma mark —— 依靠单一数据进行简单创建
/// 仅仅依靠主标题内容（普通文本）进行创建
+(JobsReturnButtonByTitleBlock _Nonnull)initByTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable data) {
            data.title = title;
        }));
    };
}
/// 仅仅依靠主标题富文本内容进行创建
+(JobsReturnButtonByAttributedStringBlock _Nonnull)initByAttributedString{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSAttributedString *_Nonnull title){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.attributedTitle = title;
        }));
    };
}
/// 仅仅靠按钮图片进行创建
+(JobsReturnButtonByNormalImageBlock _Nonnull)initByNormalImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.image = image;
        }));
    };
}
/// 仅仅依靠按钮背景图进行创建
+(JobsReturnButtonByBackgroundImageBlock _Nonnull)initByBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.buttonModel.backgroundImage = image;
        }));
    };
}
#pragma mark —— 对副标题进行创建
/// 仅仅依靠（主/副）标题内容（普通文本）进行创建
+(JobsReturnButtonByTitlesBlock _Nonnull)initByTitles{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,NSString *_Nonnull subTitle){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable data) {
            data.title = title;
            data.subTitle = subTitle;
        }));
    };
}
/// 仅仅依靠（主标题+副标题）富文本内容进行创建
+(JobsReturnButtonByAttributedStringsBlock _Nonnull)initByAttributedStrings{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSAttributedString *_Nonnull title,NSAttributedString *_Nonnull subTitle){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.attributedTitle = title;
            data.attributedSubtitle = subTitle;
        }));
    };
}
#pragma mark —— 依靠多数据进行较为复杂的创建
/// 依靠标题内容和字体大小进行创建
+(JobsReturnButtonByStyle1Block _Nonnull)initByTitle_font{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nullable font){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel *_Nullable data) {
            data.buttonModel.title = title;
            data.buttonModel.titleFont = font;
        }));
    };
}
/// 依靠标题内容（普通文本）、字体大小、文字颜色进行创建
+(JobsReturnButtonByStyle2Block _Nonnull)initByStyle1{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nullable font,
                                         UIColor *_Nullable titleCor){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel *_Nullable data) {
            data.buttonModel.title = title;
            data.buttonModel.titleFont = font;
            data.buttonModel.titleCor = titleCor;
        }));
    };
}
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片进行创建
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyle2{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nullable font,
                                         UIColor *_Nullable titleCor,
                                         UIImage *_Nonnull image,
                                         NSDirectionalRectEdge imagePlacement,
                                         CGFloat x){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel *_Nullable data) {
            data.image = image;
            data.buttonModel.title = title;
            data.buttonModel.titleFont = font;
            data.buttonModel.titleCor = titleCor;
            data.buttonModel.imagePlacement = imagePlacement;
            data.buttonModel.imagePadding = x;
        }));
    };
}
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮背景图片进行创建
+(JobsReturnButtonByStyle4Block _Nonnull)initByStyle3{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nullable font,
                                         UIColor *_Nullable titleCor,
                                         UIImage *_Nonnull backgroundImage){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.buttonModel.title = title;
            data.buttonModel.titleFont = font;
            data.buttonModel.titleCor = titleCor;
            data.buttonModel.backgroundImage = backgroundImage;
        }));
    };
}
/// 依靠标题内容（普通文本）、字体大小、文字颜色、按钮图片、按钮背景图片进行创建
+(JobsReturnButtonByStyle5Block _Nonnull)initByStyle4{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         UIFont *_Nullable font,
                                         UIColor *_Nullable titleCor,
                                         UIImage *_Nonnull image,
                                         UIImage *_Nonnull backgroundImage,
                                         NSDirectionalRectEdge imagePlacement){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.image = image;
            data.buttonModel.title = title;
            data.buttonModel.titleFont = font;
            data.buttonModel.titleCor = titleCor;
            data.buttonModel.backgroundImage = backgroundImage;
            data.buttonModel.imagePlacement = imagePlacement;
        }));
    };
}
/// 依靠文字内容、字体大小、文字颜色、按钮图片、图文距离进行创建
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyle5{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nullable font,/// 字体大小
                                         UIColor *_Nullable titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         NSDirectionalRectEdge directionalRectEdge,/// 图文相对位置
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.image = image;
            data.buttonModel.title = title;
            data.buttonModel.titleFont = font;
            data.buttonModel.titleCor = titleCor;
            data.directionalRectEdge = directionalRectEdge;
        }));
    };
}
/// 图文混排（图片在上边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleTop{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         NSDirectionalRectEdge imagePlacement,/// 图片和文字的位置关系
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeTop,x);
    };
}
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleLeft{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         NSDirectionalRectEdge imagePlacement,/// 图片和文字的位置关系
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeLeading,x);
    };
}
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleBottom{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         NSDirectionalRectEdge imagePlacement,/// 图片和文字的位置关系
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeBottom,x);
    };
}
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle3Block _Nonnull)initByStyleRight{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         NSDirectionalRectEdge imagePlacement,/// 图片和文字的位置关系
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeTrailing,x);
    };
}
#pragma mark —— 依靠数据束进行创建
+(JobsReturnButtonByVoidBlock _Nonnull)jobsInit{
    return ^__kindof UIButton *_Nullable(){
        return BaseButton
            .initByButtonModel(nil)
            .bgColor(JobsClearColor);
    };
}
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock _Nonnull)initByViewModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIViewModel *_Nullable data){
        @jobs_strongify(self)
        if(!data) data = UIViewModel.new;
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
                           longPressGestureEventBlock:data.buttonModel.longPressGestureEventBlock ? : ^id(__kindof UIButton *_Nullable weakSelf,
                                                                                                          id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            if(weakSelf.longPressGestureBlock) weakSelf.longPressGestureBlock(arg);
            return nil;
        }
                                      clickEventBlock:data.buttonModel.clickEventBlock ? : ^id(__kindof UIButton *x){
            if(x.clickBlock) x.clickBlock(x);
            return nil;
        }];
    };
}
/// 依靠UIButtonModel进行创建
+(JobsReturnButtonByButtonModelBlock _Nonnull)initByButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonModel *_Nullable data){
        @jobs_strongify(self)
        if(!data) data = UIButtonModel.new;
        return [self.alloc jobsInitBtnByConfiguration:data.btnConfiguration
                                           background:data.background
                           buttonConfigTitleAlignment:data.buttonConfigTitleAlignment
                                        textAlignment:data.textAlignment
                                     subTextAlignment:data.subTextAlignment
                                          normalImage:data.normalImage
                                       highlightImage:data.highlightImage
                                      attributedTitle:data.attributedTitle
                              selectedAttributedTitle:data.selectedAttributedTitle
                                   attributedSubtitle:data.attributedSubtitle
                                                title:data.title
                                             subTitle:data.subTitle
                                            titleFont:data.titleFont
                                         subTitleFont:data.subTitleFont
                                             titleCor:data.titleCor
                                          subTitleCor:data.subTitleCor
                                   titleLineBreakMode:data.titleLineBreakMode
                                subtitleLineBreakMode:data.subtitleLineBreakMode
                                  baseBackgroundColor:data.baseBackgroundColor
                                      backgroundImage:data.backgroundImage
                                         imagePadding:data.imagePadding
                                         titlePadding:data.titlePadding
                                       imagePlacement:data.imagePlacement
                           contentHorizontalAlignment:data.contentHorizontalAlignment
                             contentVerticalAlignment:data.contentVerticalAlignment
                                        contentInsets:data.contentInsets
                                    cornerRadiusValue:data.cornerRadiusValue
                                      roundingCorners:data.roundingCorners//UIRectCornerAllCorners
                                 roundingCornersRadii:data.roundingCornersRadii
                                       layerBorderCor:data.layerBorderCor
                                          borderWidth:data.borderWidth
                                        primaryAction:data.primaryAction
                           longPressGestureEventBlock:data.longPressGestureEventBlock ? : ^id(__kindof UIButton *_Nullable weakSelf,
                                                                                              id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            if(weakSelf.longPressGestureBlock) weakSelf.longPressGestureBlock(arg);
            return nil;
        }
                                      clickEventBlock:data.clickEventBlock ? : ^id(__kindof UIButton *x){
            if(x.clickBlock) x.clickBlock(x);
            return nil;
        }];
    };
}
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock _Nonnull)initByTextModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UITextModel *_Nullable data){
        @jobs_strongify(self)
        if(!data) data = UITextModel.new;
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
                           longPressGestureEventBlock:^id(__kindof UIButton *_Nullable weakSelf,
                                                          id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            if(weakSelf.longPressGestureBlock) weakSelf.longPressGestureBlock(arg);
            return nil;
        }
                                      clickEventBlock:^id(__kindof UIButton *x){
            if(x.clickBlock) x.clickBlock(x);
            return nil;
        }];
    };
}
#pragma mark —— 一些公有方法
-(JobsReturnButtonByClickBlock _Nonnull)onClick{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByBtnBlock block) {
        @jobs_strongify(self)
        self.clickBlock = block;
        return self;
    };
}

-(JobsReturnButtonByClickBlock _Nonnull)onLongPressGesture{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByBtnBlock block) {
        @jobs_strongify(self)
        self.longPressGestureBlock = block;
        return self;
    };
}

-(JobsReturnButtonByCorBlock _Nonnull)bgColor{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIColor *color) {
        @jobs_strongify(self)
        if(color) self.jobsResetBtnBgCor(color);
        return self;
    };
}

-(JobsReturnButtonByFloatBlock _Nonnull)cornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsResetBtnCornerRadiusValue(data);
        return self;
    };
}
#pragma mark —— @property(nonatomic,copy)jobsByBtnBlock clickBlock;
JobsKey(_clickBlock)
@dynamic clickBlock;
-(jobsByBtnBlock)clickBlock{
    return Jobs_getAssociatedObject(_clickBlock);
}

-(void)setClickBlock:(jobsByBtnBlock)clickBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_clickBlock, clickBlock);
}
#pragma mark —— @property(nonatomic,copy,class)jobsByBtnBlock longPressGestureBlock;
JobsKey(_longPressGestureBlock)
@dynamic longPressGestureBlock;
-(jobsByBtnBlock)longPressGestureBlock{
    return Jobs_getAssociatedObject(_longPressGestureBlock);
}

-(void)setLongPressGestureBlock:(jobsByBtnBlock)longPressGestureBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGestureBlock, longPressGestureBlock);
}

@end
