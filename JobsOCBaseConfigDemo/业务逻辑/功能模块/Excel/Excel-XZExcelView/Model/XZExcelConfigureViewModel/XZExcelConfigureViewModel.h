//
//  XZExcelConfigureViewModel.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITextModel.h"

#ifndef LineColor
#define LineColor   UIColor.grayColor /// 表格线的颜色
#endif

UIKIT_EXTERN const CGFloat LineWidth;

@interface XZExcelConfigureViewModel : NSObject
#pragma mark —— 表格设置
@property(nonatomic,assign)CGFloat itemW;/// 表格宽度
@property(nonatomic,assign)CGFloat itemH;/// 表格高度
@property(nonatomic,assign)NSInteger rowNumber;/// 行数
@property(nonatomic,assign)NSInteger colNumber;/// 列数
#pragma mark —— 值
@property(nonatomic,copy)NSString *contentStr_00;/// 起始格子的数据
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UITextModel *>*>*contentArr;
@property(nonatomic,strong)NSMutableArray <UITextModel *>*topHeaderDatas;
@property(nonatomic,strong)NSMutableArray <UITextModel *>*leftListDatas;
@property(nonatomic,strong)NSValue *VerticalScrollValue;/// 垂直滚动
@property(nonatomic,strong)NSValue *HorizontalScrollValue;/// 水平滚动

UIKIT_EXTERN NSString * const VerticalScrollBegin;/// 垂直滚动键值
UIKIT_EXTERN NSString * const HorizontalScrollBegin;/// 水平滚动键值

@end
