//
//  JobsSearchConfig.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/14.
//

#ifndef JobsSearchConfig_h
#define JobsSearchConfig_h

#ifndef JobsSearchShowHotwordsTBVCellHeight ///???
#define JobsSearchShowHotwordsTBVCellHeight JobsWidth(40)//行高
#endif

#ifndef JobsSearchHistoryData
#define JobsSearchHistoryData @"JobsSearchHistoryData"
#endif

#ifndef listNum  //???
#define listNum 2//列数
#endif

#ifndef StorageID
#define StorageID @"StorageID"
#endif

#ifndef HOT_SEARCH_STYLE_ENUM_DEFINED
#define HOT_SEARCH_STYLE_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, HotSearchStyle) {
    HotSearchStyle_1 = 0, /// 横排自适应提行
    HotSearchStyle_2,     /// 一行N列（默认N = 2），前三颜色突出表示
    HotSearchStyle_3,     /// 暂时未定义
};
#endif /* HOT_SEARCH_STYLE_ENUM_DEFINED */
/// 取数据
NS_INLINE NSArray *_Nullable JobsSearchReadData(void){
    return (NSArray *)NSUserDefaults.readWithKey(StorageID);
}
/// 存数据
NS_INLINE void JobsSearchStorageData(_Nonnull id data){
    NSArray *arr = (NSArray *)NSUserDefaults.readWithKey(StorageID);
    UserDefaultModel *userDefaultModel = UserDefaultModel.new;

    if ([arr containsObject:data]) return;
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:arr];/// 实际存档的是数组
    [mutArr addObject:data];
    userDefaultModel.obj = mutArr;
    userDefaultModel.key = StorageID;

    NSUserDefaults.updateWithModel(userDefaultModel);
}

#endif /* JobsSearchConfig_h */
