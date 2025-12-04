//
// Created by Chenyu Lan on 10/30/14.
// Copyright (c) 2014 Fenbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "YTKAnimatingRequestAccessory.h"

#if __has_include(<YTKNetwork/YTKChainRequest.h>)
#import <YTKNetwork/YTKBatchRequest.h>
#else
#import "YTKBatchRequest.h"
#endif

#import "DefineProperty.h"

@interface YTKBaseRequest (AnimatingAccessory)

Prop_weak()UIView *animatingView;
Prop_copy()NSString *animatingText;

@end
