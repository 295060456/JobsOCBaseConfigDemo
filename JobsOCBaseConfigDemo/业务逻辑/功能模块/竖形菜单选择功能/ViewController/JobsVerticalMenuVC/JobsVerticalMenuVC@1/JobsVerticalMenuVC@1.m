//
//  JobsVerticalMenuVC@1.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@1.h"

@interface JobsVerticalMenuVC_1 ()
/// UI
//@property(nonatomic,strong)UITableView *tableView;///  左侧的标题
@property(nonatomic,strong)BaseButton *customerServiceBtn;
@property(nonatomic,strong)BaseButton *msgBtn;
@property(nonatomic,strong)BaseButton *editBtn;
@property(nonatomic,strong)JobsSearchBar *searchView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*leftDataArray;/// 左边的数据源
@property(nonatomic,strong)UIViewModel *leftViewCurrentSelectModel;

@end

@implementation JobsVerticalMenuVC_1

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    self.makeSubVC();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
//        data.add(JobsBarButtonItem(self.aboutBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(JobsBarButtonItem(self.msgBtn));
        data.add(JobsBarButtonItem(self.customerServiceBtn));
    });
    self.makeNavByAlpha(1);
    
    self.searchView.alpha = 1;
    self.tableView.reloadDatas();
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
    return ^(){
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
        [self addChildViewController:viewController];
        viewController.view.frame = self.view.bounds;
        viewController.view.resetOriginX(self.tableView.right);
        viewController.view.resetWidth(self.view.width - self.tableView.width);
        [self.view addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
    };
}

-(NSMutableArray<UIViewModel *> *)titleMutArr{
    if (!_titleMutArr) {
        /// 最初默认的数据
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"收藏");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"真人");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"体育");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"电子");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"棋牌");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"彩票");
            }));
        });
    }return _titleMutArr;
}

-(jobsByVoidBlock)refreshLeftView{
    return ^(){
        [self.tableView reloadData];
        if (self.leftDataArray.count){
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
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
    LeftCell *cell = LeftCell.cellStyleDefaultWithTableView(tableView);
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
    cell.jobsRichElementsInCellWithModel(viewModel);
    return cell;
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
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = HEXCOLOR(0xFCFBFB);
        _tableView.dataLink(self);
        _tableView.frame = CGRectMake(0,
                                      JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h,
                                      TableViewWidth,
                                      JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight);
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }return _tableView;
}

-(BaseButton *)customerServiceBtn{
    if (!_customerServiceBtn) {
        @jobs_weakify(self)
        _customerServiceBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnImage(JobsIMG(@"人工客服"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
    }return _customerServiceBtn;
}

-(BaseButton *)msgBtn{
    if (!_msgBtn) {
        @jobs_weakify(self)
        _msgBtn = BaseButton.jobsInit()
            .jobsResetBtnImage(JobsIMG(@"消息"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });;
    }return _msgBtn;
}

-(JobsSearchBar *)searchView{
    if (!_searchView) {
        _searchView = JobsSearchBar.new;
        _searchView.sizer = CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40));
        _searchView.jobsRichViewByModel(nil);
//        @jobs_weakify(self)
        [_searchView actionObjectBlock:^(NSString *data) {
//            @jobs_strongify(self)
        }];
        
        [self.gk_navigationBar addSubview:_searchView];
        [_searchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)));
            make.right.equalTo(self.gk_navigationBar).offset(JobsWidth(0));
            make.centerY.equalTo(self.gk_navigationBar);
        }];
        
//        [_jobsSearchBar actionNSIntegerBlock:^(UITextFieldFocusType data) {
//            @jobs_strongify(self)
//            switch (data) {
//                case UITextFieldGetFocus:{/// 输入框获得焦点
//                    if (self.listViewData.count) {
//                        /// 必须先移除，否则反复添加无法正常移除
//                        self.dropDownListView = [self motivateFromView:weak_self.jobsSearchBar
//                                                                  data:self.listViewData
//                                                    motivateViewOffset:JobsWidth(5)
//                                                           finishBlock:^(UIViewModel *data) {
//                            NSLog(@"data = %@",data);
//                        }];
//                    }
//                }break;
//                case UITextFieldLoseFocus:{/// 输入框失去焦点
//                    [self endDropDownListView];
//                }break;
//                default:
//                    break;
//            }
//        }];
    }return _searchView;
}

-(BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColor(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(JobsIMG(@"编辑"))
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"编辑"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                toast(JobsInternationalization(@"编辑"));
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self.view addSubview:_editBtn];
        [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.tableView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
        }];
    }return _editBtn;
}

-(NSMutableArray<UIViewModel *> *)leftDataArray{
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    }return _leftDataArray;
}

@end
