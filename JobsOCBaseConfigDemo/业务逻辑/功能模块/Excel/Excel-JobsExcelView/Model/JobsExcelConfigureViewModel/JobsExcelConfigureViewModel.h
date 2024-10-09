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

UIKIT_EXTERN NSString * _Nullable const VerticalScrollBegin;/// 垂直滚动键值
UIKIT_EXTERN NSString * _Nullable const HorizontalScrollBegin;/// 水平滚动键值

@interface JobsExcelConfigureViewModel : NSObject
#pragma mark —— 表格设置
/// 公共设置
@property(nonatomic,assign)CGFloat XZExcelW;/// 整张Excel表的宽度
@property(nonatomic,assign)CGFloat XZExcelH;/// 整张Excel表的高度
@property(nonatomic,assign)CGFloat itemW;/// 单个表格宽度
@property(nonatomic,assign)CGFloat itemH;/// 单个表格高度
@property(nonatomic,assign)CGFloat LineWidth;/// 线宽
@property(nonatomic,assign)CGFloat scrollOffsetX;/// X 多滑动的距离【一个补偿值】
@property(nonatomic,assign)CGFloat scrollOffsetY;/// Y 多滑动的距离【一个补偿值】
/// 颜色设置
@property(nonatomic,strong,null_resettable)UIColor *cor0;/// 第一行、第一列格子的背景颜色
@property(nonatomic,strong,null_resettable)UIColor *cor1;/// 奇数行的背景颜色
@property(nonatomic,strong,null_resettable)UIColor *cor2;/// 偶数行的背景颜色
@property(nonatomic,strong,null_resettable)UIColor *cor3;/// 第一行的背景颜色
@property(nonatomic,strong,null_resettable)UIColor *cor4;/// 第一行的主文字颜色
@property(nonatomic,strong,null_resettable)UIColor *cor5;/// 其他行的主文字颜色
@property(nonatomic,strong,null_resettable)UIColor *cor6;/// 表格线的颜色
/// 背景图片设置
@property(nonatomic,strong,null_resettable)UIImage *image0;/// 第一行、第一列格子的背景图片
@property(nonatomic,strong,null_resettable)UIImage *image1;/// 奇数行的背景图片
@property(nonatomic,strong,null_resettable)UIImage *image2;/// 偶数行的背景图片
@property(nonatomic,strong,null_resettable)UIImage *image3;/// 第一行的背景图片
#pragma mark —— 值
@property(nonatomic,strong,null_resettable)UIButtonModel *data_00;/// 起始格子的数据
@property(nonatomic,strong)NSMutableArray <NSMutableArray <UIButtonModel *>*>* _Nonnull contentArr;
@property(nonatomic,strong,null_resettable)NSMutableArray <UIButtonModel *>*topHeaderDatas;
@property(nonatomic,strong,null_resettable)NSMutableArray <UIButtonModel *>*leftListDatas;
@property(nonatomic,strong)NSValue * _Nonnull VerticalScrollValue;/// 垂直滚动
@property(nonatomic,strong)NSValue * _Nonnull HorizontalScrollValue;/// 水平滚动
@property(nonatomic,assign,readonly)NSInteger rowNumber;/// 行数
@property(nonatomic,assign,readonly)NSInteger colNumber;/// 列数
@property(nonatomic,strong)NSMutableArray <NSString *>* _Nullable topHeaderTitles;
@property(nonatomic,strong)NSMutableArray <NSString *>* _Nullable leftTitles;

@property(nonatomic,copy)jobsByVoidBlock _Nonnull configureData;

@end

NS_INLINE __kindof JobsExcelConfigureViewModel *_Nonnull jobsMakeExcelConfigureViewModel(jobsByExcelConfigureViewModelBlock _Nonnull block){
    JobsExcelConfigureViewModel *data = JobsExcelConfigureViewModel.alloc.init;
    if (block) block(data);
    return data;
}
