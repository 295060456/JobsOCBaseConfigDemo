//
//  GoodsClassModel.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/15.
//

#import "GoodsClassModel.h"

@implementation GoodsClassModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"idField":@"id",
             };
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"childrenList":GoodsClassModel.class,
             };
}

-(NSMutableArray<GoodsClassModel *> *)childrenList{
    if (!_childrenList) {
        _childrenList = NSMutableArray.array;
    }return _childrenList;
}

@end
