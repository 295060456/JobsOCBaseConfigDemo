//
//  JobsAppDoorVC_Style2.m
//  JobsAppDoor
//
//  Created by Jobs on 2020/12/7.
//

#import "JobsAppDoorVC_Style2.h"

@interface JobsAppDoorVC_Style2 ()
/// UI
@property(nonatomic,strong)UIImageView *bgImgV;
@property(nonatomic,strong)BaseButton *customerServiceBtn;
@property(nonatomic,strong)ZFPlayerController *player;
@property(nonatomic,strong)ZFAVPlayerManager *playerManager;
@property(nonatomic,strong,nullable)CustomZFPlayerControlView *customPlayerControlView;
@property(nonatomic,strong,nullable)JobsAppDoorLoginContentView *loginContentView;/// 登录页面
@property(nonatomic,strong,nullable)JobsAppDoorRegisterContentView *registerContentView;/// 注册页面
@property(nonatomic,strong,nullable)JobsAppDoorForgotCodeContentView *forgotCodeContentView;/// 忘记密码
@property(nonatomic,strong,nullable)JobsAppDoorLogoContentView *logoContentView;
/// Data
@property(nonatomic,assign)CGFloat logoContentViewY;/// 初始高度
@property(nonatomic,assign)CGFloat loginContentViewY;/// 初始高度
@property(nonatomic,assign)CGFloat registerContentViewY;/// 初始高度
@property(nonatomic,assign)CGFloat forgotCodeContentViewY;/// 初始高度
@property(nonatomic,assign)CGFloat loginCustomerServiceBtnY;/// 在登录页面的初始高度
@property(nonatomic,assign)CGFloat registerCustomerServiceBtnY;/// 在注册页面的初始高度
@property(nonatomic,assign)BOOL loginDoorInputEditing;/// 只要有一个TF还在编辑那么就是在编辑
@property(nonatomic,assign)NSInteger lastTimeActivateTFIndex;/// 上一时刻被激活的输入框的序列号
@property(nonatomic,assign)NSInteger currentActivateTFIndex;/// 当前被激活的输入框的序列号

@end

@implementation JobsAppDoorVC_Style2

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+(void)destroySingleton{
    static_jobsAppDoor_Style2OnceToken = 0;
    appDoorVC_Style2 = nil;
}
static JobsAppDoorVC_Style2 *appDoorVC_Style2 = nil;
static dispatch_once_t static_jobsAppDoor_Style2OnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_jobsAppDoor_Style2OnceToken, ^{
        appDoorVC_Style2 = JobsAppDoorVC_Style2.new;
    });return appDoorVC_Style2;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {
            self.view = self.bgImgV;
        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_video){
            [self.player.currentPlayerManager play];
        }else{}
        self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsBlueColor;

    //标的值初始化
    self.logoContentViewY = 0;
    self.loginContentViewY = 0;
    self.registerContentViewY = 0;
    self.loginCustomerServiceBtnY = 0;
    self.registerCustomerServiceBtnY = 0;
    self.currentPage = @(CurrentPage_login);//默认页面是登录
    self.loginDoorInputEditing = NO;
    
    [self keyboardByUpBlock:^(NSNotificationKeyboardModel * _Nullable data) {
        NSLog(@"");
    } downBlock:^(NSNotificationKeyboardModel * _Nullable data) {
        NSLog(@"");
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    self.loginContentView.图片从小放大();
    self.registerContentView.图片从小放大();
    self.logoContentView.图片从小放大();
    self.customerServiceBtn.图片从小放大();
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {

        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_video){
            if (self.player.currentPlayerManager.isPlaying) {
                [self.player.currentPlayerManager pause];
            }
        }else{}
    }
}
//键盘 弹出 和 收回 走这个方法
-(void)keyboardWillChangeFrameNotification:(NSNotification *)notification{}

