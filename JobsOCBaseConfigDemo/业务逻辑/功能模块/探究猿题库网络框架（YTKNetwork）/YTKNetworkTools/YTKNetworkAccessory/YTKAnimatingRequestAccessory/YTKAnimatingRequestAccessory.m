//
//  YTKAnimatingRequestAccessory.m
//  Ape_uni
//
//  Created by Chenyu Lan on 10/30/14.
//  Copyright (c) 2014 Fenbi. All rights reserved.
//

#import "YTKAnimatingRequestAccessory.h"
//#import "YTKAlertUtils.h"

@implementation YTKAnimatingRequestAccessory

-(id)initWithAnimatingView:(UIView *)animatingView
             animatingText:(NSString *)animatingText {
    if (self = [super init]) {
        _animatingView = animatingView;
        _animatingText = animatingText;
    }return self;
}

-(id)initWithAnimatingView:(UIView *)animatingView {
    if (self = [super init]) {
        _animatingView = animatingView;
    }return self;
}

+(id)accessoryWithAnimatingView:(UIView *)animatingView {
    return [self.alloc initWithAnimatingView:animatingView];
}

+(id)accessoryWithAnimatingView:(UIView *)animatingView
                  animatingText:(NSString *)animatingText {
    return [self.alloc initWithAnimatingView:animatingView animatingText:animatingText];
}

-(void)requestWillStart:(id)request {
    if (_animatingView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // TODO: show loading
            // [YTKAlertUtils showLoadingAlertView:_animatingText inView:_animatingView];
            JobsLog(@" loading start");
        });
    }
}

- (void)requestWillStop:(id)request {
    if (_animatingView) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // TODO: hide loading
            //[YTKAlertUtils hideLoadingAlertView:_animatingView];
            JobsLog(@" loading finished");
        });
    }
}

@end
