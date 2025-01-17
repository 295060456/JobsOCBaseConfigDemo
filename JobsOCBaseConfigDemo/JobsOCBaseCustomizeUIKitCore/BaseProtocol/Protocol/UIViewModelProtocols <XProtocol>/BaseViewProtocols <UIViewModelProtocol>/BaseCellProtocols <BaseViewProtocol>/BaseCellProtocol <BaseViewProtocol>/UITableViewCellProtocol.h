//
//  UITableViewCellProtocol.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/30.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "BaseCellProtocol.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewCellProtocol <BaseCellProtocol>
@optional
/// ⚠️执行return的顺序依照下列👇🏻属性的排序⚠️
///【组 1】 UITableViewCell单独自定义设置系统自带控件的Frame 【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
Prop_assign()CGRect textLabelFrame;
Prop_assign()CGRect detailTextLabelFrame;
Prop_assign()CGRect imageViewFrame;
///【组 2】UITableViewCell单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
Prop_assign()CGSize textLabelSize;
Prop_assign()CGSize detailTextLabelSize;
Prop_assign()CGSize imageViewSize;
///【组 3】UITableViewCell单独自定义设置系统自带控件的宽高【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
Prop_assign()CGFloat textLabelWidth;
Prop_assign()CGFloat textLabelHeight;
Prop_assign()CGFloat detailTextLabelWidth;
Prop_assign()CGFloat detailTextLabelHeight;
Prop_assign()CGFloat imageViewWidth;
Prop_assign()CGFloat imageViewHeight;
///【组 4】UITableViewCell单独自定义设置系统自带控件的偏移量 在外层设置（也就是在定义TableView的这一层）
Prop_assign()CGFloat textLabelFrameOffsetX;
Prop_assign()CGFloat textLabelFrameOffsetY;
Prop_assign()CGFloat textLabelFrameOffsetWidth;
Prop_assign()CGFloat textLabelFrameOffsetHeight;

Prop_assign()CGFloat detailTextLabelOffsetX;
Prop_assign()CGFloat detailTextLabelOffsetY;
Prop_assign()CGFloat detailTextLabelOffsetWidth;
Prop_assign()CGFloat detailTextLabelOffsetHeight;

Prop_assign()CGFloat imageViewFrameOffsetX;
Prop_assign()CGFloat imageViewFrameOffsetY;
Prop_assign()CGFloat imageViewFrameOffsetWidth;/// 负值缩小，正值放大
Prop_assign()CGFloat imageViewFrameOffsetHeight;/// 负值缩小，正值放大
#pragma mark —— 初始化方法
/// @implementation UITableViewCell (BaseCellProtocol)
+(JobsReturnTableViewCellByTableViewCellStyleBlock _Nonnull)initTableViewCellWithStyle;
+(instancetype)initTableViewCell:(Class)tableViewCellClass
                       withStyle:(UITableViewCellStyle)style;
/// 4种UITableViewCell系统样式类型
/// 资料来源：https://www.jianshu.com/p/62ac18f8cf69
/// 具体子类实现
/// UITableViewCellStyleDefault ：左边有一个显示图片的imageView和一个标题textLabel。
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView;
/// UITableViewCellStyleValue1 = 左边：imageView＋textLabel；右边：detailTextLabel
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView;
/// UITableViewCellStyleValue2 = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue2WithTableView;
/// UITableViewCellStyleSubtitle = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleSubtitleWithTableView;
/// UITableViewCell 的横向和纵向的缩进
/// 在具体的子类，去覆盖-(void)setFrame:(CGRect)frame方法
/// - Parameters:
///   - frame: 最原始的Cell的Frame
///   - offsetX: X轴的偏移量
///   - offsetY: Y轴的偏移量
-(void)jobsResetTableViewCellFrame:(CGRect)frame
                       cellOffsetX:(CGFloat)offsetX
                       cellOffsetY:(CGFloat)offsetY;
/// UITableViewCell的一些默认样式设置
-(jobsByVoidBlock _Nonnull)settingForTableViewCell;
/// 获取这个UITableViewCell所承载的UITableView
-(__kindof UITableView *_Nullable)jobsGetCurrentTableView;
/// 获取当前的UITableViewCell对应的indexPath
-(NSIndexPath *_Nullable)jobsGetCurrentIndexPath;
/// 获取当前的UITableViewCell对应的section个数
-(NSInteger)jobsGetCurrentNumberOfSections;
/// 获取当前的UITableViewCell对应的section的的row个数
-(NSInteger)jobsGetCurrentNumberOfRowsInSection;
/// 以section为单位，每个section的第一行和最后一行的cell圆角化处理【cell之间没有分割线】
/// - Parameters:
///   - cellBgCor: UITableViewCell 的背景色
///   - bottomLineCor: UITableViewCell 的底部线颜色
///   - cellOutLineCor: UITableViewCell 的外线颜色
///   - cornerRadiusSize: 切角弧度
///   - borderWidth: 线宽
///   - dx: 内有介绍
///   - dy: 内有介绍
-(void)cutFirstAndLastTableViewCellWithBackgroundCor:(UIColor *_Nullable)cellBgCor
                                       bottomLineCor:(UIColor *_Nullable)bottomLineCor
                                      cellOutLineCor:(UIColor *_Nullable)cellOutLineCor
                                    cornerRadiusSize:(CGSize)cornerRadiusSize
                                         borderWidth:(CGFloat)borderWidth
                                                  dx:(CGFloat)dx
                                                  dy:(CGFloat)dy;
