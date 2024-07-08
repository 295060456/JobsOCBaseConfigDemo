//
//  SplashAdManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/6/24.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSUInteger, SkipButtonMode) {
    SkipButtonModeNormal,
    SkipButtonModeCountdown
};

NS_ASSUME_NONNULL_BEGIN

typedef void (^AdInteractionCallback)(void);
typedef void (^AdCompletionCallback)(void);

@interface JobsLaunchAdMgr : NSObject

@property (nonatomic, copy) NSString *buttonTitle;
@property (nonatomic, assign) CGRect buttonFrame;
@property (nonatomic, assign) SkipButtonMode buttonMode;
@property (nonatomic, assign) NSInteger countdownDuration;
@property (nonatomic, copy) NSString *redirectURL;
@property (nonatomic, copy) AdInteractionCallback onDoubleTap;
@property (nonatomic, copy) AdInteractionCallback onSingleTap;
@property (nonatomic, copy) AdInteractionCallback onLongPress;
@property (nonatomic, copy) AdInteractionCallback onShake;
@property (nonatomic, copy) AdCompletionCallback onAdDidFinish;

+ (instancetype)sharedManager;
- (void)showAdWithLocalResource:(NSString *)resourcePath isVideo:(BOOL)isVideo;
- (void)showAdWithURLResource:(NSString *)url isVideo:(BOOL)isVideo shouldPreload:(BOOL)shouldPreload;

@end

NS_ASSUME_NONNULL_END
