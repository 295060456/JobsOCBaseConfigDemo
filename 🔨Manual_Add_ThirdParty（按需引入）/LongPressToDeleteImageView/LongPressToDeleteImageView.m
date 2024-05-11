//
//  LongPressToDeleteImageView.m
//  ShengAi
//
//  Created by 刘赓 on 2018/12/4.
//  Copyright © 2018 刘赓. All rights reserved.
//

#import "LongPressToDeleteImageView.h"

#define angelToRandian(x) ((x)/180.0 * M_PI)

@implementation LongPressToDeleteImageView

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                               action:@selector(longPress:)];
        
        [self addGestureRecognizer:longPress];
        
    }
    return self;
}

-(void)longPress:(UILongPressGestureRecognizer*)longPress{
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        
        anim.keyPath = @"transform.rotation";
        
        anim.values = @[@(angelToRandian(-7)),@(angelToRandian(7)),@(angelToRandian(-7))];
        
        anim.repeatCount = MAXFLOAT;
        
        anim.duration = 0.2;
        
        [self.layer addAnimation:anim
                                    forKey:nil];
        
        self.hidden = NO;
    }
}

//// 恢复抖动
//view.layer.speed = 1.0;
//// 停止抖动
//view.layer.speed = 0.0; 

//- (IBAction)delete:(id)sender {
//    [self.imageView removeFromSuperview];
//    [self.btn removeFromSuperview];
//}

@end
