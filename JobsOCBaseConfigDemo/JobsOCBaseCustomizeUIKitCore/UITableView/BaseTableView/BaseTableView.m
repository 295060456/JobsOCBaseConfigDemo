//
//  BaseTableViewer.m
//  Feidegou
//
//  Created by Kite on 2019/10/31.
//  Copyright © 2019 朝花夕拾. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView ()

@end

@implementation BaseTableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
/**
 1. 刷新完成后触发 layoutsubview
 UITableView 在 reloaddata 后, 会触发 layoutsubview , 可以继承父类的 superview 方法, 在其中处理需要在刷新完数据后做的操作, 如播放短视频.

 2. 使用layoutIfNeeded方法，强制重绘
 在 UITableView 调用 reloaddata 方法后, 强制调用其 layoutIfNeeded 方法, 接着调用刷新完后的操作.
 */
-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    NSLog(JobsInternationalization(@""));
    if (self.objectBlock) self.objectBlock(@1);
}
/// 专治UITableView相应链断裂【核心代码】
- (UIView *)hitTest:(CGPoint)point
          withEvent:(UIEvent *)event {
    static UIEvent *e = nil;
    if (e != nil && e == event) {
        e = nil;
        return [super hitTest:point withEvent:event];
    }
    e = event;
    if (event.type == UIEventTypeTouches) {
        NSSet *touches = [event touchesForView:self];
        UITouch *touch = [touches anyObject];
        if (touch.phase == UITouchPhaseBegan) {
            NSLog(@"Touches began");
        }else if(touch.phase == UITouchPhaseEnded){
            NSLog(@"Touches Ended");
        }else if(touch.phase == UITouchPhaseCancelled){
            NSLog(@"Touches Cancelled");
        }else if (touch.phase == UITouchPhaseMoved){
            NSLog(@"Touches Moved");
        }
    }return [super hitTest:point withEvent:event];
}

@end
