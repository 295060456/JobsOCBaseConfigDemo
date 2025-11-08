//
// UIViewModelOthersProtocol.h
// JobsOCBaseConfig
//
// Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DefineProperty.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举
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
Prop_assign()CGFloat Alpha;
Prop_assign()BOOL opaque;
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
#pragma mark —— 展现控制器的方式
Prop_assign()ComingStyle pushOrPresent;
#pragma mark —— 点击
Prop_assign()BOOL jobsSelected;
Prop_assign()BOOL jobsEnabled;
Prop_strong(nullable)UIAction *primaryAction;/// 新Api的点击事件
/// 一般用于 UIButtonModel
Prop_copy(nullable)JobsRetIDByIDBlock clickEventBlock;/// 老Api的点击事件，利用RAC实现
Prop_copy(nullable)JobsRetIDByIDBlock longPressGestureEventBlock;/// 按钮的长按事件
/// 一般用于 UIButton
Prop_copy(nullable)jobsByBtnBlock onClickBlock;
Prop_copy(nullable)jobsByBtnBlock onLongPressGestureEventBlock;
#pragma mark —— 挂载的对象
Prop_strong(nullable)UIView *VIEW; /// 慎用：挂载的对象除非主动置空，否则生命周期于本对象同步消亡
Prop_strong(nullable)UIViewController *VC; /// 慎用：挂载的对象除非主动置空，否则生命周期于本对象同步消亡
#pragma mark —— ZFDouYinCell
-(void)zf_douyinRotation;

@end

typedef JobsRetIDByIDBlock _Nonnull (^JobsReturnIDBlockByIDBlock)(id <UIViewModelOthersProtocol>_Nullable data);

NS_ASSUME_NONNULL_END

#ifndef UIViewModelOthersProtocol_synthesize
#define UIViewModelOthersProtocol_synthesize \
\
@synthesize Alpha = _Alpha;\
@synthesize opaque = _opaque;\
@synthesize layerBorderCor = _layerBorderCor;\
@synthesize layerBorderWidth = _layerBorderWidth;\
@synthesize layerCornerRadius = _layerCornerRadius;\
@synthesize isTranslucent = _isTranslucent;\
@synthesize isVisible = _isVisible;\
@synthesize isInvisible = _isInvisible;\
@synthesize isMultiLineShows = _isMultiLineShows;\
@synthesize labelShowingType = _labelShowingType;\
@synthesize jobsTag = _jobsTag;\
@synthesize pushOrPresent = _pushOrPresent;\
@synthesize jobsSelected = _jobsSelected;\
@synthesize jobsEnabled = _jobsEnabled;\
@synthesize primaryAction = _primaryAction;\
@synthesize clickEventBlock = _clickEventBlock;\
@synthesize longPressGestureEventBlock = _longPressGestureEventBlock;\
@synthesize onClickBlock = _onClickBlock;\
@synthesize onLongPressGestureEventBlock = _onLongPressGestureEventBlock;\
@synthesize VIEW = _VIEW;\
@synthesize VC = _VC;\

#endif /* UIViewModelOthersProtocol_synthesize */

#ifndef UIViewModelOthersProtocol_dynamic
#define UIViewModelOthersProtocol_dynamic \
\
@dynamic Alpha;\
@dynamic opaque;\
@dynamic layerBorderCor;\
@dynamic layerBorderWidth;\
@dynamic layerCornerRadius;\
@dynamic isTranslucent;\
@dynamic isVisible;\
@dynamic isInvisible;\
@dynamic isMultiLineShows;\
@dynamic labelShowingType;\
@dynamic jobsTag;\
@dynamic pushOrPresent;\
@dynamic jobsSelected;\
@dynamic jobsEnabled;\
@dynamic primaryAction;\
@dynamic clickEventBlock;\
@dynamic longPressGestureEventBlock;\
@dynamic onClickBlock;\
@dynamic onLongPressGestureEventBlock;\
@dynamic VIEW;\
@dynamic VC;\

#endif /* UIViewModelOthersProtocol_dynamic */

