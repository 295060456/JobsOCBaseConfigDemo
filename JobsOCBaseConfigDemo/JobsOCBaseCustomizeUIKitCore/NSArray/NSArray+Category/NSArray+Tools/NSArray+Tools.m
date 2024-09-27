//
//  NSArray+Tools.m
//  Wifi
//
//  Created by muxi on 14/11/27.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import "NSArray+Tools.h"

@implementation NSArray (Tools)
/// 数组里面是否包含某个元素
-(JobsReturnBOOLByIDBlock _Nonnull)containsObject{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data) {
        @jobs_strongify(self)
        if(!data) return NO;
        return [self containsObject:data];
    };
}
/// 数组转字符串
-(NSString *_Nonnull)string{
    if(!self ||self.count == 0) return JobsInternationalization(@"");
    NSMutableString *str = NSMutableString.string;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,
                                       BOOL *stop) {
        [str appendFormat:@"%@,",obj];
    }];
    //删除最后一个','
    NSString *strForRight = [str substringWithRange:NSMakeRange(0, str.length - 1)];
    return strForRight;
}
/// 数组比较
-(JobsReturnBOOLByArrBlock _Nonnull)compareEqualArrElement{
    @jobs_weakify(self)
    return ^BOOL(NSArray *_Nullable array){
        @jobs_strongify(self)
        return [[NSSet setWithArray:self] isEqualToSet:[NSSet setWithArray:array]];
    };
}
/// 数组计算交集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForIntersectionWithOtherArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable otherArray){
        @jobs_strongify(self)
        if(self.count == 0) return nil;
        if(!otherArray) return nil;
        return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            for (id obj in self) {/// 遍历
                if(!otherArray.containsObject(obj)) continue;
                data.add(obj);/// 添加
            }
        });
    };
}
/// 数据计算差集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForMinusWithOtherArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable otherArray){
        @jobs_strongify(self)
        if(!self) return nil;
        if(!otherArray) return self;
        return jobsMakeMutArr(^(NSMutableArray *array) {
            @jobs_strongify(self)
            [array addObjectsFromArray:self];
            for (id obj in otherArray) {
                if(!self.containsObject(obj)) continue;
                [array removeObject:obj];
            }
        });
    };
}
/// Masonry 均匀分布的布局方式封装
-(JobsReturnIDByMasonryModelBlock _Nonnull)installByMasonryModel{
    @jobs_weakify(self)
    return ^id _Nullable(__kindof MasonryModel *_Nullable data){
        @jobs_strongify(self)
        [self mas_distributeViewsAlongAxis:data.axisType/// 在水平（垂直）方向上分布这些视图
                          withFixedSpacing:data.fixedSpacing/// 指定每个视图之间的固定间距
                               leadSpacing:data.leadSpacing/// 指定第一个视图与父视图左边缘（顶部）之间的距离
                               tailSpacing:data.tailSpacing];/// 指定最后一个视图与父视图右边缘（底部）之间的距离
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            /// 横向拉伸以均分
            if(data.axisType == MASAxisTypeHorizontal){
                if(data.top) make.top.equalTo(@(data.top));
                if(data.bottom) make.bottom.equalTo(@(data.bottom));
                make.height.equalTo(@(data.height));
            }
            /// 纵向拉伸以均分
            if(data.axisType == MASAxisTypeVertical){
                if(data.left) make.left.equalTo(@(data.left));
                if(data.right) make.right.equalTo(@(data.right));
                make.width.equalTo(@(data.width));
            }
        }];return self;
    };
}

-(jobsByBOOLBlock _Nonnull)jobsVisible{
    @jobs_weakify(self)
    return ^(BOOL data){
        @jobs_strongify(self)
        for (UIView *view in self) {
            view.jobsVisible = data;
        }
    };
}

@end
