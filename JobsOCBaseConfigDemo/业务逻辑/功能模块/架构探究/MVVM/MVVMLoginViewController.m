#import "MVVMLoginViewController.h"
#import "MVVM/MVVMLoginViewModel.h"
#import "Common/MockAuthService.h"

@interface MVVMLoginViewController ()
@property (nonatomic, strong) MVVMLoginViewModel *vm;
@property (nonatomic, strong) UITextField *userField;
@property (nonatomic, strong) UITextField *passField;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation MVVMLoginViewController
- (instancetype)init {
    if (self = [super init]) { _vm = [[MVVMLoginViewModel alloc] initWithService:[MockAuthService new]]; }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVVM";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    _userField = [self tf:@"用户名 (admin)"];
    _passField = [self tf:@"密码 (123456)"]; _passField.secureTextEntry = YES;
    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem]; [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
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

    [_userField addTarget:self action:@selector(onUser:) forControlEvents:UIControlEventEditingChanged];
    [_passField addTarget:self action:@selector(onPass:) forControlEvents:UIControlEventEditingChanged];

    __weak typeof(self) w = self;
    self.vm.loginEnabledChanged = ^(BOOL enabled) { w.loginBtn.enabled = enabled; w.loginBtn.alpha = enabled?1:0.5; };
    self.vm.loadingChanged = ^(BOOL loading) { loading ? [w.spinner startAnimating] : [w.spinner stopAnimating]; };
    self.vm.messageChanged = ^(NSString *msg, BOOL ok) {
        w.statusLabel.text = msg;
        w.statusLabel.textColor = ok ? [UIColor systemGreenColor] : [UIColor systemRedColor];
    };
}
- (UITextField *)tf:(NSString *)ph { UITextField *t=[UITextField new]; t.placeholder=ph; t.borderStyle=UITextBorderStyleRoundedRect; return t; }
- (void)onUser:(UITextField *)t { self.vm.username = t.text; }
- (void)onPass:(UITextField *)t { self.vm.password = t.text; }
- (void)tapLogin { [self.vm login]; }
@end
