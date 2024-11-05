//
//  JobsBaseDataSettingVC.m
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsBaseDataSettingVC.h"

@interface JobsBaseDataSettingVC ()

@end

@implementation JobsBaseDataSettingVC

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
}

-(void)loadView{
    [super loadView];
    self.isHiddenNavigationBar = YES;
    self.setupNavigationBarHidden = YES;
    self.currentPage = 1;
    self.modalInPresentation = NO; /// 禁用下拉手势dismiss画面需要将此属性设置为YES
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     NOTE:
     View controllers presented with custom presentation controllers
     do not assume control of the status bar appearance by default
     (their -preferredStatusBarStyle and -prefersStatusBarHidden
     methods are not called).  You can override this behavior by
     setting the value of the presented view controller's
     modalPresentationCapturesStatusBarAppearance property to YES.
     
     self.modalPresentationCapturesStatusBarAppearance = YES;
     */
    [self updatePreferredContentSizeWithTraitCollection:self.traitCollection];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
    NSLog(@"%d",self.setupNavigationBarHidden);
    self.isHiddenNavigationBar = self.setupNavigationBarHidden;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— UIContentContainer
/// UIContentContainer 自定义模态动画推出ViewController
-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
             withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    // When the current trait collection changes (e.g. the device rotates),
    // update the preferredContentSize.
    [self updatePreferredContentSizeWithTraitCollection:newCollection];
}
@synthesize presentUpHeight = _presentUpHeight;
-(void)updatePreferredContentSizeWithTraitCollection:(UITraitCollection *)traitCollection{
    NSLog(@"%f",self.presentUpHeight);
    self.preferredContentSize = CGSizeMake(self.view.bounds.size.width,
                                           traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact ? 270 : self.presentUpHeight);/// 上升的高度
}
#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
#pragma mark —— BaseViewControllerProtocol
-(JobsReturnNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig{
    return ^JobsNavBarConfig *_Nullable(UIButtonModel *_Nullable backBtnModel,
                                        UIButtonModel *_Nullable closeBtnModel) {
        @jobs_weakify(self)
        return Jobs3TO(static_navBarConfig, jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
            @jobs_strongify(self)
            /// 对中间标题的配置
            data.bgCor = self.viewModel.navBgCor;
            data.bgImage = self.viewModel.navBgImage;
            data.attributedTitle = Jobs3TO(self.viewModel.attributedText, self.viewModel.textModel.attributedText);
            data.title = Jobs3TO(self.viewModel.text, self.viewModel.textModel.text);
            data.font = Jobs3TO(self.viewModel.font, self.viewModel.textModel.font);
            data.titleCor = self.viewModel.textModel.textCor;
            /// 对（左边）返回键的配置
            data.backBtnModel = Jobs3TO(backBtnModel, self.backBtnModel);
            /// 对（右边）关闭键的配置
            data.closeBtnModel = Jobs3TO(closeBtnModel, self.closeBtnModel);
            self.navBarConfig = data;
        }));
    };
}
#pragma mark —— lazyLoad
/// BaseViewControllerProtocol
@synthesize vcs = _vcs;
-(NSMutableArray<__kindof UIViewController *> *)vcs{
    if(!_vcs){
        _vcs = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            
        });
    }return _vcs;
}
@synthesize viewModel = _viewModel;
-(UIViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.textCor = HEXCOLOR(0x3D4A58);
            data.textModel.font = UIFontWeightRegularSize(16);
        });
    }return _viewModel;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
@synthesize closeBtnModel = _closeBtnModel;
-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.backgroundImage = JobsIMG(@"联系我们");
//            data.selected_backgroundImage = JobsIMG(@"联系我们");
//            data.jobsResetBtnImage = JobsIMG(@"联系我们");
//            data.highlightImage = JobsIMG(@"联系我们");
//            data.imagePadding = JobsWidth(5);
            data.roundingCorners = UIRectCornerAllCorners;
            data.baseBackgroundColor = JobsClearColor;
        });
    }return _closeBtnModel;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
@synthesize backBtnModel = _backBtnModel;
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel;
        _backBtnModel.longPressGestureEventBlock = ^id(__kindof UIButton *x) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        };
        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            self.backBtnClickEvent(x);
            return nil;
        };
    }return _backBtnModel;
}

@end
