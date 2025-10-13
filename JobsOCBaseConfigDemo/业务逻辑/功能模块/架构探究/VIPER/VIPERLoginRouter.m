#import "VIPERLoginRouter.h"
#import "VIPER/VIPERLoginViewController.h"
#import "VIPER/VIPERLoginInteractor.h"
#import "VIPER/VIPERLoginPresenter.h"
#import "Common/MockAuthService.h"

@implementation VIPERLoginRouterImpl
+ (UIViewController *)buildModule {
    VIPERLoginViewController *view = [VIPERLoginViewController new];
    VIPERLoginInteractor *interactor = [[VIPERLoginInteractor alloc] initWithService:[MockAuthService new]];
    VIPERLoginRouterImpl *router = [VIPERLoginRouterImpl new];
    VIPERLoginPresenterImpl *presenter = [VIPERLoginPresenterImpl new];
    presenter.view = (id<VIPERLoginView>)view;
    presenter.interactor = (id<VIPERLoginInteractorInput>)interactor;
    presenter.router = (id<VIPERLoginRouter>)router;
    interactor.output = (id<VIPERLoginInteractorOutput>)presenter;
    view.presenter = (id<VIPERLoginPresenter>)presenter;
    return view;
}
- (void)navigateToHomeFrom:(UIViewController *)vc {
    UIViewController *home = [UIViewController new];
    home.view.backgroundColor = [UIColor systemGreenColor];
    home.title = @"Home";
    [vc.navigationController pushViewController:home animated:YES];
}
@end
