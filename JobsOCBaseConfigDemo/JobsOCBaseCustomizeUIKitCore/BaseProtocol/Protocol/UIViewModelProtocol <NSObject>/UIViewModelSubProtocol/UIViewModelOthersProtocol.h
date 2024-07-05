//
//  UIViewModelOthersProtocol.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsLabelDef.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@class UIViewModel;

NS_ASSUME_NONNULL_BEGIN

@protocol UIViewModelOthersProtocol <NSObject>
@optional
#pragma mark —— 其他
@property(nonatomic,assign)AppLanguage appLanguage;
@property(nonatomic,strong,nullable)Class __block cls;/// 绑定的class
@property(nonatomic,strong,nullable)UIViewModel __block *viewModel;
@property(nonatomic,strong,nullable)NSMutableArray <UIViewModel *> __block *viewModelMutArr;
@property(nonatomic,strong,nullable)RACSignal __block *reqSignal;
@property(nonatomic,strong,nullable)NSString __block *internationalizationKEY;/// 国际化的key
@property(nonatomic,assign)NSUInteger __block jobsTag;
@property(nonatomic,assign)BOOL __block jobsSelected;
@property(nonatomic,assign)BOOL __block isMultiLineShows;/// 是否多行行显示【默认单行显示】
@property(nonatomic,assign)BOOL __block isTranslucent;/// 是否取消tabBar的透明效果
@property(nonatomic,assign)BOOL __block isVisible;/// ❤️只是一个标记是否可见，如果需要设置请移步@interface UIView (Extras) ：-(BOOL)jobsVisible; 和 -(void)setJobsVisible:(BOOL)jobsVisible;
@property(nonatomic,assign)UILabelShowingType labelShowingType;
@property(nonatomic,strong,nullable)id __block data;/// 绑定的数据源，数据类型id
@property(nonatomic,strong,nullable)id __block requestParams;/// 绑定的数据源，数据类型id
@property(nonatomic,strong,nullable)NSMutableSet __block *jobsDataMutSet;/// 绑定的数据源，数据类型NSMutableSet
@property(nonatomic,strong,nullable)NSMutableArray __block *jobsDataMutArr;/// 绑定的数据源，数据类型NSMutableArray
@property(nonatomic,strong,nullable)NSMutableDictionary __block *jobsDataMutDic;/// 绑定的数据源，数据类型NSMutableDictionary
// Layer
@property(nonatomic,strong,nullable)UIColor __block *layerBorderCor;
@property(nonatomic,assign)CGFloat __block layerBorderWidth;
@property(nonatomic,assign)CGFloat __block layerCornerRadius;

@end

NS_ASSUME_NONNULL_END

#pragma mark —— @synthesize UIViewModelOthersProtocol
#ifndef UIViewModelOthersProtocol_synthesize
#define UIViewModelOthersProtocol_synthesize \
\
@synthesize appLanguage = _appLanguage;\
@synthesize cls = _cls;\
@synthesize viewModel = _viewModel;\
@synthesize viewModelMutArr = _viewModelMutArr;\
@synthesize reqSignal = _reqSignal;\
@synthesize internationalizationKEY = _internationalizationKEY;\
@synthesize jobsTag = _jobsTag;\
@synthesize jobsSelected = _jobsSelected;\
@synthesize isMultiLineShows = _isMultiLineShows;\
@synthesize isTranslucent = _isTranslucent;\
@synthesize isVisible = _isVisible;\
@synthesize labelShowingType = _labelShowingType;\
@synthesize layerBorderCor = _layerBorderCor;\
@synthesize layerBorderWidth = _layerBorderWidth;\
@synthesize layerCornerRadius = _layerCornerRadius;\
@synthesize data = _data;\
@synthesize requestParams = _requestParams;\
@synthesize jobsDataMutSet = _jobsDataMutSet;\
@synthesize jobsDataMutArr = _jobsDataMutArr;\
@synthesize jobsDataMutDic = _jobsDataMutDic;\

#endif

#pragma mark —— @dynamic UIViewModelOthersProtocol
#ifndef UIViewModelOthersProtocol_dynamic
#define UIViewModelOthersProtocol_dynamic \
\
@dynamic appLanguage;\
@dynamic cls;\
@dynamic viewModel;\
@dynamic viewModelMutArr;\
@dynamic reqSignal;\
@dynamic internationalizationKEY;\
@dynamic jobsTag;\
@dynamic jobsSelected;\
@dynamic isMultiLineShows;\
@dynamic isTranslucent;\
@dynamic isVisible;\
@dynamic labelShowingType;\
@dynamic layerBorderCor;\
@dynamic layerBorderWidth;\
@dynamic layerCornerRadius;\
@dynamic data;\
@dynamic requestParams;\
@dynamic jobsDataMutSet;\
@dynamic jobsDataMutArr;\
@dynamic jobsDataMutDic;\

#endif