/// 除了最后一行以外，所有的cell的最下面的线的颜色为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfRowsInSection: 当前的UITableViewCell对应的section的的row个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)tableViewMakesLastRowCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                     bounds:(CGRect)bounds
                      numberOfRowsInSection:(NSInteger)numberOfRowsInSection
                                borderWidth:(CGFloat)borderWidth
                              bottomLineCor:(UIColor *_Nullable)bottomLineCor;
/// 除了第一行以外，所有的cell的最上面的线为bottomLineCor
/// - Parameters:
///   - indexPath: indexPath
///   - bounds: bounds
///   - numberOfRowsInSection: 当前的UITableViewCell对应的section的的row个数
///   - borderWidth: 线宽
///   - bottomLineCor: cell 底部线条颜色
-(void)tableViewMakesFirstRowCellAtIndexPath:(NSIndexPath *_Nonnull)indexPath
                                      bounds:(CGRect)bounds
                       numberOfRowsInSection:(NSInteger)numberOfRowsInSection
                               bottomLineCor:(UIColor *_Nullable)bottomLineCor
                                 borderWidth:(CGFloat)borderWidth;
@end

NS_ASSUME_NONNULL_END

#ifndef UITableViewCellProtoco_Synthesize_part1
#define UITableViewCellProtoco_Synthesize_part1 \
\
@synthesize imageViewFrame = _imageViewFrame;\
@synthesize imageViewWidth = _imageViewWidth;\
@synthesize textLabelHeight = _textLabelHeight;\
@synthesize imageViewHeight = _imageViewHeight;\
@synthesize imageViewSize = _imageViewSize;\
@synthesize textLabelFrame = _textLabelFrame;\
@synthesize textLabelFrameOffsetWidth = _textLabelFrameOffsetWidth;\
@synthesize textLabelFrameOffsetHeight = _textLabelFrameOffsetHeight;\
@synthesize imageViewFrameOffsetX = _imageViewFrameOffsetX;\
@synthesize imageViewFrameOffsetY = _imageViewFrameOffsetY;\
@synthesize imageViewFrameOffsetWidth = _imageViewFrameOffsetWidth;\
@synthesize imageViewFrameOffsetHeight = _imageViewFrameOffsetHeight;\
@synthesize textLabelFrameOffsetX = _textLabelFrameOffsetX;\
@synthesize textLabelFrameOffsetY = _textLabelFrameOffsetY;\
@synthesize textLabelSize = _textLabelSize;\
@synthesize textLabelWidth = _textLabelWidth;\

#endif /* UITableViewCellProtoco_Synthesize_part1 */

#ifndef UITableViewCellProtoco_Synthesize_part2
#define UITableViewCellProtoco_Synthesize_part2 \
\
@synthesize detailTextLabelFrame = _detailTextLabelFrame;\
@synthesize detailTextLabelSize = _detailTextLabelSize;\
@synthesize detailTextLabelWidth = _detailTextLabelWidth;\
@synthesize detailTextLabelHeight = _detailTextLabelHeight;\
@synthesize detailTextLabelOffsetX = _detailTextLabelOffsetX;\
@synthesize detailTextLabelOffsetY = _detailTextLabelOffsetY;\
@synthesize detailTextLabelOffsetWidth = _detailTextLabelOffsetWidth;\
@synthesize detailTextLabelOffsetHeight = _detailTextLabelOffsetHeight;\

#endif /* UITableViewCellProtoco_Synthesize_part2 */

#ifndef UITableViewCellProtocol_dynamic
#define UITableViewCellProtocol_dynamic \
\
@dynamic textLabelFrame;\
@dynamic detailTextLabelFrame;\
@dynamic imageViewFrame;\
\
@dynamic textLabelSize;\
@dynamic detailTextLabelSize;\
@dynamic imageViewSize;\
\
@dynamic textLabelWidth;\
@dynamic textLabelHeight;\
@dynamic detailTextLabelWidth;\
@dynamic detailTextLabelHeight;\
@dynamic imageViewWidth;\
@dynamic imageViewHeight;\
\
@dynamic textLabelFrameOffsetX;\
@dynamic textLabelFrameOffsetY;\
@dynamic textLabelFrameOffsetWidth;\
@dynamic textLabelFrameOffsetHeight;\
\
@dynamic detailTextLabelOffsetX;\
@dynamic detailTextLabelOffsetY;\
@dynamic detailTextLabelOffsetWidth;\
@dynamic detailTextLabelOffsetHeight;\
\
@dynamic imageViewFrameOffsetX;\
@dynamic imageViewFrameOffsetY;\
@dynamic imageViewFrameOffsetWidth;\
@dynamic imageViewFrameOffsetHeight;\

#endif /* UITableViewCellProtocol_dynamic */
