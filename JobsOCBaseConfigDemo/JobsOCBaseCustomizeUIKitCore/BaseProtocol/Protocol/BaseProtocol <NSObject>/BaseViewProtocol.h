//
//  BaseViewProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

@class UIViewModel;

typedef NS_ENUM(NSInteger, JobsHeaderFooterViewStyle) {
    JobsHeaderViewStyle = 0,
    JobsFooterViewStyle
};

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <BaseProtocol>

@optional
/// 作用于-(void)layoutSubviews的圆切角参数
@property(nonatomic,assign)UIRectCorner layoutSubviewsRectCorner;
@property(nonatomic,assign)CGSize layoutSubviewsRectCornerSize;
/// 记录该View的Masonry约束情况
@property(nonatomic,strong)NSMutableArray <MASConstraint *>*constraintMutArr;
/// 视图长、宽、高的定义
@property(nonatomic,assign)CGSize thisViewSize;
/// 标记是HeaderView 还是 FooterView
@property(nonatomic,assign)JobsHeaderFooterViewStyle headerFooterViewStyle;
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model;
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewWidthWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewHeightWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForFooterInSection:(id _Nullable)model;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForHeaderInSection:(id _Nullable)model;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGRect)viewFrameWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeXWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeYWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeWidthWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)viewChangeHeightWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model;
/// 数据（字符串）定宽
+(CGFloat)widthByData:(UIViewModel *_Nonnull)data;
/// 数据（字符串）定高
+(CGFloat)heightByData:(UIViewModel *_Nonnull)data;
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewWidthWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewHeightWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)heightForFooterInSection:(id _Nullable)model;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)heightForHeaderInSection:(id _Nullable)model;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGSize)viewSizeWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGRect)viewFrameWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeXWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeYWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeWidthWithModel:(id _Nullable)model;
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)viewChangeHeightWithModel:(id _Nullable)model;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
-(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model;
/// 数据（字符串）定宽
-(CGFloat)widthByData:(UIViewModel *_Nonnull)data;
/// 数据（字符串）定高
-(CGFloat)heightByData:(UIViewModel *_Nonnull)data;
#pragma mark —— 一些功能性的
/// 初始化的时候最好传入一个size值将其子视图的大小固定死。因为只有当父视图有Size的情况下子视图才会展开，从而避免刷新约束时候的一系列麻烦事。
-(instancetype)initWithSize:(CGSize)thisViewSize;
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh;
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh;
/// 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize BaseViewProtocol
#ifndef BaseViewProtocol_synthesize
#define BaseViewProtocol_synthesize \
\
@synthesize layoutSubviewsRectCorner = _layoutSubviewsRectCorner;\
@synthesize layoutSubviewsRectCornerSize = _layoutSubviewsRectCornerSize;\
@synthesize constraintMutArr = _constraintMutArr;\
@synthesize thisViewSize = _thisViewSize;\
@synthesize headerFooterViewStyle = _headerFooterViewStyle;\

#endif

#pragma mark —— @dynamic BaseViewProtocol
#ifndef BaseViewProtocol_dynamic
#define BaseViewProtocol_dynamic \
\
@dynamic layoutSubviewsRectCorner;\
@dynamic layoutSubviewsRectCornerSize;\
@dynamic constraintMutArr;\
@dynamic thisViewSize;\
@dynamic headerFooterViewStyle;\

#endif
