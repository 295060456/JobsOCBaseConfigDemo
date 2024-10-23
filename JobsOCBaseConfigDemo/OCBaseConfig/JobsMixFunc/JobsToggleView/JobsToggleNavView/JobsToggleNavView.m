
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
@property(nonatomic,strong)__kindof UIView *sliderView;
/// Data
@property(nonatomic,assign)NSUInteger current_index;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*buttonModels;
@property(nonatomic,strong)NSMutableArray <__kindof UIButton *>*buttonsArray;

@end

@implementation JobsToggleNavView
JobsToggleNavViewProtocolSynthesize
-(void)dealloc{
    NSLog(@"");
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
        for (int i = 0 ; i < self.buttonModels.count ; i++) {
            BaseButton *button = BaseButton
                .initByButtonModel((UIButtonModel *)self.buttonModels[i])
                .byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel *_Nullable data) {
                    @jobs_strongify(self)
                    data.jobsX = self.buttonWidth * i + self.btn_each_offset * (i - 1);
                    data.jobsY = 0;
                    data.jobsWidth = jobs3TO(self.buttonModels[i].btn_width,self.buttonWidth);
                    data.jobsHeight = jobs3TO(self.buttonModels[i].btn_height,self.height);
                }));
//            UIButtonModel *buttonModel = self.buttonModels[i];
//            BaseButton *button = BaseButton.jobsInit()
//                .bgColor(buttonModel.baseBackgroundColor)
//                .jobsResetImagePlacement(buttonModel.imagePlacement)
//                .jobsResetImagePadding(buttonModel.imagePadding)
//                .jobsResetBtnImage(buttonModel.normalImage)
//                .jobsResetBtnBgImage(buttonModel.backgroundImage)
//                .jobsResetBtnTitleCor(buttonModel.titleCor)
//                .jobsResetBtnTitleFont(buttonModel.titleFont)
//                .jobsResetBtnTitle(buttonModel.title)
//                .onClick(buttonModel.onClickBlock)
//                .onLongPressGesture(buttonModel.onLongPressGestureEventBlock)
//                .byFrame(jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
//                    @jobs_strongify(self)
//                    data.jobsX = i * self.buttonWidth + (i ? self.btn_each_offset : 0);
//                    data.jobsY = 0;
//                    data.jobsWidth = jobs3TO(self.buttonModels[i].btn_width,self.buttonWidth);
//                    data.jobsHeight = jobs3TO(self.buttonModels[i].btn_height,self.height);
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
        self.buttonsArray[0].jobsResetBtnTitle(Jobs3TO(self.buttonModels[0].selected_title,
                                                       self.buttonModels[0].title));
        /// 重设按钮纯文本标题字体
        self.buttonsArray[0].jobsResetTitleFont(Jobs3TO(self.buttonModels[0].selected_titleFont,
                                                        self.buttonModels[0].titleFont));
        /// 重设按钮纯文本标题文字颜色
        self.buttonsArray[0].jobsResetBtnTitleCor(Jobs3TO(self.buttonModels[0].selected_titleCor,
                                                          self.buttonModels[0].titleCor));
        /// 重设按钮图片
        self.buttonsArray[0].jobsResetBtnImage(Jobs3TO(self.buttonModels[0].highlightImage,
                                                       self.buttonModels[0].normalImage));
        /// 重设按钮背景图片
        self.buttonsArray[0].jobsResetBtnBgImage(Jobs3TO(self.buttonModels[0].selected_backgroundImage,
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
    return self.width / self.buttonModels.count;
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
        
        NSLog(@"当前选择：%lu",(unsigned long)index);
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
        currentBtn.jobsResetBtnTitle(Jobs3TO(self.buttonModels[index].selected_title,
                                             self.buttonModels[index].title));
        /// 重设按钮纯文本标题字体
        currentBtn.jobsResetTitleFont(Jobs3TO(self.buttonModels[index].selected_titleFont,
                                              self.buttonModels[index].titleFont));
        /// 重设按钮纯文本标题文字颜色
        currentBtn.jobsResetBtnTitleCor(Jobs3TO(self.buttonModels[index].selected_titleCor,
                                                self.buttonModels[index].titleCor));
        /// 重设按钮图片
        currentBtn.jobsResetBtnImage(Jobs3TO(self.buttonModels[index].highlightImage,
                                             self.buttonModels[index].normalImage));
        /// 重设按钮背景图片
        currentBtn.jobsResetBtnBgImage(Jobs3TO(self.buttonModels[index].selected_backgroundImage,
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
//@synthesize buttonModels = _buttonModels;
//-(NSMutableArray<UIButtonModel *> *)buttonModels{
//    if(!_buttonModels){
//        _buttonModels = NSMutableArray.array;
//    }return _buttonModels;
//}
INIT_BUTTON_MODE
@end
