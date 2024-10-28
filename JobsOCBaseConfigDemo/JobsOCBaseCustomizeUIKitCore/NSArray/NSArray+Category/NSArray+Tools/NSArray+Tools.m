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

-(jobsByBOOLBlock _Nonnull)jobsVisible{
    @jobs_weakify(self)
    return ^(BOOL data){
        @jobs_strongify(self)
        for (UIView *view in self) {
            view.jobsVisible = data;
        }
    };
}

-(JobsReturnArrByMasonryBlock _Nonnull)installByMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(jobsByMASConstraintMakerBlock _Nonnull data){
        @jobs_strongify(self)
        [self mas_makeConstraints:data];
        return self;
    };
}
#pragma mark —— Masonry 均匀分布的布局方式封装
/// 在指定的轴方向上，按照固定的间距分布多个视图。每个视图之间的间距是固定的，而不是视图本身的尺寸固定。
-(JobsReturnArrByMasonryModelBlock _Nonnull)installByMasonryModel1{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof MasonryModel *_Nullable data){
        @jobs_strongify(self)
        [self mas_distributeViewsAlongAxis:data.axisType/// 在水平（垂直）方向上分布这些视图
                          withFixedSpacing:data.fixedSpacing/// 指定每个视图之间的固定间距
                               leadSpacing:data.leadSpacing/// 指定第一个视图与父视图左边缘（顶部）之间的距离
                               tailSpacing:data.tailSpacing];/// 指定最后一个视图与父视图右边缘（底部）之间的距离
        if(data.is_mas_makeConstraints){
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
            }];
        }return self;
    };
}
/// 将一组视图沿某个方向（水平或垂直）等间距分布，视图的宽度（或高度）是固定的，且视图与容器的两端没有间隔。
-(JobsReturnArrByMasonryModelBlock _Nonnull)installByMasonryModel2{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof MasonryModel *_Nullable data){
        @jobs_strongify(self)
        [self mas_distributeViewsAlongAxis:data.axisType/// 在水平（垂直）方向上分布这些视图
                       withFixedItemLength:data.fixedItemLength/// 设置每个视图的固定宽度或高度
                               leadSpacing:data.leadSpacing/// 指定第一个视图与父视图左边缘（顶部）之间的距离
                               tailSpacing:data.tailSpacing];/// 指定最后一个视图与父视图右边缘（底部）之间的距离
        if(data.is_mas_makeConstraints){
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
            }];
        }return self;
    };
}
/// 转成可变数组
-(JobsReturnMutableArrayByVoidBlock _Nonnull)mutableArr{
    @jobs_weakify(self)
    return ^__kindof NSMutableArray *_Nullable(void){
        @jobs_strongify(self)
        return [NSMutableArray arrayWithArray:self];
    };
}

@end
