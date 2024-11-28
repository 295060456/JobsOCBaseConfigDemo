//
//  BaseButton.m
//  DouDong-II
//
//  Created by Jobs on 2021/6/1.
//

#import "BaseButton.h"

@interface BaseButton ()

@end

@implementation BaseButton
BaseProtocol_synthesize
UIMarkProtocol_synthesize
BaseButtonProtocol_synthesize
#pragma mark —— Sys
-(instancetype)init{
    if (self = [super init]) {
        NSLog(@"");
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"");
    }return self;
}

+(instancetype)buttonWithConfiguration:(UIButtonConfiguration *)configuration
                         primaryAction:(nullable UIAction *)primaryAction{
    return [super buttonWithConfiguration:configuration primaryAction:primaryAction];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
/// 【形成Frame后直接return，避免被其他中间过程修改】
-(void)layoutSubviews{
    [super layoutSubviews];
//    [self printValue];
    [self resetSubViews];
    
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"_UISystemBackgroundView")]) {
            subview.frame = self.bounds;
        }
    }
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}
#pragma mark —— 一些私有方法
/// 只能在-(void)layoutSubviews里面进行调用
-(void)resetSubViews{
    @jobs_weakify(self)
    {/// 【组 1】UIButton 单独自定义设置系统自带控件的Frame ❤️与组2、3属性互斥❤️
        if (!jobsZeroRectValue(self.textLabelFrame)) {
            self.titleLabel.frame = self.textLabelFrame;
        }
        if (!jobsZeroRectValue(self.subTextLabelFrame)) {
            if (@available(iOS 15.0, *)) {
                self.subtitleLabel.frame = self.subTextLabelFrame;
            }
        }
        if (!jobsZeroRectValue(self.imageViewFrame)) {
            self.imageView.frame = self.imageViewFrame;
        }
    }
    
    {/// 【组 2】UIButton 单独自定义设置系统自带控件的Size ❤️与组1、3属性互斥❤️
        {
            if (!jobsZeroSizeValue(self.textLabelSize)) {
                self.titleLabel.resetSize(self.textLabelSize);
            }
            self.titleLabel.resetOriginXByOffset(self.textLabelFrameOffsetX);
            self.titleLabel.resetOriginYByOffset(self.textLabelFrameOffsetY);
        }
        
        {
            if (@available(iOS 15.0, *)) {
                if(!jobsZeroSizeValue(self.subTextLabelSize)){
                    self.subtitleLabel.resetSize(self.subTextLabelSize);
                }
                self.subtitleLabel.resetOriginXByOffset(self.subTextLabelFrameOffsetX);
                self.subtitleLabel.resetOriginYByOffset(self.subTextLabelFrameOffsetY);
            }
        }
        
        {
            if (!jobsZeroSizeValue(self.imageViewSize)) {
                self.imageView.resetSize(self.imageViewSize);
            }
            self.imageView.resetOriginXByOffset(self.imageViewFrameOffsetX);
            self.imageView.resetOriginYByOffset(self.imageViewFrameOffsetY);
        }
    }
    
    {/// 【组 2】UIButton 单独自定义设置系统自带控件的Size ❤️与组1、3属性互斥❤️
        {
            if (!jobsZeroSizeValue(self.textLabelSize)) {
                self.titleLabel.resetSize(self.textLabelSize);
            }
            if(self.textLabelFrameResetX){
                self.titleLabel.resetOriginX(self.textLabelFrameResetX);
            }
            if(self.textLabelFrameResetY){
                self.titleLabel.resetOriginY(self.textLabelFrameResetY);
            }
        }
        
        {
            if (!jobsZeroSizeValue(self.subTextLabelSize)) {
                if (@available(iOS 15.0, *)) {
                    self.subtitleLabel.resetSize(self.subTextLabelSize);
                }
            }
            if(self.subTextLabelFrameResetX){
                if (@available(iOS 15.0, *)) {
                    self.subtitleLabel.resetOriginX(self.subTextLabelFrameResetX);
                }
            }
            if(self.subTextLabelFrameResetY){
                if (@available(iOS 15.0, *)) {
                    self.subtitleLabel.resetOriginY(self.subTextLabelFrameResetY);
                }
            }
        }

        {
            if (!jobsZeroSizeValue(self.imageViewSize)) {
                self.imageView.resetSize(self.imageViewSize);
            }
            if (self.imageViewFrameResetX) {
                self.imageView.resetOriginX(self.imageViewFrameResetX);
            }
            if (self.imageViewFrameResetY) {
                self.imageView.resetOriginY(self.imageViewFrameResetY);
            }
        }
    }
    
    {/// 【组 3】UIButton 单独自定义设置系统自带控件的长宽 ❤️与组1、2属性互斥❤️
        {
            self.titleLabel.resetWidthByOffset(self.textLabelWidth);
            self.titleLabel.resetHeightByOffset(self.textLabelHeight);
            self.titleLabel.resetOriginXByOffset(self.textLabelFrameOffsetX);
            self.titleLabel.resetOriginYByOffset(self.textLabelFrameOffsetY);
        }
        
        {
            if (@available(iOS 15.0, *)) {
                self.subtitleLabel.resetWidthByOffset(self.subTextLabelWidth);
                self.subtitleLabel.resetHeightByOffset(self.subTextLabelHeight);
                self.subtitleLabel.resetOriginXByOffset(self.subTextLabelFrameOffsetX);
                self.subtitleLabel.resetOriginYByOffset(self.subTextLabelFrameOffsetY);
            }
        }

        {
            self.imageView.resetWidthByOffset(self.imageViewWidth);
            self.imageView.resetHeightByOffset(self.imageViewHeight);
            self.imageView.resetOriginXByOffset(self.imageViewFrameOffsetX);
            self.imageView.resetOriginYByOffset(self.imageViewFrameOffsetY);
        }
    }

    {/// UIButton 单独自定义设置系统自带控件的偏移量 ❤️与其他组属性不互斥❤️
        self.titleLabel.offsetForView(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            @jobs_strongify(self)
            viewModel.offsetXForEach = self.textLabelFrameOffsetX;
            viewModel.offsetYForEach = self.textLabelFrameOffsetY;
            viewModel.offsetWidth = self.textLabelFrameOffsetWidth;
            viewModel.offsetHeight = self.textLabelFrameOffsetHeight;
        }));
        self.imageView.offsetForView(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            @jobs_strongify(self)
            viewModel.offsetXForEach = self.imageViewFrameOffsetX;
            viewModel.offsetYForEach = self.imageViewFrameOffsetY;
            viewModel.offsetWidth = self.imageViewFrameOffsetWidth;
            viewModel.offsetHeight = self.imageViewFrameOffsetHeight;
        }));
    }
}

