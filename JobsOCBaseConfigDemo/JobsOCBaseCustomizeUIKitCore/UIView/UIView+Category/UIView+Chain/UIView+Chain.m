//
//  UIView+Chain.m
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/8/11.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIView+Chain.h"

@implementation UIView (Chain)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self,
                      @selector(hitTest:withEvent:),
                      @selector(exchange_hitTest:withEvent:));
    });
}
 
- (UIView *)exchange_hitTest:(CGPoint)point
                   withEvent:(UIEvent *)event {
    UIView * view = [self exchange_hitTest:point
                                 withEvent:event];
    if (view) {
        return view;
    } else {
        for (UIView * v in self.subviews) {
            if (v.ableRespose) {
                if (CGRectContainsPoint(v.frame, point)) {
                    return v;
                }
            }
        }return nil;
    }
}
#pragma mark —— @property(nonatomic,assign)BOOL ableRespose
- (void)setAbleRespose:(BOOL)ableRespose {
    objc_setAssociatedObject(self,
                             _cmd,
                             @(ableRespose),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
 
- (BOOL)ableRespose {
    return objc_getAssociatedObject(self, _cmd) != nil ? [objc_getAssociatedObject(self, _cmd) boolValue] : NO;
}

@end
