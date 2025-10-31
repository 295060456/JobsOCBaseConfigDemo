//
//  JobsAppDoor.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorVC.h"
//ZFPlayerController *ZFPlayer_DoorVC;
@interface JobsAppDoorVC (){
    NSInteger index;// 当前被激活的TextField的序号，从1开始
    UIButton *toRegisterBtn;
    UITextField *lastEditTextField;// 上一次处于编辑状态的TextField
}
/// UI
Prop_strong()JobsAppDoorLogoContentView *logoContentView;
Prop_strong()JobsAppDoorContentView *jobsAppDoorContentView;/// 登录和注册
Prop_strong(nullable)JobsAppDoorForgotCodeContentView *forgotCodeContentView;/// 忘记密码
Prop_strong(nullable)UIImageView *bgImgV;
Prop_strong(nullable)UIButton *customerServiceBtn;
Prop_strong(nullable)ZFPlayerController *player;
Prop_strong(nullable)ZFAVPlayerManager *playerManager;
Prop_strong(nullable)CustomZFPlayerControlView *customPlayerControlView;
/// Data
Prop_assign()BOOL registerDoorInputEditing;
Prop_assign()CGFloat logoContentViewY;/// 初始高度
Prop_assign()CGFloat forgotCodeContentViewY;/// 初始高度
Prop_assign()CGFloat jobsAppDoorContentViewY;/// 初始高度
Prop_assign()CGFloat customerServiceBtnY;/// 初始高度
Prop_assign()NSInteger currentActivateTFIndex;/// 当前被激活的输入框的序列号
Prop_assign()NSInteger lastTimeActivateTFIndex;/// 上一时刻被激活的输入框的序列号
Prop_strong()JobsAppDoorModel *appDoorModel;

@end

@implementation JobsAppDoorVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

+(void)destroySingleton{
    static_jobsAppDoorOnceToken = 0;
    static_appDoorVC = nil;
}
static JobsAppDoorVC *static_appDoorVC = nil;
static dispatch_once_t static_jobsAppDoorOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_jobsAppDoorOnceToken, ^{
        static_appDoorVC = JobsAppDoorVC.new;
    });return static_appDoorVC;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

-(void)loadView{
    [super loadView];
    self.bgImage = nil;
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {
            self.view = self.bgImgV;
        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video){
            [self.player.currentPlayerManager play];
        }else{}
    }
    self.currentPage = @(CurrentPage_Login);//默认页面是登录
    //标的值初始化
    self.logoContentViewY = 0;
    self.jobsAppDoorContentViewY = 0;
    self.customerServiceBtnY = 0;
    
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self keyboardByUpBlock:^(NSNotificationKeyboardModel * _Nullable data) {
        JobsLog(@"");
    } downBlock:^(NSNotificationKeyboardModel * _Nullable data) {
        JobsLog(@"");
    }];
    self.jobsAppDoorContentView.图片从小放大();
    self.logoContentView.图片从小放大();
    self.customerServiceBtn.图片从小放大();
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    JobsLog(@"%@",self.requestParams);
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        JobsLog(@"%@",self.requestParams);
        if ([self.viewModel.requestParams integerValue] == CurrentPage_Login) {
            
        }else if ([self.viewModel.requestParams integerValue] == CurrentPage_Register){
            [self.jobsAppDoorContentView animationToRegister];
        }else if ([self.viewModel.requestParams integerValue] == CurrentPage_ForgotCode){
            
        }else{}
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Image) {

        }else if ([self.viewModel.requestParams integerValue] == JobsAppDoorBgType_Video){
            if (self.player.currentPlayerManager.isPlaying) {
                [self.player.currentPlayerManager pause];
            }
        }else{}
    }
}
#pragma mark —— 一些私有方法
-(void)竖形按钮在左边{
    index = 0;
    self->_jobsAppDoorContentView.backgroundColor = Cor2;
    Ivar ivar = class_getInstanceVariable(JobsAppDoorContentView.class, "_toRegisterBtn");//必须是下划线接属性
    UIButton *toRegisterBtn = object_getIvar(self->_jobsAppDoorContentView, ivar);
    toRegisterBtn.jobsResetBtnBgCor(Cor3);
    toRegisterBtn.jobsResetBtnTitleCor(Cor1);
    
    self.currentPage = @(CurrentPage_Register);//注册页面
    self->_jobsAppDoorContentView.frame = CGRectMake(JobsAppDoorContentViewRegisterX,
                                                     JobsAppDoorContentViewRegisterY,
                                                     JobsAppDoorContentViewRegisterWidth,
                                                     JobsAppDoorContentViewRegisterHeight);
    toRegisterBtn.frame = CGRectMake(0,
                                     0,
                                     JobsWidth(64),
                                     self->_jobsAppDoorContentView.height);
}

