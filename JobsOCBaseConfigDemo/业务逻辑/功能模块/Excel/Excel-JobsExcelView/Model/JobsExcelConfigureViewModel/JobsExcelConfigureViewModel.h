//
//  JobsExcelConfigureViewModel.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <Foundation/Foundation.h>
#import "UITextModel.h"

#ifndef LineColor
#define LineColor UIColor.grayColor /// 表格线的颜色
#endif

UIKIT_EXTERN const CGFloat LineWidth;
UIKIT_EXTERN NSString * const VerticalScrollBegin;/// 垂直滚动键值
UIKIT_EXTERN NSString * const HorizontalScrollBegin;/// 水平滚动键值

@interface JobsExcelConfigureViewModel : NSObject
#pragma mark —— 表格设置
@property(nonatomic,assign)CGFloat XZExcelW;/// 整张Excel表的宽度
@property(nonatomic,assign)CGFloat XZExcelH;/// 整张Excel表的高度
@property(nonatomic,assign)CGFloat itemW;/// 单个表格宽度
@property(nonatomic,assign)CGFloat itemH;/// 单个表格高度
@property(nonatomic,assign)NSInteger rowNumber;/// 行数
@property(nonatomic,assign)NSInteger colNumber;/// 列数
#pragma mark —— 值
@property(nonatomic,strong)UITextModel *textModel_00;/// 起始格子的数据
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UITextModel *>*>*contentArr;
@property(nonatomic,strong)NSMutableArray <UITextModel *>*topHeaderDatas;
@property(nonatomic,strong)NSMutableArray <UITextModel *>*leftListDatas;
@property(nonatomic,strong)NSValue *VerticalScrollValue;/// 垂直滚动
@property(nonatomic,strong)NSValue *HorizontalScrollValue;/// 水平滚动

@end
