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
@synthesize index = _index;
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
    if (self.titleLabel.labelShowingType == UILabelShowingType_02) {
        self.layer.masksToBounds = true;
        if (!self.shouldAutoScroll){
            [super drawRect:rect];
        }
        [self setTextLayerScroll];
        self.normalTitle(JobsInternationalization(@""));
    }else{
        [super drawRect:rect];
    }
}
/// 【形成Frame后直接return，避免被其他中间过程修改】
-(void)layoutSubviews{
    [super layoutSubviews];
//    [self printValue];
    [self resetSubViews];
}

-(void)setFrame:(CGRect)frame{
    if (self.titleLabel.labelShowingType == UILabelShowingType_02) {
        [self.titleLabel setTextLayerScroll];
    }
    if (self.subtitleLabel.labelShowingType == UILabelShowingType_02) {
        [self.subtitleLabel setTextLayerScroll];
    }
    
    if(self.titleLabel.labelShowingType == UILabelShowingType_02 ||
       self.subtitleLabel.labelShowingType == UILabelShowingType_02){
        return;
    }else{
        [super setFrame:frame];
    }
}
#pragma mark —— 一些私有方法
/// 只能在-(void)layoutSubviews里面进行调用
-(void)resetSubViews{
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
        
        if (!jobsZeroRectValue(self.textLabelFrame) ||
            !jobsZeroRectValue(self.subTextLabelFrame) ||
            !jobsZeroRectValue(self.imageViewFrame)) return;
    }
    
    {/// 【组 2】UIButton 单独自定义设置系统自带控件的Size ❤️与组1、3属性互斥❤️
        if (!jobsZeroSizeValue(self.textLabelSize)) {
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.size = self.textLabelSize;
            titleLabelFrame.origin.x += self.textLabelFrameOffsetX;
            titleLabelFrame.origin.y += self.textLabelFrameOffsetY;
            self.titleLabel.frame = titleLabelFrame;
        }
        if (!jobsZeroSizeValue(self.subTextLabelSize)) {
            if (@available(iOS 15.0, *)) {
                CGRect subTitleLabelFrame = self.subtitleLabel.frame;
                subTitleLabelFrame.size = self.subTextLabelSize;
                subTitleLabelFrame.origin.x += self.subTextLabelFrameOffsetX;
                subTitleLabelFrame.origin.y += self.subTextLabelFrameOffsetY;
                self.subtitleLabel.frame = subTitleLabelFrame;
            }
        }
        if (!jobsZeroSizeValue(self.imageViewSize)) {
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.size = self.imageViewSize;
            imageViewFrame.origin.x += self.imageViewFrameOffsetX;
            imageViewFrame.origin.y += self.imageViewFrameOffsetY;
            self.imageView.frame = imageViewFrame;
        }
        
        if (!jobsZeroSizeValue(self.textLabelSize) ||
            !jobsZeroSizeValue(self.subTextLabelSize) ||
            !jobsZeroSizeValue(self.imageViewSize)) return;
    }
    
    {/// 【组 3】UIButton 单独自定义设置系统自带控件的长宽 ❤️与组1、2属性互斥❤️
        if (self.textLabelWidth) {
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.size.width = self.textLabelWidth;
            titleLabelFrame.origin.x += self.textLabelFrameOffsetX;
            titleLabelFrame.origin.y += self.textLabelFrameOffsetY;
            self.titleLabel.frame = titleLabelFrame;
        }
        if (self.textLabelHeight) {
            CGRect titleLabelFrame = self.titleLabel.frame;
            titleLabelFrame.size.height = self.textLabelHeight;
            titleLabelFrame.origin.x += self.textLabelFrameOffsetX;
            titleLabelFrame.origin.y += self.textLabelFrameOffsetY;
            self.titleLabel.frame = titleLabelFrame;
        }
        
        if (self.subTextLabelWidth) {
            if (@available(iOS 15.0, *)) {
                CGRect subTitleLabelFrame = self.subtitleLabel.frame;
                subTitleLabelFrame.size.width = self.subTextLabelWidth;
                subTitleLabelFrame.origin.x += self.subTextLabelFrameOffsetX;
                subTitleLabelFrame.origin.y += self.subTextLabelFrameOffsetY;
                self.subtitleLabel.frame = subTitleLabelFrame;
            }
        }
        if (self.subTextLabelHeight) {
            if (@available(iOS 15.0, *)) {
                CGRect subTitleLabelFrame = self.subtitleLabel.frame;
                subTitleLabelFrame.size.height = self.subTextLabelHeight;
                subTitleLabelFrame.origin.x += self.subTextLabelFrameOffsetX;
                subTitleLabelFrame.origin.y += self.subTextLabelFrameOffsetY;
                self.subtitleLabel.frame = subTitleLabelFrame;
            }
        }
        
        if (self.imageViewWidth) {
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.size.width = self.imageViewWidth;
            imageViewFrame.origin.x += self.textLabelFrameOffsetWidth;
            imageViewFrame.origin.y += self.textLabelFrameOffsetHeight;
            self.titleLabel.frame = imageViewFrame;
        }
        if (self.imageViewHeight) {
            CGRect imageViewFrame = self.imageView.frame;
            imageViewFrame.size.height = self.imageViewHeight;
            imageViewFrame.origin.x += self.textLabelFrameOffsetWidth;
            imageViewFrame.origin.y += self.textLabelFrameOffsetHeight;
            self.titleLabel.frame = imageViewFrame;
        }
        
        if (self.textLabelWidth ||
            self.textLabelHeight ||
            self.subTextLabelWidth ||
            self.subTextLabelHeight ||
            self.imageViewWidth ||
            self.imageViewHeight) return;
    }

    {/// UIButton 单独自定义设置系统自带控件的偏移量 ❤️与其他组属性不互斥❤️
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.offsetXForEach = self.textLabelFrameOffsetX;
            viewModel.offsetYForEach = self.textLabelFrameOffsetY;
            viewModel.offsetWidth = self.textLabelFrameOffsetWidth;
            viewModel.offsetHeight = self.textLabelFrameOffsetHeight;
            
            [self.titleLabel offsetForView:viewModel];
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.offsetXForEach = self.imageViewFrameOffsetX;
            viewModel.offsetYForEach = self.imageViewFrameOffsetY;
            viewModel.offsetWidth = self.imageViewFrameOffsetWidth;
            viewModel.offsetHeight = self.imageViewFrameOffsetHeight;
            
            [self.imageView offsetForView:viewModel];
        }
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
BaseButtonProtocol_synthesize
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInButtonWithModel:(id _Nullable)model{
    NSLog(@"");
}
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)buttonWidthWithModel:(id _Nullable)model{
    return 0;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)buttonHeightWithModel:(id _Nullable)model{
    return 0;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)buttonSizeWithModel:(id _Nullable)model{
    return CGSizeZero;
}
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)buttonFrameWithModel:(id _Nullable)model{
    return CGRectZero;
}

@end
