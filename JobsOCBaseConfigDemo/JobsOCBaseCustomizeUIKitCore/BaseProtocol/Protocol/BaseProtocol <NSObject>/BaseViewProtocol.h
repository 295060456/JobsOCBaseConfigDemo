//
//  BaseViewProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"
#import "JobsBlock.h"
#import "VoidByCertainParameters.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#ifndef JOBS_HEADERFOOTER_VIEW_STYLE_ENUM_DEFINED
#define JOBS_HEADERFOOTER_VIEW_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsHeaderFooterViewStyle) {
    JobsHeaderViewStyle = 0,
    JobsFooterViewStyle
};
#endif /* JOBS_HEADERFOOTER_VIEW_STYLE_ENUM_DEFINED */

@class UIViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <BaseProtocol>
@optional
/// 是否允许托拽手势
@property(nonatomic,assign)BOOL isAllowDrag;
/// 退出当前页面的时候，除了当前页面出栈以外，你额外需要做的事情
@property(nonatomic,strong,nullable)JobsReturnIDByIDBlock jobsBackBlock;
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
-(jobsByIDBlock _Nonnull)jobsRichElementsInViewWithModel;
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
/// 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel;
/**
 在这个方法里：
 传入：UITableViewHeaderFooterView *
 对外返回：创建需要覆盖在UITableViewHeaderFooterView *的在View
 再在- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section方法里面：
 [self makeViewOnTableViewHeaderFooterView:headerView].alpha = 1; /// 进行一句话进行调用
 */
-(UIView *_Nullable)makeViewOnTableViewHeaderFooterView:(UITableViewHeaderFooterView *)headerFooterView;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize BaseViewProtocol
#ifndef BaseViewProtocol_synthesize
#define BaseViewProtocol_synthesize \
\
@synthesize isAllowDrag = _isAllowDrag;\
@synthesize jobsBackBlock = _jobsBackBlock;\
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
@dynamic isAllowDrag;\
@dynamic jobsBackBlock;\
@dynamic layoutSubviewsRectCorner;\
@dynamic layoutSubviewsRectCornerSize;\
@dynamic constraintMutArr;\
@dynamic thisViewSize;\
@dynamic headerFooterViewStyle;\

#endif
