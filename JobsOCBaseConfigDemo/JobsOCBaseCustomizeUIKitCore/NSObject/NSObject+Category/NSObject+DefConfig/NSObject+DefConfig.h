//
//  NSObject+DefConfig.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "NSString+Others.h"

NS_ASSUME_NONNULL_BEGIN
// https://www.jianshu.com/p/564b5da57ea1
@interface NSObject (DefConfig)
/// 用于：UI刷新（高频需求）
-(void)delayByMainQueue:(int64_t)time block:(jobsByUInt64_tBlock)block;
/// 用于：重计算 / IO
-(void)delayByGlobalQueue:(int64_t)time block:(jobsByUInt64_tBlock)block;

@end

NS_ASSUME_NONNULL_END
