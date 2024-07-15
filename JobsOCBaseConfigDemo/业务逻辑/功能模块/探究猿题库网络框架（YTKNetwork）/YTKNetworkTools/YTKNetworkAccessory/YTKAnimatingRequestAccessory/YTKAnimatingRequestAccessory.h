//
//  YTKAnimatingRequestAccessory.h
//  Ape_uni
//
//  Created by Chenyu Lan on 10/30/14.
//  Copyright (c) 2014 Fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<YTKNetwork/YTKBaseRequest.h>)
#import <YTKNetwork/YTKBaseRequest.h>
#else
#import "YTKBaseRequest.h"
#endif

@interface YTKAnimatingRequestAccessory : NSObject <YTKRequestAccessory>

@property(nonatomic,weak)UIView *animatingView;
@property(nonatomic,strong)NSString *animatingText;

-(id)initWithAnimatingView:(UIView *)animatingView;
-(id)initWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

+(id)accessoryWithAnimatingView:(UIView *)animatingView;
+(id)accessoryWithAnimatingView:(UIView *)animatingView animatingText:(NSString *)animatingText;

@end
