//
// UIViewModelOthersProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsLabelDef.h"
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@protocol UIViewModelOthersProtocol <NSObject>
@optional
/// 其他
#pragma mark —— UI
@property(nonatomic,strong,nullable)UIColor *layerBorderCor;
@property(nonatomic,assign)CGFloat layerBorderWidth;
@property(nonatomic,assign)CGFloat layerCornerRadius;
@property(nonatomic,assign)BOOL isTranslucent;/// 是否取消tabBar的透明效果
@property(nonatomic,assign)BOOL isVisible;/// ❤️只是一个标记是否可见，如果需要设置请移步@interface UIView (Extras) ：-(BOOL)jobsVisible; 和 -(void)setJobsVisible:(BOOL)jobsVisible;
@property(nonatomic,assign)BOOL isInvisible;/// 此属性默认就是NO，即可见
@property(nonatomic,assign)BOOL isMultiLineShows;/// 是否多行行显示【默认单行显示】
@property(nonatomic,assign)UILabelShowingType labelShowingType;
#pragma mark —— 定位
@property(nonatomic,assign)NSUInteger jobsTag;
#pragma mark —— 点击
@property(nonatomic,assign)BOOL jobsSelected;
@property(nonatomic,assign)BOOL jobsEnabled;
@property(nonatomic,strong,nullable)UIAction *primaryAction;/// 新Api的点击事件
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock longPressGestureEventBlock;/// 按钮的长按事件
@property(nonatomic,copy,nullable)JobsReturnIDByIDBlock clickEventBlock;/// 老Api的点击事件，利用RAC实现

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UIViewModelOthersProtocol
#ifndef UIViewModelOthersProtocol_synthesize
#define UIViewModelOthersProtocol_synthesize \
\
@synthesize layerBorderCor = _layerBorderCor;\
@synthesize layerBorderWidth = _layerBorderWidth;\
@synthesize layerCornerRadius = _layerCornerRadius;\
@synthesize isTranslucent = _isTranslucent;\
@synthesize isVisible = _isVisible;\
@synthesize isInvisible = _isInvisible;\
@synthesize isMultiLineShows = _isMultiLineShows;\
@synthesize labelShowingType = _labelShowingType;\
@synthesize jobsTag = _jobsTag;\
@synthesize jobsSelected = _jobsSelected;\
@synthesize jobsEnabled = _jobsEnabled;\
@synthesize primaryAction = _primaryAction;\
@synthesize longPressGestureEventBlock = _longPressGestureEventBlock;\
@synthesize clickEventBlock = _clickEventBlock;\

#endif

#pragma mark —— @dynamic UIViewModelOthersProtocol
#ifndef UIViewModelOthersProtocol_dynamic
#define UIViewModelOthersProtocol_dynamic \
\
@dynamic layerBorderCor;\
@dynamic layerBorderWidth;\
@dynamic layerCornerRadius;\
@dynamic isTranslucent;\
@dynamic isVisible;\
@dynamic isInvisible;\
@dynamic isMultiLineShows;\
@dynamic labelShowingType;\
@dynamic jobsTag;\
@dynamic jobsSelected;\
@dynamic jobsEnabled;\
@dynamic primaryAction;\
@dynamic longPressGestureEventBlock;\
@dynamic clickEventBlock;\

#endif

