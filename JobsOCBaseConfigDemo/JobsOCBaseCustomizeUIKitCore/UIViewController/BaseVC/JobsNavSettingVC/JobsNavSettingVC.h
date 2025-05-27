//
//  JobsNavSettingVC.h
//  FM
//
//  Created by User on 9/9/24.
//

#import "JobsMonitorVC.h"
#import "JobsBlock.h"
#import "UIViewController+BaseNavigationBar.h"
#import "UIView+Extras.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsNavSettingVC : JobsMonitorVC<UIGestureRecognizerDelegate>

-(jobsByCGFloatBlock _Nonnull)makeNavByAlpha;
-(jobsByCGFloatBlock _Nonnull)makeJobsNavByAlpha;
-(jobsByNavBarConfigBlock _Nonnull)makeNavByConfig;
-(jobsByNavBarConfigBlock _Nonnull)makeGKNavByConfig;

@end

NS_ASSUME_NONNULL_END
/**
    要想隐藏系统的导航栏，这里有2个手段。一个是在UIViewController的基类，一个是在UIViewController的分类
    1、如果要在viewDidLoad实现隐藏系统的导航栏，则调用UIViewController基类的父类方法self.setupNavigationBarHidden = YES;
    2、如果要在viewWillAppear实现隐藏系统的导航栏，则调用UIViewController分类的方法self.isHiddenNavigationBar = YES;//禁用系统的导航栏
 */
/**
 
 self.makeNavByConfig(jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
     config.viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
         viewModel.alpha = 1;
         viewModel.navBgCor = JobsClearColor;
         viewModel.navBgImage = JobsIMG(@"");
         viewModel.titleImage = JobsIMG(@"BSportRedLogo"); /// 配置中间的标题为图片
     });
     /// 配置返回键
     config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
//            @jobs_strongify(self)
         buttonModel.normalImage = JobsIMG(@"全局返回箭头");
         buttonModel.highlightImage = JobsIMG(@"全局返回箭头");
         buttonModel.title = JobsInternationalization(@"");
         buttonModel.titleFont = bayonRegular(18);
         buttonModel.titleCor = JobsCor(@"#8A93A1");
         buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
         buttonModel.textAlignment = NSTextAlignmentCenter;
         buttonModel.subTextAlignment = NSTextAlignmentCenter;
         buttonModel.baseBackgroundColor = JobsClearColor;
         buttonModel.imagePadding = JobsWidth(5);
         buttonModel.clickEventBlock = ^id(__kindof UIButton *_Nullable x){
             @jobs_strongify(self)
             x.selected = !x.selected;
             JobsAppTool.loginWork = FMLoginWork_MyFav;
 //            self.backTo(0);
             self.backViewControllerCore(self);
             return nil;
         };
         buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable btn){
             // @jobs_strongify(self)
             return nil;
         };
     }));
 }));
 
 */
