//
//  UITableViewHeaderFooterView+Attribute.m
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import "UITableViewHeaderFooterView+Attribute.h"
/// 资料来源：https://github.com/Zydhjx/HeaderDemo
/// 在基类覆写- (void)setFrame:(CGRect)frame方法。比如基类：BaseTableViewHeaderFooterView
@implementation UITableViewHeaderFooterView (Attribute)
#pragma mark —— Prop_weak()UITableView *tbv;
-(void)setTbv:(UITableView *)tbv{
    SEL selector = @selector(tbv);
    [self willChangeValueForKey:NSStringFromSelector(selector)];
    objc_setAssociatedObject(self, selector, tbv, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:NSStringFromSelector(selector)];
}

-(UITableView *)tbv{
    return objc_getAssociatedObject(self, _cmd);
}
#pragma mark —— Prop_assign()NSUInteger section;
-(void)setSection:(NSUInteger)section{
    SEL selector = @selector(section);
    [self willChangeValueForKey:NSStringFromSelector(selector)];
    objc_setAssociatedObject(self, selector, @(section), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:NSStringFromSelector(selector)];
}

-(NSUInteger)section{
    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
}

@end
