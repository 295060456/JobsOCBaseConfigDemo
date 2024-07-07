//
//  SplashAdManager.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/6/24.
//

#import "JobsLaunchAdMgr.h"

@interface JobsLaunchAdMgr ()
/// UI
@property(nonatomic,strong)UIView *adView;
@property(nonatomic,strong)UIButton *countDownBtn;
@property(nonatomic,strong)AVPlayer *videoPlayer;
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
@property(nonatomic,strong)UIImageView *imageView;
/// Data
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,strong)NSString *path;

@end

@implementation JobsLaunchAdMgr
static JobsLaunchAdMgr *JobsLaunchAdMgrInstance = nil;
static dispatch_once_t JobsLaunchAdMgrOnceToken;
+ (instancetype)sharedManager {
    dispatch_once(&JobsLaunchAdMgrOnceToken, ^{
        JobsLaunchAdMgrInstance = [super allocWithZone:NULL].init;
    });return JobsLaunchAdMgrInstance;
}
/// 单例的销毁
+ (void)destroyInstance {
    JobsLaunchAdMgrOnceToken = 0;
    JobsLaunchAdMgrInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    dispatch_once(&JobsLaunchAdMgrOnceToken, ^{
        JobsLaunchAdMgrInstance = [super allocWithZone:zone];
    });return JobsLaunchAdMgrInstance;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        _buttonFrame = CGRectZero;
    }return self;
}

- (void)showAdWithLocalResource:(NSString *)resourcePath
                        isVideo:(BOOL)isVideo {
    [self setupAdView];
    if (isVideo) {
        [self playLocalVideo:resourcePath];
    } else {
        [self displayLocalImage:resourcePath];
    }
}

- (void)showAdWithURLResource:(NSString *)url
                      isVideo:(BOOL)isVideo
                shouldPreload:(BOOL)shouldPreload {
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
    self.adView.alpha = 1;
    [self.countDownBtn startTimer];
}

- (void)playLocalVideo:(NSString *)path {
    self.url = path.jobsUrl;
    [self.videoPlayer play];
    @jobs_weakify(self)
    JobsAddNotification(self,
                    selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                              id _Nullable arg){
        NSNotification *notification = (NSNotification *)arg;
        @jobs_strongify(self)
        NSLog(@"通知传递过来的 = %@",notification.object);
        [self adDidFinish];
        return nil;
    },nil, self),AVPlayerItemDidPlayToEndTimeNotification,_videoPlayer.currentItem);
}

- (void)displayLocalImage:(NSString *)path {
    self.path = path;
    self.imageView.image = self.image;
    @jobs_weakify(self)
    [self performSelector:[self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                id  _Nullable arg) {
        @jobs_strongify(self)
        [self adDidFinish];
        return nil;
    }]
               withObject:nil
               afterDelay:self.countdownDuration];
}

- (void)playURLVideo:(NSString *)urlString {
    self.url = urlString.jobsUrl;
    [self.videoPlayer play];
    @jobs_weakify(self)
    JobsAddNotification(self,
                    selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                              id _Nullable arg){
        NSNotification *notification = (NSNotification *)arg;
        @jobs_strongify(self)
        NSLog(@"通知传递过来的 = %@",notification.object);
        [self adDidFinish];
        return nil;
    },nil, self),AVPlayerItemDidPlayToEndTimeNotification,_videoPlayer.currentItem);
}

- (void)displayURLImage:(NSString *)urlString {
    self.url = urlString.jobsUrl;
    self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.url]];
    @jobs_weakify(self)
    [self performSelector:[self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                id  _Nullable arg) {
        @jobs_strongify(self)
        [self adDidFinish];
        return nil;
    }]
               withObject:nil
               afterDelay:self.countdownDuration];
}

- (void)adDidFinish {
    [self.adView removeFromSuperview];
    if (_videoPlayer) {
        [_videoPlayer pause];
        _videoPlayer = nil;
    }
}
#pragma mark —— lazyLoad
-(AVPlayer *)videoPlayer{
    if(!_videoPlayer){
        _videoPlayer = [AVPlayer playerWithURL:self.url];
    }return _videoPlayer;
}

-(AVPlayerLayer *)playerLayer{
    if(!_playerLayer){
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.videoPlayer];
        _playerLayer.frame = self.adView.bounds;
        [self.adView.layer addSublayer:_playerLayer];
    }return _playerLayer;
}

