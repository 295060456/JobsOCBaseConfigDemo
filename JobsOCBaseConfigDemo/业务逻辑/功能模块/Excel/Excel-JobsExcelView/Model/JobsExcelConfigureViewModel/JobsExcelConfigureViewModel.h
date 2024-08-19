//
//  JobsExcelConfigureViewModel.h
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import <Foundation/Foundation.h>
#import "UIButtonModel.h"

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
@property(nonatomic,strong)UIButtonModel *data_00;/// 起始格子的数据
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIButtonModel *>*>*contentArr;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*topHeaderDatas;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*leftListDatas;
@property(nonatomic,strong)NSValue *VerticalScrollValue;/// 垂直滚动
@property(nonatomic,strong)NSValue *HorizontalScrollValue;/// 水平滚动
/// 颜色设置
@property(nonatomic,strong)UIColor *cor0;/// 第一行、第一列格子的背景颜色
@property(nonatomic,strong)UIColor *cor1;/// 奇数行的背景颜色
@property(nonatomic,strong)UIColor *cor2;/// 偶数行的背景颜色
@property(nonatomic,strong)UIColor *cor3;/// 第一行的背景颜色
@property(nonatomic,strong)UIColor *cor4;/// 第一行的主文字颜色
@property(nonatomic,strong)UIColor *cor5;/// 其他行的主文字颜色
/// 背景图片设置
@property(nonatomic,strong)UIImage *image0;/// 第一行、第一列格子的背景图片
@property(nonatomic,strong)UIImage *image1;/// 奇数行的背景图片
@property(nonatomic,strong)UIImage *image2;/// 偶数行的背景图片
@property(nonatomic,strong)UIImage *image3;/// 第一行的背景图片

@end