-(void)keyboardDidChangeFrameNotification:(NSNotification *)notification{
//    NSDictionary *userInfo = notification.userInfo;
//    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    CGFloat KeyboardOffsetY = beginFrame.origin.y - endFrame.origin.y;

    @jobs_weakify(self)
    NSMutableArray * (^currentPageDataMutArr)(CurrentPage currentPage) = ^(CurrentPage currentPage){
        @jobs_strongify(self)
        if (currentPage == CurrentPage_login) {
            return self.loginContentView.appDoorInputViewBaseStyle;
        }else{
            return self.registerContentView.appDoorInputViewBaseStyle;
        }
    };

    NSInteger index = 0;
    for (JobsAppDoorInputViewBaseStyle *inputView in currentPageDataMutArr(self.currentPage.integerValue)) {
        Ivar ivar = nil;
        if (index == 0) {
            ivar = class_getInstanceVariable([JobsAppDoorInputViewBaseStyle_3 class], "_tf");//必须是下划线接属性
        }else if (index == 1){
            ivar = class_getInstanceVariable([JobsAppDoorInputViewBaseStyle_3 class], "_tf");//必须是下划线接属性
        }else if (index == 2){
            ivar = class_getInstanceVariable([JobsAppDoorInputViewBaseStyle_3 class], "_tf");//必须是下划线接属性
        }else if (index == 3){
            ivar = class_getInstanceVariable([JobsAppDoorInputViewBaseStyle_1 class], "_tf");//必须是下划线接属性
        }else if (index == 4){
            ivar = class_getInstanceVariable([JobsAppDoorInputViewBaseStyle_4 class], "_tf");//必须是下划线接属性
        }else{}

        if (ivar) {
            JobsMagicTextField *tf = object_getIvar(inputView, ivar);
            self.loginDoorInputEditing |= tf.editing;
            if (tf.editing) {
                NSLog(@"FFF = %ld",index);//当前被激活的idx
                self.lastTimeActivateTFIndex = self.currentActivateTFIndex;
                self.currentActivateTFIndex = index;//赋予新值。因为同一时刻，textField有且只有一个被激活
            }
        }
        index += 1;
    }

    if (!self.loginDoorInputEditing) {
        NSLog(@"没有在编辑");
        self.logoContentView.y = self.logoContentViewY;
        self.loginContentView.y = self.loginContentViewY;
        self.registerContentView.y = self.registerContentViewY;
        
        if (self.currentPage == CurrentPage_login) {
            self.customerServiceBtn.y = self.loginCustomerServiceBtnY;
        }else if (self.currentPage.integerValue == CurrentPage_register){
            self.customerServiceBtn.y = self.registerCustomerServiceBtnY;
        }else{}
        
    }else{
        NSLog(@"在编辑");
        NSInteger offsetIdx = self.currentActivateTFIndex - self.lastTimeActivateTFIndex;
        self.logoContentView.y -= 40 * (offsetIdx + 0);
        self.loginContentView.y -= 40 * (offsetIdx + 0);
        self.registerContentView.y -= 40 * (offsetIdx + 0);
        self.customerServiceBtn.y -= 40 * (offsetIdx + 0);
    }

    self.loginDoorInputEditing = NO;//置空状态
}
#pragma mark —— lazyLoad
-(JobsAppDoorLoginContentView *)loginContentView{
    if (!_loginContentView) {
        _loginContentView = JobsAppDoorLoginContentView.new;
        
        _loginContentView.x = 20;
        _loginContentView.y = JobsMainScreen_HEIGHT() / 4;
        _loginContentView.height = JobsAppDoorContentViewLoginHeight;
        _loginContentView.width = JobsMainScreen_WIDTH() - 40;
        self.loginContentViewY = _loginContentView.y;
        [self.view addSubview:_loginContentView];
        _loginContentView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [_loginContentView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if ([btn.titleLabel.text isEqualToString:Title2]) {
                    self.currentPage = @(CurrentPage_register);
                    [self->_loginContentView removeContentViewWithOffsetY:0];
                    [self.registerContentView showContentViewWithOffsetY:0];
                    @jobs_weakify(self)
                    [UIView animateWithDuration:2
                                          delay:0.1
                         usingSpringWithDamping:0.3
                          initialSpringVelocity:10
                                        options:UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                        @jobs_strongify(self)
                        if (!self.registerCustomerServiceBtnY) {
                            self.registerCustomerServiceBtnY = self.registerContentView.top + self.registerContentView.height + 20;
                        }
                        self.customerServiceBtn.y = self.registerCustomerServiceBtnY;
                        
                    } completion:nil];
                }else if([btn.titleLabel.text isEqualToString:Title3]){
                    self.currentPage = @(CurrentPage_forgotCode);
                    [self->_loginContentView removeContentViewWithOffsetY:0];
                    [self.forgotCodeContentView showContentViewWithOffsetY:0];
                    self.customerServiceBtn.alpha = 0;
                    
                }else if([btn.titleLabel.text isEqualToString:Title4]){
                    self.backBtnClickEvent(btn);
                }else if([btn.titleLabel.text isEqualToString:Title3]){
                    // 忘记密码
                }else{}
            }else if ([data isKindOfClass:JobsMagicTextField.class]){
                
            }else if ([data isKindOfClass:NSString.class]){
                
            }else{}
        }];
        _loginContentView.cornerCutToCircleWithCornerRadius(8);
    }return _loginContentView;
}

