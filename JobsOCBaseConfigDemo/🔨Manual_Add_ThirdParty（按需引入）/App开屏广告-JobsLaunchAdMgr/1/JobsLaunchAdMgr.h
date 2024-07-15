#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void(^JobsLaunchAdMgrCallback)(void);

typedef NS_ENUM(NSUInteger, JobsLaunchAdMode) {
    JobsLaunchAdModeNormal,
    JobsLaunchAdModeCountdown
};

@interface JobsLaunchAdMgr : NSObject

@property (nonatomic, strong) NSString *buttonTitle;
@property (nonatomic, assign) CGRect buttonFrame;
@property (nonatomic, assign) JobsLaunchAdMode adMode;
@property (nonatomic, assign) NSTimeInterval imageDisplayDuration;
@property (nonatomic, strong) NSURL *adURL;
@property (nonatomic, assign) BOOL preloadResources;
@property (nonatomic, assign) BOOL shouldPlayVideoSound;
@property (nonatomic, copy) JobsLaunchAdMgrCallback doubleTapCallback;
@property (nonatomic, copy) JobsLaunchAdMgrCallback singleTapCallback;
@property (nonatomic, copy) JobsLaunchAdMgrCallback shakeCallback;

+ (instancetype)sharedInstance;
- (void)configureWithAdMode:(JobsLaunchAdMode)adMode;
- (void)showAd;

@end
