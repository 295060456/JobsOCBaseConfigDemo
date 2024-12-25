//
//  RACGestureRecognizerDelegate.m
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//  特别鸣谢：https://github.com/kaiinui/UIGestureRecognizer-RACExtension

#import "RACGestureRecognizerActionHandler.h"

@implementation RACGestureRecognizerActionHandler

-(jobsByGestureRecognizerBlock _Nonnull)rac_handleGesture{
    return ^(__kindof UIGestureRecognizer *_Nullable recognizer){
        [recognizer.rac_subject sendNext:recognizer];
    };
}

@end
