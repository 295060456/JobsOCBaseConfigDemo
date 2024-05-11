//
//  FMDatabase+Manager.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "LoadingImage.h"
#import "FileFolderHandleTool.h"

#if __has_include(<FMDB/FMDB.h>)
#import <FMDB/FMDB.h>
#else
#import "FMDB.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMDatabase (Manager)
/// 依据路径创建数据库
-(FMDatabase *)createDataBaseWithPath:(NSString *_Nullable)dbPath;
/// 实际对数据库有变动的操作
-(BOOL)handleExecuteUpdate:(NSString *)executeUpdate
      withArgumentsInArray:(NSArray *_Nullable)argumentsInArray;
#pragma mark —— 增删改查中 除了查询（executeQuery），其余操作都用（executeUpdate）
-(BOOL)handleInsert;

-(BOOL)handleDelete;

-(BOOL)handleUpdate;

-(FMResultSet *)handleQuery;
/// 开启事务，返回是否事务回滚
/// @param targetObj 指定的某类实例上开启事务
/// @param methodName 开启的事务提取出来封装成一个不带参方法
-(BOOL)handleTargetObj:(nonnull NSObject *)targetObj
           transaction:(nullable NSString *)methodName;
/// 多线程保护使用FMDB数据库
/// @param dbPath 依据路径索引到数据库文件
/// @param doWithBlock 具体做的事情
-(void)handleMultiThreadedProtectionDB:(NSString *_Nullable)dbPath
                                doWith:(jobsByIDBlock)doWithBlock;


@end

NS_ASSUME_NONNULL_END
