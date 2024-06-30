//
//  NSObject+ChangeAppicon.h
//  Casino
//
//  Created by Jobs on 2021/12/14.
//

#import <Foundation/Foundation.h>
#import "MacroDef_Func.h"
#import "NSObject+WHToast.h"

NS_ASSUME_NONNULL_BEGIN
/**
    参考资料：https://github.com/maybeisyi/ChangeAppIconDemo
    https://www.jianshu.com/p/69313970d0e7
 */
@interface NSObject (ChangeAppicon)
/// 测试App更改图标
-(void)testChangeAppicon;
/// App更改图标核心代码
-(void)setAppIconWithName:(NSString *_Nullable)iconName;

@end

NS_ASSUME_NONNULL_END
