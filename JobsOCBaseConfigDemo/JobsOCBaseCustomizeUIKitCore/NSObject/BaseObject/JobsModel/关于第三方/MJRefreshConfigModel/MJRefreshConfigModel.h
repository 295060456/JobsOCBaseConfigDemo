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
@property(nonatomic,strong)UIFont *font;
#pragma mark —— TextColor
@property(nonatomic,strong)UIColor *textColor;
#pragma mark —— duration
@property(nonatomic,assign)CGFloat stateIdleDuration;
@property(nonatomic,assign)CGFloat pullingDuration;
@property(nonatomic,assign)CGFloat refreshingDuration;
@property(nonatomic,assign)CGFloat willRefreshDuration;
@property(nonatomic,assign)CGFloat noMoreDataDuration;
#pragma mark —— title
@property(nonatomic,strong)NSString *stateIdleTitle;
@property(nonatomic,strong)NSString *pullingTitle;
@property(nonatomic,strong)NSString *refreshingTitle;
@property(nonatomic,strong)NSString *willRefreshTitle;
@property(nonatomic,strong)NSString *noMoreDataTitle;
#pragma mark —— 静态图内部拼接出的动效，而非Gif
@property(nonatomic,strong)NSMutableArray <UIImage *>*stateIdlePicsMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*pullingPicsMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*refreshingPicsMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*willRefreshPicsMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*noMoreDataPicsMutArr;
#pragma mark —— Lottie配置
@property(nonatomic,strong)NSString *jsonLottiefilePaths;
@property(nonatomic,copy)JobsReturnIDByIDBlock loadBlock;
#pragma mark —— 其他
/** 根据拖拽比例自动切换透明度 */
@property(assign,nonatomic,getter=isAutomaticallyChangeAlpha)BOOL automaticallyChangeAlpha;
@property(nonatomic,assign)BOOL isShake;/// 是否需要震动反馈？默认不需要

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof MJRefreshConfigModel *_Nonnull jobsMakeRefreshConfigModel(jobsByRefreshConfigModelBlock _Nonnull block){
    MJRefreshConfigModel *model = MJRefreshConfigModel.alloc.init;
    if (block) block(model);
    return model;
}
