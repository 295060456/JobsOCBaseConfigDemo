
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
                                             longPressGestureEventBlock:^(id  _Nullable weakSelf,
                                                                          id  _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
        }
                                                        clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            /// 跟随的指示器
            [UIView animateWithDuration:0.2
                             animations:^{
                @jobs_strongify(self)
                self.sliderView.resetCenterX(x.centerX);
            }];
            
            {/// 按钮
                for (UIButton *subButton in self.buttonsArray) {
                    subButton.selected = NO;
                    subButton.jobsResetTitleFont(UIFontSystemFontOfSize(self.tagTextFont_normal));
                    subButton.jobsResetBtnTitleCor(self.tagTextColor_normal);
                }
                
                x.selected = !x.selected;
                x.jobsResetTitleFont(UIFontSystemFontOfSize(self.tagTextFont_selected));
                x.jobsResetBtnTitleCor(self.tagTextColor_selected);
            }
            /// 最外层的View联动
            if (self.objectBlock) self.objectBlock(x);

            return nil;
        }];
        button.frame = CGRectMake(i * self.buttonWidth,
                                  0,
                                  self.buttonWidth,
                                  self.height);
        button.tag = 1000 + i;
        [self.buttonsArray addObject:button];
        [self addSubview:button];
    }
    self.sliderView.alpha = 1;
}
#pragma mark —— 一些公有方法
/// 选择某一个标签
- (void)selectingOneTagWithIndex:(NSInteger)index{
    NSInteger s_btnTagIndex = index + 1000;
    for (UIButton *subButton in self.buttonsArray) {
        /// 此时的subButton，不是当前点击的subButton
        if (s_btnTagIndex != subButton.tag) {
            subButton.selected = NO;
            subButton.titleLabel.font = UIFontSystemFontOfSize(self.tagTextFont_normal);
        }
        /// 此时的subButton，就是当前点击的subButton
        else{
            @jobs_weakify(self)
            [UIView animateWithDuration:0.2
                             animations:^{
                @jobs_strongify(self)
                NSLog(@"gsgsg");
                self.sliderView.resetCenterX(subButton.centerX);
            } completion:^(BOOL finished) {
                subButton.selected = YES;
                subButton.titleLabel.font = UIFontSystemFontOfSize(self.tagTextFont_selected);
            }];
        }
    }
}
#pragma mark —— lazyLoad
-(UIView *)sliderView{
    if(!_sliderView){
        _sliderView = UIView.new;
        _sliderView.frame = CGRectMake(0,
                                       self.height - self.sliderH,
                                       self.sliderW,
                                       self.sliderH);

        _sliderView.centerX = self.buttonWidth / 2;
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
