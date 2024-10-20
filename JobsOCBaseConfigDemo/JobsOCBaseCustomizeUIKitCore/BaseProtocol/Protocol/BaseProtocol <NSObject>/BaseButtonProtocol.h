//
//  BaseButtonProtocol.h
//  DouDong-II
//
//  Created by Jobs on 2021/6/1.
//

#import <Foundation/Foundation.h>
#import "BaseViewProtocol.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseButtonProtocol <BaseViewProtocol>
@optional
#pragma mark —— UIButton + UI
/// 为了迎合点语法而故意把下列方法属性化
/// Common
@property(nonatomic,strong)UIButtonConfiguration *buttonConfiguration;
@property(nonatomic,strong)UIBackgroundConfiguration *backgroundConfiguration;
@property(nonatomic,assign)NSTextAlignment titleAlignment;
@property(nonatomic,assign)UIButtonConfigurationTitleAlignment buttonConfigurationTitleAlignment;
@property(nonatomic,assign)BOOL jobsSelected;
#pragma mark —— JobsBtnModel
@property(nonatomic,strong)UIColor *btnBackgroundColor;
@property(nonatomic,assign)CGSize imageSize;
/// 结合下列属性来实现改变Button文字位置
@property(nonatomic,assign)UIControlContentHorizontalAlignment contentHorizontalAlignment;
@property(nonatomic,assign)UIControlContentVerticalAlignment contentVerticalAlignment;
@property(nonatomic,assign)NSDirectionalRectEdge directionalRectEdge;
@property(nonatomic,assign)UIEdgeInsets contentEdgeInsets;/// iOS 15以前可以用
@property(nonatomic,readwrite,assign)NSDirectionalEdgeInsets contentInsets;/// iOS 15以后 结合UIButtonConfiguration 以替换属性：UIEdgeInsets contentEdgeInsets;
@property(nonatomic,assign)CGFloat contentSpacing;
@property(nonatomic,assign)NSLineBreakMode lineBreakMode;
@property(nonatomic,assign)NSLineBreakMode subLineBreakMode;
@property(nonatomic,assign)CGFloat btnWidth;/// 预设值，父视图的宽度不能大于这个值
#pragma mark —— 以前的
/// ⚠️执行return的顺序依照下列👇🏻属性的排序⚠️
///【组 1】UIButton 单独自定义设置系统自带控件的Frame【形成Frame后直接return，避免被其他中间过程修改】❤️与组2、3属性互斥❤️
@property(nonatomic,assign)CGRect textLabelFrame;
@property(nonatomic,assign)CGRect subTextLabelFrame;
@property(nonatomic,assign)CGRect imageViewFrame;
///【组 2】UIButton 单独自定义设置系统自带控件的Size【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、3属性互斥❤️
@property(nonatomic,assign)CGSize textLabelSize;
@property(nonatomic,assign)CGFloat textLabelFrameResetX;
@property(nonatomic,assign)CGFloat textLabelFrameResetY;

@property(nonatomic,assign)CGSize subTextLabelSize;
@property(nonatomic,assign)CGFloat subTextLabelFrameResetX;
@property(nonatomic,assign)CGFloat subTextLabelFrameResetY;

