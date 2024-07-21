
//
//  RPTaggedNavView.m
//  RPTaggedNavView
//
//  Created by Tao on 2018/8/8.
//  Copyright © 2018年 Tao. All rights reserved.
//
#import "JobsToggleNavView.h"

#define DefaultTagTextColor_normal [UIColor blackColor]
#define DefaultTagTextColor_selected [UIColor redColor]
#define DefaultTagTextFont_normal 15
#define DefaultTagTextFont_selected 22
#define DefaultSliderColor [UIColor redColor]
#define DefaultSliderH 1
#define DefaultSliderW 30

@interface JobsToggleNavView ()

@property(nonatomic,strong)NSMutableArray <__kindof UIButton *>*buttonsArray;
@property(nonatomic,strong)UIView *sliderView;
@property(nonatomic,assign)NSUInteger current_index;

@end

@implementation JobsToggleNavView
-(void)dealloc{
    NSLog(@"");
}
#pragma mark —— BaseProtocol
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
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
        self.backgroundColor = JobsWhiteColor;
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
//    return [PwdSettingView viewSizeWithModel:nil];
    return CGSizeMake(JobsWidth(40), JobsWidth(40));
}
#pragma mark —— 一些私有方法
-(CGFloat)buttonWidth{
    return self.width / self.dataArr.count;
}

-(void)createUI{
    self.backgroundColor = JobsWhiteColor;
    if(self.buttonsArray.count){
        [self.buttonsArray removeAllObjects];
    }
    for (int i = 0 ; i < self.dataArr.count ; i++) {
        @jobs_weakify(self)
        UIButton *button = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                             background:nil
                                                         titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                          textAlignment:NSTextAlignmentCenter
                                                       subTextAlignment:NSTextAlignmentCenter
                                                            normalImage:nil
                                                         highlightImage:nil
                                                        attributedTitle:nil
                                                selectedAttributedTitle:nil
                                                     attributedSubtitle:nil
                                                                  title:self.dataArr[i]
                                                               subTitle:nil
                                                              titleFont:UIFontSystemFontOfSize(self.tagTextFont_normal)
                                                           subTitleFont:nil
                                                               titleCor:self.tagTextColor_normal
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
                                             longPressGestureEventBlock:nil
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
}
#pragma mark —— 一些公有方法
/// 核心方法：拖动和点击的逻辑，都归属于这个方法
- (void)selectingOneTagWithIndex:(NSInteger)index{
    NSLog(@"当前选择：%lu",(unsigned long)index);
    if(index == self.current_index) return;
    self.current_index = index;
    /// 全部还原
    for (UIButton *subButton in self.buttonsArray) {
        subButton.selected = NO;
        subButton.jobsResetTitleFont(UIFontSystemFontOfSize(self.tagTextFont_normal));
        subButton.jobsResetBtnTitleCor(self.tagTextColor_normal);
    }
    UIButton *currentBtn = self.buttonsArray[index];
    currentBtn.selected = YES;
    
    self.sliderView.resetCenterX(currentBtn.centerX);
    currentBtn.jobsResetTitleFont(UIFontSystemFontOfSize(self.tagTextFont_selected));
    currentBtn.jobsResetBtnTitleCor(self.tagTextColor_selected);
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

-(UIColor *)tagTextColor_normal{
    if(!_tagTextColor_normal){
        _tagTextColor_normal = DefaultTagTextColor_normal;
    }return _tagTextColor_normal;
}

-(UIColor *)tagTextColor_selected{
    if(!_tagTextColor_selected){
        _tagTextColor_selected = DefaultTagTextColor_selected;
    }return _tagTextColor_selected;
}

-(CGFloat)tagTextFont_normal{
    if(!_tagTextFont_normal){
        _tagTextFont_normal = DefaultTagTextFont_normal;
    }return _tagTextFont_normal;
}

-(CGFloat)tagTextFont_selected{
    if(!_tagTextFont_selected){
        _tagTextFont_selected = DefaultTagTextFont_selected;
    }return _tagTextFont_selected;
}

-(UIColor *)sliderColor{
    if(!_sliderColor){
        _sliderColor = DefaultSliderColor;
    }return _sliderColor;
}

-(CGFloat)sliderH{
    if(!_sliderH){
        _sliderH = DefaultSliderH;
    }return _sliderH;
}

-(CGFloat)sliderW{
    if(!_sliderW){
        _sliderW = DefaultSliderW;
    }return _sliderW;
}

@end
