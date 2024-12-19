//
//  BaseViewController.m
//  JobsSearch
//
//  Created by Jobs on 2020/12/1.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
#pragma mark —— BaseViewProtocol
BaseViewProtocol_synthesize
BaseViewControllerProtocol_synthesize
/// new方法触发
- (instancetype)init{
    if (self = [super init]) {
        
    }return self;
}
/// new方法触发
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    if(self = [super initWithNibName:nibNameOrNil
                              bundle:nibBundleOrNil]) {

    }return self;
}

-(void)loadView{
    [super loadView];
    self.LoadView = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ViewDidLoad = YES;
    /// 在loadView或者之前的生命周期中定义背景图片或者底色
    self.setBackGround();
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.ViewWillAppear = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.ViewDidAppear = YES;
#ifdef DEBUG
    /// 网络异步数据刷新UI会在viewDidAppear以后执行viewWillLayoutSubviews、viewDidLayoutSubviews
//    [self ifEmptyData];
#endif
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.ViewWillDisappear = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.ViewDidDisappear = YES;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.view.mjRefreshTargetView.mj_footer.y = self.view.mjRefreshTargetView.contentSize.height;
}
#pragma mark —— 一些私有方法
/// 在loadView或者之前的生命周期中定义背景图片或者底色
-(jobsByVoidBlock _Nonnull)setBackGround{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        /// 底图没有 + 底色没有
        if(!self.viewModel.bgImage && !self.viewModel.bgCor){
            self.view.backgroundColor = HEXCOLOR(0xFCFBFB);
            return;
        }
        /// 底图有 + 底色没有
        if(self.viewModel.bgImage && !self.viewModel.bgCor){
            self.bgImageView.alpha = 1;
            return;
        }
        /// 底图没有 + 底色有
        if(!self.viewModel.bgImage && self.viewModel.bgCor){
            self.view.backgroundColor = self.viewModel.bgCor;
            return;
        }
        /// 底图有 + 底色有 = 优先使用底图数据
        if(self.viewModel.bgImage && self.viewModel.bgCor){
            self.bgImageView.alpha = 1;
            return;
        }
    };
}
#pragma mark —— lazyLoad
@synthesize bgImageView = _bgImageView;
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.resetOrigin(CGPointMake(self.view.x, self.view.y));
            imageView.resetSize(CGSizeMake(JobsRealWidth(),JobsRealHeight()));
            imageView.image = self.viewModel.bgImage;
            imageView.userInteractionEnabled = YES;
    //        self.view = _bgImageView; // 如果用UIImageView来替换原本的View，有时候会出现一些错误
            [self.view insertSubview:imageView atIndex:0];
        });
    }return _bgImageView;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
//@synthesize backBtnModel = _backBtnModel;
//-(UIButtonModel *)backBtnModel{
//    if(!_backBtnModel){
//        @jobs_strongify(self)
//        _backBtnModel = self.makeBackBtnModel;
//        _backBtnModel.longPressGestureEventBlock = ^id(__kindof UIButton *x) {
//            JobsLog(@"按钮的长按事件触发");
//            return nil;
//        };
//        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
//            @jobs_strongify(self)
//            if (self.objectBlock) self.objectBlock(x);
//            self.showTabBar(YES);
//            self.backTo(2);
//            return nil;
//        };
//    }return _backBtnModel;
//}

@end
