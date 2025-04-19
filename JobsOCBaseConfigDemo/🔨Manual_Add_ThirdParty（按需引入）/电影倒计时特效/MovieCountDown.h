//
//  movieCountDown.h
//  Timer
//
//  Created by Jobs on 2020/9/2.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCountDown : NSObject

@property(nonatomic,weak)UIView *effectView;
Prop_strong()UIColor *countDownTextColor;
Prop_strong()UIColor *aphViewBackgroundColor;
Prop_assign()CGFloat countDownTime;

-(void)倒计时放大特效;

@end

NS_ASSUME_NONNULL_END
