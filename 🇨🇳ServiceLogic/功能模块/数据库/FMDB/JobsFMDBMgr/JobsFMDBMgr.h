//
//  JobsFMDBMgr.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import <Foundation/Foundation.h>

#if __has_include(<FMDB/FMDB.h>)
#import <FMDB/FMDB.h>
#else
#import "FMDB.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 
 FMDB 是一个封装了 SQLite 的 Objective-C 库，提供了方便的接口进行数据库操作，确实简化了直接编写 SQL 语句的过程，但实际上还是需要编写 SQL 语句来进行数据库操作。
 FMDB 主要提供了一些简洁的方法来执行 SQL 语句和处理结果集。
 */
@interface JobsFMDBMgr : NSObject

+(instancetype)sharedManager;
/// 单例的销毁
+(void)destroyInstance;
/// 建表
- (void)createTable;
/// 增加数据
- (void)insertUserWithName:(NSString *)name age:(NSInteger)age;
/// 查询数据
- (NSArray *)fetchAllUsers;
/// 更新/改正 数据
- (void)updateUserWithID:(NSInteger)userID newName:(NSString *)newName newAge:(NSInteger)newAge;
/// 删除数据
- (void)deleteUserWithID:(NSInteger)userID;

@end

NS_ASSUME_NONNULL_END
