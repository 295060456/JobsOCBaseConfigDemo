//
//  MKCommentModel.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/23.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsCommentModel.h"

@implementation JobsChildCommentModel

#pragma mark —— YYModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
        @"ID" : @"id"
    };
}
#pragma mark —— MJExtention
+(NSDictionary *)mj_replacedKeyFromPropertyName {
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id"
    };
}

@end

@implementation JobsFirstCommentModel

#pragma mark —— YYModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
        @"ID" : @"id",
        @"childDataArr":@"child"
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"childDataArr" : JobsChildCommentModel.class
    };
}
#pragma mark —— MJExtention
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id",
        @"childDataArr":@"child"
    };
}

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"childDataArr" : JobsChildCommentModel.class
    };
}

@end

@implementation JobsCommentModel

#pragma mark —— YYModel
+ (NSDictionary *)modelCustomPropertyMapper{
    return @{
        @"listDataArr": @"list"
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"list" : JobsFirstCommentModel.class
    };
}
#pragma mark —— MJExtention
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"listDataArr" : @"list",
    };
}

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"listDataArr" : JobsFirstCommentModel.class,
    };
}

@end

@implementation JobsFirstCommentCustomCofigModel
#pragma mark —— 自定义属性
-(NSInteger)preMax{
    if (_preMax == 0) {
        _preMax = 3;
    }return _preMax;
}

-(NSInteger)loadMoreDataNum{
    if (_loadMoreDataNum == 0) {
        if (self.childDataArr.count) {
            return self.childDataArr.count - self.firstShowNum;//全加载 = 数据库有的 - 默认已经显示的
        }
    }return _loadMoreDataNum;
}

-(NSInteger)firstShowNum{
    if (self.isFullShow) {
        return self.childDataArr.count;
    }else{
        return self.childDataArr.count > self.preMax ? self.preMax : self.childDataArr.count;
    }
}

-(BOOL)isFullShow{
    return NO;
}

@end
