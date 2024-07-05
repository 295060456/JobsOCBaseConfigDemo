//
//  ZLGestureLockViewController.m
//  GestureLockDemo
//
//  Created by ZL on 2017/4/5.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "ZLGestureLockViewController.h"

#define GesturesPassword @"gesturespassword"

@interface ZLGestureLockViewController (){
    CGFloat maginX;
    CGFloat magin;
    CGFloat btnW;
    CGFloat btnH;
}
@property(strong,nonatomic)ZLGestureLockView *gestureLockView;
/// 实时展示已经划过的手势路径
@property(strong,nonatomic)ZLGestureLockIndicator *gestureLockIndicator;
/// 手势状态栏提示label
@property(strong,nonatomic)UILabel *statusLabel;
/// 账户名
@property(strong,nonatomic)UILabel *nameLabel;
/// 账户头像
@property(strong,nonatomic)UIImageView *headIcon;
/// 其他账户登录按钮
@property(strong,nonatomic)UIButton *otherAcountBtn;
/// 重新绘制按钮
@property(strong,nonatomic)UIButton *resetPswBtn;
/// 忘记手势密码按钮
@property(strong,nonatomic)UIButton *forgetPswBtn;
/// 创建的手势密码
@property(nonatomic,copy)NSString *lastGesturePsw;
/// 创建/校验 手势密码
@property(nonatomic)ZLUnlockType unlockType;

@end

@implementation ZLGestureLockViewController

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
    [self.view endEditing:YES];
    if (JobsDebug) {
        [WHToast jobsToastMsg:[NSString stringWithFormat:@"成功销毁了控制器:%@",NSStringFromClass(self.class)]];
        NSLog(@"%@",JobsLocalFunc);
        PrintRetainCount(self);
    }
}

- (instancetype)initWithUnlockType:(ZLUnlockType)unlockType {
    if (self = [super init]) {
        _unlockType = unlockType;
    }return self;
}