-(NSURL *)url{
    if(!_url){
        _url = @"".jobsUrl;
    }return _url;
}

-(NSString *)path{
    if(!_path){
        _path = @"";
    }return _path;
}

-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = UIImageView.new;
        _imageView.frame = self.adView.bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.adView addSubview:_imageView];
    }return _imageView;
}

-(UIImage *)image{
    if(_image){
        _image = [UIImage imageWithContentsOfFile:self.path];
    }return _image;
}

-(UIView *)adView{
    if (!_adView) {
//        jobsGetMainWindow()
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        _adView = [UIView.alloc initWithFrame:keyWindow.bounds];
        _adView.backgroundColor = JobsYellowColor;
        [keyWindow addSubview:_adView];
        
        {
            _adView.numberOfTouchesRequired = 1;
            _adView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _adView.minimumPressDuration = 0.1;
            _adView.numberOfTouchesRequired = 1;
            _adView.allowableMovement = 1;
            _adView.userInteractionEnabled = YES;
            _adView.target = self;/// ⚠️注意：任何手势这一句都要写

            {
                _adView.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable weakSelf,
                                                                                            UILongPressGestureRecognizer *  _Nullable arg) {
                   NSLog(@"长按手势被触发");
                    if (arg.state == UIGestureRecognizerStateBegan) {
                        if (self.onLongPress) {
                            self.onLongPress();
                        }
                    }
                   return nil;
                }];
                _adView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
            }

            {
                _adView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target,
                                                                                      UITapGestureRecognizer *_Nullable arg) {
                   NSLog(@"单击手势被触发");
                    if (self.onSingleTap) {
                        self.onSingleTap();
                    } else {
                        [self jobsOpenURL:self.redirectURL
            successCompletionHandlerBlock:^(id  _Nullable data) {
                            
                        } failCompletionHandlerBlock:^(id  _Nullable data) {
                            
                        }];
                        
                        [self adDidFinish];
                    }return nil;
                }];
                _adView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
            }
            
            {
                _adView.doubleTapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id  _Nullable target, UITapGestureRecognizer *_Nullable arg) {
                    NSLog(@"双击手势被触发");
                    if (self.onDoubleTap) {
                        self.onDoubleTap();
                    }return nil;
                }];
                _adView.doubleTapGR.enabled = YES; // 必须在设置完Target和selector以后方可开启执行
            }

        }
        
    }return _adView;
}

-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel
                            longPressGestureEventBlock:nil
                                       clickEventBlock:^id _Nullable(UIButton *_Nullable x) {
            x.selected = !x.selected;
            [self adDidFinish];
            return nil;
        }];
        [self.adView addSubview:_countDownBtn];
 //       [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
 //           make.height.mas_equalTo(JobsWidth(72));
 //           make.top.equalTo(self).offset(JobsWidth(20));
 //           make.centerX.equalTo(self);
 //       }];
 //       [_countDownBtn makeBtnLabelByShowingType:UILabelShowingType_03];
         
         if (CGRectEqualToRect(self.buttonFrame, CGRectZero)) {
             _countDownBtn.frame = CGRectMake(_adView.bounds.size.width - 60, 40, 50, 30);
         } else {
             _countDownBtn.frame = self.buttonFrame;
         }
        /// 倒计时按钮点击事件
        [_countDownBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            [x startTimer];//选择时机、触发启动
            NSLog(@"🪓🪓🪓🪓🪓 = 获取验证码");
            return nil;
        }];
        /// 定时器跳动的回调
        [_countDownBtn actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                TimerProcessModel *model = (TimerProcessModel *)data;
                NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
            }
            [self adDidFinish];
        }];
    }return _countDownBtn;
}

