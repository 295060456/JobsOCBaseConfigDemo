//
//  UITableViewHeaderFooterView+Attribute.h
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "DefineProperty.h"
/// 资料来源：https://github.com/Zydhjx/HeaderDemo
/// 在基类覆写- (void)setFrame:(CGRect)frame方法。比如基类：BaseTableViewHeaderFooterView
@interface UITableViewHeaderFooterView (Attribute)
Prop_weak()UITableView *tbv;
Prop_assign()NSUInteger section;

@end
