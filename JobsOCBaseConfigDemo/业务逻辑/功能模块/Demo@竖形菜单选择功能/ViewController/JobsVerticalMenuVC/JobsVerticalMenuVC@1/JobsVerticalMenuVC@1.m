//
//  JobsVerticalMenuVC@1.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@1.h"

@interface JobsVerticalMenuVC_1 ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()JobsSearchBar *searchView;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*titleMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*leftDataArray;/// 左边的数据源
Prop_strong()UIViewModel *leftViewCurrentSelectModel;

@end

@implementation JobsVerticalMenuVC_1

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = @"右边的架构是VC";
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
    self.makeSubVC();
}

//

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
                                        .jobsResetBtnImage(@"消息".img)
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            if (self.objBlock) self.objBlock(x);
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })));
        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
                                        .bgColorBy(JobsWhiteColor)
                                        .jobsResetBtnImage(@"人工客服".img)
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            if (self.objBlock) self.objBlock(x);
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })));
    });
    self.makeNavByAlpha(1);
    
    self.searchView.alpha = 1;
    self.tableView.byShow(self);
    self.editBtn.alpha = 1;
    self.refreshLeftView();
    
    self.displayViewController(self.vcs[0]);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [self.collectionView setContentOffset:CGPointMake(0, JobsWidth(-5)) animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock)makeSubVC{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        /// 这里可以调用接口去获取一级目录分类的数据
        for (int i = 0; i < self.titleMutArr.count; i++){
            self.vcs.add(JobsVerticalMenuSubVC.new);
        }
    };
}

-(jobsByVCBlock)displayViewController{
    @jobs_weakify(self)
    return ^(__kindof UIViewController *_Nullable viewController){
        @jobs_strongify(self)
        /// 移除当前显示的子视图控制器
        for (__kindof UIViewController *vc in self.childViewControllers) {
            [vc willMoveToParentViewController:nil];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
        /// 添加新视图控制器
        self.addChildViewController(viewController);
        viewController.view.frame = self.view.bounds;
        viewController.view.resetOriginX(self.tableView.right);
        viewController.view.resetWidth(self.view.width - self.tableView.width);
        self.view.addSubview(viewController.view);
        [viewController didMoveToParentViewController:self];
    };
}

-(NSMutableArray<UIViewModel *> *)titleMutArr{
    if (!_titleMutArr) {
        /// 最初默认的数据
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = @"收藏".tr;
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = @"真人".tr;
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = @"体育".tr;
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = @"电子".tr;
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = @"棋牌".tr;
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = @"彩票".tr;
            }));
        });
    }return _titleMutArr;
}

-(jobsByVoidBlock)refreshLeftView{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self )
        self.tableView.reloadDatas();
        if (self.leftDataArray.count){
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = jobsMakeIndexPathZero();
                [self.tableView selectRowAtIndexPath:indexPath
                                            animated:NO
                                      scrollPosition:UITableViewScrollPositionNone];
                if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]){
                    [self.tableView.delegate tableView:self.tableView
                               didSelectRowAtIndexPath:indexPath];
                }
            });
        }
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(__kindof UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.titleMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    @jobs_weakify(self)
    return LeftCell.cellStyleDefaultWithTableView(tableView)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
        }));
}

-(CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return LeftCell.cellHeightByModel(nil);
}

-(void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.displayViewController(self.vcs[indexPath.row]);
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        @jobs_weakify(self)
        _tableView = self.view.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(HEXCOLOR(0xFCFBFB))
                .byFrame(CGRectMake(0,JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
                                    TableViewWidth,JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight));
        }));
    }return _tableView;
}

-(JobsSearchBar *)searchView{
    if (!_searchView) {
        @jobs_weakify(self)
        _searchView = jobsMakeSearchBar(^(__kindof JobsSearchBar * _Nullable searchBar) {
            @jobs_strongify(self)
            searchBar
                .bySize(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)))
                .JobsRichViewByModel2(nil)
                .JobsBlock1(^(id _Nullable data) {

                })
                .addOn(self.gk_navigationBar)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)));
                    make.right.equalTo(self.gk_navigationBar).offset(JobsWidth(0));
                    make.centerY.equalTo(self.gk_navigationBar);
                });
        });
    }return _searchView;
}

-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(@"编辑".img)
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"编辑".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toastBy(@"编辑".tr);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.left.equalTo(self.view);
                make.top.equalTo(self.tableView.mas_bottom);
                make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
            });
    }return _editBtn;
}

-(NSMutableArray<UIViewModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {

        });
    }return _leftDataArray;
}
@synthesize vcs = _vcs;
-(__kindof NSMutableArray<__kindof UIViewController *> *)vcs{
    if(!_vcs){
        _vcs = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {

        });
    }return _vcs;
}

@end
