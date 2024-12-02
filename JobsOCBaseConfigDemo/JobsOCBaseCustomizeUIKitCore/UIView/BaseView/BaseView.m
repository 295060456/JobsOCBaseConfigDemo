//
//  BaseView.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2021/2/5.
//  Copyright © 2021 MonkeyKingVideo. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()

@end

@implementation BaseView
BaseProtocol_synthesize
BaseViewProtocol_synthesize
UIPictureAndBackGroundCorProtocol_synthesize
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
    // self.size = MSPayView.viewSizeByModel(nil);
    if(!CGSizeEqualToSize(CGSizeZero, self.layoutSubviewsRectCornerSize)){
        [self appointCornerCutToCircleByRoundingCorners:self.layoutSubviewsRectCorner
                                            cornerRadii:self.layoutSubviewsRectCornerSize];
    }
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
}
#pragma mark —— lazyLoad
-(JobsReturnNavBarConfigByButtonModelBlock)makeNavBarConfig{
    return ^(UIButtonModel *_Nullable backBtnModel,
             UIButtonModel *_Nullable closeBtnModel) {
        @jobs_weakify(self)
        return jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
            @jobs_strongify(self)
            data.bgCor = self.viewModel.navBgCor;
            data.bgImage = self.viewModel.navBgImage;
            data.attributedTitle = self.viewModel.backBtnTitleModel.attributedTitle;
            data.title = self.viewModel.textModel.text;
            data.font = self.viewModel.textModel.font;
            data.titleCor = self.viewModel.textModel.textCor;
            data.backBtnModel = backBtnModel ? : self.backBtnModel;
            data.closeBtnModel = closeBtnModel ? : self.closeBtnModel;
            self.navBarConfig = data;
        });
    };
}

-(JobsNavBar *)navBar{
    if(!_navBar){
        @jobs_weakify(self)
        _navBar = jobsMakeNavBar(^(__kindof JobsNavBar *_Nullable data) {
            @jobs_strongify(self)
            if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                self.navBarConfig.backBtnModel.btn_offset_x = self.navBarConfig.backBtnModel.btn_offset_x ? : JobsWidth(40);
                self.navBarConfig.closeBtnModel.btn_offset_x = self.navBarConfig.closeBtnModel.btn_offset_x ? : JobsWidth(40);
            }
            NSLog(@"%f",self.navBarConfig.backBtnModel.btn_offset_x);
            NSLog(@"%f",self.navBarConfig.closeBtnModel.btn_offset_x);
    //        if(!self.navBarConfig.title) self.navBarConfig.title = self.viewModel.textModel.text;
            data.navBarConfig = self.navBarConfig;
            self.addSubview(data);
            [data mas_makeConstraints:^(MASConstraintMaker *make) {
                if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                    make.top.equalTo(self);
                }else{
                    make.top.equalTo(self).offset(JobsStatusBarHeight());
                }
                make.left.right.equalTo(self);
                make.height.mas_equalTo(JobsWidth(40));
            }];self.refresh();
            data.jobsRichViewByModel(nil);
            @jobs_weakify(self)
            [data actionNavBarBackBtnClickBlock:^(UIButton * _Nullable x) {
                @jobs_strongify(self)
                self.jobsBackBtnClickEvent(x);
                if(self.backBtnClickAction) self.backBtnClickAction(x);
            }];
            [data actionNavBarCloseBtnClickBlock:^(UIButton * _Nullable x) {
                @jobs_strongify(self)
                if(self.closeBtnClickAction)self.closeBtnClickAction(x);
            }];
        });
    }return _navBar;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.backgroundImage = JobsIMG(@"联系我们");
    //        data.selected_backgroundImage = JobsIMG(@"联系我们");
    //        data.jobsResetBtnImage = JobsIMG(@"联系我们");
    //        data.highlightImage = JobsIMG(@"联系我们");
    //        data.imagePadding = JobsWidth(5);
            data.roundingCorners = UIRectCornerAllCorners;
            data.baseBackgroundColor = JobsClearColor;
        });
    }return _closeBtnModel;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel;
        _backBtnModel.longPressGestureEventBlock = ^id(__kindof UIButton *x) {
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
