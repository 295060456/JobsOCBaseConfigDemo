//
// Created by Chenyu Lan on 10/30/14.
// Copyright (c) 2014 Fenbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "YTKAnimatingRequestAccessory.h"

#if __has_include(<YTKNetwork/YTKChainRequest.h>)
#import <YTKNetwork/YTKChainRequest.h>
#else
#import "YTKChainRequest.h"
#endif

@interface YTKChainRequest (AnimatingAccessory)

@property(weak,nonatomic)UIView *animatingView;
@property(strong,nonatomic)NSString *animatingText;

@end
