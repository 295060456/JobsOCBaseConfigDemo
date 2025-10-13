#import "VIPERLoginViewController.h"

@interface VIPERLoginViewController ()
@property (nonatomic, strong) UITextField *userField;
@property (nonatomic, strong) UITextField *passField;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation VIPERLoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"VIPER";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    _userField=[self tf:@"用户名 (admin)"]; _passField=[self tf:@"密码 (123456)"]; _passField.secureTextEntry=YES;
    _loginBtn=[UIButton buttonWithType:UIButtonTypeSystem]; [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(tapLogin) forControlEvents:UIControlEventTouchUpInside];
    _statusLabel=[UILabel new]; _statusLabel.numberOfLines=0;
    _spinner=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];

    UIStackView *stack=[[UIStackView alloc] initWithArrangedSubviews:@[_userField,_passField,_loginBtn,_spinner,_statusLabel]];
    stack.axis=UILayoutConstraintAxisVertical; stack.spacing=12; stack.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:stack];
    [NSLayoutConstraint activateConstraints:@[
        [stack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [stack.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [stack.widthAnchor constraintEqualToConstant:280]
    ]];

    [_userField addTarget:self action:@selector(onUser:) forControlEvents:UIControlEventEditingChanged];
    [_passField addTarget:self action:@selector(onPass:) forControlEvents:UIControlEventEditingChanged];
}
- (UITextField *)tf:(NSString *)ph { UITextField *t=[UITextField new]; t.placeholder=ph; t.borderStyle=UITextBorderStyleRoundedRect; return t; }
- (void)onUser:(UITextField *)t { [self.presenter usernameChanged:t.text]; }
- (void)onPass:(UITextField *)t { [self.presenter passwordChanged:t.text]; }
- (void)tapLogin { [self.presenter tapLogin]; }

#pragma mark - VIPERLoginView
- (void)showLoading:(BOOL)loading { loading?[self.spinner startAnimating]:[self.spinner stopAnimating]; }
- (void)renderMessage:(NSString *)text success:(BOOL)ok {
    self.statusLabel.text = text;
    self.statusLabel.textColor = ok ? [UIColor systemGreenColor] : [UIColor systemRedColor];
}
- (void)setLoginEnabled:(BOOL)enabled { self.loginBtn.enabled = enabled; self.loginBtn.alpha = enabled?1:0.5; }
@end
