//
//  UIButton+SimplyMake.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "UIButton+SimplyMake.h"

@implementation UIButton (SimplyMake)
#pragma mark —— 一些公共方法
/// 长按方法
+(JobsRetIDByIDBlockByViewModelOthersProtocolID _Nonnull)longPressGestureActionBy{
    return ^JobsReturnIDByIDBlock(id<UIViewModelOthersProtocol> data){
        return data.longPressGestureEventBlock ? :
        (data.onLongPressGestureEventBlock ? ^id(__kindof UIButton *_Nullable x) {
            if (data.onLongPressGestureEventBlock) data.onLongPressGestureEventBlock(x);
            return nil;
        } : ^id(__kindof UIButton *_Nullable x) {
            JobsLog(@"按钮的长按事件触发");
            if (x.longPressGestureBlock) x.longPressGestureBlock(x);
            return nil;
        });
    };
}
/// 点击方法
+(JobsRetIDByIDBlockByViewModelOthersProtocolID _Nonnull)clickActionBy{
    return ^JobsReturnIDByIDBlock(id<UIViewModelOthersProtocol> data){
        return data.clickEventBlock ? :
        (data.onClickBlock ? ^id(__kindof UIButton *_Nullable x) {
            if (data.onClickBlock) data.onClickBlock(x);
            return nil;
        } : ^id(__kindof UIButton *_Nullable x) {
            JobsLog(@"按钮的点击事件触发");
            if (x.clickBlock) x.clickBlock(x);
            return nil;
        });
    };
}
#pragma mark —— 对老Api进行二次封装
+(JobsReturnButtonByNSIntegerBlock _Nonnull)initByType{
    return ^__kindof UIButton *_Nullable(UIButtonType type){
        return [UIButton buttonWithType:type];
    };
}

+(__kindof UIButton *)initByCustomType{
    return UIButton.initByType(UIButtonTypeCustom);
}

+(__kindof UIButton *)initBySysType API_AVAILABLE(ios(7.0)){
    return UIButton.initByType(UIButtonTypeSystem);
}

+(__kindof UIButton *)initByDetailDisclosureType{
    return UIButton.initByType(UIButtonTypeDetailDisclosure);
}

+(__kindof UIButton *)initByInfoLightType{
    return UIButton.initByType(UIButtonTypeInfoLight);
}

+(__kindof UIButton *)initByInfoDarkType{
    return UIButton.initByType(UIButtonTypeInfoDark);
}

+(__kindof UIButton *)initByContactAddType{
    return UIButton.initByType(UIButtonTypeContactAdd);
}

+(__kindof UIButton *)initByPlainType API_AVAILABLE(tvos(11.0)) API_UNAVAILABLE(ios, watchos){
    return UIButton.initByType(UIButtonTypePlain);
}

