//
//  UIGestureRecognizer+ReactiveCocoa.m
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//  特别鸣谢：https://github.com/kaiinui/UIGestureRecognizer-RACExtension

#import "UIGestureRecognizer+ReactiveCocoa.h"

@implementation UIGestureRecognizer (ReactiveCocoa)

+(instancetype)rac_recognizer{
    UIGestureRecognizer *recognizer = self.new;
    [recognizer rac_initializeRAC];
    [recognizer addTarget:recognizer.rac_gestureHandler
                   action:@selector(rac_handleGesture)];
    return recognizer;
}

-(RACSignal *)rac_signal{
    return self.rac_subject;
}

-(void)rac_initializeRAC{
    self.rac_gestureHandler = RACGestureRecognizerActionHandler.new;
    self.rac_subject = RACSubject.subject;
}

@end