-(JobsAppDoorRegisterContentView *)registerContentView{
    if (!_registerContentView) {
        _registerContentView = JobsAppDoorRegisterContentView.new;
        _registerContentView.x = JobsMainScreen_WIDTH() + 20;
        _registerContentView.y = JobsMainScreen_HEIGHT() / 4;
        _registerContentView.height = JobsAppDoorContentViewRegisterHeight;
        _registerContentView.width = JobsMainScreen_WIDTH() - 40;
        self.registerContentViewY = _registerContentView.y;
        [self.view addSubview:_registerContentView];
        _registerContentView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [_registerContentView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if ([btn.titleLabel.text isEqualToString:Title1]){
                    self.currentPage = @(CurrentPage_login);
                    [self.registerContentView removeContentViewWithOffsetY:0];
                    [self->_loginContentView showContentViewWithOffsetY:0];
                    @jobs_weakify(self)
                    [UIView animateWithDuration:2
                                          delay:0.1
                         usingSpringWithDamping:0.3
                          initialSpringVelocity:10
                                        options:UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                        @jobs_strongify(self)
                        self.customerServiceBtn.y = self.loginCustomerServiceBtnY;
                    } completion:nil];
                }else{}
            }
        }];
        _registerContentView.cornerCutToCircleWithCornerRadius(8);
    }return _registerContentView;
}

-(JobsAppDoorForgotCodeContentView *)forgotCodeContentView{
    if (!_forgotCodeContentView) {
        _forgotCodeContentView = JobsAppDoorForgotCodeContentView.new;
        _forgotCodeContentView.x = JobsMainScreen_WIDTH() + 20;
        _forgotCodeContentView.y = JobsMainScreen_HEIGHT() / 4;
        _forgotCodeContentView.height = JobsAppDoorContentViewFindPasswordHeight;
        _forgotCodeContentView.width = JobsMainScreen_WIDTH() - 40;
        self.forgotCodeContentViewY = _forgotCodeContentView.y;
        [self.view addSubview:_forgotCodeContentView];
        _forgotCodeContentView.jobsRichViewByModel(nil);
        @jobs_weakify(self)
        [_forgotCodeContentView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if ([btn.titleLabel.text isEqualToString:Title1]){
                    self.currentPage = @(CurrentPage_login);
                    [self.forgotCodeContentView removeContentViewWithOffsetY:0];
                    [self->_loginContentView showContentViewWithOffsetY:0];
                    @jobs_weakify(self)
                    [UIView animateWithDuration:2
                                          delay:0.1
                         usingSpringWithDamping:0.3
                          initialSpringVelocity:10
                                        options:UIViewAnimationOptionCurveEaseInOut
                                     animations:^{
                        @jobs_strongify(self)
                        self.customerServiceBtn.alpha = 1;
                    } completion:nil];
                }else{}
            }
        }];
        _forgotCodeContentView.cornerCutToCircleWithCornerRadius(8);
    }return _forgotCodeContentView;
}

