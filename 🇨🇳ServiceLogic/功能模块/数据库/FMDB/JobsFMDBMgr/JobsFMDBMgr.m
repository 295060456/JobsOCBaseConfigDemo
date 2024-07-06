//
//  JobsFMDBMgr.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import "JobsFMDBMgr.h"

@interface JobsFMDBMgr ()

@property(nonatomic,strong)FMDatabaseQueue *databaseQueue;

@end

@implementation JobsFMDBMgr

static JobsFMDBMgr *JobsFMDBMgrInstance;
static dispatch_once_t JobsFMDBMgrOnceToken;
+ (instancetype)sharedManager {
    dispatch_once(&JobsFMDBMgrOnceToken, ^{
        JobsFMDBMgrInstance = self.new;
    });return JobsFMDBMgrInstance;
}
/// 单例的销毁
+ (void)destroyInstance {
    JobsFMDBMgrOnceToken = 0;
    JobsFMDBMgrInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsFMDBMgrOnceToken, ^{
        JobsFMDBMgrInstance = [super allocWithZone:zone];
    });return JobsFMDBMgrInstance;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        NSString *docsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
        NSString *dbPath = [docsPath stringByAppendingPathComponent:@"users.db"];
        self.databaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        [self createTable];
    }return self;
}
/// 建表
- (void)createTable {
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *createTableQuery = @"CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)";
        BOOL success = [db executeUpdate:createTableQuery];
        if (success) {
            NSLog(@"Table created successfully.");
        } else {
            NSLog(@"Failed to create table.");
        }
    }];
}
/// 插入数据
- (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *insertQuery = @"INSERT INTO Users (name, age) VALUES (?, ?)";
        BOOL success = [db executeUpdate:insertQuery, name, @(age)];
        if (success) {
            NSLog(@"User inserted successfully.");
        } else {
            NSLog(@"Failed to insert user.");
        }
    }];
}
/// 查询数据
- (NSArray *)fetchAllUsers {
    NSMutableArray *users = NSMutableArray.array;
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *selectQuery = @"SELECT * FROM Users";
        FMResultSet *result = [db executeQuery:selectQuery];
        while (result.next) {
            NSDictionary *user = @{
                @"id": @([result intForColumn:@"id"]),
                @"name": [result stringForColumn:@"name"],
                @"age": @([result intForColumn:@"age"])
            };
            [users addObject:user];
        }
    }];return users;
}
/// 更新/改正 数据
- (void)updateUserWithID:(NSInteger)userID
                 newName:(NSString *)newName
                  newAge:(NSInteger)newAge {
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *updateQuery = @"UPDATE Users SET name = ?, age = ? WHERE id = ?";
        BOOL success = [db executeUpdate:updateQuery, newName, @(newAge), @(userID)];
        if (success) {
            NSLog(@"User updated successfully.");
        } else {
            NSLog(@"Failed to update user.");
        }
    }];
}
/// 删除数据
- (void)deleteUserWithID:(NSInteger)userID {
    [self.databaseQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *deleteQuery = @"DELETE FROM Users WHERE id = ?";
        BOOL success = [db executeUpdate:deleteQuery, @(userID)];
        if (success) {
            NSLog(@"User deleted successfully.");
        } else {
            NSLog(@"Failed to delete user.");
        }
    }];
}

@end