-(void)竖形按钮在右边{
    index = 0;
    self->_jobsAppDoorContentView.backgroundColor = Cor2;
    Ivar ivar = class_getInstanceVariable([JobsAppDoorContentView class], "_toRegisterBtn");//必须是下划线接属性
    UIButton *toRegisterBtn = object_getIvar(self->_jobsAppDoorContentView, ivar);
    toRegisterBtn.jobsResetBtnBgCor(Cor1);
    toRegisterBtn.jobsResetBtnTitleCor(Cor4);

    self.currentPage = @(CurrentPage_Login);//登录页面
    self->_jobsAppDoorContentView.frame = CGRectMake(JobsAppDoorContentViewLoginX,
                                                     JobsAppDoorContentViewLoginY,
                                                     JobsAppDoorContentViewLoginWidth,
                                                     JobsAppDoorContentViewLoginHeight);
    toRegisterBtn.frame = CGRectMake(self->_jobsAppDoorContentView.width - 64,
                                     0,
                                     64,
                                     self->_jobsAppDoorContentView.height);
}
/// 进此页面先自动跳转到注册页面
-(void)toRegister{
    [self.jobsAppDoorContentView animationToRegister];
}
#pragma mark —— 网络请求
/// 注册网络请求
-(void)authRegisterByAccount:(NSString *_Nullable)account
                     country:(NSString *_Nullable)country
                  inviteCode:(NSString *_Nullable)inviteCode
                    password:(NSString *_Nullable)password
                       phone:(NSString *_Nullable)phone
                   phoneCode:(NSString *_Nullable)phoneCode
                    validate:(NSString *_Nullable)validate{
}
/// 登录网络请求
-(void)authLoginByAccount:(NSString *_Nullable)account
                 deviceId:(NSString *_Nullable)deviceId
                 password:(NSString *_Nullable)password
                 validate:(NSString *_Nullable)validate{
}
/// 网易云盾验证
-(void)NTESVerifyCodeWithBlock:(jobsByIDBlock)block{

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
        if (currentPage == CurrentPage_Login) {
            return self.jobsAppDoorContentView.loginDoorInputViewBaseStyleMutArr;
        }else{
            return self.jobsAppDoorContentView.registerDoorInputViewBaseStyleMutArr;
        }
    };
    
    index = 0;
    
    for (JobsAppDoorInputViewBaseStyle *inputView in currentPageDataMutArr(self.currentPage.intValue)) {
        UITextField *textField = inputView.textField;
        if (textField.isEditing) {
            JobsLog(@"当前被激活的输入框的index = %ld",index);
            self.lastTimeActivateTFIndex = self.currentActivateTFIndex;
            self.currentActivateTFIndex = index;//赋予新值。因为同一时刻，textField有且只有一个被激活
            
            JobsLog(@"在编辑");
            NSInteger offsetIdx = self.currentActivateTFIndex - self.lastTimeActivateTFIndex;
            self.jobsAppDoorContentView.y -= JobsWidth(40) * (offsetIdx + 0);
            self.logoContentView.y -= JobsWidth(40) * (offsetIdx + 0);
            self.customerServiceBtn.y -= JobsWidth(40) * (offsetIdx + 0);
            
            lastEditTextField = textField;
            index++;
            break;
        }else{
            JobsLog(@"没有在编辑");
            self.jobsAppDoorContentView.y = self.jobsAppDoorContentViewY;
            self.logoContentView.y = self.logoContentViewY;
            self.customerServiceBtn.y = self.customerServiceBtnY;
            index++;
        }
    }
    JobsLog(@"");
}
#pragma mark —— lazyLoad
-(JobsAppDoorLogoContentView *)logoContentView{
    if (!_logoContentView) {
        _logoContentView = JobsAppDoorLogoContentView.new;
        [self.view addSubview:_logoContentView];
        [_logoContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(150)));
            make.bottom.equalTo(self.jobsAppDoorContentView.mas_top).offset(-JobsWidth(50));
            make.centerX.equalTo(self.view);
        }];
        [self.view layoutIfNeeded];
        self.logoContentViewY = self.logoContentView.y;
    }return _logoContentView;
}

