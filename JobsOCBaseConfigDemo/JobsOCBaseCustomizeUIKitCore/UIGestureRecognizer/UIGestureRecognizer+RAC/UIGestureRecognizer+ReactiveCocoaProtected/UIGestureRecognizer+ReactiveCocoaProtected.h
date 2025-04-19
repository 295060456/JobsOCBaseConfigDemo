//
//  UIGestureRecognizer+ReactiveCocoaProtected.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//  特别鸣谢：https://github.com/kaiinui/UIGestureRecognizer-RACExtension

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "MacroDef_Sys.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@class RACSubject;
@class RACGestureRecognizerActionHandler;

@interface UIGestureRecognizer (ReactiveCocoaProtected)
/// private: To retain UIGestureDelegate. The GestureRecognizer's delegate will be
Prop_strong()RACGestureRecognizerActionHandler *rac_gestureHandler;
/// protected: To retain subject while recognizing gestures.
Prop_strong()RACSubject *rac_subject;

@end
