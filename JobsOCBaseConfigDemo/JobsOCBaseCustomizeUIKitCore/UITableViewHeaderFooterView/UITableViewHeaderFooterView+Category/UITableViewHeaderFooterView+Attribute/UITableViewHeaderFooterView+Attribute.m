//
//  UITableViewHeaderFooterView+Attribute.m
//  HeaderDemo
//
//  Created by zyd on 2018/6/22.
//  Copyright © 2018年 zyd. All rights reserved.
//

#import "UITableViewHeaderFooterView+Attribute.h"

@implementation UITableViewHeaderFooterView (Attribute)
#pragma mark —— tableView
-(void)setTableView:(UITableView *)tableView{
    [self willChangeValueForKey:NSStringFromSelector(_cmd)];
    objc_setAssociatedObject(self, _cmd, tableView, OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:NSStringFromSelector(_cmd)];
}

-(UITableView *)tableView{
    return objc_getAssociatedObject(self, _cmd);
}
#pragma mark —— section
-(void)setSection:(NSUInteger)section{
    [self willChangeValueForKey:NSStringFromSelector(_cmd)];
    objc_setAssociatedObject(self, _cmd, @(section), OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:NSStringFromSelector(_cmd)];
}

-(NSUInteger)section{
    return [objc_getAssociatedObject(self, _cmd) unsignedIntegerValue];
}

@end
