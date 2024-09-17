//
//  NSObject+Data.h
//  FM
//
//  Created by User on 9/16/24.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "UIViewModelOthersProtocol.h"

#import "NSObject+CallBackInfoByBlock.h"
#import "JobsBlock.h"

#if __has_include(<TXFileOperation/TXFileOperation.h>)
#import <TXFileOperation/TXFileOperation.h>
#else
#import "TXFileOperation.h"
#endif

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import "FileFolderHandleTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Data)
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
,UIViewModelOthersProtocol
>

#pragma mark —— 关于数据（MJExtension）解析
/// 对待输入参数是含字典的数组
+(JobsReturnArrayByArrayBlock _Nonnull)byDataArr;
/// 对待输入参数是字典
+(JobsReturnIDByDicBlock _Nonnull)byDataDic;
/// 万能解析
+(JobsReturnIDByIDBlock _Nonnull)byData;
#pragma mark —— 关于数据存储
///【对FileFolderHandleTool的二次封装】 存数据，储存成功返回地址
/// @param data 被储存的数据
/// @param documentsChildDir 在documents旗下的子文件夹名，也可以不用子文件夹进行管理
/// @param fileFullname 对应写入的文件带后缀的全民
/// @param error 错误抛出
+(NSString *_Nullable)saveData:(id _Nonnull)data
         withDocumentsChildDir:(NSString *_Nullable)documentsChildDir
                  fileFullname:(NSString *_Nonnull)fileFullname
                         error:(NSError *__autoreleasing *)error;
@end

NS_ASSUME_NONNULL_END
