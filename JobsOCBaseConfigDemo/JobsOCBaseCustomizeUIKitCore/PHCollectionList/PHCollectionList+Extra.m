//
//  PHCollectionList+Extra.m
//  FM
//
//  Created by Admin on 26/12/2024.
//

#import "PHCollectionList+Extra.h"

@implementation PHCollectionList (Extra)
/// 对系统方法 fetchTopLevelUserCollectionsWithOptions 的二次封装
+(JobsReturnPHFetchResultWithPHCollectionByPHFetchOptionsBlock _Nonnull)initByOptions{
    return ^__kindof PHFetchResult <__kindof PHCollection *>*_Nonnull(__kindof PHFetchOptions *_Nullable options){
        /// 获取相册的集合
        return [PHCollectionList fetchTopLevelUserCollectionsWithOptions:options];
    };
}

@end
