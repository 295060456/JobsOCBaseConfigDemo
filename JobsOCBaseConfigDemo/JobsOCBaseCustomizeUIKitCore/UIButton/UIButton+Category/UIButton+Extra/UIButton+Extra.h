//
//  UIButton+Extra.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import <UIKit/UIKit.h>
#import "UIView+Measure.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extra)

@property(nonatomic,assign)CGFloat imageTitleSpace;

-(jobsByNSIntegerBlock _Nonnull)makeBtnLabelByShowingType;

@end

NS_ASSUME_NONNULL_END
