//
//  UIView+layout.m
//  Layout
//
//  Created by 上帝的宠儿 on 2022/6/8.
//

#import "UIView+layout.h"

@implementation UIView (layout)

- (CGFloat)x_{ return self.frame.origin.x; }
- (CGFloat)y_{ return self.frame.origin.y; }
- (CGFloat)w_{ return self.frame.size.width; }
- (CGFloat)h_{ return self.frame.size.height; }

@end
