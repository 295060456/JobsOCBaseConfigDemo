
//
//  RPTaggedNavView.m
//  RPTaggedNavView
//
//  Created by Tao on 2018/8/8.
//  Copyright © 2018年 Tao. All rights reserved.
//
#import "JobsToggleNavView.h"

@interface JobsToggleNavView ()

@property(nonatomic,strong)NSMutableArray <__kindof UIButton *>*buttonsArray;
@property(nonatomic,strong)UIView *sliderView;
@property(nonatomic,assign)NSUInteger current_index;

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
//    [self layoutSubviewsCutCnrByRoundingCorners:UIRectCornerAllCorners
//                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
//    self.viewModel = model ? : UIViewModel.new;
//    MakeDataNull
    [self createUI];
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(340), JobsWidth(500));
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return [PwdSettingView viewSizeWithModel:nil];
}
#pragma mark —— 一些私有方法
-(CGFloat)buttonWidth{
    return self.width / self.dataArr.count;
}

-(void)createUI{
//    self.backgroundColor = JobsWhiteColor;
    if(self.buttonsArray.count){
        [self.buttonsArray removeAllObjects];
    }// selected_backgroundImage
    for (int i = 0 ; i < self.dataArr.count ; i++) {
        @jobs_weakify(self)
        UIButton *button = [BaseButton.alloc jobsInitBtnByConfiguration:self.buttonModel.btnConfiguration
                                                             background:self.buttonModel.background
                                                         titleAlignment:self.buttonModel.buttonConfigTitleAlignment
                                                          textAlignment:self.buttonModel.textAlignment
                                                       subTextAlignment:self.buttonModel.subTextAlignment
                                                            normalImage:self.buttonModel.normalImage
                                                         highlightImage:self.buttonModel.highlightImage
                                                        attributedTitle:self.buttonModel.attributedTitle
                                                selectedAttributedTitle:self.buttonModel.selectedAttributedTitle
                                                     attributedSubtitle:self.buttonModel.attributedSubtitle
                                                                  title:self.dataArr[i]
                                                               subTitle:nil
                                                              titleFont:self.buttonModel.titleFont
                                                           subTitleFont:self.buttonModel.subTitleFont
                                                               titleCor:self.buttonModel.titleCor
                                                            subTitleCor:self.buttonModel.subTitleCor
                                                     titleLineBreakMode:self.buttonModel.titleLineBreakMode
                                                  subtitleLineBreakMode:self.buttonModel.subtitleLineBreakMode
                                                    baseBackgroundColor:self.buttonModel.baseBackgroundColor
                                                        backgroundImage:self.buttonModel.normal_backgroundImages[i]
                                                           imagePadding:self.buttonModel.imagePadding
                                                           titlePadding:self.buttonModel.titlePadding
                                                         imagePlacement:self.buttonModel.imagePlacement
                                             contentHorizontalAlignment:self.buttonModel.contentHorizontalAlignment
                                               contentVerticalAlignment:self.buttonModel.contentVerticalAlignment
                                                          contentInsets:self.buttonModel.contentInsets
                                                      cornerRadiusValue:self.buttonModel.cornerRadiusValue
                                                        roundingCorners:self.buttonModel.roundingCorners
                                                   roundingCornersRadii:self.buttonModel.roundingCornersRadii
                                                         layerBorderCor:self.buttonModel.layerBorderCor
                                                            borderWidth:self.buttonModel.borderWidth
                                                          primaryAction:self.buttonModel.primaryAction
                                             longPressGestureEventBlock:self.buttonModel.longPressGestureEventBlock
                                                        clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            /// 最外层的View联动
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];

        button.frame = CGRectMake(i * self.buttonWidth,
                                  0,
                                  self.buttonWidth,
                                  self.height);
        button.index = self.buttonsArray.count;
//        NSLog(@"sss = %ld",(long)button.index);
        [self.buttonsArray addObject:button];
        [self addSubview:button];
    }
    self.current_index = 0;
    self.sliderView.alpha = 1;
    
    self.buttonsArray[0].jobsResetTitleFont(self.buttonModel.selected_titleFont);
    self.buttonsArray[0].jobsResetBtnTitleCor(self.buttonModel.selected_titleCor);
    self.buttonsArray[0].jobsResetBtnBgImage(self.buttonModel.selected_backgroundImages[0]);
    self.buttonsArray[0].selected = YES;
}
#pragma mark —— 一些公有方法
/// 核心方法：拖动和点击的逻辑，都归属于这个方法
- (void)selectingOneTagWithIndex:(NSInteger)index{
    /// 纠错
    if(index > self.buttonsArray.count - 1) index = self.buttonsArray.count - 1;
    if(index < 0) index = 0;
    
    NSLog(@"当前选择：%lu",(unsigned long)index);
    if(index == self.current_index) return;
    self.current_index = index;
    /// 全部还原
    int t = 0;
    for (UIButton *subButton in self.buttonsArray) {
        subButton.selected = NO;
        subButton.jobsResetTitleFont(self.buttonModel.titleFont);
        subButton.jobsResetBtnTitleCor(self.buttonModel.titleCor);
        subButton.jobsResetBtnBgImage(self.buttonModel.normal_backgroundImages[t]);
        t+=1;
    }
    UIButton *currentBtn = self.buttonsArray[index];
    currentBtn.selected = YES;
    
    self.sliderView.resetCenterX(currentBtn.centerX);
    currentBtn.jobsResetTitleFont(self.buttonModel.selected_titleFont);
    currentBtn.jobsResetBtnTitleCor(self.buttonModel.selected_titleCor);
    currentBtn.jobsResetBtnBgImage(self.buttonModel.selected_backgroundImages[index]);
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
INIT_BUTTON_MODE
@end
