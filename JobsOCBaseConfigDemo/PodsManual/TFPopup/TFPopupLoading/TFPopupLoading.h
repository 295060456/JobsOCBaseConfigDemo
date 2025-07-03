//
//  TFPopupLoading.h
//  TFPopupDemo
//
//  Created by zhutaofeng on 2019/5/13.
//  Copyright © 2019 ztf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFPopupConst.h"

@class TFPopupLoading;
typedef void(^TFPopupLoadingBlock)(TFPopupLoading *toast);

@interface TFPopupLoading : UIView

Prop_strong()UIActivityIndicatorView *indicatorView;
Prop_strong()UILabel  *msgLabel;

+(void)tf_show:(UIView *)inView animationType:(TFAnimationType)animationType;
+(void)tf_hide:(UIView *)inView;

@end


