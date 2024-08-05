//
//  XZExcelConfigureViewModel.h
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "TableModel.h"

#define LineColor  [UIColor grayColor] /// 表格线的颜色
UIKIT_EXTERN const CGFloat LineWidth;

@interface XZExcelConfigureViewModel : NSObject
#pragma mark —— 表格设置
@property(nonatomic,assign)CGFloat itemW;/// 表格宽度
@property(nonatomic,assign)CGFloat itemH;/// 表格高度
@property(nonatomic,assign)NSInteger rowNumber;/// 行数
@property(nonatomic,assign)NSInteger colNumber;/// 列数
#pragma mark —— 值
@property(nonatomic,strong)NSMutableArray <NSString *>*titleArr;
@property(nonatomic,strong)NSMutableArray <TableModel *>*contentArr;
@property(nonatomic,strong)NSValue *VerticalScrollValue;/// 垂直滚动
@property(nonatomic,strong)NSValue *HorizontalScrollValue;/// 水平滚动

UIKIT_EXTERN NSString * const VerticalScrollBegin;/// 垂直滚动键值
UIKIT_EXTERN NSString * const HorizontalScrollBegin;/// 水平滚动键值

@end
