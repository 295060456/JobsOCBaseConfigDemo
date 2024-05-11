//
//  NSUserDefaults+Manager.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>
#import "UserDefaultModel.h"
#import "JobsUserDefaultDefine.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Manager)
/// 存数据
+(void)updateWithModel:(UserDefaultModel *)userDefaultModel;
/// 读取数据
+(id _Nullable)readWithKey:(NSString *)key;
/// 删除数据
+(void)deleteWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