+(__kindof UIButton *)initByCloseType API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos, watchos){
    return UIButton.initByType(UIButtonTypeClose);
}
#pragma mark —— 依靠单一数据进行简单创建
/// 仅仅依靠主标题内容（普通文本）进行创建
+(JobsReturnButtonByStringBlock _Nonnull)initByTitle{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable data) {
            data.title = title;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
/// 仅仅依靠主标题富文本内容进行创建
+(JobsReturnButtonByAttributedStringBlock _Nonnull)initByAttributedString{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSAttributedString *_Nonnull title){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.attributedTitle = title;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
/// 仅仅靠按钮图片进行创建
+(JobsReturnButtonByImageBlock _Nonnull)initByNormalImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.image = image;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
/// 仅仅依靠按钮背景图进行创建
+(JobsReturnButtonByImageBlock _Nonnull)initByBackgroundImage{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIImage *_Nonnull image){
        @jobs_strongify(self)
        return self.initByViewModel(jobsMakeViewModel(^(__kindof UIViewModel *_Nullable data) {
            data.backgroundImage = image;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
#pragma mark —— 对副标题进行创建
/// 仅仅依靠（主/副）标题内容（普通文本）进行创建
+(JobsReturnButtonByTitlesBlock _Nonnull)initByTitles{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,
                                         NSString *_Nonnull subTitle){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel *_Nullable data) {
            data.title = title;
            data.subTitle = subTitle;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
/// 仅仅依靠（主标题+副标题）富文本内容进行创建
+(JobsReturnButtonByAttributedStringsBlock _Nonnull)initByAttributedStrings{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSAttributedString *_Nonnull title,
                                         NSAttributedString *_Nonnull subTitle){
        @jobs_strongify(self)
        return self.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.attributedTitle = title;
            data.attributedSubTitle = subTitle;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
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
            data.title = title;
            data.titleFont = font;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
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
            data.title = title;
            data.titleFont = font;
            data.titleCor = titleCor;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
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
            data.title = title;
            data.titleFont = font;
            data.titleCor = titleCor;
            data.imagePlacement = imagePlacement;
            data.imagePadding = x;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
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
            data.title = title;
            data.titleFont = font;
            data.titleCor = titleCor;
            data.backgroundImage = backgroundImage;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
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
            data.title = title;
            data.titleFont = font;
            data.titleCor = titleCor;
            data.backgroundImage = backgroundImage;
            data.imagePlacement = imagePlacement;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
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
            data.title = title;
            data.titleFont = font;
            data.titleCor = titleCor;
            data.imagePlacement = directionalRectEdge;
            data.imagePadding = x;
        })).bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
/// 图文混排（图片在上边 ）
+(JobsReturnButtonByStyle7Block _Nonnull)initByStyleTop{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeTop,x);
    };
}
/// 图文混排（图片在左边 ）
+(JobsReturnButtonByStyle7Block _Nonnull)initByStyleLeft{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeLeading,x);
    };
}
/// 图文混排（图片在下边 ）
+(JobsReturnButtonByStyle7Block _Nonnull)initByStyleBottom{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
                                         CGFloat x){/// 图文距离
        @jobs_strongify(self)
        return self.initByStyle5(title,font,titleCor,image,NSDirectionalRectEdgeBottom,x);
    };
}
/// 图文混排（图片在右边 ）
+(JobsReturnButtonByStyle7Block _Nonnull)initByStyleRight{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(NSString *_Nonnull title,/// 主文字内容
                                         UIFont *_Nonnull font,/// 字体大小
                                         UIColor *_Nonnull titleCor,/// 主文字颜色
                                         UIImage *_Nonnull image,/// 按钮图片
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
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0));
    };
}
/// 依靠UIViewModel进行创建
+(JobsReturnButtonByViewModelBlock _Nonnull)initByViewModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIViewModel *_Nullable data){
        @jobs_strongify(self)
        if(!data) data = UIViewModel.new;
        UIButton *button = [self.alloc jobsInitBtnByConfiguration:data.buttonConfiguration
                                                       background:data.backgroundConfiguration
                                       buttonConfigTitleAlignment:data.buttonConfigurationTitleAlignment//UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:data.textAlignment//NSTextAlignmentCenter
                                                 subTextAlignment:data.subTextAlignment//NSTextAlignmentCenter
                                                      normalImage:data.image
                                                   highlightImage:data.highlightImage
                                                  attributedTitle:data.attributedTitle
                                          selectedAttributedTitle:data.selectedAttributedTitle
                                               attributedSubtitle:data.attributedSubTitle
                                                            title:data.title
                                                         subTitle:data.subTitle
                                                        titleFont:data.titleFont
                                                     subTitleFont:data.subTitleFont
                                                         titleCor:data.titleCor
                                                      subTitleCor:data.subTitleCor
                                               titleLineBreakMode:data.titleLineBreakMode// NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:data.subtitleLineBreakMode//NSLineBreakByWordWrapping
                                              baseBackgroundColor:data.baseBackgroundColor//JobsWhiteColor
                                                  backgroundImage:data.backgroundImage
                                                     imagePadding:data.imagePadding
                                                     titlePadding:data.titlePadding
                                                   imagePlacement:data.imagePlacement//NSDirectionalRectEdgeNone
                                       contentHorizontalAlignment:data.contentHorizontalAlignment//UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:data.contentVerticalAlignment//UIControlContentVerticalAlignmentCenter
                                                    contentInsets:data.contentInsets
                                                cornerRadiusValue:data.cornerRadiusValue
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:data.roundingCornersRadii
                                                   layerBorderCor:data.layerBorderCor
                                                      borderWidth:data.borderWidth
                                                         selected:data.jobsSelected
                                                    primaryAction:data.primaryAction
                                       longPressGestureEventBlock:UIButton.longPressGestureActionBy(data)
                                                  clickEventBlock:UIButton.clickActionBy(data)];
        button.modelData = data;
        return button;
    };
}
/// 依靠UIButtonModel进行创建
+(JobsReturnButtonByButtonModelBlock _Nonnull)initByButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIButtonModel *_Nullable data){
        @jobs_strongify(self)
        if(!data) data = UIButtonModel.new;
        UIButton *button = [self.alloc jobsInitBtnByConfiguration:data.buttonConfiguration
                                                       background:data.backgroundConfiguration
                                       buttonConfigTitleAlignment:data.buttonConfigurationTitleAlignment
                                                    textAlignment:data.textAlignment
                                                 subTextAlignment:data.subTextAlignment
                                                      normalImage:data.normalImage
                                                   highlightImage:data.highlightImage
                                                  attributedTitle:data.attributedTitle
                                          selectedAttributedTitle:data.selectedAttributedTitle
                                               attributedSubtitle:data.attributedSubTitle
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
                                                  roundingCorners:data.roundingCorners /// UIRectCornerAllCorners
                                             roundingCornersRadii:data.roundingCornersRadii
                                                   layerBorderCor:data.layerBorderCor
                                                      borderWidth:data.borderWidth
                                                         selected:data.jobsSelected
                                                    primaryAction:data.primaryAction
                                       longPressGestureEventBlock:UIButton.longPressGestureActionBy(data)
                                                  clickEventBlock:UIButton.clickActionBy(data)];
        button.modelData = data;
        return button;
    };
}
/// 依靠UITextModel进行创建
+(JobsReturnButtonByTextModelBlock _Nonnull)initByTextModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UITextModel *_Nullable data){
        @jobs_strongify(self)
        if(!data) data = UITextModel.new;
        UIButton *button = [self.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:nil
                                                   highlightImage:nil
                                                  attributedTitle:data.attributedTitle
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:data.attributedSubTitle
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
                                                         selected:NO
                                                    primaryAction:nil
                                       longPressGestureEventBlock:UIButton.longPressGestureActionBy(data)
                                                  clickEventBlock:UIButton.clickActionBy(data)];
        button.modelData = data;
        return button;
    };
}
#pragma mark —— 一些公有方法
-(JobsReturnButtonByClickBlock _Nonnull)onClickBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByBtnBlock block) {
        @jobs_strongify(self)
        self.clickBlock = block;
        return self;
    };
}

