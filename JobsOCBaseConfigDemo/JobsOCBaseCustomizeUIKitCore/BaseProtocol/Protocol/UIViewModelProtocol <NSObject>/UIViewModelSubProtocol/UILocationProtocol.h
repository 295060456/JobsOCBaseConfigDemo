//
// UILocationProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIButton+ImageTitleSpacing.h"
/// 屏幕方向
#ifndef DeviceOrientation_typedef
#define DeviceOrientation_typedef
typedef NS_ENUM(NSInteger, DeviceOrientation) {
  DeviceOrientationUnknown, /// 未知方向
  DeviceOrientationPortrait,/// 竖屏
  DeviceOrientationLandscape /// 横屏
};
#endif /* DeviceOrientation_typedef */

NS_ASSUME_NONNULL_BEGIN

@protocol UILocationProtocol <NSObject>
@optional
#pragma mark —— 方位和大小
/// Frame
@property(nonatomic,assign)CGFloat jobsX;
@property(nonatomic,assign)CGFloat jobsY;
@property(nonatomic,assign)CGFloat jobsWidth;/// 宽
@property(nonatomic,assign)CGFloat jobsHeight;/// 高
/// Edge
@property(nonatomic,assign)CGFloat jobsTop;
@property(nonatomic,assign)CGFloat jobsLeft;/// = leading
@property(nonatomic,assign)CGFloat jobsRight;/// = trailing
@property(nonatomic,assign)CGFloat jobsBottom;
/// NSRange
@property(nonatomic,assign)NSUInteger location;
@property(nonatomic,assign)NSUInteger length;
/// Offset
@property(nonatomic,assign)CGFloat jobsOffsetX;
@property(nonatomic,assign)CGFloat jobsOffsetY;
/// 结构体
@property(nonatomic,assign)CGSize jobsSize;/// 二维尺寸
@property(nonatomic,assign)CGRect jobsRect;
@property(nonatomic,assign)CGPoint jobsPoint;
@property(nonatomic,assign)UIRectCorner rectCorner;/// 设置切哪个直角
@property(nonatomic,assign)CGSize cornerRadii;/// 设置切哪个直角的切角矩形
@property(nonatomic,assign)UILayoutConstraintAxis axis;
@property(nonatomic,assign)UIStackViewDistribution distribution;
@property(nonatomic,assign)UIStackViewAlignment alignment;
@property(nonatomic,assign)NSInteger row;
@property(nonatomic,assign)NSInteger item;
@property(nonatomic,assign)NSInteger section;
/// Layer
@property(nonatomic,assign)CGFloat cornerRadius;/// 圆切角（全角）
#pragma mark —— UIButton 专用属性 — 图文的相对位置
@property(nonatomic,assign)NSDirectionalRectEdge buttonEdgeInsetsStyle;
@property(nonatomic,assign)CGFloat imageTitleSpace;
@property(nonatomic,assign)CGFloat titleSpace;
#pragma mark —— 关于 UITableViewCell 和 UICollectionViewCell
@property(nonatomic,assign,class)CGFloat HeightForHeaderInSection;
@property(nonatomic,assign,class)CGFloat CellWidth;
@property(nonatomic,assign,class)CGFloat CellHeight;
@property(nonatomic,assign,class)CGSize CellSize;

@property(nonatomic,assign)CGFloat heightForHeaderInSection;
@property(nonatomic,assign)CGFloat cellWidth;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)CGSize cellSize;

