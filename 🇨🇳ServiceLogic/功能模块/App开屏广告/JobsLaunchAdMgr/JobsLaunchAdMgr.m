//
//  SplashAdManager.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/6/24.
//

#import "JobsLaunchAdMgr.h"

@implementation JobsLaunchAdMgr {
    UIView *_adView;
    UIButton *_skipButton;
    AVPlayer *_videoPlayer;
    UIImageView *_imageView;
    NSTimer *_countdownTimer;
    NSInteger _currentCountdown;
}

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
    }
    return self;
}

- (void)showAdWithLocalResource:(NSString *)resourcePath isVideo:(BOOL)isVideo {
    [self setupAdView];
    if (isVideo) {
        [self playLocalVideo:resourcePath];
    } else {
        [self displayLocalImage:resourcePath];
    }
}

- (void)showAdWithURLResource:(NSString *)url isVideo:(BOOL)isVideo shouldPreload:(BOOL)shouldPreload {
    [self setupAdView];
    if (shouldPreload) {
        // Implement preloading logic here
    }
    if (isVideo) {
        [self playURLVideo:url];
    } else {
        [self displayURLImage:url];
    }
}

- (void)setupAdView {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    _adView = [[UIView alloc] initWithFrame:keyWindow.bounds];
    _adView.backgroundColor = [UIColor blackColor];
    [keyWindow addSubview:_adView];

    _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_skipButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    [_skipButton addTarget:self action:@selector(skipButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self updateSkipButtonFrame];
    [_adView addSubview:_skipButton];

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    [singleTap requireGestureRecognizerToFail:doubleTap];
    [_adView addGestureRecognizer:singleTap];
    [_adView addGestureRecognizer:doubleTap];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [_adView addGestureRecognizer:longPress];

    [self startCountdownIfNeeded];
}

- (void)updateSkipButtonFrame {
    if (CGRectEqualToRect(self.buttonFrame, CGRectZero)) {
        _skipButton.frame = CGRectMake(_adView.bounds.size.width - 60, 40, 50, 30);
    } else {
        _skipButton.frame = self.buttonFrame;
    }
}

- (void)playLocalVideo:(NSString *)path {
    NSURL *videoURL = [NSURL fileURLWithPath:path];
    _videoPlayer = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_videoPlayer];
    playerLayer.frame = _adView.bounds;
    [_adView.layer addSublayer:playerLayer];
    [_videoPlayer play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidFinish:) name:AVPlayerItemDidPlayToEndTimeNotification object:_videoPlayer.currentItem];
}

- (void)displayLocalImage:(NSString *)path {
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _imageView = [[UIImageView alloc] initWithFrame:_adView.bounds];
    _imageView.image = image;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [_adView addSubview:_imageView];
    [self performSelector:@selector(adDidFinish) withObject:nil afterDelay:self.countdownDuration];
}

- (void)playURLVideo:(NSString *)urlString {
    NSURL *videoURL = [NSURL URLWithString:urlString];
    _videoPlayer = [AVPlayer playerWithURL:videoURL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_videoPlayer];
    playerLayer.frame = _adView.bounds;
    [_adView.layer addSublayer:playerLayer];
    [_videoPlayer play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoDidFinish:) name:AVPlayerItemDidPlayToEndTimeNotification object:_videoPlayer.currentItem];
}

- (void)displayURLImage:(NSString *)urlString {
    NSURL *imageURL = [NSURL URLWithString:urlString];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    _imageView = [[UIImageView alloc] initWithFrame:_adView.bounds];
    _imageView.image = image;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [_adView addSubview:_imageView];
    [self performSelector:@selector(adDidFinish) withObject:nil afterDelay:self.countdownDuration];
}

- (void)startCountdownIfNeeded {
    if (self.buttonMode == SkipButtonModeCountdown) {
        _currentCountdown = self.countdownDuration;
        _countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES];
    }
}

- (void)updateCountdown {
    if (_currentCountdown > 0) {
        [_skipButton setTitle:[NSString stringWithFormat:@"跳过 %ld", (long)_currentCountdown] forState:UIControlStateNormal];
        _currentCountdown--;
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
    [_adView removeFromSuperview];
    if (_countdownTimer) {
        [_countdownTimer invalidate];
        _countdownTimer = nil;
    }
    if (_videoPlayer) {
        [_videoPlayer pause];
        _videoPlayer = nil;
    }
}

@end
