//
//  handleDemoView.m
//  HandleAnimationDemo
//
//  Created by ZengYong on 16/4/8.
//  Copyright © 2016年 maipu. All rights reserved.
//

#import "HAHandleDemoView.h"

static const NSTimeInterval duration = 1.f;
static const NSTimeInterval enlangerDuration = 0.05f;
static const NSTimeInterval shrinkDuration = 0.1f;

@interface HAHandleDemoView ()
@property(nonatomic,strong)UIButton *handleDemoBtn;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)NSTimer *enlangerTimer;
@property(nonatomic,strong)NSTimer *shrinkTimer;
@end

@implementation HAHandleDemoView{
    
    CGFloat currentScale;
    
    CGFloat currentMaxSide;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake((CGRectGetWidth(frame)-CGRectGetHeight(frame))*0.5, 0, CGRectGetHeight(frame), CGRectGetHeight(frame))];
        
        self.bgView.backgroundColor = [UIColor grayColor];
        
        self.bgView.layer.cornerRadius = CGRectGetHeight(frame) / 2;
        
        self.bgView.hidden = YES;
        
//        self.handleDemoBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        
//        [self.handleDemoBtn setBackgroundColor:[UIColor blackColor]];
        
//        [self.handleDemoBtn setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:self.bgView];
        
//        [self addSubview:self.handleDemoBtn];
    }
    
    return self;
}

// 点击放大
- (void)handleBtnTouchDownAction{
    
    currentMaxSide = [self calculateMaxSide];
    
    self.bgView.hidden = NO;
    
    self.enlangerTimer = [NSTimer scheduledTimerWithTimeInterval:enlangerDuration target:self selector:@selector(handleEnlargerAction) userInfo:nil repeats:YES];
}

// 点击放大
- (void)handleEnlargerAction{
    
    CGFloat ratio = enlangerDuration / duration;
    
    CGFloat bgViewRadius = self.bgView.bounds.size.height * 0.5;
    
    currentScale += ratio * (currentMaxSide / bgViewRadius);
    
    self.bgView.transform = CGAffineTransformMakeScale(currentScale, currentScale);
    
    if (currentScale >= (currentMaxSide / bgViewRadius)) {
        
        [self.enlangerTimer invalidate];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(animationCompleted)]) {
            
            [self.delegate animationCompleted];
        }
    }
}

// 松开缩小
- (void)handleBtnTouchUpOutsideAction{
    
    [self.enlangerTimer invalidate];
    
//    self.handleDemoBtn.userInteractionEnabled = NO;
    
    self.shrinkTimer = [NSTimer scheduledTimerWithTimeInterval:shrinkDuration target:self selector:@selector(handleShrinkAction) userInfo:nil repeats:YES];
}

// 松开缩小
- (void)handleShrinkAction{
    
    CGFloat ratio = shrinkDuration / duration;
    
    CGFloat bgViewRadius = self.bgView.bounds.size.height * 0.5;
    
    currentScale -= ratio * (currentMaxSide / bgViewRadius);
    
    self.bgView.transform = CGAffineTransformMakeScale(currentScale, currentScale);
    
    if (currentScale <= 0) {
        
        [self.shrinkTimer invalidate];
        
//        self.handleDemoBtn.userInteractionEnabled = YES;
        
        self.bgView.hidden = YES;
        
        self.bgView.transform = CGAffineTransformIdentity;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(animationCancel)]) {
            
            [self.delegate animationCancel];
        }
    }
}

//取得放大到最大后的边的长度
- (CGFloat)calculateMaxSide{
    
    CGPoint bgViewCenter = self.bgView.center;
    
    CGPoint svCenter = self.center;
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat w;
    
    CGFloat h;
    
    if (bgViewCenter.x > svCenter.x) {
        
        if (bgViewCenter.y < svCenter.y) {
            //第一象限
            w = bgViewCenter.x;
            
            h = screenHeight - bgViewCenter.y;
        }else{
            //第四象限
            w = bgViewCenter.x;
            
            h = bgViewCenter.y;
        }
    } else {
        if (bgViewCenter.y < svCenter.y) {
            //第二象限
            w = screenWidth - bgViewCenter.x;
            
            h = screenHeight - bgViewCenter.y;
        } else {
            //第三象限
            w = screenWidth - bgViewCenter.x;
            
            h = bgViewCenter.y;
        }
    }
    
    CGFloat maxSide = sqrt(w*w+h*h);
    
    return maxSide;
}

@end
