//
//  NSUserDefaults+Manager.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>
#import "UserDefaultModel.h"
#import "JobsUserDefaultDefine.h"
#import "JobsBlock.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Manager)
/// CRUD（create, read, update, delete）
/// 存数据（包括父类直到NSObject的所有属性）
+(jobsByUserDefaultModelBlock)updateWithModel;
/// 读取数据
+(JobsReturnIDByStringBlock)readWithKey;
/// 删除数据
+(jobsByStringBlock)deleteWithKey;

@end

NS_ASSUME_NONNULL_END
