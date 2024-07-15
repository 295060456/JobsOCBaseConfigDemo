//
//  BaseViewController.h
//  JobsSearch
//
//  Created by Jobs on 2020/12/1.
//

#import <UIKit/UIKit.h>
#import "UIViewModelProtocol.h"
#import "BaseViewControllerProtocol.h"
#import "JobsBlock.h"
#import "JobsOCBaseConfigNotificationManager.h"
#import "MacroDef_Notification.h"
#import "MacroDef_Log.h"
#import "MacroDef_String.h"
#import "MacroDef_Func.h"

#import "UIView+Category.h"
#import "UIViewController+Category.h"
#import "JobsBasePopupView.h"
#import "JobsMenuView.h"

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#import "JXCategoryViewVerticalShowVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
<
UIGestureRecognizerDelegate
,UIViewModelProtocol
,BaseViewControllerProtocol
>

@property(nonatomic,strong)JobsMenuView *menuView;

@end

NS_ASSUME_NONNULL_END

/**
    加入键盘监听者 和 停止MJ_Refresh刷新 移到了NSObject 分类层，定位于 @interface NSObject (Extras)。这么做是考虑到调用类可能不仅仅局限于UIViewController

    -(void)keyboard;//加入键盘通知的监听者
    -(void)endRefreshing:(UIScrollView *_Nonnull)targetScrollView; 停止刷新
 */

/**
    要想隐藏系统的导航栏，这里有2个手段。一个是在UIViewController的基类，一个是在UIViewController的分类
    1、如果要在viewDidLoad实现隐藏系统的导航栏，则调用UIViewController基类的父类方法self.setupNavigationBarHidden = YES;
    2、如果要在viewWillAppear实现隐藏系统的导航栏，则调用UIViewController分类的方法self.isHiddenNavigationBar = YES;//禁用系统的导航栏
 */

/**
    _collectionView.mj_header = self.mjRefreshGifHeader;
    _collectionView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
    self.view.mjRefreshTargetView = _collectionView;
    _collectionView.mj_footer = self.mjRefreshAutoNormalFooter;
    _collectionView.mj_footer.hidden = YES;
*/

/**
 TABAnimated 使用示范
-(UICollectionView *)collectionView{
 if (!_collectionView) {
     _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                          collectionViewLayout:self.layout];
     _collectionView.backgroundColor = self.bgCor;
     [self dataLinkByCollectionView:_collectionView];
     _collectionView.showsVerticalScrollIndicator = NO;
     
     [_collectionView RegisterClass];

     [self.scrollView addSubview:_collectionView];
     [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.right.bottom.equalTo(self.view);
         make.top.equalTo(self.view).offset(153.5);
     }];
     
     {
         NSArray *classArray = @[
                                 DDCollectionViewCell_Style2.class,
                                 DDCollectionViewCell_Style3.class,
                                 DDCollectionViewCell_Style4.class,
                                 ];
         NSArray *sizeArray = @[
                                [NSValue valueWithCGSize:[DDCollectionViewCell_Style2 cellSizeWithModel:nil]],
                                [NSValue valueWithCGSize:[DDCollectionViewCell_Style3 cellSizeWithModel:nil]],
                                [NSValue valueWithCGSize:[DDCollectionViewCell_Style4 cellSizeWithModel:nil]]
                                ];
         
         _collectionView.tabAnimated = [TABCollectionAnimated animatedWithCellClassArray:classArray
                                                                           cellSizeArray:sizeArray
                                                                      animatedCountArray:@[@(1),@(1),@(1)]];
         
         [_collectionView.tabAnimated addHeaderViewClass:BaseCollectionReusableView_Style1.class
                                                viewSize:[BaseCollectionReusableView_Style1 viewSizeWithModel:nil]
                                               toSection:0];
         [_collectionView.tabAnimated addHeaderViewClass:BaseCollectionReusableView_Style1.class
                                                viewSize:[BaseCollectionReusableView_Style2 viewSizeWithModel:nil]
                                               toSection:2];
         
         _collectionView.tabAnimated.containNestAnimation = YES;
         _collectionView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
         _collectionView.tabAnimated.canLoadAgain = YES;
         [_collectionView tab_startAnimation];   // 开启动画
     }
 }return _collectionView;
}
 
 -(UITableView *)tableView{
     if (!_tableView) {
         _tableView = UITableView.new;
         _tableView.backgroundColor = HEXCOLOR(0xFAFAFA);
         _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         _tableView.showsVerticalScrollIndicator = NO;
         _tableView.delegate = self;
         _tableView.dataSource = self;
         [self dataLinkByTableView:_tableView];
         _tableView.mj_header = self.mjRefreshGifHeader;
         _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
         _tableView.mj_footer = self.mjRefreshAutoGifFooter;
         self.view.mjRefreshTargetView = _tableView;
         [self.view addSubview:_tableView];
         [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(self.gk_navigationBar.mas_bottom);
             make.left.right.bottom.equalTo(self.view);
         }];
         {/// 设置tabAnimated相关属性
             // 可以不进行手动初始化，将使用默认属性
             _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:[MKRankTBVCell class]
                                                                   cellHeight:[MKRankTBVCell cellHeightWithModel:nil]];
             _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
    //            [_tableView.tabAnimated addHeaderViewClass:LineTableViewHeaderFooterView.class viewHeight:60 toSection:0];
             [_tableView tab_startAnimation];   // 开启动画
         }
     }return _tableView;
}
 
 */

/**
 自定义高度的模态推送控制器使用示例
 1、如果self = ViewController
 JobsPresentedVC *vc = JobsPresentedVC.new;
 JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
 presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:vc presentingViewController:self];
 vc.presentUpHeight = JobsWidth(200);
 vc.view.backgroundColor = JobsRedColor;
 vc.transitioningDelegate = presentationController;
 
 [self presentViewController:vc animated:YES completion:NULL];
 
 2、如果self = View
 JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
 JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
 presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:jobsCommentCoreVC presentingViewController:self.jobsGetCurrentViewController];
 jobsCommentCoreVC.presentUpHeight = JobsWidth(800);
 /// jobsCommentCoreVC.view.backgroundColor = JobsRedColor;
 jobsCommentCoreVC.transitioningDelegate = presentationController;
 
 [self forceComingToPresentVC:jobsCommentCoreVC
                requestParams:JobsInternationalization(@"")
                   completion:nil];
 
 */
