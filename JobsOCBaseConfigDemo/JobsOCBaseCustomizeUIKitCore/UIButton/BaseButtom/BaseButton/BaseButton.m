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
UIMarkProtocol_synthesize_part1
BaseButtonProtocol_synthesize
#pragma mark —— Sys
-(instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        JobsLog(@"");
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
/// 判断触摸点是否在 UITextView 内
/// 当 UIButton.enabled = NO时，此方法不响应
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    /// 如果触摸点在 UITextView 内部，忽略事件
    if ([hitView isKindOfClass:[UITextView class]]) {
        return nil; /// 将事件传递给 UIButton 的 superview
    }
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:UITextView.class]) {
            if(self.objectBlock) self.objectBlock(subview);
            CGPoint subPoint = [subview convertPoint:point fromView:self];
            if ([subview pointInside:subPoint withEvent:event]) {
                return subview; /// 返回 UITextView
            }
        }
    }return hitView; /// 默认返回按钮自身
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
    JobsLog(@"self.textLabelFrame = %@",NSStringFromCGRect(self.textLabelFrame));
    JobsLog(@"self.subTextLabelFrame = %@",NSStringFromCGRect(self.subTextLabelFrame));
    JobsLog(@"self.imageViewFrame = %@",NSStringFromCGRect(self.imageViewFrame));
    
    JobsLog(@"self.textLabelSize = %@",NSStringFromCGSize(self.textLabelSize));
    JobsLog(@"self.subTextLabelSize = %@",NSStringFromCGSize(self.subTextLabelSize));
    JobsLog(@"self.imageViewSize = %@",NSStringFromCGSize(self.imageViewSize));
    
    JobsLog(@"self.textLabelWidth = %f",self.textLabelWidth);
    JobsLog(@"self.textLabelHeight = %f",self.textLabelHeight);
    JobsLog(@"self.subTextLabelWidth = %f",self.subTextLabelWidth);
    JobsLog(@"self.subTextLabelHeight = %f",self.subTextLabelHeight);
    JobsLog(@"self.imageViewWidth = %f",self.imageViewWidth);
    JobsLog(@"self.imageViewHeight = %f",self.imageViewHeight);
    
    JobsLog(@"self.textLabelFrameOffsetX = %f",self.textLabelFrameOffsetX);
    JobsLog(@"self.textLabelFrameOffsetY = %f",self.textLabelFrameOffsetY);
    JobsLog(@"self.textLabelFrameOffsetWidth = %f",self.textLabelFrameOffsetWidth);
    JobsLog(@"self.textLabelFrameOffsetHeight = %f",self.textLabelFrameOffsetHeight);
    
    JobsLog(@"self.subTextLabelFrameOffsetX = %f",self.subTextLabelFrameOffsetX);
    JobsLog(@"self.subTextLabelFrameOffsetY = %f",self.subTextLabelFrameOffsetY);
    JobsLog(@"self.subTextLabelFrameOffsetWidth = %f",self.subTextLabelFrameOffsetWidth);
    JobsLog(@"self.subTextLabelFrameOffsetHeight = %f",self.subTextLabelFrameOffsetHeight);
    
    JobsLog(@"self.imageViewFrameOffsetX = %f",self.imageViewFrameOffsetX);
    JobsLog(@"self.imageViewFrameOffsetY = %f",self.imageViewFrameOffsetY);
    JobsLog(@"self.imageViewFrameOffsetWidth = %f",self.imageViewFrameOffsetWidth);
    JobsLog(@"self.imageViewFrameOffsetHeight = %f",self.imageViewFrameOffsetHeight);
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
        self.jobsResetBtnImage(selected ? buttonModel.highlightImage : buttonModel.normalImage);
    }
}

@end
