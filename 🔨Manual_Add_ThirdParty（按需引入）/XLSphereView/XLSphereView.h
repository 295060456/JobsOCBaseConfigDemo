//
//  XLSphereView.h
//  XLSphereView
//
//  Created by 袁小龙 on 16/4/4.
//  Copyright © 2016年 xiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLSphereView : UIView

@property(nonatomic,assign) BOOL isTimerStart;

- (void)setItems:(NSArray *)items;

- (void)timerStart;

- (void)timerStop;

@end

NS_ASSUME_NONNULL_END
