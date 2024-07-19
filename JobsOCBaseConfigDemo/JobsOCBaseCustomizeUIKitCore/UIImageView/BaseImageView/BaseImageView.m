//
//  BaseImageView.m
//  KJBannerViewDemo
//
//  Created by 杨科军 on 2021/2/19.
//  Copyright © 2021 杨科军. All rights reserved.
//

#import "BaseImageView.h"

@interface BaseImageView ()

@end

@implementation BaseImageView
#pragma mark —— UIViewModelProtocol
UIViewModelProtocol_synthesize
#pragma mark —— BaseProtocol
BaseProtocol_synthesize
#pragma mark —— BaseViewProtocol
BaseViewProtocol_synthesize

-(instancetype)init{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
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
        [self layoutSubviewsCutCnrByRoundingCorners:self.layoutSubviewsRectCorner
                                        cornerRadii:self.layoutSubviewsRectCornerSize];
    }
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
}
#pragma mark —— BaseViewProtocol
-(void)richElementsInViewWithModel:(id _Nullable)model{
    
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


@end
