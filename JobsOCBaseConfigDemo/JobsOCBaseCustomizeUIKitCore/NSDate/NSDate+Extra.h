//
//  NSDate+Extra.h
//  FM
//
//  Created by User on 9/13/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extra)
/// 将NSDate转化为可视化的时间字符串（年/月/日）
-(NSString *)toVisualTime;

@end

NS_ASSUME_NONNULL_END