-(JobsReturnButtonByClickBlock _Nonnull)onLongPressGestureBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByBtnBlock block) {
        @jobs_strongify(self)
        self.longPressGestureBlock = block;
        return self;
    };
}

-(JobsReturnButtonByTimerManagerBlock _Nonnull)heartBeatBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(jobsByTimerManagerBlock block) {
        @jobs_strongify(self)
        self.heartBeatBlock = block;
        return self;
    };
}

-(JobsReturnButtonByColorBlock _Nonnull)bgColorBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(UIColor *color) {
        @jobs_strongify(self)
        if(color) self.jobsResetBtnBgCor(color);
        return self;
    };
}

-(JobsReturnButtonByCGFloatBlock _Nonnull)cornerRadiusValueBy{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.jobsResetBtnCornerRadiusValue(data);
        return self;
    };
}
#pragma mark —— 依据数据源进行按钮的统一重设
-(JobsReturnButtonByViewModelAndBOOLBlock _Nonnull)resetByViewModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(__kindof UIViewModel *_Nonnull viewModel,BOOL selected){
        @jobs_strongify(self)
        /// 图（背景颜色）
        self.jobsResetBtnBgCor(selected ? viewModel.bgSelectedCor : viewModel.bgCor);/// 更改：按钮背景色
        self.jobsResetBtnBgImage(selected ? viewModel.highlightBackgroundImage : viewModel.backgroundImage);/// 更改：按钮背景图片
        self.jobsResetBtnImage(selected ? viewModel.selectedImage_ : viewModel.image);/// 更改：按钮图片
        /// 主标题
        if(viewModel.attributedTitle){/// 主标题（富文本）
            self.jobsResetBtnNormalAttributedTitle(selected ? viewModel.selectedAttributedSubTitle : viewModel.attributedTitle);
        }else{/// 主标题（普通文本）
            self.jobsResetBtnTitle(selected ? viewModel.textModel.selectedText : viewModel.textModel.text);
            self.jobsResetBtnTitleCor(selected ? viewModel.textModel.selectedTextCor : viewModel.textModel.textCor);
            self.jobsResetBtnTitleFont(selected ? viewModel.textModel.selectedFont : viewModel.textModel.font);
        }
        /// 副标题
        if(viewModel.attributedSubTitle){/// 副标题（富文本）
            self.jobsResetBtnNormalAttributedTitle(selected ? viewModel.selectedAttributedSubTitle : viewModel.attributedSubTitle);
        }else{/// 副标题（普通文本）
            self.jobsResetBtnSubTitle(selected ? viewModel.subTextModel.selectedSubText : viewModel.subTextModel.subText);
            self.jobsResetBtnSubTitleCor(selected ? viewModel.subTextModel.selectedSubTextCor : viewModel.subTextModel.subTextCor);
            self.jobsResetBtnSubTitleFont(selected ? viewModel.subTextModel.selectedSubFont : viewModel.subTextModel.subFont);
        }return self;
    };
}

