//
//  UITableViewCellProtocol.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/30.
//

#import <Foundation/Foundation.h>
#import "BaseCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol UITableViewCellProtocol <BaseCellProtocol>

@optional
/// ⚠️执行return的顺序依照下列👇🏻属性的排序⚠️
///【组 1】 UITableViewCell单独自定义设置系统自带控件的Frame 【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
@property(nonatomic,assign)CGRect textLabelFrame;
@property(nonatomic,assign)CGRect detailTextLabelFrame;
@property(nonatomic,assign)CGRect imageViewFrame;
///【组 2】UITableViewCell单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
@property(nonatomic,assign)CGSize textLabelSize;
@property(nonatomic,assign)CGSize detailTextLabelSize;
@property(nonatomic,assign)CGSize imageViewSize;
///【组 3】UITableViewCell单独自定义设置系统自带控件的宽高【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
@property(nonatomic,assign)CGFloat textLabelWidth;
@property(nonatomic,assign)CGFloat textLabelHeight;
@property(nonatomic,assign)CGFloat detailTextLabelWidth;
@property(nonatomic,assign)CGFloat detailTextLabelHeight;
@property(nonatomic,assign)CGFloat imageViewWidth;
@property(nonatomic,assign)CGFloat imageViewHeight;
///【组 4】UITableViewCell单独自定义设置系统自带控件的偏移量 在外层设置（也就是在定义TableView的这一层）
@property(nonatomic,assign)CGFloat textLabelFrameOffsetX;
@property(nonatomic,assign)CGFloat textLabelFrameOffsetY;
@property(nonatomic,assign)CGFloat textLabelFrameOffsetWidth;
@property(nonatomic,assign)CGFloat textLabelFrameOffsetHeight;

@property(nonatomic,assign)CGFloat detailTextLabelOffsetX;
@property(nonatomic,assign)CGFloat detailTextLabelOffsetY;
@property(nonatomic,assign)CGFloat detailTextLabelOffsetWidth;
@property(nonatomic,assign)CGFloat detailTextLabelOffsetHeight;

@property(nonatomic,assign)CGFloat imageViewFrameOffsetX;
@property(nonatomic,assign)CGFloat imageViewFrameOffsetY;
@property(nonatomic,assign)CGFloat imageViewFrameOffsetWidth;/// 负值缩小，正值放大
@property(nonatomic,assign)CGFloat imageViewFrameOffsetHeight;/// 负值缩小，正值放大
#pragma mark —— 初始化方法
/// @implementation UITableViewCell (BaseCellProtocol)
+(instancetype)initTableViewCellWithStyle:(UITableViewCellStyle)style;
+(instancetype)initTableViewCell:(Class)tableViewCellClass
                       withStyle:(UITableViewCellStyle)style;
/// 4种UITableViewCell系统样式类型
/// 资料来源：https://www.jianshu.com/p/62ac18f8cf69
/// 具体子类实现
/// UITableViewCellStyleDefault ：左边有一个显示图片的imageView和一个标题textLabel。
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView;
/// UITableViewCellStyleValue1 = 左边：imageView＋textLabel；右边：detailTextLabel
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView;
/// UITableViewCellStyleValue2 = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(instancetype)cellStyleValue2WithTableView:(UITableView *)tableView;
/// UITableViewCellStyleSubtitle = 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(instancetype)cellStyleSubtitleWithTableView:(UITableView *)tableView;
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
+(void)settingForTableViewCell:(UITableViewCell *)tableViewCell;
/// 获取这个UITableViewCell所承载的UITableView
-(UITableView *)jobsGetCurrentTableView;
/// 获取当前的UITableViewCell对应的indexPath
-(NSIndexPath *)jobsGetCurrentIndexPath;
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

#pragma mark —— @synthesize UITableViewCellProtocol
/// 和UIViewModelProtocol里面重复定义的部分
#ifndef UITableViewCell_UIViewModelProtocolSynthesize
#define UITableViewCell_UIViewModelProtocolSynthesize \
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

#endif

#ifndef UITableViewCellProtocol_synthesize
#define UITableViewCellProtocol_synthesize \
@synthesize detailTextLabelFrame = _detailTextLabelFrame;\
@synthesize detailTextLabelSize = _detailTextLabelSize;\
@synthesize detailTextLabelWidth = _detailTextLabelWidth;\
@synthesize detailTextLabelHeight = _detailTextLabelHeight;\
@synthesize detailTextLabelOffsetX = _detailTextLabelOffsetX;\
@synthesize detailTextLabelOffsetY = _detailTextLabelOffsetY;\
@synthesize detailTextLabelOffsetWidth = _detailTextLabelOffsetWidth;\
@synthesize detailTextLabelOffsetHeight = _detailTextLabelOffsetHeight;\

#endif
//
#pragma mark —— @dynamic UITableViewCellProtocol
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

#endif