@property(nonatomic,assign)CGSize tableHeaderViewSize;
@property(nonatomic,assign)CGSize tableFooterViewSize;
@property(nonatomic,assign)BOOL usesTableViewHeaderView;/// 默认不使用
@property(nonatomic,assign)BOOL usesTableViewFooterView;/// 默认不使用
/// 更多，参见： 关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量.md
@property(nonatomic,assign)CGFloat offsetXForEach;
@property(nonatomic,assign)CGFloat offsetYForEach;
@property(nonatomic,assign)CGFloat offsetHeight;
@property(nonatomic,assign)CGFloat offsetWidth;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UILocationProtocol_UIViewModelSynthesize
/// 和 UIViewModel 重复定义的部分
#ifndef UILocationProtocol_UIViewModelSynthesize
#define UILocationProtocol_UIViewModelSynthesize \
@synthesize cornerRadius = _cornerRadius;\
@synthesize rectCorner = _rectCorner;\
@synthesize cornerRadii = _cornerRadii;\
@synthesize jobsX = _jobsX;\
@synthesize jobsY = _jobsY;\
@synthesize jobsWidth = _jobsWidth;\
@synthesize jobsHeight = _jobsHeight;\
@synthesize jobsTop = _jobsTop;\
@synthesize jobsLeft = _jobsLeft;\
@synthesize jobsRight = _jobsRight;\
@synthesize jobsBottom = _jobsBottom;\
@synthesize location = _location;\
@synthesize length = _length;\
@synthesize jobsOffsetX = _jobsOffsetX;\
@synthesize jobsOffsetY = _jobsOffsetY;\
@synthesize jobsSize = _jobsSize;\
@synthesize jobsRect = _jobsRect;\
@synthesize jobsPoint = _jobsPoint;\
@synthesize offsetXForEach = _offsetXForEach;\
@synthesize offsetYForEach = _offsetYForEach;\
@synthesize offsetHeight = _offsetHeight;\
@synthesize offsetWidth = _offsetWidth;\
@synthesize axis = _axis;\
@synthesize distribution = _distribution;\
@synthesize alignment = _alignment;\
@synthesize row = _row;\
@synthesize item = _item;\
@synthesize section = _section;\
@synthesize buttonEdgeInsetsStyle;\
@synthesize imageTitleSpace;\
@synthesize titleSpace;\
@synthesize cellWidth = _cellWidth;\
@synthesize cellHeight = _cellHeight;\
@synthesize heightForHeaderInSection = _heightForHeaderInSection;\
@synthesize cellSize = _cellSize;\
@synthesize tableHeaderViewSize = _tableHeaderViewSize;\
@synthesize tableFooterViewSize = _tableFooterViewSize;\
@synthesize usesTableViewHeaderView = _usesTableViewHeaderView;\
@synthesize usesTableViewFooterView = _usesTableViewFooterView;\

#endif

#pragma mark —— @dynamic UILocationProtocol_UIViewModelDynamic
#ifndef UILocationProtocol_UIViewModelDynamic
#define UILocationProtocol_UIViewModelDynamic \
\
@dynamic cornerRadius;\
@dynamic rectCorner;\
@dynamic cornerRadii;\
@dynamic jobsX;\
@dynamic jobsY;\
@dynamic jobsWidth;\
@dynamic jobsHeight;\
@dynamic jobsTop;\
@dynamic jobsLeft;\
@dynamic jobsRight;\
@dynamic jobsBottom;\
@dynamic location;\
@dynamic length;\
@dynamic jobsOffsetX;\
@dynamic jobsOffsetY;\
@dynamic jobsSize;\
@dynamic jobsRect;\
@dynamic jobsPoint;\
@dynamic offsetXForEach;\
@dynamic offsetYForEach;\
@dynamic offsetHeight;\
@dynamic offsetWidth;\
@dynamic axis;\
@dynamic distributio;\
@dynamic alignment;\
@dynamic row;\
@dynamic item;\
@dynamic section;\
@dynamic buttonEdgeInsetsStyle;\
@dynamic imageTitleSpace;\
@dynamic titleSpace;\
@dynamic cellWidth;\
@dynamic cellHeight;\
@dynamic heightForHeaderInSection;\
@dynamic cellSize;\
@dynamic tableHeaderViewSize;\
@dynamic tableFooterViewSize;\
@dynamic usesTableViewHeaderView;\
@dynamic usesTableViewFooterView;\

#endif