-(ButtonTimerConfigModel *)btnTimerConfigModel{
    if (!_btnTimerConfigModel) {
        _btnTimerConfigModel = ButtonTimerConfigModel.new;
        
        /// 一些通用的设置
        _btnTimerConfigModel.jobsSize = CGSizeMake(JobsWidth(100), JobsWidth(25));
        _btnTimerConfigModel.count = 5;
        _btnTimerConfigModel.showTimeType = ShowTimeType_SS;//时间显示风格
        _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;/// 逆时针模式（倒计时模式）
        _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;
        _btnTimerConfigModel.labelShowingType = UILabelShowingType_03;/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        /// 计时器未开始【静态值】
        _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 0.1;
        _btnTimerConfigModel.readyPlayValue.layerCornerRadius = JobsWidth(8);
        _btnTimerConfigModel.readyPlayValue.bgCor = JobsYellowColor;
        _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsBrownColor;
        _btnTimerConfigModel.readyPlayValue.textCor = JobsBlueColor;
        _btnTimerConfigModel.readyPlayValue.text = JobsInternationalization(@"跳过");
        _btnTimerConfigModel.readyPlayValue.font = UIFontWeightMediumSize(13);
        /// 计时器进行中【动态值】
        _btnTimerConfigModel.runningValue.bgCor = JobsCyanColor;
        _btnTimerConfigModel.runningValue.text = JobsInternationalization(Title12);
        _btnTimerConfigModel.runningValue.layerBorderCor = JobsRedColor;
        _btnTimerConfigModel.runningValue.textCor = JobsBlackColor;
        /// 计时器结束【静态值】
        _btnTimerConfigModel.endValue.bgCor = JobsYellowColor;
        _btnTimerConfigModel.endValue.text = JobsInternationalization(@"跳过");
        _btnTimerConfigModel.endValue.layerBorderCor = JobsPurpleColor;
        _btnTimerConfigModel.endValue.textCor = JobsBlackColor;
        
    }return _btnTimerConfigModel;
}

//-(BaseButton *)countDownBtn{
//    if(!_countDownBtn){
//        @jobs_weakify(self)
//        _countDownBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
//                                                          background:nil
//                                                      titleAlignment:UIButtonConfigurationTitleAlignmentCenter
//                                                       textAlignment:NSTextAlignmentCenter
//                                                    subTextAlignment:NSTextAlignmentCenter
//                                                         normalImage:nil
//                                                      highlightImage:nil
//                                                     attributedTitle:nil
//                                             selectedAttributedTitle:nil
//                                                  attributedSubtitle:[self richTextWithDataConfigMutArr:self.richTextConfigMutArr]
//                                                               title:JobsInternationalization(_buttonTitle)
//                                                            subTitle:nil
//                                                           titleFont:UIFontWeightBoldSize(18)
//                                                        subTitleFont:nil
//                                                            titleCor:JobsCor(@"#333333")
//                                                         subTitleCor:nil
//                                                  titleLineBreakMode:NSLineBreakByWordWrapping
//                                               subtitleLineBreakMode:NSLineBreakByWordWrapping
//                                                 baseBackgroundColor:UIColor.whiteColor
//                                                        imagePadding:JobsWidth(0)
//                                                        titlePadding:JobsWidth(10)
//                                                      imagePlacement:NSDirectionalRectEdgeNone
//                                          contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
//                                            contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
//                                                       contentInsets:jobsSameDirectionalEdgeInsets(0)
//                                                   cornerRadiusValue:JobsWidth(0)
//                                                     roundingCorners:UIRectCornerAllCorners
//                                                roundingCornersRadii:CGSizeZero
//                                                      layerBorderCor:nil
//                                                         borderWidth:JobsWidth(0)
//                                                       primaryAction:nil
//                                                longPressGestureEventBlock:nil
//                                                     clickEventBlock:^id(BaseButton *x) {
//           @jobs_strongify(self)
//           x.selected = !x.selected;
//           if (self.objectBlock) self.objectBlock(x);
//            [self adDidFinish];
//           return nil;
//       }];
//       [self.adView addSubview:_countDownBtn];
////       [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
////           make.height.mas_equalTo(JobsWidth(72));
////           make.top.equalTo(self).offset(JobsWidth(20));
////           make.centerX.equalTo(self);
////       }];
////       [_countDownBtn makeBtnLabelByShowingType:UILabelShowingType_03];
//        
//        if (CGRectEqualToRect(self.buttonFrame, CGRectZero)) {
//            _countDownBtn.frame = CGRectMake(_adView.bounds.size.width - 60, 40, 50, 30);
//        } else {
//            _countDownBtn.frame = self.buttonFrame;
//        }
//    }return _countDownBtn;
//}

-(NSString *)buttonTitle{
    if(!_buttonTitle){
        _buttonTitle = JobsInternationalization(@"跳过");
    }return _buttonTitle;
}

-(NSInteger)countdownDuration{
    if(!_countdownDuration){
        _countdownDuration = 5;
    }return _countdownDuration;
}

-(NSString *)redirectURL{
    if(!_redirectURL){
        _redirectURL = @"https://www.google.com";
    }return _redirectURL;
}

@end
