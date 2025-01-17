//
// UIViewModelOthersProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefineProperty.h"
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
Prop_strong(nullable)UIColor *layerBorderCor;
Prop_assign()CGFloat layerBorderWidth;
Prop_assign()CGFloat layerCornerRadius;
Prop_assign()BOOL isTranslucent;/// 是否取消tabBar的透明效果
Prop_assign()BOOL isVisible;/// ❤️只是一个标记是否可见，如果需要设置请移步@interface UIView (Extras) ：-(BOOL)jobsVisible; 和 -(void)setJobsVisible:(BOOL)jobsVisible;
Prop_assign()BOOL isInvisible;/// 此属性默认就是NO，即可见
Prop_assign()BOOL isMultiLineShows;/// 是否多行行显示【默认单行显示】
Prop_assign()UILabelShowingType labelShowingType;
#pragma mark —— 定位
Prop_assign()NSUInteger jobsTag;
#pragma mark —— 点击
Prop_assign()BOOL jobsSelected;
Prop_assign()BOOL jobsEnabled;
Prop_strong(nullable)UIAction *primaryAction;/// 新Api的点击事件
Prop_copy(nullable)JobsReturnIDByIDBlock longPressGestureEventBlock;/// 按钮的长按事件
Prop_copy(nullable)JobsReturnIDByIDBlock clickEventBlock;/// 老Api的点击事件，利用RAC实现
#pragma mark —— ZFDouYinCell
-(void)zf_douyinRotation;

@end

NS_ASSUME_NONNULL_END

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

#endif /* UIViewModelOthersProtocol_synthesize */

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

#endif /* UIViewModelOthersProtocol_dynamic */