-(void)printValue{
    NSLog(@"self.textLabelFrame = %@",NSStringFromCGRect(self.textLabelFrame));
    NSLog(@"self.subTextLabelFrame = %@",NSStringFromCGRect(self.subTextLabelFrame));
    NSLog(@"self.imageViewFrame = %@",NSStringFromCGRect(self.imageViewFrame));
    
    NSLog(@"self.textLabelSize = %@",NSStringFromCGSize(self.textLabelSize));
    NSLog(@"self.subTextLabelSize = %@",NSStringFromCGSize(self.subTextLabelSize));
    NSLog(@"self.imageViewSize = %@",NSStringFromCGSize(self.imageViewSize));
    
    NSLog(@"self.textLabelWidth = %f",self.textLabelWidth);
    NSLog(@"self.textLabelHeight = %f",self.textLabelHeight);
    NSLog(@"self.subTextLabelWidth = %f",self.subTextLabelWidth);
    NSLog(@"self.subTextLabelHeight = %f",self.subTextLabelHeight);
    NSLog(@"self.imageViewWidth = %f",self.imageViewWidth);
    NSLog(@"self.imageViewHeight = %f",self.imageViewHeight);
    
    NSLog(@"self.textLabelFrameOffsetX = %f",self.textLabelFrameOffsetX);
    NSLog(@"self.textLabelFrameOffsetY = %f",self.textLabelFrameOffsetY);
    NSLog(@"self.textLabelFrameOffsetWidth = %f",self.textLabelFrameOffsetWidth);
    NSLog(@"self.textLabelFrameOffsetHeight = %f",self.textLabelFrameOffsetHeight);
    
    NSLog(@"self.subTextLabelFrameOffsetX = %f",self.subTextLabelFrameOffsetX);
    NSLog(@"self.subTextLabelFrameOffsetY = %f",self.subTextLabelFrameOffsetY);
    NSLog(@"self.subTextLabelFrameOffsetWidth = %f",self.subTextLabelFrameOffsetWidth);
    NSLog(@"self.subTextLabelFrameOffsetHeight = %f",self.subTextLabelFrameOffsetHeight);
    
    NSLog(@"self.imageViewFrameOffsetX = %f",self.imageViewFrameOffsetX);
    NSLog(@"self.imageViewFrameOffsetY = %f",self.imageViewFrameOffsetY);
    NSLog(@"self.imageViewFrameOffsetWidth = %f",self.imageViewFrameOffsetWidth);
    NSLog(@"self.imageViewFrameOffsetHeight = %f",self.imageViewFrameOffsetHeight);
}
#pragma mark —— BaseButtonProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richButtonByModel{
    return ^(id _Nullable data){
        
    };
}
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)buttonWidthByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)buttonHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.0f;
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)buttonSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeZero;
    };
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGRectByIDBlock _Nonnull)buttonFrameByModel{
    return ^CGRect(id _Nullable data){
        return CGRectZero;
    };
}
@synthesize selected = _selected;
-(void)setSelected:(BOOL)selected{
    _selected = selected;
    if([self.data isKindOfClass:UIViewModel.class]){
        UIViewModel *viewModel = (UIViewModel *)self.data;
        self.jobsResetBtnImage(selected ? viewModel.selectedImage_ : viewModel.image);
    }
    if([self.data isKindOfClass:UIButtonModel.class]){
        UIButtonModel *buttonModel = (UIButtonModel *)self.data;
//        self.jobsResetBtnImage(selected ? buttonModel.highlightImage : buttonModel.normalImage);
        if(selected){
            self.jobsResetBtnImage(buttonModel.highlightImage);
        }else{
            self.jobsResetBtnImage(buttonModel.normalImage);
        }
    }
}

@end
