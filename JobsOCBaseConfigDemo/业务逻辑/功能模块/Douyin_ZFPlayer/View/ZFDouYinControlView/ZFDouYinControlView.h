//
//  ZFDouYinControlView.h
//  ZFPlayer_Example
//
//  Created by 任子丰 on 2018/6/4.
//  Copyright © 2018年 紫枫. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZFLoadingView.h"
#import <ZFPlayer/ZFPlayerMediaControl.h>
#import <ZFPlayer/UIView+ZFFrame.h>
#import <ZFPlayer/UIImageView+ZFCache.h>
#import <ZFPlayer/ZFUtilities.h>
#import <ZFPlayer/ZFSliderView.h>
#import <ZFPlayer/ZFPlayerController.h>

@interface ZFDouYinControlView : UIView <ZFPlayerMediaControl>

-(void)resetControlView;
-(void)showCoverViewWithUrl:(NSString *)coverUrl;

@end
