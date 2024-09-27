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
/// Masonry 均匀分布的布局方式封装
-(JobsReturnIDByMasonryModelBlock _Nonnull)installByMasonryModel;
-(jobsByBOOLBlock _Nonnull)jobsVisible;

@end

/**
 @property(nonatomic,strong)NSMutableArray <UIImageView *>*subViewsMutArr;
 self.subViewsMutArr.jobsVisible(YES);
 
 -(NSMutableArray<UIImageView *> *)subViewsMutArr{
     if(!_subViewsMutArr){
         @jobs_weakify(self)
         _subViewsMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIView *>*_Nullable data) {
             @jobs_strongify(self)
             data.add(BonusEarnedView.JobsRichElementsInViewWithModel(nil));
             data.add(InvitedFriendsNumberView.JobsRichElementsInViewWithModel(nil));
             data.add(CopyLinkView.JobsRichElementsInViewWithModel(nil));
             data.add(DownloadQRCodeView.JobsRichElementsInViewWithModel(nil));
             for (UIView *view in data) {
                 self.view.addSubview(view);
             }
         }).installByMasonryModel(jobsMakeMasonryModel(^(__kindof MasonryModel * _Nullable data) {
             data.axisType = MASAxisTypeHorizontal;
             data.fixedSpacing = JobsWidth(22);
             data.leadSpacing = JobsWidth(52);
             data.tailSpacing = JobsWidth(52);
             data.top = JobsWidth(90);
             data.height = [BonusEarnedView viewSizeWithModel:nil].height;
         }));
     }return _subViewsMutArr;
 }
 */
