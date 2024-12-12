//
//  BaseViewProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/22.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h"
#import "BaseProtocol.h"

@class MASConstraint;
@class UIViewModel;
@class UIButtonModel;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewProtocol <BaseProtocol>
typedef id _Nullable(^JobsReturnIDByObjWithBaseViewProtocolBlock)(id<BaseViewProtocol> _Nullable data);
@optional
Prop_strong(nullable)__kindof UICollectionView *collectionView;
Prop_strong(nullable)__kindof UITableView *tableView;
Prop_strong(nullable)__kindof UIScrollView *scrollView;
/// 是否允许托拽手势
Prop_assign()BOOL isAllowDrag;
/// 退出当前页面的时候，除了当前页面出栈以外，你额外需要做的事情
Prop_copy(nullable)JobsReturnIDByIDBlock jobsBackBlock;
/// 圆切角参数：作用于-(void)layoutSubviews
Prop_assign()UIRectCorner layoutSubviewsRectCorner;
Prop_assign()CGSize layoutSubviewsRectCornerSize;
Prop_strong(nullable)UIColor *layerCor;
/// 记录该View的Masonry约束情况
Prop_strong(nullable)NSMutableArray <MASConstraint *>*constraintMutArr;/* #import <Masonry/Masonry.h> */
/// 视图长、宽、高的定义
Prop_assign()CGSize thisViewSize;
/// 标记是HeaderView 还是 FooterView
Prop_assign()JobsHeaderFooterViewStyle headerFooterViewStyle;
Prop_copy(nullable)jobsByBtnBlock backBtnClickAction;
Prop_copy(nullable)jobsByBtnBlock closeBtnClickAction;
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
Prop_strong(nullable)UIButtonModel *closeBtnModel;
Prop_strong(nullable)UIButtonModel *backBtnModel;
Prop_strong(nullable)UIViewModel *titleModel;
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
-(id _Nullable)value;
-(id _Nullable)value1;
-(id _Nullable)value2;
-(id _Nullable)value3;
-(id _Nullable)value4;

@end

NS_ASSUME_NONNULL_END

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

#endif /* BaseViewProtocol_synthesize */

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

#endif /* BaseViewProtocol_dynamic */
