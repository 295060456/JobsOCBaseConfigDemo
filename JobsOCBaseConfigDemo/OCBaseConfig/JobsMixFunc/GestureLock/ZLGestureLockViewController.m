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
Prop_strong()ZLGestureLockView *gestureLockView;
/// 实时展示已经划过的手势路径
Prop_strong()ZLGestureLockIndicator *gestureLockIndicator;
/// 手势状态栏提示label
Prop_strong()UILabel *statusLabel;
/// 账户名
Prop_strong()UILabel *nameLabel;
/// 账户头像
Prop_strong()UIImageView *headIcon;
/// 其他账户登录按钮
Prop_strong()UIButton *otherAcountBtn;
/// 重新绘制按钮
Prop_strong()UIButton *resetPswBtn;
/// 忘记手势密码按钮
Prop_strong()UIButton *forgetPswBtn;
/// 创建的手势密码
Prop_copy()NSString *lastGesturePsw;
/// 创建/校验 手势密码
Prop_assign()ZLUnlockType unlockType;

@end

@implementation ZLGestureLockViewController

- (void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
    if (JobsDebug) {
        self.jobsToastMsg(JobsInternationalization(@"成功销毁了控制器:").add(NSStringFromClass(self.class)));
        JobsLog(@"%@",JobsLocalFunc);
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
    self.view.backgroundColor = JobsWhiteColor;
    
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
    JobsDeleUserDefaultWithKey(GesturesPassword);
    JobsUserDefaultSynchronize;
}

+(void)addGesturesPassword:(NSString *)gesturesPassword{
    JobsSetUserDefaultKeyWithObject(GesturesPassword, gesturesPassword);
    JobsUserDefaultSynchronize;
}

+(NSString *)gesturesPassword {
    return [JobsUserDefaults objectForKey:GesturesPassword];
}
#pragma mark —— UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    // 重新登陆
    JobsLog(@"重新登陆");
}
#pragma mark —— lazyLoad
-(UIImageView *)headIcon{
    if (!_headIcon) {
        @jobs_weakify(self)
        _headIcon = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.frame = CGRectMake((self.view.frame.size.width - JobsWidth(56)) * 0.5,
                                         JobsWidth(30),
                                         JobsWidth(56),
                                         JobsWidth(56));
            imageView.image = JobsIMG(@"gesture_headIcon");
            self.view.addSubview(imageView);
        });
    }return _headIcon;
}

-(UILabel *)nameLabel{
    if (!_nameLabel) {
        @jobs_weakify(self)
        _nameLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = CGRectMake((self.view.frame.size.width - JobsWidth(100)) * 0.5,
                                     JobsWidth(90),
                                     JobsWidth(100),
                                     JobsWidth(20));
            label.textAlignment = NSTextAlignmentCenter;
            label.text = JobsInternationalization(@"smile丽");
            label.font = UIFontWeightBoldSize(JobsWidth(12));
            label.textColor = JobsOrangeColor;
            self.view.addSubview(label);
        });
    }return _nameLabel;
}

-(UILabel *)statusLabel{
    if (!_statusLabel) {
        @jobs_weakify(self)
        _statusLabel = self.view.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byTextAlignment(NSTextAlignmentCenter)
                .byText(JobsInternationalization(@"请绘制手势密码"))
                .byFont(UIFontSystemFontOfSize(JobsWidth(12)))
                .byTextCor(JobsRedColor)
                .byFrame(CGRectMake((self.view.frame.size.width - JobsWidth(200)) * 0.5,
                                    JobsWidth(160),
                                    JobsWidth(200),
                                    JobsWidth(30)));
        }));
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
        @jobs_weakify(self)
        _otherAcountBtn = self.view.addSubview(UIButton.jobsInit()
                                               .jobsResetBtnTitle(JobsInternationalization(@"其他账户"))
                                               .jobsResetBtnTitleFont([UIFont systemFontOfSize:JobsWidth(12)])
                                               .jobsResetBtnTitleCor(RGBA_COLOR(102, 102, 102, 1))
                                               .onClickBy(^(UIButton *x){
                                                   @jobs_strongify(self)
                                                   x.selected = !x.selected;
                                                   if (self.objBlock) self.objBlock(x);
                                                   JobsLog(@"点击其他账号登陆按钮")
                                               }).onLongPressGestureBy(^(id data){
                                                   JobsLog(@"");
                                               })
                                               .byFrame(CGRectMake(maginX,
                                                                   self.view.frame.size.height - JobsWidth(20) - btnH,
                                                                   btnW,
                                                                   btnH)));
        _otherAcountBtn.backgroundColor = JobsClearColor;
    }return _otherAcountBtn;
}

-(UIButton *)resetPswBtn{
    if (!_resetPswBtn) {
        @jobs_weakify(self)
        _resetPswBtn = self.view.addSubview(UIButton.jobsInit()
                                            .jobsResetBtnTitle(JobsInternationalization(@"重新绘制"))
                                            .jobsResetBtnTitleFont([UIFont systemFontOfSize:JobsWidth(12)])
                                            .jobsResetBtnTitleCor(RGBA_COLOR(102, 102, 102, 1))
                                            .onClickBy(^(UIButton *x){
                                                @jobs_strongify(self)
                                                x.selected = !x.selected;
                                                if (self.objBlock) self.objBlock(x);
                                                self.lastGesturePsw = nil;
                                                self.statusLabel.text = JobsInternationalization(@"请绘制手势密码");
                                                self.resetPswBtn.hidden = YES;
                                                [self.gestureLockIndicator setGesturePassword:JobsInternationalization(@"")];
                                             }).onLongPressGestureBy(^(id data){
                                                 JobsLog(@"");
                                             })
                                            .byFrame(CGRectMake(CGRectGetMaxX(self.otherAcountBtn.frame) + magin,
                                                                self.otherAcountBtn.frame.origin.y,
                                                                btnW,
                                                                btnH)));
        _resetPswBtn.backgroundColor = self.otherAcountBtn.backgroundColor;
    }return _resetPswBtn;
}

-(UIButton *)forgetPswBtn{
    if (!_forgetPswBtn) {
        @jobs_weakify(self)
        _forgetPswBtn = self.view.addSubview(UIButton.jobsInit()
                                             .jobsResetBtnTitle(JobsInternationalization(@"重新绘制"))
                                             .jobsResetBtnTitleFont([UIFont systemFontOfSize:JobsWidth(12)])
                                             .jobsResetBtnTitleCor(RGBA_COLOR(102, 102, 102, 1))
                                             .onClickBy(^(UIButton *x){
                                                 @jobs_strongify(self)
                                                 x.selected = !x.selected;
                                                 if (self.objBlock) self.objBlock(x);
                                                 JobsLog(@"点击忘记手势密码按钮");
                                              }).onLongPressGestureBy(^(id data){
                                                  JobsLog(@"");
                                              })
                                             .byFrame(CGRectMake(CGRectGetMaxX(self.resetPswBtn.frame) + magin,
                                                                 self.otherAcountBtn.frame.origin.y,
                                                                 btnW,
                                                                 btnH)));
         _resetPswBtn.backgroundColor = self.otherAcountBtn.backgroundColor;
    }return _forgetPswBtn;
}

@end
