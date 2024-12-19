//
//  PopUpVC.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/7/6.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

#ifndef MOVE_DIRECTION_ENUM_DEFINED
#define MOVE_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSUInteger, MoveDirection){
    MoveDirection_vertical_up = 0, /// 垂直方向(向上)滑动
    MoveDirection_vertical_down,   /// 垂直方向(向下)滑动
    MoveDirection_horizont_left,   /// 水平方向(向左)滑动
    MoveDirection_horizont_right   /// 水平方向(向右)滑动
};
#endif /* MOVE_DIRECTION_ENUM_DEFINED */
//此类解耦手势
@interface JobsPopUpVC : BaseViewController
<
UIGestureRecognizerDelegate
>

@property(nonatomic,assign)CGFloat popUpHeight;//默认弹出高度300

@end

NS_ASSUME_NONNULL_END

/**

    PopUpVC *popUpVC = PopUpVC.new;
    @jobs_weakify(self)
    [popUpVC actionBlockPopUpVC:^(id data) {
        @jobs_strongify(self)
        JobsLog(@"您点击了关注");
    }];
    [UIViewController comingFromVC:self
                              toVC:popUpVC
                       comingStyle:ComingStyle_PUSH
                 presentationStyle:UIModalPresentationAutomatic
                     requestParams:JobsInternationalization(@"")
                           success:^(id data) {}
                          animated:YES];

*/
