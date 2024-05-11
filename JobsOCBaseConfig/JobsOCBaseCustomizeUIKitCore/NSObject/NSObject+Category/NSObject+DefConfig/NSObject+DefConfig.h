//
//  NSObject+DefConfig.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
// https://www.jianshu.com/p/564b5da57ea1
@interface NSObject (DefConfig)
// 回到主线程
-(void)getMainQueue:(jobsByVoidBlock)block;
// 开启一个子线程
-(void)getGlobalQueue:(jobsByVoidBlock)block;
/// 从现在开始，等待一段时间，去做一件事情
/// @param delay 从现在开始，等待的时间
/// @param doSthBlock 去做的一件事情
-(void)delay:(CGFloat)delay
       doSth:(jobsByIDBlock)doSthBlock;

@end

NS_ASSUME_NONNULL_END
