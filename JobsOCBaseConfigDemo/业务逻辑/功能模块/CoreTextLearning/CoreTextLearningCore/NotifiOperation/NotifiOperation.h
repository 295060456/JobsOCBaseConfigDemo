//
//  NotifiOperation.h
//  CoreTextLearning
//
//  Created by alan comb on 2021/4/10.
//

#import <Foundation/Foundation.h>
#import "NotifiView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NotifiOperation : NSOperation

@property(nonatomic,strong)id data;
/** 通知展示的父view */
@property(nonatomic,strong)UIView *fatherView;
/** block */
@property(nonatomic,copy)FinishBlock finishBlock;
/** showview */
@property(nonatomic,strong)NotifiView *showView;
/**
 增加一个操作
 @param fatherView 通知要显示在的父view
 @param data 通知的数据
 @param finishBlock 回调操作结束
 @return 操作
 */
+ (instancetype)addOperatioOnView:(UIView *)fatherView
                             Info:(id)data
                    completeBlock:(FinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
