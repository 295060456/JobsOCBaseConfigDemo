//
//  NSObject+Mock.h
//  FM
//
//  Created by Admin on 18/11/2024.
//

#import <Foundation/Foundation.h>

#import "NSObject+DEV.h"/// 开发环境
#import "NSObject+TEST.h"/// 测试环境
#import "NSObject+UAT.h"/// UAT 环境

NS_ASSUME_NONNULL_BEGIN
/// 测试调试专用
@interface NSObject (Mock)

@end

NS_ASSUME_NONNULL_END
