//
//  OCDynamic.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 【消息转发】不实现h文件暴露的方法，而进行动态链接
@interface OCDynamic : NSObject

+(void)Test;
-(void)test;

@end

NS_ASSUME_NONNULL_END
