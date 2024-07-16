#import "JobsLaunchAdMgr.h"
#import <AVKit/AVKit.h>

@interface JobsLaunchAdMgr ()

@property (nonatomic, strong) UIView *adView;
@property (nonatomic, strong) UIButton *skipButton;
@property (nonatomic, strong) AVPlayer *videoPlayer;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIWindow *mainWindow;

@end

@implementation JobsLaunchAdMgr

+ (instancetype)sharedInstance {
    static JobsLaunchAdMgr *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JobsLaunchAdMgr alloc] init];
        instance.buttonTitle = @"跳过";
        instance.buttonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 20, 50, 30);
        instance.imageDisplayDuration = 5.0;
        instance.preloadResources = NO;
        instance.shouldPlayVideoSound = NO;
    });
    return instance;
}

- (void)configureWithAdMode:(JobsLaunchAdMode)adMode {
    self.adMode = adMode;
}

- (void)showAd {
    [self setupAdView];
    if (self.adURL) {
        [self loadAdFromURL:self.adURL];
    } else {
        // Load local resources
    }
}

- (void)setupAdView {
    self.mainWindow = [UIApplication sharedApplication].delegate.window;
    self.adView = [[UIView alloc] initWithFrame:self.mainWindow.bounds];
    [self.mainWindow addSubview:self.adView];
    
    self.skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.skipButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    self.skipButton.frame = self.buttonFrame;
    [self.skipButton addTarget:self action:@selector(skipAd) forControlEvents:UIControlEventTouchUpInside];
    [self.adView addSubview:self.skipButton];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.adView addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.adView addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleShake) name:@"UIEventSubtypeMotionShake" object:nil];
}

- (void)loadAdFromURL:(NSURL *)url {
    if ([url.absoluteString hasSuffix:@"mp4"]) {
        // Load video
        self.videoPlayer = [AVPlayer playerWithURL:url];
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
        playerLayer.frame = self.adView.bounds;
        [self.adView.layer addSublayer:playerLayer];
        [self.videoPlayer play];
        
        if (self.adMode == JobsLaunchAdModeCountdown) {
            [self startCountdown];
        } else {
            [self.videoPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
        }
    } else {
        // Load image
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        self.imageView = [[UIImageView alloc] initWithImage:image];
        self.imageView.frame = self.adView.bounds;
        [self.adView addSubview:self.imageView];
        
        [NSTimer scheduledTimerWithTimeInterval:self.imageDisplayDuration target:self selector:@selector(skipAd) userInfo:nil repeats:NO];
    }
}

- (void)skipAd {
    [self.adView removeFromSuperview];
    // Enter the root controller
}

- (void)handleSingleTap:(UITapGestureRecognizer *)gesture {
    if (self.singleTapCallback) {
        self.singleTapCallback();
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.google.com"]];
    }
}

- (void)handleDoubleTap:(UITapGestureRecognizer *)gesture {
    if (self.doubleTapCallback) {
        self.doubleTapCallback();
    }
}

- (void)handleShake {
    if (self.shakeCallback) {
        self.shakeCallback();
    }
}

- (void)startCountdown {
    __block NSInteger countdown = 5; // default countdown time
    if (self.adMode == JobsLaunchAdModeCountdown) {
        countdown = self.imageDisplayDuration;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(countdown * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self skipAd];
    });
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
