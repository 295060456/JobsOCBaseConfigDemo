//
//  MJRefreshConfig.h
//  DouYin
//
//  Created by Jobs on 2020/12/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsLoadingImage.h"
#import "MacroDef_Cor.h"
#import "JobsBlock.h"
#import "MacroDef_String.h"
#import "NSString+Conversion.h"
#import "NSString+Others.h"
#import "NSMutableArray+Extra.h"
/**
 MJRefreshStateIdle,   //   普通闲置状态
 MJRefreshStatePulling,   //   松开就可以进行刷新的状态
 MJRefreshStateRefreshing,   //   正在刷新中的状态
 MJRefreshStateWillRefresh,   //   即将刷新的状态
 MJRefreshStateNoMoreData   //   所有数据加载完毕，没有更多的数据了
 */
NS_ASSUME_NONNULL_BEGIN

typedef enum : NSInteger {
    /// 开始刷新
    RefreshingType_beginRefreshing = 0,
    /// 结束刷新
    RefreshingType_endRefreshing
} RefreshingType;

@interface MJRefreshConfigModel : NSObject

#pragma mark —— Font
Prop_strong()UIFont *font;
#pragma mark —— TextColor
Prop_strong()UIColor *textColor;
#pragma mark —— duration
Prop_assign()CGFloat stateIdleDuration;
Prop_assign()CGFloat pullingDuration;
Prop_assign()CGFloat refreshingDuration;
Prop_assign()CGFloat willRefreshDuration;
Prop_assign()CGFloat noMoreDataDuration;
#pragma mark —— title
Prop_copy()NSString *stateIdleTitle;
Prop_copy()NSString *pullingTitle;
Prop_copy()NSString *refreshingTitle;
Prop_copy()NSString *willRefreshTitle;
Prop_copy()NSString *noMoreDataTitle;
#pragma mark —— 静态图内部拼接出的动效，而非Gif
Prop_copy()NSMutableArray <UIImage *>*stateIdlePicsMutArr;
Prop_copy()NSMutableArray <UIImage *>*pullingPicsMutArr;
Prop_copy()NSMutableArray <UIImage *>*refreshingPicsMutArr;
Prop_copy()NSMutableArray <UIImage *>*willRefreshPicsMutArr;
Prop_copy()NSMutableArray <UIImage *>*noMoreDataPicsMutArr;
#pragma mark —— Lottie配置
Prop_copy()NSString *jsonLottiefilePaths;
Prop_copy()JobsReturnIDByIDBlock loadBlock;
#pragma mark —— 其他
/** 根据拖拽比例自动切换透明度 */
@property(assign,nonatomic,getter=isAutomaticallyChangeAlpha)BOOL automaticallyChangeAlpha;
Prop_assign()BOOL isShake;/// 是否需要震动反馈？默认不需要

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MJRefreshConfigModel *_Nonnull jobsMakeRefreshConfigModel(jobsByRefreshConfigModelBlock _Nonnull block){
    MJRefreshConfigModel *model = MJRefreshConfigModel.alloc.init;
    if (block) block(model);
    return model;
}
