//
//  UIGestureRecognizer+ReactiveCocoa.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//  特别鸣谢：https://github.com/kaiinui/UIGestureRecognizer-RACExtension

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "RACGestureRecognizerActionHandler.h"
#import "UIGestureRecognizer+ReactiveCocoaProtected.h"

@class RACSignal;
// TODO: To make them private, separate them into a category.
@interface UIGestureRecognizer (ReactiveCocoa)

+(instancetype)rac_recognizer;
-(RACSignal *)rac_signal;

@end
