//
//  JobsExcelConfigureViewModel.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <Foundation/Foundation.h>
#import "UIButtonModel.h"
#import "JobsBlock.h"
#import "DefineProperty.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@interface JobsExcelConfigureViewModel : NSObject
#pragma mark —— 表格设置
/// 公共设置
Prop_assign()CGFloat XZExcelW;/// 整张Excel表的宽度
Prop_assign()CGFloat XZExcelH;/// 整张Excel表的高度
Prop_assign()CGFloat itemW;/// 单个表格宽度
Prop_assign()CGFloat itemH;/// 单个表格高度
Prop_assign()CGFloat LineWidth;/// 线宽
Prop_assign()CGFloat scrollOffsetX;/// X 多滑动的距离【一个补偿值】
Prop_assign()CGFloat scrollOffsetY;/// Y 多滑动的距离【一个补偿值】
/// 颜色设置
Prop_strong(null_resettable)UIColor *cor0;/// 第一行、第一列格子的背景颜色
Prop_strong(null_resettable)UIColor *cor1;/// 奇数行的背景颜色
Prop_strong(null_resettable)UIColor *cor2;/// 偶数行的背景颜色
Prop_strong(null_resettable)UIColor *cor3;/// 第一行的背景颜色
Prop_strong(null_resettable)UIColor *cor4;/// 第一行的主文字颜色
Prop_strong(null_resettable)UIColor *cor5;/// 其他行的主文字颜色
Prop_strong(null_resettable)UIColor *cor6;/// 表格线的颜色
/// 背景图片设置
Prop_strong(null_resettable)UIImage *image0;/// 第一行、第一列格子的背景图片
Prop_strong(null_resettable)UIImage *image1;/// 奇数行的背景图片
Prop_strong(null_resettable)UIImage *image2;/// 偶数行的背景图片
Prop_strong(null_resettable)UIImage *image3;/// 第一行的背景图片
#pragma mark —— 值
Prop_strong(nonnull)NSValue *VerticalScrollValue;/// 垂直滚动
Prop_strong(nonnull)NSValue *HorizontalScrollValue;/// 水平滚动
Prop_assign(readonly)NSInteger rowNumber;/// 行数
Prop_assign(readonly)NSInteger colNumber;/// 列数
Prop_strong(nonnull)RACSubject *verticalScrollSignal;
Prop_strong(nonnull)RACSubject *horizontalScrollSignal;
Prop_copy(nonnull)jobsByIDBlock configureDataBy;/// 因为UI架构的原因，数据必须先行后列

Prop_strong(null_resettable)UIButtonModel *data_00;/// 起始格子的数据
Prop_copy(nonnull)NSMutableArray <NSMutableArray <UIButtonModel *>*>*contentArr;
Prop_copy(null_resettable)NSMutableArray <UIButtonModel *>*topHeaderDatas;
Prop_copy(null_resettable)NSMutableArray <UIButtonModel *>*leftListDatas;

Prop_copy(nonnull)NSMutableArray <NSMutableArray <NSString *>*>*contentTitles;
Prop_copy()NSMutableArray <NSString *>*_Nullable topHeaderTitles;
Prop_copy()NSMutableArray <NSString *>*_Nullable leftTitles;

@end

NS_INLINE __kindof JobsExcelConfigureViewModel *_Nonnull jobsMakeExcelConfigureViewModel(jobsByExcelConfigureViewModelBlock _Nonnull block){
    JobsExcelConfigureViewModel *data = JobsExcelConfigureViewModel.alloc.init;
    if (block) block(data);
    return data;
}
