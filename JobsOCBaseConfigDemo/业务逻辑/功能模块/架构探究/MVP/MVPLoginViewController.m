#import "MVPLoginViewController.h"
#import "MVP/MVPLoginContracts.h"
#import "MVP/MVPLoginPresenter.h"
#import "Common/MockAuthService.h"

@interface MVPLoginViewController () <MVPLoginView>
@property (nonatomic, strong) id<MVPLoginPresenter> presenter;
@property (nonatomic, strong) UITextField *userField;
@property (nonatomic, strong) UITextField *passField;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation MVPLoginViewController
- (instancetype)init {
    if (self = [super init]) {
        _presenter = [[MVPLoginPresenterImpl alloc] initWithView:self service:[MockAuthService new]];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVP";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    _userField = [self makeTF:@"用户名 (admin)"];
    _passField = [self makeTF:@"密码 (123456)"]; _passField.secureTextEntry = YES;
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(tapLogin) forControlEvents:UIControlEventTouchUpInside];
    _statusLabel = [UILabel new]; _statusLabel.numberOfLines = 0;
    _spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];

    UIStackView *stack = [[UIStackView alloc] initWithArrangedSubviews:@[_userField,_passField,_loginBtn,_spinner,_statusLabel]];
    stack.axis = UILayoutConstraintAxisVertical; stack.spacing = 12; stack.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stack];
    [NSLayoutConstraint activateConstraints:@[
        [stack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [stack.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [stack.widthAnchor constraintEqualToConstant:280]
    ]];

    [_userField addTarget:self action:@selector(onUserChanged:) forControlEvents:UIControlEventEditingChanged];
    [_passField addTarget:self action:@selector(onPassChanged:) forControlEvents:UIControlEventEditingChanged];

    [self.presenter viewDidLoad];
}
- (UITextField *)makeTF:(NSString *)ph {
    UITextField *tf = [UITextField new];
    tf.placeholder = ph; tf.borderStyle = UITextBorderStyleRoundedRect;
    return tf;
}
- (void)onUserChanged:(UITextField *)tf { [self.presenter onUsernameChanged:tf.text]; }
- (void)onPassChanged:(UITextField *)tf { [self.presenter onPasswordChanged:tf.text]; }
- (void)tapLogin { [self.presenter onTapLogin]; }

#pragma mark - MVPLoginView
- (void)showLoading:(BOOL)loading { loading ? [self.spinner startAnimating] : [self.spinner stopAnimating]; }
- (void)showMessage:(NSString *)text success:(BOOL)ok {
    self.statusLabel.text = text;
    self.statusLabel.textColor = ok ? [UIColor systemGreenColor] : [UIColor systemRedColor];
}
- (void)setLoginEnabled:(BOOL)enabled { self.loginBtn.enabled = enabled; self.loginBtn.alpha = enabled?1.0:0.5; }
@end