@property(nonatomic,assign)CGSize imageViewSize;
@property(nonatomic,assign)CGFloat imageViewFrameResetX;
@property(nonatomic,assign)CGFloat imageViewFrameResetY;
///【组 3】UIButton 单独自定义设置系统自带控件的长宽【形成Frame后直接return，避免被其他中间过程修改】❤️与组1、2属性互斥❤️
@property(nonatomic,assign)CGFloat textLabelWidth;
@property(nonatomic,assign)CGFloat subTextLabelWidth;
@property(nonatomic,assign)CGFloat imageViewWidth;
@property(nonatomic,assign)CGFloat textLabelHeight;
@property(nonatomic,assign)CGFloat subTextLabelHeight;
@property(nonatomic,assign)CGFloat imageViewHeight;
/// UIButton 单独自定义设置系统自带控件的偏移量 ❤️与其他组属性不互斥❤️
// 关于 textLabel 的偏移
@property(nonatomic,assign)CGFloat textLabelFrameOffsetX;
@property(nonatomic,assign)CGFloat textLabelFrameOffsetY;
@property(nonatomic,assign)CGFloat textLabelFrameOffsetWidth;
@property(nonatomic,assign)CGFloat textLabelFrameOffsetHeight;
// 关于 subTextLabel 的偏移
@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetX;
@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetY;
@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetWidth;
@property(nonatomic,assign)CGFloat subTextLabelFrameOffsetHeight;
// 关于 imageView 的偏移
@property(nonatomic,assign)CGFloat imageViewFrameOffsetX;
@property(nonatomic,assign)CGFloat imageViewFrameOffsetY;
@property(nonatomic,assign)CGFloat imageViewFrameOffsetWidth;
@property(nonatomic,assign)CGFloat imageViewFrameOffsetHeight;
//具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richButtonByModel;
#pragma mark —— 用类方法定义
//具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)buttonWidthByModel;
//具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)buttonHeightByModel;
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)buttonSizeByModel;
//具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGRectByIDBlock _Nonnull)buttonFrameByModel;
#pragma mark —— 用实例方法定义
//具体由子类进行复写【数据定宽】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)buttonWidthByModel;
//具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGFloatByIDBlock _Nonnull)buttonHeightByModel;
//具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGSizeByIDBlock _Nonnull)buttonSizeByModel;
//具体由子类进行复写【数据Frame】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnCGRectByIDBlock _Nonnull)buttonFrameByModel;
/// 获取绑定的数据源
-(UIButtonModel *_Nullable)getButtonModel;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize BaseButtonProtocol
#ifndef BaseButtonProtocol_synthesize
#define BaseButtonProtocol_synthesize \
\
@synthesize buttonConfiguration = _buttonConfiguration;\
@synthesize backgroundConfiguration = _backgroundConfiguration;\
@synthesize titleAlignment = _titleAlignment;\
@synthesize buttonConfigurationTitleAlignment = _buttonConfigurationTitleAlignment;\
@synthesize jobsSelected = _jobsSelected;\
@synthesize jobsEnabled = _jobsEnabled;\
@synthesize btnBackgroundColor = _btnBackgroundColor;\
@synthesize imageSize = _imageSize;\
@synthesize contentHorizontalAlignment = _contentHorizontalAlignment;\
@synthesize contentVerticalAlignment = _contentVerticalAlignment;\
@synthesize directionalRectEdge = _directionalRectEdge;\
@synthesize contentEdgeInsets = _contentEdgeInsets;\
@synthesize contentInsets = _contentInsets;\
@synthesize contentSpacing = _contentSpacing;\
@synthesize lineBreakMode = _lineBreakMode;\
@synthesize btnWidth = _btnWidth;\
\
@synthesize textLabelFrame = _textLabelFrame;\
@synthesize subTextLabelFrame = _subTextLabelFrame;\
@synthesize imageViewFrame = _imageViewFrame;\
\
@synthesize textLabelSize = _textLabelSize;\
@synthesize textLabelFrameResetX = _textLabelFrameResetX;\
@synthesize textLabelFrameResetY = _textLabelFrameResetY;\
@synthesize subTextLabelSize = _subTextLabelSize;\
@synthesize subTextLabelFrameResetX = _subTextLabelFrameResetX;\
@synthesize subTextLabelFrameResetY = _subTextLabelFrameResetY;\
@synthesize imageViewSize = _imageViewSize;\
@synthesize imageViewFrameResetX = _imageViewFrameResetX;\
@synthesize imageViewFrameResetY = _imageViewFrameResetY;\
\
@synthesize textLabelWidth = _textLabelWidth;\
@synthesize subTextLabelWidth = _subTextLabelWidth;\
@synthesize imageViewWidth = _imageViewWidth;\
@synthesize textLabelHeight = _textLabelHeight;\
@synthesize subTextLabelHeight = _subTextLabelHeight;\
@synthesize imageViewHeight = _imageViewHeight;\
\
@synthesize textLabelFrameOffsetX = _textLabelFrameOffsetX;\
@synthesize textLabelFrameOffsetY = _textLabelFrameOffsetY;\
@synthesize textLabelFrameOffsetWidth = _textLabelFrameOffsetWidth;\
@synthesize textLabelFrameOffsetHeight = _textLabelFrameOffsetHeight;\
\
@synthesize subTextLabelFrameOffsetX = _subTextLabelFrameOffsetX;\
@synthesize subTextLabelFrameOffsetY = _subTextLabelFrameOffsetY;\
@synthesize subTextLabelFrameOffsetWidth = _subTextLabelFrameOffsetWidth;\
@synthesize subTextLabelFrameOffsetHeight = _subTextLabelFrameOffsetHeight;\
\
@synthesize imageViewFrameOffsetX = _imageViewFrameOffsetX;\
@synthesize imageViewFrameOffsetY = _imageViewFrameOffsetY;\
@synthesize imageViewFrameOffsetWidth = _imageViewFrameOffsetWidth;\
@synthesize imageViewFrameOffsetHeight = _imageViewFrameOffsetHeight;\

#endif

#pragma mark —— @dynamic BaseButtonProtocol
#ifndef BaseButtonProtocol_dynamic
#define BaseButtonProtocol_dynamic \
\
@dynamic buttonConfiguration;\
@dynamic backgroundConfiguration;\
@dynamic titleAlignment;\
@dynamic buttonConfigurationTitleAlignment;\
@dynamic jobsEnabled;\
@dynamic jobsSelected;\
@dynamic btnBackgroundColor;\
@dynamic imageSize;\
@dynamic contentHorizontalAlignment;\
@dynamic contentVerticalAlignment;\
@dynamic directionalRectEdge;\
@dynamic contentEdgeInsets;\
@dynamic contentInsets;\
@dynamic contentSpacing;\
@dynamic lineBreakMode;\
@dynamic subLineBreakMode;\
@dynamic btnWidth;\
\
@dynamic textLabelFrame;\
@dynamic subTextLabelFrame;\
@dynamic imageViewFrame;\
\
@dynamic textLabelSize;\
@dynamic textLabelFrameResetX;\
@dynamic textLabelFrameResetY;\
@dynamic subTextLabelSize;\
@dynamic subTextLabelFrameResetX;\
@dynamic subTextLabelFrameResetY;\
@dynamic imageViewSize;\
@dynamic imageViewFrameResetX;\
@dynamic imageViewFrameResetY;\
\
@dynamic textLabelWidth;\
@dynamic subTextLabelWidth;\
@dynamic imageViewWidth;\
@dynamic textLabelHeight;\
@dynamic subTextLabelHeight;\
@dynamic imageViewHeight;\
\
@dynamic textLabelFrameOffsetX;\
@dynamic textLabelFrameOffsetY;\
@dynamic textLabelFrameOffsetWidth;\
@dynamic textLabelFrameOffsetHeight;\
\
@dynamic subTextLabelFrameOffsetX;\
@dynamic subTextLabelFrameOffsetY;\
@dynamic subTextLabelFrameOffsetWidth;\
@dynamic subTextLabelFrameOffsetHeight;\
\
@dynamic imageViewFrameOffsetX;\
@dynamic imageViewFrameOffsetY;\
@dynamic imageViewFrameOffsetWidth;\
@dynamic imageViewFrameOffsetHeight;\

#endif
