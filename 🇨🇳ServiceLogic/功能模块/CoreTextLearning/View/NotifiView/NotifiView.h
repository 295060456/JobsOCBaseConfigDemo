//
//  NotifiView.h
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import <UIKit/UIKit.h>
typedef void(^FinishBlock)(NSString* _Nullable key);
typedef NS_ENUM(NSInteger, NotifiViewState){
    NotifiViewStateInit = 0, //初始化
    NotifiViewStateReady, //就绪
    NotifiViewStateBegin, //开始动画执行
    NotifiViewStateStart, //开始动画结束，正式进入开始阶段
    NotifiViewStateShowing, //正在展示view
    NotifiViewStateEnd, //结束动画开始执行
    NotifiViewStateFinish //结束动画完成执行，整个view展示的生命周期结束
};

#ifndef SD_LOCK
#define SD_LOCK(lock) dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
#endif

#ifndef SD_UNLOCK
#define SD_UNLOCK(lock) dispatch_semaphore_signal(lock);
#endif

#define kNotifiViewKey @"key"
#define kNotifiViewContent @"content"

NS_ASSUME_NONNULL_BEGIN

@interface NotifiView : UIView

@property(nonatomic,assign)NotifiViewState state;
@property(nonatomic,assign)BOOL canAddtionTime;
@property(nonatomic,assign)NSTimeInterval duration;
@property(nonatomic,readonly,strong) NSDictionary* data;  // @{@"key":@"xxx", @"data" : {NSDictionary class]}
@property(nonatomic,copy)NSString* key;    ///当前可用的key值，  不能重复

- (void)updateWithData:(NSDictionary*)data
                finish:(FinishBlock)finishBlock;
- (void)showWithData:(NSDictionary*)data
              finish:(FinishBlock)finishBlock;
- (void)cancel;

@end

NS_ASSUME_NONNULL_END
