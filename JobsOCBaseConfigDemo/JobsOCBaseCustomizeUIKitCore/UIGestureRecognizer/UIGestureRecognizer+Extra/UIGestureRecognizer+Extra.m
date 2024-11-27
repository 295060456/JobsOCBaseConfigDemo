//
//  UIGestureRecognizer+Extra.m
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import "UIGestureRecognizer+Extra.h"

@implementation UIGestureRecognizer (Extra)

-(__kindof UIGestureRecognizer *)gestureActionBy:(jobsByVoidBlock _Nonnull)block{
    [self.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
        if(block) block();
    }];return self;
}

-(__kindof UIGestureRecognizer *)GestureActionBy:(jobsByGestureRecognizerBlock _Nonnull)block{
    [self.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable gesture) {
        if(block) block(gesture);
    }];return self;
}

@end