-(JobsReturnButtonByButtonModelAndBOOLBlock _Nonnull)resetByButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable(__kindof UIButtonModel *_Nonnull buttonModel,BOOL selected){
        @jobs_strongify(self)
        /// 图（背景颜色）
        self.jobsResetBtnBgCor(selected ? buttonModel.baseBackgroundColor : buttonModel.baseBackgroundColor);/// 更改：按钮背景色
        self.jobsResetBtnBgImage(selected ? buttonModel.highlightBackgroundImage : buttonModel.backgroundImage);/// 更改：按钮背景图片
        self.jobsResetBtnImage(selected ? buttonModel.highlightImage : buttonModel.normalImage);/// 更改：按钮图片
        /// 主标题
        if(buttonModel.attributedTitle){/// 主标题（富文本）
            self.jobsResetBtnNormalAttributedTitle(selected ? buttonModel.selectedAttributedSubTitle : buttonModel.attributedTitle);
        }else{/// 主标题（普通文本）
            self.jobsResetBtnTitle(selected ? buttonModel.selectedTitle : buttonModel.title);
            self.jobsResetBtnTitleCor(selected ? buttonModel.selectedTitleCor : buttonModel.titleCor);
            self.jobsResetBtnTitleFont(selected ? buttonModel.selectedTitleFont : buttonModel.titleFont);
        }
        /// 副标题
        if(buttonModel.attributedSubTitle){/// 副标题（富文本）
            self.jobsResetBtnNormalAttributedTitle(selected ? buttonModel.selectedAttributedSubTitle : buttonModel.attributedSubTitle);
        }else{/// 副标题（普通文本）
            self.jobsResetBtnSubTitle(selected ? buttonModel.selectedSubTitle : buttonModel.subTitle);
            self.jobsResetBtnSubTitleCor(selected ? buttonModel.selectedSubTitleCor : buttonModel.subTitleCor);
            self.jobsResetBtnSubTitleFont(selected ? buttonModel.selectedSubTitleFont : buttonModel.subTitleFont);
        }return self;
    };
}
#pragma mark —— Prop_copy()jobsByBtnBlock clickBlock;
JobsKey(_clickBlock)
@dynamic clickBlock;
-(jobsByBtnBlock _Nullable)clickBlock{
    return Jobs_getAssociatedObject(_clickBlock);
}

-(void)setClickBlock:(jobsByBtnBlock _Nullable)clickBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_clickBlock, clickBlock);
}
#pragma mark —— Prop_copy(class)jobsByBtnBlock longPressGestureBlock;
JobsKey(_longPressGestureBlock)
@dynamic longPressGestureBlock;
-(jobsByBtnBlock _Nullable)longPressGestureBlock{
    return Jobs_getAssociatedObject(_longPressGestureBlock);
}

-(void)setLongPressGestureBlock:(jobsByBtnBlock _Nullable)longPressGestureBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_longPressGestureBlock, longPressGestureBlock);
}
#pragma mark —— Prop_copy()jobsByTimerManagerBlock heartBeatBlock;
JobsKey(_heartBeatBlock)
@dynamic heartBeatBlock;
-(jobsByTimerManagerBlock _Nullable)heartBeatBlock{
    return Jobs_getAssociatedObject(_heartBeatBlock);
}

-(void)setHeartBeatBlock:(jobsByTimerManagerBlock _Nullable)heartBeatBlock{
    Jobs_setAssociatedRETAIN_NONATOMIC(_heartBeatBlock, heartBeatBlock);
}
#pragma mark —— Prop_strong()UIViewModel *viewModel;
JobsKey(_modelData)
@dynamic modelData;
-(id)modelData{
    return Jobs_getAssociatedObject(_modelData);
}

-(void)setModelData:(id)modelData{
    Jobs_setAssociatedRETAIN_NONATOMIC(_modelData, modelData)
}

@end
