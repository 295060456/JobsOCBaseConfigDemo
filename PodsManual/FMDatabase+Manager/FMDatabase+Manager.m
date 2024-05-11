//
//  FMDatabase+Manager.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "FMDatabase+Manager.h"

@implementation FMDatabase (Manager)
/// 依据路径创建数据库
-(FMDatabase *)createDataBaseWithPath:(NSString *_Nullable)dbPath{
    // 数据库访问路径
    if (dbPath.nullString) {
        dbPath = [NSString.documentsDir stringByAppendingPathComponent:@"test.db"];
    }
    NSLog(@"!!!dbPath = %@",dbPath);
    // 创建对应路径下数据库
    return [FMDatabase databaseWithPath:dbPath];
}
/// 实际对数据库有变动的操作
-(BOOL)handleExecuteUpdate:(NSString *)executeUpdate
      withArgumentsInArray:(NSArray *_Nullable)argumentsInArray{
    if ([self open]) {
        BOOL result = [self executeUpdate:executeUpdate
                     withArgumentsInArray:argumentsInArray];
        [self close];
        return result;
    }return NO;
}
#pragma mark —— 增删改查中 除了查询（executeQuery），其余操作都用（executeUpdate）
-(BOOL)handleInsert{
    return [self handleExecuteUpdate:@"insert into 't_student'(ID,name,phone,score) values(?,?,?,?)"
                withArgumentsInArray:@[@113,@"x3",@"13",@53]];
}

-(BOOL)handleDelete{
    return [self handleExecuteUpdate:@"delete from 't_student' where ID = ?"
                withArgumentsInArray:@[@113]];
}

-(BOOL)handleUpdate{
    return [self handleExecuteUpdate:@"update 't_student' set ID = ? where name = ?"
                withArgumentsInArray:@[@113,@"x3"]];
}

-(FMResultSet *)handleQuery{
    return [self executeQuery:@"select * from 't_student' where ID = ?"
         withArgumentsInArray:@[@113]];
}
/// 开启事务，返回是否事务回滚
/// @param targetObj 指定的某类实例上开启事务
/// @param methodName 开启的事务提取出来封装成一个不带参方法
-(BOOL)handleTargetObj:(nonnull NSObject *)targetObj
           transaction:(nullable NSString *)methodName{
    if ([self open]) {
        // 开启事务
        NSDate *begin = NSDate.date;
        [self beginTransaction];
        BOOL rollBack = NO;
        
        @try {
            [NSObject targetObj:targetObj callingMethodWithName:methodName];
        }@catch(NSException *exception) {
            // 在事务中执行任务失败，退回开启事务之前的状态
            [self rollback];
            return rollBack = YES;
        }@finally {
            // 在事务中执行任务成功之后
            [self commit];
            [self close];
            
            NSDate *end = NSDate.date;
            NSTimeInterval time = [end timeIntervalSinceDate:begin];
            NSLog(@"事务耗时 = %f",time);
            
            return rollBack = NO;
        }
    }else{
        NSLog(@"打开数据库失败");
        return NO;
    }
}
/// 多线程保护使用FMDB数据库
/// @param dbPath 依据路径索引到数据库文件
/// @param doWithBlock 具体做的事情
-(void)handleMultiThreadedProtectionDB:(NSString *_Nullable)dbPath
                                doWith:(jobsByIDBlock)doWithBlock{
    FMDatabaseQueue *dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    if ([[self createDataBaseWithPath:dbPath] open]) {
        [dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
            if (doWithBlock) doWithBlock(db);
        }];
    }
}

@end