-(JobsAppDoorForgotCodeContentView *)forgotCodeContentView{
    if (!_forgotCodeContentView) {
        _forgotCodeContentView = JobsAppDoorForgotCodeContentView.new;
        _forgotCodeContentView.x = JobsAppDoorContentViewFindPasswordX;
        _forgotCodeContentView.y = JobsAppDoorContentViewFindPasswordY;
        _forgotCodeContentView.width = JobsAppDoorContentViewFindPasswordWidth;
        _forgotCodeContentView.height = JobsAppDoorContentViewFindPasswordHeight;
        self.forgotCodeContentViewY = _forgotCodeContentView.y;
        [self.view addSubview:_forgotCodeContentView];
        _forgotCodeContentView.jobsRichViewByModel(UIViewModel.new);
        @jobs_weakify(self)
        [_forgotCodeContentView actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                UIButton *btn = (UIButton *)data;
                if (btn.titleForNormalState.isEqualToString(Title1)){
                    self.currentPage = @(CurrentPage_Login);
                    [self.forgotCodeContentView removeContentViewWithOffsetY:0];
                    [self.jobsAppDoorContentView showContentViewWithOffsetY:0];
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

-(JobsAppDoorContentView *)jobsAppDoorContentView{
    if (!_jobsAppDoorContentView) {
        _jobsAppDoorContentView = JobsAppDoorContentView.new;
        /// 初始进的是登录页面
        _jobsAppDoorContentView.frame = CGRectMake(JobsAppDoorContentViewLoginX,
                                                   JobsAppDoorContentViewLoginY,
                                                   JobsAppDoorContentViewLoginWidth,
                                                   JobsAppDoorContentViewLoginHeight);
        self.jobsAppDoorContentViewY = _jobsAppDoorContentView.y;
        _jobsAppDoorContentView.backgroundColor = Cor2;
        @jobs_weakify(self)
        //监测输入字符回调 和 激活的textField 和 toRegisterBtn/abandonLoginBtn点击事件
        [_jobsAppDoorContentView actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:UIButton.class]) {
                [self.view endEditing:YES];
                UIButton *btn = (UIButton *)data;
                if (btn.titleForNormalState.isEqualToString(Title2) ||// Title2 JobsInternationalization(@"L\no\ng\ni\nn")
                    btn.titleForNormalState.isEqualToString(Title1)) {// Title1 JobsInternationalization(@"B\na\nc\nk\nT\no\nL\no\ng\ni\nn")
                    self->toRegisterBtn = (UIButton *)data;
                    //状态置空
                    self.currentActivateTFIndex = 0;
                    self.lastTimeActivateTFIndex = 0;
                    
                    if (self->toRegisterBtn.selected) {
                        [self 竖形按钮在左边];
                    }else{
                        [self 竖形按钮在右边];
                    }
                    self.customerServiceBtn.top = self.jobsAppDoorContentView.top + self.jobsAppDoorContentView.height + JobsWidth(20);
                    self.customerServiceBtnY =  self.customerServiceBtn.y;
                }
                else if (btn.titleForNormalState.isEqualToString(Title6)){// Title6 JobsInternationalization(@"Register")

                }
                else if (btn.titleForNormalState.isEqualToString(Title7)){// JobsInternationalization(@"Login")

                }
                else if (btn.titleForNormalState.isEqualToString(Title4)){// Title4 JobsInternationalization(@"Back to HomePage")
                    UIButton *abandonLoginBtn = (UIButton *)data;
                    self.backBtnClickEvent(abandonLoginBtn);
                    [JobsAppDoorVC destroySingleton];
                }
                else if (btn.titleForNormalState.isEqualToString(Title5)){// Title5 JobsInternationalization(@"Save the user name")
                    
                }
                else if (btn.titleForNormalState.isEqualToString(Title3)){// Title3 JobsInternationalization(@"Forgot code")
                    
                    {//本页动效实现的
                        self.currentPage = @(CurrentPage_ForgotCode);
                        [self->_jobsAppDoorContentView removeContentViewWithOffsetY:0];
                        [self.forgotCodeContentView showContentViewWithOffsetY:0];
                        self.customerServiceBtn.alpha = 0;
                    }

                }else{}
            }else if ([data isKindOfClass:JobsAppDoorModel.class]){
                self.appDoorModel = (JobsAppDoorModel *)data;
            }else{}
        }];
        [self.view addSubview:_jobsAppDoorContentView];
        _jobsAppDoorContentView.cornerCutToCircleWithCornerRadius(8);
        _jobsAppDoorContentView.jobsRichViewByModel(nil);
    }return _jobsAppDoorContentView;
}

- (UIButton *)customerServiceBtn {
    if (!_customerServiceBtn) {
        @jobs_weakify(self)
        UIButton *btn = UIButton.jobsInit().bgColorBy(JobsWhiteColor);
        if (@available(iOS 16.0, *)) {
            btn = btn
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(1);
        } else {
            // < iOS 16：用语义方向 + EdgeInsets 粗略模拟
            btn.semanticContentAttribute = UISemanticContentAttributeForceLeftToRight;
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 6);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        }
        btn.jobsResetBtnImage(@"客服".img)
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(Title8)
            .onClickBy(^ (UIButton *x) {
                JobsLog(@"点击客服按钮");
            })
            .onLongPressGestureBy(^ (id data) {
                JobsLog(@"");
            })
            // 圆角依赖最终尺寸：等约束生效后再设
            .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                @jobs_strongify(self)
                data.jobsWidth = 2;
                data.layerCor = JobsWhiteColor;
                // 先给个占位，真正的 cornerRadius 放到布局后再设置
                data.cornerRadiusValue = 0;
            }))
            .byAdd(^ (MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.equalTo(@(self.jobsAppDoorContentView.top + self.jobsAppDoorContentView.height + 20));
                make.centerX.equalTo(@(JobsMainScreen_WIDTH() / 2.0));
                make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 3.0,
                                                 JobsMainScreen_WIDTH() / 9.0));
            })
            .byVisible(YES);
        // 等约束计算完再设置真正的圆角（避免高度为 0）
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            [self.view layoutIfNeeded];
            self->_customerServiceBtn.layer.cornerRadius = self->_customerServiceBtn.bounds.size.height * 0.5;
            self->_customerServiceBtn.layer.masksToBounds = YES;
        });
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
            imageView.image = @"AppDoorBgImage".img;
            imageView.userInteractionEnabled = YES;
        });
    }return _bgImgV;
}

@end
