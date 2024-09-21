//
//  BaseView.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/2/5.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()
/// Data
@property(nonatomic,strong)UIButtonModel *closeBtnModel;
@property(nonatomic,strong)UIButtonModel *backBtnModel;
@property(nonatomic,copy)jobsByBtnBlock backBtnClickAction;
@property(nonatomic,copy)jobsByBtnBlock closeBtnClickAction;

@end

@implementation BaseView
#pragma mark —— UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseProtocol
BaseProtocol_synthesize
#pragma mark —— BaseViewProtocol
BaseViewProtocol_synthesize

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
/**
 1. 刷新完成后触发 layoutsubview
 UICollectionView 在 reloaddata 后, 会触发 layoutsubview , 可以继承父类的 superview 方法, 在其中处理需要在刷新完数据后做的操作, 如播放短视频.

 2. 使用layoutIfNeeded方法，强制重绘
 在 UICollectionView 调用 reloaddata 方法后, 强制调用其 layoutIfNeeded 方法, 接着调用刷新完后的操作.
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    /// 在这里设置这个View的size，外界设置的话，在某些情况下会因为内部生命周期的问题，导致异常
    // self.size = [MSPayView viewSizeWithModel:nil];
    if(!CGSizeEqualToSize(CGSizeZero, self.layoutSubviewsRectCornerSize)){
        [self appointCornerCutToCircleByRoundingCorners:self.layoutSubviewsRectCorner
                                        cornerRadii:self.layoutSubviewsRectCornerSize];
    }
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
    };
}
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewWidthWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewHeightWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForFooterInSection:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForHeaderInSection:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectZero;
}
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeXWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeYWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeWidthWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeHeightWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
/// 数据（字符串）定宽
+(CGFloat)widthByData:(UIViewModel *_Nonnull)data{
    return 0.0f;
}
/// 数据（字符串）定高
+(CGFloat)heightByData:(UIViewModel *_Nonnull)data{
    return 0.0f;
}
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewWidthWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewHeightWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)heightForFooterInSection:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)heightForHeaderInSection:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGRect)viewFrameWithModel:(id _Nullable)model{
    return CGRectZero;
}
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeXWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeYWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeWidthWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeHeightWithModel:(id _Nullable)model{
    return 0.0f;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
-(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
/// 数据（字符串）定宽
-(CGFloat)widthByData:(UIViewModel *_Nonnull)data{
    return 0.0f;
}
/// 数据（字符串）定高
-(CGFloat)heightByData:(UIViewModel *_Nonnull)data{
    return 0.0f;
}
#pragma mark —— BaseViewProtocol
-(void)actionNavBarBackBtnClickBlock:(jobsByBtnBlock)objectBlock{
    self.backBtnClickAction = objectBlock;
}
    
-(void)actionNavBarCloseBtnClickBlock:(jobsByBtnBlock)objectBlock{
    self.closeBtnClickAction = objectBlock;
}
#pragma mark —— lazyLoad
-(JobsReturnNavBarConfigByButtonModelBlock)makeNavBarConfig{
    @jobs_weakify(self)
    return ^(UIButtonModel *_Nullable backBtnModel,
             UIButtonModel *_Nullable closeBtnModel) {
        @jobs_strongify(self)
        JobsNavBarConfig *_navBarConfig = JobsNavBarConfig.new;
        _navBarConfig.bgCor = self.viewModel.navBgCor;
        _navBarConfig.bgImage = self.viewModel.navBgImage;
        _navBarConfig.attributedTitle = self.viewModel.backBtnTitleModel.attributedText;
        _navBarConfig.title = self.viewModel.textModel.text;
        _navBarConfig.font = self.viewModel.textModel.font;
        _navBarConfig.titleCor = self.viewModel.textModel.textCor;
        _navBarConfig.backBtnModel = backBtnModel ? : self.backBtnModel;
        _navBarConfig.closeBtnModel = closeBtnModel ? : self.closeBtnModel;
        self.navBarConfig = _navBarConfig;
        return _navBarConfig;
    };
}

-(JobsNavBar *)navBar{
    if(!_navBar){
        _navBar = JobsNavBar.new;
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            self.navBarConfig.backBtnModel.btn_offset_x = self.navBarConfig.backBtnModel.btn_offset_x ? : JobsWidth(40);
            self.navBarConfig.closeBtnModel.btn_offset_x = self.navBarConfig.closeBtnModel.btn_offset_x ? : JobsWidth(40);
        }
        NSLog(@"%f",self.navBarConfig.backBtnModel.btn_offset_x);
        NSLog(@"%f",self.navBarConfig.closeBtnModel.btn_offset_x);
//        if(!self.navBarConfig.title) self.navBarConfig.title = self.viewModel.textModel.text;
        _navBar.navBarConfig = self.navBarConfig;
        [self addSubview:_navBar];
        [_navBar mas_makeConstraints:^(MASConstraintMaker *make) {
            if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                make.top.equalTo(self);
            }else{
                make.top.equalTo(self).offset(JobsStatusBarHeight());
            }
            make.left.right.equalTo(self);
            make.height.mas_equalTo(JobsWidth(40));
        }];
        [self layoutIfNeeded];
        _navBar.jobsRichElementsInViewWithModel(nil);
        @jobs_weakify(self)
        [_navBar actionNavBarBackBtnClickBlock:^(UIButton * _Nullable x) {
            @jobs_strongify(self)
            self.jobsBackBtnClickEvent(x);
            if(self.backBtnClickAction) self.backBtnClickAction(x);
        }];
        [_navBar actionNavBarCloseBtnClickBlock:^(UIButton * _Nullable x) {
            @jobs_strongify(self)
            if(self.closeBtnClickAction)self.closeBtnClickAction(x);
        }];
    }return _navBar;
}

-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = UIButtonModel.new;
        _closeBtnModel.backgroundImage = JobsIMG(@"联系我们");
//        _closeBtnModel.selected_backgroundImage = JobsIMG(@"联系我们");
//        _closeBtnModel.normalImage = JobsIMG(@"联系我们");
//        _closeBtnModel.highlightImage = JobsIMG(@"联系我们");
//        _closeBtnModel.imagePadding = JobsWidth(5);
        _closeBtnModel.roundingCorners = UIRectCornerAllCorners;
        _closeBtnModel.baseBackgroundColor = JobsClearColor;
    }return _closeBtnModel;
}

-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        _backBtnModel = UIButtonModel.new;
//        _backBtnModel.backgroundImage = JobsIMG(@"返回");
//        _backBtnModel.selected_backgroundImage = JobsIMG(@"返回");
        _backBtnModel.normalImage = JobsIMG(@"返回");
        _backBtnModel.highlightImage = JobsIMG(@"返回");
        _backBtnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _backBtnModel.title = self.viewModel.backBtnTitleModel.text;
        _backBtnModel.titleCor = JobsBlackColor;
        _backBtnModel.selected_titleCor = JobsBlackColor;
        _backBtnModel.roundingCorners = UIRectCornerAllCorners;
        _backBtnModel.imagePlacement = NSDirectionalRectEdgeLeading;
        _backBtnModel.imagePadding = JobsWidth(5);
        @jobs_weakify(self)
        _backBtnModel.longPressGestureEventBlock = ^id(id _Nullable weakSelf,
                                                       id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        };
        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            self.jobsBackBtnClickEvent(x);
            return nil;
        };
    }return _backBtnModel;
}

@end
