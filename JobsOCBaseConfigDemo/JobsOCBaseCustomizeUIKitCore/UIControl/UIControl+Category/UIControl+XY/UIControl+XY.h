//
//  UIControl+XY.h
//  JinXian Finance
//
//  Created by Jobs on 2017/7/17.
//  Copyright © 2017年 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN
/// 资料来源：http://www.jianshu.com/p/a830d0a57378
@interface UIControl (XY)

Prop_assign()NSTimeInterval uxy_acceptEventInterval;//可以用这个给重复点击加间隔

@end

NS_ASSUME_NONNULL_END