-(JobsAppDoorLogoContentView *)logoContentView{
    if (!_logoContentView) {
        _logoContentView = JobsAppDoorLogoContentView.new;
        [self.view addSubview:_logoContentView];
        [_logoContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(50)));
            make.bottom.equalTo(self.loginContentView.mas_top).offset(-JobsWidth(50));
            make.centerX.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
        self.logoContentViewY = self.logoContentView.y;
    }return _logoContentView;
}

-(BaseButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
//        @jobs_weakify(self)
        _customerServiceBtn = BaseButton
            .initByStyle2(Title8,
                          nil,
                          nil,
                          JobsIMG(@"客服"),
                          NSDirectionalRectEdgeTop,
                          JobsWidth(5))
            .bgColor(JobsWhiteColor)
            .cornerRadiusValue(_customerServiceBtn.height / 2)
            .onClick(^(UIButton *x){
                toast(x.titleForNormalState);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [_customerServiceBtn buttonAutoFontByWidth];
        [self.view addSubview:_customerServiceBtn];
        [_customerServiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 2.5, JobsMainScreen_WIDTH() / 9));
            make.centerX.equalTo(self.view);
            make.top.mas_equalTo(self.loginContentView.top + self.loginContentView.height + 20);
        }];
        [self.view layoutIfNeeded];
        self.loginCustomerServiceBtnY = _customerServiceBtn.y;
        _customerServiceBtn.jobsResetBtnLayerBorderCor(JobsWhiteColor);
        _customerServiceBtn.jobsResetBtnLayerBorderWidth(2);
    }return _customerServiceBtn;
}

-(ZFAVPlayerManager *)playerManager{
    if (!_playerManager) {
        _playerManager = jobsMakeZFAVPlayerManager(^(__kindof ZFAVPlayerManager * _Nullable data) {
            data.shouldAutoPlay = YES;
            if (isiPhoneX_series()) {
                data.assetURL = @"iph_X.mp4".pathForResourceWithFullName.jobsFileUrl;
            }else{
                data.assetURL = @"非iph_X.mp4".pathForResourceWithFullName.jobsFileUrl;
            }
        });
    }return _playerManager;
}

-(ZFPlayerController *)player{
    if (!_player) {
        @jobs_weakify(self)
        _player = [ZFPlayerController.alloc initWithPlayerManager:self.playerManager
                                                    containerView:self.view];
        _player.controlView = self.customPlayerControlView;
//        ZFPlayer_DoorVC = _player;
        [_player setPlayerDidToEnd:^(id<ZFPlayerMediaPlayback>  _Nonnull asset) {
            @jobs_strongify(self)
            [self.playerManager replay];//设置循环播放
        }];
    }return _player;
}

-(CustomZFPlayerControlView *)customPlayerControlView{
    if (!_customPlayerControlView) {
        _customPlayerControlView = CustomZFPlayerControlView.new;
        @jobs_weakify(self)
        [_customPlayerControlView actionCustomZFPlayerControlViewBlock:^(id data, id data2) {
            @jobs_strongify(self)
            [self.view endEditing:YES];
        }];
    }return _customPlayerControlView;
}

-(UIImageView *)bgImgV{
    if (!_bgImgV) {
        _bgImgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.image = JobsIMG(@"AppDoorBgImage");
            imageView.userInteractionEnabled = YES;
        });
    }return _bgImgV;
}

@end
