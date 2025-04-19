
//
//  RPTaggedNavView.m
//  RPTaggedNavView
//
//  Created by Tao on 2018/8/8.
//  Copyright © 2018年 Tao. All rights reserved.
//
#import "JobsToggleNavView.h"

@interface JobsToggleNavView ()
/// UI
Prop_strong()__kindof UIView *sliderView;
/// Data
Prop_assign()NSUInteger current_index;
Prop_copy()NSMutableArray <UIButtonModel *>*buttonModels;
Prop_copy()NSMutableArray <__kindof UIButton *>*buttonsArray;

@end

@implementation JobsToggleNavView
JobsToggleNavViewProtocolSynthesize
-(void)dealloc{
    JobsLog(@"");
}
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 内部指定圆切角
//    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerAllCorners
//                                        cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.buttonModels = model;
        if(self.buttonsArray.count) {
            for (__kindof UIButton *btn in self.buttonsArray) {
                [btn removeFromSuperview];
            }[self.buttonsArray removeAllObjects];
        }
        __block CGFloat btnRight = 0;
        for (int i = 0 ; i < self.buttonModels.count ; i++) {
            UIButtonModel *buttonModel = self.buttonModels[i];
            BaseButton *button = BaseButton
                .initByButtonModel(buttonModel)
                .byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel *_Nullable data) {
                    @jobs_strongify(self)
                    data.jobsWidth = jobs3TO(buttonModel.jobsWidth,self.buttonWidth);
                    data.jobsHeight = jobs3TO(buttonModel.jobsHeight,self.height);
                    if(i == 0){
                        btnRight = data.jobsWidth;
                        buttonModel.jobsRight = btnRight;
                        data.jobsX = 0;
                    }else{
                        btnRight += (data.jobsWidth + self.btn_each_offset * i);
                        buttonModel.jobsRight = btnRight;
                        UIButtonModel *buttonModel2 = self.buttonModels[i - 1];/// 上一个
                        CGFloat d = jobs3TO(buttonModel2.jobsWidth,self.buttonWidth);
                        buttonModel.jobsX = (d + self.btn_each_offset) * i;
                        data.jobsX = buttonModel2.jobsRight + self.btn_each_offset;
                    }
                    data.jobsY = 0;
                }));
            
//            UIButtonModel *buttonModel = self.buttonModels[i];
//            BaseButton *button = BaseButton.jobsInit()
//                .bgColorBy(buttonModel.baseBackgroundColor)
//                .jobsResetImagePlacement(buttonModel.imagePlacement)
//                .jobsResetImagePadding(buttonModel.imagePadding)
//                .jobsResetBtnImage(buttonModel.normalImage)
//                .jobsResetBtnBgImage(buttonModel.backgroundImage)
//                .jobsResetBtnTitleCor(buttonModel.titleCor)
//                .jobsResetBtnTitleFont(buttonModel.titleFont)
//                .jobsResetBtnTitle(buttonModel.title)
//                .onClickBy(buttonModel.onClickBlock)
//                .onLongPressGestureBy(buttonModel.onLongPressGestureEventBlock)
//                .byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
//                    @jobs_strongify(self)
//                    data.jobsX = i * self.buttonWidth + (i ? self.btn_each_offset : 0);
//                    data.jobsY = 0;
//                    data.jobsWidth = jobs3TO(self.buttonModels[i].jobsWidth,self.buttonWidth);
//                    data.jobsHeight = jobs3TO(self.buttonModels[i].jobsHeight,self.height);
//                }));
            button.index = i;
            self.buttonsArray.add(button);
            [self addSubview:button];
        }
        self.current_index = 0;
        self.sliderView.alpha = 1;
        /// 设置按钮为选中状态
        self.buttonsArray[0].selected = YES;
        /// 重设按钮纯文本标题
        self.buttonsArray[0].jobsResetBtnTitle(Jobs3TO(self.buttonModels[0].selectedTitle,
                                                       self.buttonModels[0].title));
        /// 重设按钮纯文本标题字体
        self.buttonsArray[0].jobsResetTitleFont(Jobs3TO(self.buttonModels[0].selectedTitleFont,
                                                        self.buttonModels[0].titleFont));
        /// 重设按钮纯文本标题文字颜色
        self.buttonsArray[0].jobsResetBtnTitleCor(Jobs3TO(self.buttonModels[0].selectedTitleCor,
                                                          self.buttonModels[0].titleCor));
        /// 重设按钮图片
        self.buttonsArray[0].jobsResetBtnImage(Jobs3TO(self.buttonModels[0].highlightImage,
                                                       self.buttonModels[0].normalImage));
        /// 重设按钮背景图片
        self.buttonsArray[0].jobsResetBtnBgImage(Jobs3TO(self.buttonModels[0].highlightBackgroundImage,
                                                         self.buttonModels[0].backgroundImage));
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(340), JobsWidth(500));
    };
}