-(void)loadView{
    [super loadView];
    maginX = JobsWidth(15);
    magin = JobsWidth(5);
    btnW = (UIScreen.mainScreen.bounds.size.width - maginX * 2 - magin * 2) / 3;
    btnH = JobsWidth(30);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.headIcon.alpha = 1;
    self.nameLabel.alpha = 1;
    self.statusLabel.alpha = 1;
    self.gestureLockIndicator.alpha = 1;
    self.gestureLockView.delegate = self;
    self.otherAcountBtn.alpha = 1;
    self.resetPswBtn.hidden = YES;
    self.forgetPswBtn.alpha = 1;

    switch (_unlockType) {
        case ZLUnlockTypeCreatePsw:{
            self.gestureLockIndicator.hidden = NO;
            self.otherAcountBtn.hidden = self.forgetPswBtn.hidden = self.nameLabel.hidden = self.headIcon.hidden = NO;//YES;❤️
        }break;
        case ZLUnlockTypeValidatePsw:{
            self.gestureLockIndicator.hidden = YES;
            self.otherAcountBtn.hidden = self.forgetPswBtn.hidden = self.nameLabel.hidden = self.headIcon.hidden = NO;
        }break;
        default:
            break;
    }
}
#pragma mark —— private
//  创建手势密码
- (void)createGesturesPassword:(NSMutableString *)gesturesPassword{
    
    if (self.lastGesturePsw.length == 0) {
        
        if (gesturesPassword.length < 4) {
            self.statusLabel.text = JobsInternationalization(@"至少连接四个点，请重新输入");
            [self shakeAnimationForView:self.statusLabel];
            return;
        }
        
        if (self.resetPswBtn.hidden == YES) {
            self.resetPswBtn.hidden = NO;
        }
        
        self.lastGesturePsw = gesturesPassword;
        [self.gestureLockIndicator setGesturePassword:gesturesPassword];
        self.statusLabel.text = JobsInternationalization(@"请再次绘制手势密码");
        [self.gestureLockView clearLockView];
        return;
    }
    
    if ([self.lastGesturePsw isEqualToString:gesturesPassword]) { // 绘制成功
        [self dismissViewControllerAnimated:YES
                                 completion:^{
            // 保存手势密码
            [ZLGestureLockViewController addGesturesPassword:gesturesPassword];
        }];
    }else {
        self.statusLabel.text = JobsInternationalization(@"与上一次绘制不一致，请重新绘制");
        [self shakeAnimationForView:self.statusLabel];
        [self.gestureLockView clearLockView];
    }
}
// 验证手势密码
- (void)validateGesturesPassword:(NSMutableString *)gesturesPassword {
    static NSInteger errorCount = 5;
    if ([gesturesPassword isEqualToString:[ZLGestureLockViewController gesturesPassword]]) {
        [self dismissViewControllerAnimated:YES
                                 completion:^{
            errorCount = 5;
        }];
    } else {
        if (errorCount - 1 == 0) { // 你已经输错五次了！ 退出重新登陆！
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:JobsInternationalization(@"手势密码已失效")
                                                                message:@"请重新登陆"
                                                               delegate:self
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:JobsInternationalization(@"重新登陆"), nil];
            [alertView show];
            errorCount = 5;
            return;
        }
        
        self.statusLabel.text = [NSString stringWithFormat:JobsInternationalization(@"密码错误，还可以再输入%ld次"),--errorCount];
        [self shakeAnimationForView:self.statusLabel];
        [self.gestureLockView clearLockView];
    }
}
// 抖动动画
- (void)shakeAnimationForView:(UIView *)view {
    
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}
#pragma mark —— ZLgestureLockViewDelegate
- (void)gestureLockView:(ZLGestureLockView *)lockView
       drawRectFinished:(NSMutableString *)gesturePassword {
    
    switch (_unlockType) {
        case ZLUnlockTypeCreatePsw:{// 创建手势密码
            [self createGesturesPassword:gesturePassword];
        }break;
        case ZLUnlockTypeValidatePsw:{// 校验手势密码
            [self validateGesturesPassword:gesturePassword];
        }break;
        default:
            break;
    }
}
#pragma mark —— 手势数据的存取和删除
+(void)deleteGesturesPassword{
    [NSUserDefaults.standardUserDefaults removeObjectForKey:GesturesPassword];
    [NSUserDefaults.standardUserDefaults synchronize];
}

+(void)addGesturesPassword:(NSString *)gesturesPassword{
    [NSUserDefaults.standardUserDefaults setObject:gesturesPassword forKey:GesturesPassword];
    [NSUserDefaults.standardUserDefaults synchronize];
}

+(NSString *)gesturesPassword {
    return [NSUserDefaults.standardUserDefaults objectForKey:GesturesPassword];
}
#pragma mark —— UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    // 重新登陆
    NSLog(@"重新登陆");
}
#pragma mark —— lazyLoad
-(UIImageView *)headIcon{
    if (!_headIcon) {
        _headIcon = [UIImageView.alloc initWithFrame:CGRectMake((self.view.frame.size.width - JobsWidth(56)) * 0.5,
                                                                JobsWidth(30),
                                                                JobsWidth(56),
                                                                JobsWidth(56))];
        _headIcon.image = [UIImage imageNamed:@"gesture_headIcon"];
        [self.view addSubview:_headIcon];
    }return _headIcon;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel.alloc initWithFrame:CGRectMake((self.view.frame.size.width - JobsWidth(100)) * 0.5,
                                                             JobsWidth(90),
                                                             JobsWidth(100),
                                                             JobsWidth(20))];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = JobsInternationalization(@"smile丽");
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = [UIColor orangeColor];
        [self.view addSubview:_nameLabel];
    }return _nameLabel;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        _statusLabel = [UILabel.alloc initWithFrame:CGRectMake((self.view.frame.size.width - JobsWidth(200)) * 0.5,
                                                                       JobsWidth(160),
                                                                       JobsWidth(200),
                                                                       JobsWidth(30))];
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.text = JobsInternationalization(@"请绘制手势密码");
        _statusLabel.font = [UIFont systemFontOfSize:12];
        _statusLabel.textColor = UIColor.redColor;
        [self.view addSubview:_statusLabel];
    }return _statusLabel;
}

