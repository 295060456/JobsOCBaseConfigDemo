//
//  NSObject+Data.m
//  FM
//
//  Created by User on 9/16/24.
//

#import "NSObject+Data.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"

@implementation NSObject (Data)
#pragma mark —— 关于数据（MJExtension）解析
/// 对待输入参数是含字典的数组
+(JobsReturnArrByArrBlock)byDataArr{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray <NSDictionary *>*_Nullable data){
        @jobs_strongify(self)
        return [self.class mj_objectArrayWithKeyValuesArray:data];
    };
}
/// 对待输入参数是字典
+(JobsReturnIDByDicBlock)byDataDic{
    @jobs_weakify(self)
    return ^id _Nullable(__kindof NSDictionary *_Nullable data){
        @jobs_strongify(self)
        return [self.class mj_objectWithKeyValues:data];
    };
}
/// 万能解析
+(JobsReturnIDByIDBlock)byData{
    @jobs_weakify(self)
    return ^id _Nullable(id _Nullable data){
        @jobs_strongify(self)
        if(KindOfDicCls(data)) return [self.class mj_objectWithKeyValues:data];
        if(KindOfArrCls(data)) return [self.class mj_objectArrayWithKeyValuesArray:data];
        return nil;
    };
}
#pragma mark —— 关于数据存储
///【对FileFolderHandleTool的二次封装】 存数据，储存成功返回地址
/// @param data 被储存的数据
/// @param documentsChildDir 在documents旗下的子文件夹名，也可以不用子文件夹进行管理
/// @param fileFullname 对应写入的文件带后缀的全民
/// @param error 错误抛出
+(NSString *_Nullable)saveData:(id _Nonnull)data
         withDocumentsChildDir:(NSString *_Nullable)documentsChildDir
                  fileFullname:(NSString *_Nonnull)fileFullname
                         error:(NSError *__autoreleasing *)error{
    /// 文件夹路径
    if (isNull(documentsChildDir)) {
        documentsChildDir = JobsInternationalization(@"");
    }
    NSString *folderPath = NSString.documentsDir.add(@"/").add(documentsChildDir);
    /// 创建文件夹
    [FileFolderHandleTool createFoldByFolderUrl:folderPath error:error];
    /// 文件全名带后缀路径
    NSString *localFileFullNameStr = folderPath.add(@"/").add(fileFullname);
    /// 在此文件夹下创建空白文件
    BOOL k = [FileFolderHandleTool createFileWithFolderAtPath:localFileFullNameStr
                                                 contentsData:nil
                                                    overwrite:YES
                                                        error:error];
    BOOL Q = NO;
    if (k) {
        /// 写文件。
        Q = [FileFolderHandleTool writeFileAtPath:localFileFullNameStr
                                          content:data
                                            error:error];
    }return Q ? localFileFullNameStr : @"";
}
#pragma mark —— 关于万物数据绑定
#pragma mark —— @property(nonatomic,strong,nullable)id __block data;/// 绑定的数据源，数据类型id
JobsKey(_data)
@dynamic data;
-(id)data{
    return Jobs_getAssociatedObject(_data);
}

-(void)setData:(id)data{
    Jobs_setAssociatedRETAIN_NONATOMIC(_data, data)
}
#pragma mark —— UIViewModelOthersProtocol.requestParams /// 绑定的数据源，数据类型id
JobsKey(_requestParams)
@dynamic requestParams;
-(id)requestParams{
    return Jobs_getAssociatedObject(_requestParams);
}

-(void)setRequestParams:(id)requestParams{
    Jobs_setAssociatedRETAIN_NONATOMIC(_requestParams, requestParams)
}

@end

#pragma clang diagnostic pop
