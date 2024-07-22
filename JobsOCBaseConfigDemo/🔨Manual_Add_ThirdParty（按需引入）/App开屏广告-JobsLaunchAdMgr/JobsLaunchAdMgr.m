#import "JobsLaunchAdMgr.h"
#import <CoreMotion/CoreMotion.h>

@interface JobsLaunchAdMgr ()

@property (nonatomic, strong) UIView *adView;
@property (nonatomic, strong) UIButton *skipButton;
@property (nonatomic, strong) AVPlayer *videoPlayer;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSTimer *countdownTimer;
@property (nonatomic, assign) NSInteger currentCountdown;
@property (nonatomic, strong) CMMotionManager *motionManager;

@end

@implementation JobsLaunchAdMgr

+ (instancetype)sharedManager {
    static JobsLaunchAdMgr *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _buttonTitle = @"跳过";
        _buttonFrame = CGRectZero;
        _buttonMode = SkipButtonModeNormal;
        _countdownDuration = 5;
        _redirectURL = @"https://www.google.com";
        [self setupMotionManager];
    }
    return self;
}

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    if (self.motionManager.isAccelerometerAvailable) {
        self.motionManager.accelerometerUpdateInterval = 0.1;
        __weak typeof(self) weakSelf = self;
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            [weakSelf handleShakeWithAccelerometerData:accelerometerData];
        }];
    }
}

- (void)handleShakeWithAccelerometerData:(CMAccelerometerData *)accelerometerData {
    static NSDate *lastShakeDate;
    static const NSTimeInterval shakeThresholdTime = 1.0;
    if (!lastShakeDate || [[NSDate date] timeIntervalSinceDate:lastShakeDate] > shakeThresholdTime) {
        double accelerationThreshold = 2.3; // Adjust based on your sensitivity preference
        if (fabs(accelerometerData.acceleration.x) > accelerationThreshold || fabs(accelerometerData.acceleration.y) > accelerationThreshold || fabs(accelerometerData.acceleration.z) > accelerationThreshold) {
            if (self.onShake) {
                self.onShake();
            }
            lastShakeDate = [NSDate date];
        }
    }
}

- (void)setupAdWithButtonTitle:(NSString *)buttonTitle buttonModel:(SkipButtonMode)buttonModel countdownDuration:(NSInteger)countdownDuration redirectURL:(NSString *)redirectURL {
    self.buttonTitle = buttonTitle;
    self.buttonModel = buttonModel;
    self.countdownDuration = countdownDuration;
    self.redirectURL = redirectURL;
}

- (void)setupAdHandlersWithSingleTapHandler:(void (^)(void))singleTapHandler doubleTapHandler:(void (^)(void))doubleTapHandler longPressHandler:(void (^)(void))longPressHandler shakeHandler:(void (^)(void))shakeHandler adDidFinishHandler:(void (^)(void))adDidFinishHandler {
    self.onSingleTap = singleTapHandler;
    self.onDoubleTap = doubleTapHandler;
    self.onLongPress = longPressHandler;
    self.onShake = shakeHandler;
    self.onAdDidFinish = adDidFinishHandler;
}

- (void)showAdWithLocalResource:(NSString *)resourcePath isVideo:(BOOL)isVideo {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setupAdView];
        if (isVideo) {
            [self playLocalVideo:resourcePath];
        } else {
            [self displayLocalImage:resourcePath];
        }
    });
}

- (void)showAdWithURLResource:(NSString *)url isVideo:(BOOL)isVideo shouldPreload:(BOOL)shouldPreload {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setupAdView];
        if (shouldPreload) {
            // Implement preloading logic here
        }
        if (isVideo) {
            [self playURLVideo:url];
        } else {
            [self displayURLImage:url];
        }
    });
}

- (void)setupAdView {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.adView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    self.adView.backgroundColor = [UIColor blackColor];
    [keyWindow addSubview:self.adView];

    self.skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.skipButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    [self.skipButton addTarget:self action:@selector(skipButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self updateSkipButtonFrame];
    [self.adView addSubview:self.skipButton];

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [singleTap requireGestureRecognizerToFail:doubleTap];
    [self.adView addGestureRecognizer:singleTap];
    [self.adView addGestureRecognizer:doubleTap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.adView addGestureRecognizer:longPress];

    [self startCountdownIfNeeded];
}

- (void)updateSkipButtonFrame {
    if (CGRectEqualToRect(self.buttonFrame, CGRectZero)) {
        self.skipButton.frame = CGRectMake(self.adView.bounds.size.width - 70, 40, 60, 30);
    } else {
        self.skipButton.frame = self.buttonFrame;
    }
}

- (void)playLocalVideo:(NSString *)path {
    NSURL *videoURL = [NSURL fileURLWithPath:path];
    self.videoPlayer = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
    playerLayer.frame = self.adView.bounds;
    [self.adView.layer addSublayer:playerLayer];
    [self.videoPlayer play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidFinish:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.videoPlayer.currentItem];
}

- (void)displayLocalImage:(NSString *)path {
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.imageView = [[UIImageView alloc] initWithFrame:self.adView.bounds];
    self.imageView.image = image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.adView addSubview:self.imageView];
    [self performSelector:@selector(adDidFinish) withObject:nil afterDelay:self.countdownDuration];
}

- (void)playURLVideo:(NSString *)urlString {
    NSURL *videoURL = [NSURL URLWithString:urlString];
    self.videoPlayer = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
    playerLayer.frame = self.adView.bounds;
    [self.adView.layer addSublayer:playerLayer];
    [self.videoPlayer play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidFinish:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.videoPlayer.currentItem];
}

- (void)displayURLImage:(NSString *)urlString {
    NSURL *imageURL = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView = [[UIImageView alloc] initWithFrame:self.adView.bounds];
    self.imageView.image = image;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.adView addSubview:self.imageView];
    [self performSelector:@selector(adDidFinish) withObject:nil afterDelay:self.countdownDuration];
}

- (void)startCountdownIfNeeded {
    if (self.buttonModel == SkipButtonModeCountdown) {
        self.currentCountdown = self.countdownDuration;
        self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES];
    }
}

- (void)updateCountdown {
    if (self.currentCountdown > 0) {
        [self.skipButton setTitle:[NSString stringWithFormat:@"跳过 %ld", (long)self.currentCountdown] forState:UIControlStateNormal];
        self.currentCountdown--;
    } else {
        [self adDidFinish];
    }
}

- (void)skipButtonTapped {
    [self adDidFinish];
}

- (void)videoDidFinish:(NSNotification *)notification {
    [self adDidFinish];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)gesture {
    if (self.onSingleTap) {
        self.onSingleTap();
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.redirectURL] options:@{} completionHandler:nil];
        [self adDidFinish];
    }
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)gesture {
    if (self.onDoubleTap) {
        self.onDoubleTap();
    }
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if (self.onLongPress) {
            self.onLongPress();
        }
    }
}

- (void)adDidFinish {
    [self.adView removeFromSuperview];
    if (self.countdownTimer) {
        [self.countdownTimer invalidate];
        self.countdownTimer = nil;
    }
    if (self.videoPlayer) {
        [self.videoPlayer pause];
        self.videoPlayer = nil;
    }
    if (self.motionManager) {
        [self.motionManager stopAccelerometerUpdates];
    }
    if (self.onAdDidFinish) {
        self.onAdDidFinish();
    }
}

@end