-(ZLGestureLockView *)gestureLockView{
    if (!_gestureLockView) {
        _gestureLockView = [ZLGestureLockView.alloc initWithFrame:CGRectMake(0,
                                                                             self.view.frame.size.height - self.view.frame.size.width - JobsWidth(60) - btnH,
                                                                             self.view.frame.size.width,
                                                                             self.view.frame.size.width)];
        _gestureLockView.delegate = self;
        [self.view addSubview:_gestureLockView];
    }return _gestureLockView;
}

-(ZLGestureLockIndicator *)gestureLockIndicator{
    if (!_gestureLockIndicator) {
        _gestureLockIndicator = [ZLGestureLockIndicator.alloc initWithFrame:CGRectMake((self.view.frame.size.width - JobsWidth(60)) * 0.5,
                                                                                       JobsWidth(110),
                                                                                       JobsWidth(60),
                                                                                       JobsWidth(60))];
        [self.view addSubview:_gestureLockIndicator];
    }return _gestureLockIndicator;
}

-(UIButton *)otherAcountBtn{
    if (!_otherAcountBtn) {
        _otherAcountBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _otherAcountBtn.frame = CGRectMake(maginX,
                                          self.view.frame.size.height - JobsWidth(20) - btnH,
                                          btnW,
                                          btnH);
        _otherAcountBtn.backgroundColor = [UIColor clearColor];
        _otherAcountBtn.normalTitle = JobsInternationalization(@"其他账户");
        _otherAcountBtn.titleFont = [UIFont systemFontOfSize:JobsWidth(12)];
        _otherAcountBtn.normalTitleColor = RGBA_COLOR(102, 102, 102, 1);
        [_otherAcountBtn jobsBtnClickEventBlock:^id(id data) {
            NSLog(@"点击其他账号登陆按钮")
            return nil;
        }];
        [self.view addSubview:_otherAcountBtn];
    }return _otherAcountBtn;
}

-(UIButton *)resetPswBtn{
    if (!_resetPswBtn) {
        _resetPswBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _resetPswBtn.frame = CGRectMake(CGRectGetMaxX(self.otherAcountBtn.frame) + magin,
                                        self.otherAcountBtn.frame.origin.y,
                                        btnW,
                                        btnH);
        _resetPswBtn.backgroundColor = self.otherAcountBtn.backgroundColor;
        _resetPswBtn.normalTitle = JobsInternationalization(@"重新绘制");
        _resetPswBtn.titleFont = [UIFont systemFontOfSize:JobsWidth(12)];
        _resetPswBtn.normalTitleColor = RGBA_COLOR(102, 102, 102, 1);
        @jobs_weakify(self)
        [_resetPswBtn jobsBtnClickEventBlock:^id(id data) {
            @jobs_strongify(self)
            self.lastGesturePsw = nil;
            self.statusLabel.text = JobsInternationalization(@"请绘制手势密码");
            self.resetPswBtn.hidden = YES;
            [self.gestureLockIndicator setGesturePassword:JobsInternationalization(@"")];
            return nil;
        }];
        [self.view addSubview:_resetPswBtn];
    }return _resetPswBtn;
}

-(UIButton *)forgetPswBtn{
    if (!_forgetPswBtn) {
        _forgetPswBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetPswBtn.frame = CGRectMake(CGRectGetMaxX(self.resetPswBtn.frame) + magin,
                                         self.otherAcountBtn.frame.origin.y,
                                         btnW,
                                         btnH);
        _forgetPswBtn.backgroundColor = self.otherAcountBtn.backgroundColor;
        _forgetPswBtn.normalTitle = JobsInternationalization(@"忘记密码");
        _forgetPswBtn.titleFont = [UIFont systemFontOfSize:JobsWidth(12)];
        _forgetPswBtn.normalTitleColor = UIColor.redColor;
        [_forgetPswBtn jobsBtnClickEventBlock:^id(id data) {
            NSLog(@"点击忘记手势密码按钮");
            return nil;
        }];
        [self.view addSubview:_forgetPswBtn];
    }return _forgetPswBtn;
}

@end
