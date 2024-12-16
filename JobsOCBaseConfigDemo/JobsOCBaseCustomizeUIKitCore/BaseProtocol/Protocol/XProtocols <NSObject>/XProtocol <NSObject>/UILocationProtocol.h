//
// UILocationProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefineProperty.h"
#import "UIButton+ImageTitleSpacing.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举

NS_ASSUME_NONNULL_BEGIN

@protocol UILocationProtocol <NSObject>
@optional
#pragma mark —— 方位和大小
/// Frame
Prop_assign()CGFloat jobsX;
Prop_assign()CGFloat jobsY;
Prop_assign()CGFloat jobsWidth;/// 宽
Prop_assign()CGFloat jobsHeight;/// 高
/// Edge
Prop_assign()CGFloat jobsTop;
Prop_assign()CGFloat jobsLeft;/// = leading
Prop_assign()CGFloat jobsRight;/// = trailing
Prop_assign()CGFloat jobsBottom;
/// NSRange
Prop_assign()NSUInteger location;
Prop_assign()NSUInteger length;
/// Offset
Prop_assign()CGFloat jobsOffsetX;
Prop_assign()CGFloat jobsOffsetY;
/// 结构体
Prop_assign()CGSize jobsSize;/// 二维尺寸
Prop_assign()CGRect jobsRect;
Prop_assign()CGPoint jobsPoint;
Prop_assign()UIRectCorner rectCorner;/// 设置切哪个直角
Prop_assign()CGSize cornerRadii;/// 设置切哪个直角的切角矩形
Prop_assign()UILayoutConstraintAxis axis;
Prop_assign()UIStackViewDistribution distribution;
Prop_assign()UIStackViewAlignment alignment;
Prop_assign()NSInteger section;
Prop_assign()NSInteger item;
Prop_assign()NSInteger row;
#pragma mark —— UIButton 专用属性 — 图文的相对位置
Prop_assign()NSDirectionalRectEdge buttonEdgeInsetsStyle;
Prop_assign()CGFloat imageTitleSpace;
Prop_assign()CGFloat titleSpace;
#pragma mark —— 关于 UITableViewCell 和 UICollectionViewCell
Prop_assign(class)CGFloat HeightForHeaderInSection;
Prop_assign(class)CGFloat CellWidth;
Prop_assign(class)CGFloat CellHeight;
Prop_assign(class)CGSize CellSize;

Prop_assign()CGFloat heightForHeaderInSection;
Prop_assign()CGFloat cellWidth;
Prop_assign()CGFloat cellHeight;
Prop_assign()CGSize cellSize;

Prop_assign()CGSize tableHeaderViewSize;
Prop_assign()CGSize tableFooterViewSize;
Prop_assign()BOOL usesTableViewHeaderView;/// 默认不使用
Prop_assign()BOOL usesTableViewFooterView;/// 默认不使用
/// 更多，参见： 关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量.md
Prop_assign()CGFloat offsetXForEach;
Prop_assign()CGFloat offsetYForEach;
Prop_assign()CGFloat offsetHeight;
Prop_assign()CGFloat offsetWidth;

@end

NS_ASSUME_NONNULL_END

#ifndef UILocationProtocol_synthesize
#define UILocationProtocol_synthesize \
\
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

#endif /* UILocationProtocol_synthesize */

#ifndef UILocationProtocol_dynamic
#define UILocationProtocol_dynamic \
\
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
@dynamic distribution;\
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

#endif /* UILocationProtocol_dynamic */
