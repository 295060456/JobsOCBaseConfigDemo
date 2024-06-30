//
//  UISlider+Extra.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UISlider (Extra)

-(RACDisposable *)jobsSliderAllTouchEventBlock:(jobsByIDBlock)subscribeNextBlock;
-(RACDisposable *)jobsSliderValueChangedEventBlock:(jobsByIDBlock)subscribeNextBlock;

@end

NS_ASSUME_NONNULL_END
