//
//  FindCodeFlowChartView.h
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlowChartSingleElementView : BaseView

@property(nonatomic,strong)UIImageView *bacKIMGV;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *subTitleLab;

@end

@interface FindCodeFlowChartView : BaseView

///一共几个流程节点
@property(nonatomic,assign)NSInteger flowNum;
///当前流程序号 从0开始
@property(nonatomic,assign)NSInteger currentFlowSerialNum;

@property(nonatomic,strong)NSMutableArray <NSString *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <NSString *>*subTitleMutArr;
@property(nonatomic,strong)NSMutableArray <UIImage *>*backImageMutArr;

@end

NS_ASSUME_NONNULL_END
