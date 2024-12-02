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
@class UIButtonModel;
NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <BaseProtocol>
@optional
@property(nonatomic,strong)__kindof UICollectionView *collectionView;
@property(nonatomic,strong)__kindof UITableView *tableView;
@property(nonatomic,strong)__kindof UIScrollView *scrollView;
/// 是否允许托拽手势
@property(nonatomic,assign)BOOL isAllowDrag;
/// 退出当前页面的时候，除了当前页面出栈以外，你额外需要做的事情
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock jobsBackBlock;
/// 圆切角参数：作用于-(void)layoutSubviews
@property(nonatomic,assign)UIRectCorner layoutSubviewsRectCorner;
@property(nonatomic,assign)CGSize layoutSubviewsRectCornerSize;
@property(nonatomic,strong)UIColor *layerCor;
/// 记录该View的Masonry约束情况
@property(nonatomic,strong)NSMutableArray <MASConstraint *>*constraintMutArr;
/// 视图长、宽、高的定义
@property(nonatomic,assign)CGSize thisViewSize;
/// 标记是HeaderView 还是 FooterView
@property(nonatomic,assign)JobsHeaderFooterViewStyle headerFooterViewStyle;
@property(nonatomic,copy)jobsByBtnBlock backBtnClickAction;
@property(nonatomic,copy)jobsByBtnBlock closeBtnClickAction;
#pragma mark —— 用类方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewWidthByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)heightForHeaderInSection;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGRectByIDBlock _Nonnull)viewFrameByModel;
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeXByModel;
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeYByModel;
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeWidthByModel;
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeHeightByModel;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(JobsReturnCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel;
/// 数据（字符串）定宽
+(JobsReturnCGFloatByIDBlock _Nonnull)widthByData;
/// 数据（字符串）定高
+(JobsReturnCGFloatByIDBlock _Nonnull)heightByData;
#pragma mark —— 用实例方法定义
/// 具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewWidthByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)heightForFooterInSectionByModel;
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)heightForHeaderInSection;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel;
/// 具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGRectByIDBlock _Nonnull)viewFrameByModel;
/// 具体由子类进行复写【FrameX的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeXByModel;
/// 具体由子类进行复写【FrameY的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeYByModel;
/// 具体由子类进行复写【FrameWidth的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeWidthByModel;
/// 具体由子类进行复写【FrameHeight的变化量】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)viewChangeHeightByModel;
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
-(JobsReturnCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel;
/// 数据（字符串）定宽
-(JobsReturnCGFloatByIDBlock _Nonnull)widthByData;
/// 数据（字符串）定高
-(JobsReturnCGFloatByIDBlock _Nonnull)heightByData;
#pragma mark —— 关于导航栏
@property(nonatomic,strong,nullable)UIButtonModel *closeBtnModel;
@property(nonatomic,strong,nullable)UIButtonModel *backBtnModel;
@property(nonatomic,strong,nullable)UIViewModel *titleModel;
/// 配置 GKNavigationBar
-(jobsByViewModelBlock _Nonnull)setGKNav;
/// 配置 JobsNavBarConfig
-(JobsReturnNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig;
/// 配置GKNavigationBar的返回按钮
-(jobsByBtnBlock _Nonnull)setGKNavBackBtn;
/// 返回按钮的回调
-(void)actionNavBarBackBtnClickBlock:(jobsByBtnBlock _Nullable)objectBlock;
/// 关闭按钮的回调
-(void)actionNavBarCloseBtnClickBlock:(jobsByBtnBlock _Nullable)objectBlock;
#pragma mark —— 一些功能性的
/// 初始化的时候最好传入一个size值将其子视图的大小固定死。因为只有当父视图有Size的情况下子视图才会展开，从而避免刷新约束时候的一系列麻烦事。
-(instancetype)initWithSize:(CGSize)thisViewSize;
-(JobsReturnIDByCGSizeBlock _Nonnull)initWithSize;
/// 依据数据源对UI进行渲染：具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnViewByIDBlock _Nonnull)JobsRichViewByModel;
-(JobsReturnViewByIDBlock _Nonnull)JobsRichViewByModel2;
-(jobsByIDBlock _Nonnull)jobsRichViewByModel;
-(jobsByViewModelBlock _Nonnull)jobsRichViewByViewModel;
-(jobsByIDBlock _Nonnull)update;
/// 获取绑定的数据源
-(UIViewModel *_Nullable)getViewModel;
-(UIButtonModel *_Nullable)getButtonModel;
#pragma mark —— 关于 TextField
/// 清除数据
-(JobsReturnViewByVoidBlock _Nonnull)cleanTextFieldValue;
/// 返回真实的 TextField
-(__kindof UITextField *)realTextField;
/**
 在这个方法里：
 传入：UITableViewHeaderFooterView *
 对外返回：创建需要覆盖在UITableViewHeaderFooterView *的在View
 再在- (nullable __kindof UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section方法里面：
 self.makeViewOnTableViewHeaderFooterView(headerView).alpha = 1; /// 进行一句话进行调用
 */
-(JobsReturnViewByTableViewHeaderFooterViewBlock _Nonnull)makeViewOnTableViewHeaderFooterView;
#pragma mark —— 在View内部进行实现处理，对外暴露的值。（不直接暴露UI控件）
-(id)value;
-(id)value1;
-(id)value2;
-(id)value3;
-(id)value4;

@end

NS_ASSUME_NONNULL_END

typedef id _Nullable(^JobsReturnIDByObjWithBaseViewProtocolBlock)(id<BaseViewProtocol> _Nullable data);
#pragma mark —— @synthesize BaseViewProtocol
#ifndef BaseViewProtocol_synthesize
#define BaseViewProtocol_synthesize \
\
@synthesize collectionView = _collectionView;\
@synthesize tableView = _tableView;\
@synthesize scrollView = _scrollView;\
@synthesize isAllowDrag = _isAllowDrag;\
@synthesize jobsBackBlock = _jobsBackBlock;\
@synthesize layoutSubviewsRectCorner = _layoutSubviewsRectCorner;\
@synthesize layoutSubviewsRectCornerSize = _layoutSubviewsRectCornerSize;\
@synthesize layerCor = _layerCor;\
@synthesize constraintMutArr = _constraintMutArr;\
@synthesize thisViewSize = _thisViewSize;\
@synthesize headerFooterViewStyle = _headerFooterViewStyle;\
@synthesize backBtnClickAction = _backBtnClickAction;\
@synthesize closeBtnClickAction = _closeBtnClickAction;\
@synthesize closeBtnModel = _closeBtnModel;\
@synthesize backBtnModel = _backBtnModel;\
@synthesize titleModel = _titleModel;\

#endif

#pragma mark —— @dynamic BaseViewProtocol
#ifndef BaseViewProtocol_dynamic
#define BaseViewProtocol_dynamic \
\
@dynamic collectionView;\
@dynamic tableView;\
@dynamic scrollView;\
@dynamic isAllowDrag;\
@dynamic jobsBackBlock;\
@dynamic layoutSubviewsRectCorner;\
@dynamic layoutSubviewsRectCornerSize;\
@dynamic layerCor;\
@dynamic constraintMutArr;\
@dynamic thisViewSize;\
@dynamic headerFooterViewStyle;\
@dynamic backBtnClickAction;\
@dynamic closeBtnClickAction;\
@dynamic closeBtnModel;\
@dynamic backBtnModel;\
@dynamic titleModel;\

#endif
