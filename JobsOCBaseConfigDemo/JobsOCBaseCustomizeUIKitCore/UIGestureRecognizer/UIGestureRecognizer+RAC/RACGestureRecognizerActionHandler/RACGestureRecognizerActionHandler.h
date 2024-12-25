//
//  RACGestureRecognizerDelegate.h
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//  特别鸣谢：https://github.com/kaiinui/UIGestureRecognizer-RACExtension

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "UIGestureRecognizer+ReactiveCocoa.h"
#import "UIGestureRecognizer+ReactiveCocoaProtected.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

@interface RACGestureRecognizerActionHandler : NSObject

-(jobsByGestureRecognizerBlock _Nonnull)rac_handleGesture;

@end
