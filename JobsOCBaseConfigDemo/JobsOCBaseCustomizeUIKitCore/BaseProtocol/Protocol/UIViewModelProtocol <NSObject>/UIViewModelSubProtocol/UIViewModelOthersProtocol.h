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

@class UIViewModel;

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
@property(nonatomic,assign)BOOL isMultiLineShows;/// 是否多行行显示【默认单行显示】
@property(nonatomic,assign)UILabelShowingType labelShowingType;
#pragma mark —— Data
@property(nonatomic,assign)AppLanguage appLanguage;
@property(nonatomic,strong,nullable)NSString *internationalizationKEY;/// 国际化的key
@property(nonatomic,strong,nullable)NSMutableSet *jobsDataMutSet;/// 绑定的数据源，数据类型NSMutableSet
@property(nonatomic,strong,nullable)NSMutableArray *jobsDataMutArr;/// 绑定的数据源，数据类型NSMutableArray
@property(nonatomic,strong,nullable)NSMutableArray <UIViewModel *> *viewModelMutArr;
@property(nonatomic,strong,nullable)NSMutableDictionary *jobsDataMutDic;/// 绑定的数据源，数据类型NSMutableDictionary
@property(nonatomic,strong,nullable)Class cls;/// 绑定的class
@property(nonatomic,strong,nullable)RACSignal *reqSignal;
@property(nonatomic,strong,nullable)id data;/// 绑定的数据源，数据类型id
@property(nonatomic,strong,nullable)id requestParams;/// 绑定的数据源，数据类型id
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong,nullable)UIViewModel *viewModel;
#pragma mark —— 定位
@property(nonatomic,assign)NSUInteger jobsTag;
#pragma mark —— 点击
@property(nonatomic,assign)BOOL jobsSelected;
@property(nonatomic,assign)BOOL jobsEnabled;
@property(nonatomic,strong,nullable)UIAction *primaryAction;/// 新Api的点击事件
@property(nonatomic,copy,nullable)JobsReturnIDBySelectorBlock longPressGestureEventBlock;/// 按钮的长按事件
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
@synthesize isMultiLineShows = _isMultiLineShows;\
@synthesize labelShowingType = _labelShowingType;\
@synthesize appLanguage = _appLanguage;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize viewModelMutArr = _viewModelMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\
@synthesize cls = _cls;\
@synthesize reqSignal = _reqSignal;\
@synthesize data = _data;\
@synthesize requestParams = _requestParams;\
@synthesize url = _url;\
@synthesize viewModel = _viewModel;\
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
@dynamic isMultiLineShows;\
@dynamic labelShowingType;\
@dynamic appLanguage;\
@dynamic internationalizationKEY;\
@dynamic jobsDataMutSet;\
@dynamic jobsDataMutArr;\
@dynamic viewModelMutArr;\
@dynamic jobsDataMutDic;\
@dynamic cls;\
@dynamic reqSignal;\
@dynamic data;\
@dynamic requestParams;\
@dynamic url;\
@dynamic viewModel;\
@dynamic jobsTag;\
@dynamic jobsSelected;\
@dynamic jobsEnabled;\
@dynamic primaryAction;\
@dynamic longPressGestureEventBlock;\
@dynamic clickEventBlock;\

#endif