-(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
//        return self.class.viewSizeByModel(nil);
        return CGSizeMake(JobsWidth(410), JobsWidth(280));
    };
}
#pragma mark —— 一些私有方法
-(CGFloat)buttonWidth{
    return (self.width - (self.buttonModels.count - 1) * self.btn_each_offset) / self.buttonModels.count;
}
#pragma mark —— 一些公有方法
/// 核心方法：拖动和点击的逻辑，都归属于这个方法
-(jobsByNSIntegerBlock _Nonnull)selectingOneTagWithIndex{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        /// 纠错
        if(index > self.buttonsArray.count - 1) index = self.buttonsArray.count - 1;
        if(index < 0) index = 0;
        
        JobsLog(@"当前选择：%lu",(unsigned long)index);
        self.current_index = index;
        /// 全部还原
        int t = 0;
        for (UIButton *subButton in self.buttonsArray) {
            subButton.selected = NO;
            /// 重设按钮纯文本标题
            subButton.jobsResetBtnTitle(self.buttonModels[t].title);
            /// 重设按钮纯文本标题字体
            subButton.jobsResetTitleFont(self.buttonModels[t].titleFont);
            /// 重设按钮纯文本标题文字颜色
            subButton.jobsResetBtnTitleCor(self.buttonModels[t].titleCor);
            /// 重设按钮图片
            subButton.jobsResetBtnImage(self.buttonModels[t].normalImage);
            /// 重设按钮背景图片
            subButton.jobsResetBtnBgImage(self.buttonModels[t].backgroundImage);
            t+=1;
        }
        UIButton *currentBtn = self.buttonsArray[index];
        currentBtn.selected = YES;
    
        self.sliderView.resetCenterX(currentBtn.centerX);
        /// 重设按钮纯文本标题
        currentBtn.jobsResetBtnTitle(Jobs3TO(self.buttonModels[index].selectedTitle,
                                             self.buttonModels[index].title));
        /// 重设按钮纯文本标题字体
        currentBtn.jobsResetTitleFont(Jobs3TO(self.buttonModels[index].selectedTitleFont,
                                              self.buttonModels[index].titleFont));
        /// 重设按钮纯文本标题文字颜色
        currentBtn.jobsResetBtnTitleCor(Jobs3TO(self.buttonModels[index].selectedTitleCor,
                                                self.buttonModels[index].titleCor));
        /// 重设按钮图片
        currentBtn.jobsResetBtnImage(Jobs3TO(self.buttonModels[index].highlightImage,
                                             self.buttonModels[index].normalImage));
        /// 重设按钮背景图片
        currentBtn.jobsResetBtnBgImage(Jobs3TO(self.buttonModels[index].highlightBackgroundImage,
                                               self.buttonModels[index].backgroundImage));
    };
}
#pragma mark —— lazyLoad
-(UIView *)sliderView{
    if(!_sliderView){
        _sliderView = UIView.new;
        _sliderView.resetSize(CGSizeMake(self.sliderW, self.sliderH));
        _sliderView.resetCenterX(self.buttonWidth / 2);
        _sliderView.resetOriginY(self.height - self.sliderH);
        _sliderView.backgroundColor = self.sliderColor;
        [self addSubview:_sliderView];
    }return _sliderView;
}

-(NSMutableArray<__kindof UIButton *> *)buttonsArray{
    if(!_buttonsArray){
        _buttonsArray = NSMutableArray.array;
    }return _buttonsArray;
}

-(UIColor *)sliderColor{
    if(!_sliderColor){
        _sliderColor = JobsRedColor;
    }return _sliderColor;
}

-(CGFloat)sliderH{
    if(!_sliderH){
        _sliderH = JobsWidth(30);
    }return _sliderH;
}

-(CGFloat)sliderW{
    if(!_sliderW){
        _sliderW = JobsWidth(1);
    }return _sliderW;
}

-(UIButtonModel *)buttonModel{
    if(!_buttonModel){
        _buttonModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.buttonConfiguration = nil;
            model.backgroundConfiguration = nil;
            model.buttonConfigurationTitleAlignment = UIButtonConfigurationTitleAlignmentAutomatic;
            model.textAlignment = NSTextAlignmentCenter;
            model.subTextAlignment = NSTextAlignmentCenter;
            model.normalImage = nil;
            model.highlightImage = nil;
            model.attributedTitle = nil;
            model.selectedAttributedTitle = nil;
            model.attributedSubTitle = nil;
            model.title = nil;
            model.subTitle = nil;
            model.titleFont = bayonRegular(JobsWidth(16));
            model.subTitleFont = nil;
            model.titleCor = JobsCor(@"#ABABAB");
            model.subTitleCor = nil;
            model.titleLineBreakMode = NSLineBreakByWordWrapping;
            model.subtitleLineBreakMode = NSLineBreakByWordWrapping;
            model.baseBackgroundColor = JobsWhiteColor;
            model.backgroundImage = nil;
            model.imagePadding = JobsWidth(0);
            model.titlePadding = JobsWidth(0);
            model.imagePlacement = NSDirectionalRectEdgeNone;
            model.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            model.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            model.contentInsets = jobsSameDirectionalEdgeInsets(0);
            model.cornerRadiusValue = JobsWidth(0);
            model.roundingCorners = UIRectCornerAllCorners;
            model.roundingCornersRadii = CGSizeZero;
            model.layerBorderCor = nil;
            model.borderWidth = JobsWidth(0);
            model.primaryAction = nil;
            model.longPressGestureEventBlock = nil;
            model.clickEventBlock = nil;
        });
    }return _buttonModel;
}
//@synthesize buttonModels = _buttonModels;
//-(NSMutableArray<UIButtonModel *> *)buttonModels{
//    if(!_buttonModels){
//        _buttonModels = NSMutableArray.array;
//    }return _buttonModels;
//}
@end
