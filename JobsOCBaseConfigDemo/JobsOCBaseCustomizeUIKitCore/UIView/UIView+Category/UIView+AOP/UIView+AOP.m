//
//  UIView+AOP.m
//  DouDong-II
//
//  Created by Jobs on 2020/12/18.
//

#import "UIView+AOP.h"
/// 文本选择器的自定义颜色，因为是内部类，所以需要用runtime来修改
@implementation UIView (AOP)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self.class,
                      @selector(setBackgroundColor:),
                      @selector(aop_setBackgroundColor:));
        MethodSwizzle(self.class,
                      @selector(willMoveToSuperview:),
                      @selector(aop_willMoveToSuperview:));
    });
}
//中间的遮罩
- (void)aop_setBackgroundColor:(UIColor *)color{
    if([NSStringFromClass(self.superview.superview.class) isEqualToString:@"UITextRangeView"]){
        [self aop_setBackgroundColor:[UIColor colorWithRed:194/255.0
                                                     green:228/255.0
                                                      blue:193/255.0
                                                     alpha:0.5]];
    }else{
        [self aop_setBackgroundColor:color];
    }
}
// 两边的竖线
- (void)aop_willMoveToSuperview:(UIView *)view{
    NSString *className = NSStringFromClass(self.class);
    if([className isEqualToString:@"UISelectionGrabber"] ||
       [className isEqualToString:@"UISelectionGrabberDot"]){
        UIView *coverView = [self viewWithTag:10000];
        if(!coverView){
            coverView = [[UIView alloc] initWithFrame:self.bounds];
            coverView.tag = 10000;
            [self addSubview:coverView];
        }
        if([className isEqualToString:@"UISelectionGrabberDot"]){
            coverView.layer.cornerRadius = self.bounds.size.width * 0.5;
            coverView.layer.masksToBounds = YES;
        }
        coverView.backgroundColor = [UIColor colorWithRed:194/255.0
                                                    green:228/255.0
                                                     blue:193/255.0
                                                    alpha:1.0];
    }
    [self aop_willMoveToSuperview:view];
}

@end
