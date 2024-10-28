//
//  NSArray+Tools.h
//  Wifi
//
//  Created by muxi on 14/11/27.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "MasonryModel.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

@interface NSArray (Tools)
/// 数组里面是否包含某个元素
-(JobsReturnBOOLByIDBlock _Nonnull)containsObject;
/// 数组转字符串
-(NSString *_Nonnull)string;
/// 数组比较
-(JobsReturnBOOLByArrBlock _Nonnull)compareEqualArrElement;
/// 数组计算交集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForIntersectionWithOtherArray;
/// 数据计算差集
-(JobsReturnArrayByArrayBlock _Nonnull)arrayForMinusWithOtherArray;
-(jobsByBOOLBlock _Nonnull)jobsVisible;
-(JobsReturnArrByMasonryBlock _Nonnull)installByMasonryBlock;
#pragma mark —— Masonry 均匀分布的布局方式封装
/// 在指定的轴方向上，按照固定的间距分布多个视图。每个视图之间的间距是固定的，而不是视图本身的尺寸固定。
-(JobsReturnArrByMasonryModelBlock _Nonnull)installByMasonryModel1;
/// 将一组视图沿某个方向（水平或垂直）等间距分布，视图的宽度（或高度）是固定的，且视图与容器的两端没有间隔。
-(JobsReturnArrByMasonryModelBlock _Nonnull)installByMasonryModel2;
/// 转成可变数组
-(JobsReturnMutableArrayByVoidBlock _Nonnull)mutableArr;

@end

/**
 @property(nonatomic,strong)NSMutableArray <UIImageView *>*subViewsMutArr;
 self.subViewsMutArr.jobsVisible(YES);
 
 -(NSMutableArray<__kindof UIView *> *)subViewsMutArr{
     if(!_subViewsMutArr){
         @jobs_weakify(self)
         _subViewsMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIView *>*_Nullable data) {
             @jobs_strongify(self)
             data.add(BaseButton.jobsInit()
                      .bgColor(JobsClearColor.colorWithAlphaComponent(0))
                      .jobsResetBtnBgImage(JobsIMG(@"纸飞机账户绑定"))
                      .onClick(^(UIButton *x){
                          toast(@"纸飞机");
                      }).onLongPressGesture(^(id data){
                          NSLog(@"");
                      }));
             data.add(BaseButton.jobsInit()
                      .bgColor(JobsClearColor.colorWithAlphaComponent(0))
                      .jobsResetBtnBgImage(JobsIMG(@"脸书账户绑定"))
                      .onClick(^(UIButton *x){
                          toast(@"脸书");
                      }).onLongPressGesture(^(id data){
                          NSLog(@"");
                      }));
             data.add(BaseButton.jobsInit()
                      .bgColor(JobsClearColor.colorWithAlphaComponent(0))
                      .jobsResetBtnBgImage(JobsIMG(@"Viber账户绑定"))
                      .onClick(^(UIButton *x){
                          toast(@"Viber");
                      }).onLongPressGesture(^(id data){
                          NSLog(@"");
                      }));
             for (UIView *view in data) {
                 self.addSubview(view);
             }
         }).installByMasonryModel1(jobsMakeMasonryModel(^(__kindof MasonryModel * _Nullable data) {
             data.axisType = MASAxisTypeHorizontal;
             data.fixedSpacing = JobsWidth(17);
             data.leadSpacing = JobsWidth(22);
             data.tailSpacing = JobsWidth(22);
             data.bottom = JobsWidth(-10);
             data.height = JobsWidth(26);
             data.is_mas_makeConstraints = YES;
         })).installByMasonryBlock(^(MASConstraintMaker *_Nonnull data){
             
         });
     }return _subViewsMutArr;
 }
 */
