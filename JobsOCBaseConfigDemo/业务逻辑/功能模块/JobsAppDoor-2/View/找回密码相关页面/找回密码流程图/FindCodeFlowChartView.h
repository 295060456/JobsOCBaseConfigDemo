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

Prop_strong()UIImageView *bacKIMGV;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;

@end

@interface FindCodeFlowChartView : BaseView

///一共几个流程节点
Prop_assign()NSInteger flowNum;
///当前流程序号 从0开始
Prop_assign()NSInteger currentFlowSerialNum;

Prop_copy()NSMutableArray <NSString *>*titleMutArr;
Prop_copy()NSMutableArray <NSString *>*subTitleMutArr;
Prop_copy()NSMutableArray <UIImage *>*backImageMutArr;

@end

NS_ASSUME_NONNULL_END
