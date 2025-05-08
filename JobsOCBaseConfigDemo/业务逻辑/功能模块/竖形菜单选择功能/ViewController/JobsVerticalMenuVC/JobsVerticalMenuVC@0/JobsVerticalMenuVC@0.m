//
//  JobsVerticalMenuVC@0.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@0.h"

@interface JobsVerticalMenuVC_0 ()
/// UI
Prop_strong()BaseButton *editBtn;
Prop_strong()JobsSearchBar *searchView;
/// Data
Prop_copy()NSMutableArray <__kindof UIView *>*rightViewArray; /// 右侧的视图数组
Prop_copy()NSMutableArray <__kindof UIViewModel *>*titleMutArr;
Prop_copy()NSMutableArray <__kindof UIViewModel *>*leftDataArray; /// 左边的数据源
Prop_strong()UIViewModel *leftViewCurrentSelectModel;

@end

@implementation JobsVerticalMenuVC_0

- (void)dealloc {
    JobsLog(@"%@", JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (void)loadView {
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    self.makeSubViews();
}

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
                                        .jobsResetBtnImage(JobsIMG(@"消息"))
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            if (self.objBlock) self.objBlock(x);
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })));
        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
                                        .bgColorBy(JobsWhiteColor)
                                        .jobsResetBtnImage(JobsIMG(@"人工客服"))
                                        .onClickBy(^(UIButton *x){
                                            @jobs_strongify(self)
                                            if (self.objBlock) self.objBlock(x);
                                        }).onLongPressGestureBy(^(id data){
                                            JobsLog(@"");
                                        })));
    });
    self.makeNavByAlpha(1);
    
    self.searchView.alpha = 1;
    self.tableView.reloadDatas();
    self.editBtn.alpha = 1;
    self.refreshLeftView();

    self.displayView(self.rightViewArray[0]);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
/// 创建右侧视图
- (jobsByVoidBlock _Nonnull)makeSubViews {
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.rightViewArray = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            for (int i = 0; i < self.titleMutArr.count; i++) {
                JobsVerticalMenuSubView *subView = JobsVerticalMenuSubView.new;
                subView.backgroundColor = JobsRandomColor;
                data.add(subView);
            }
        });
    };
}

//-(JobsReturnViewByClassBlock _Nonnull)makeSubViews{
//    return ^UIView *_Nullable(Class _Nonnull cls){
//        UIView *view = cls.new;
//        view.frame = CGRectMake(MenuWidth,
//                                0,
//                                JobsRealWidth() - MenuWidth,
//                                JobsRealHeight());
//        view.jobsRichViewByModel(nil);
//        return view;
//    };
//}
/// 显示指定的右侧视图
- (jobsByViewBlock _Nonnull)displayView {
    @jobs_weakify(self)
    return ^(UIView *subview) {
        @jobs_strongify(self)
        /// 移除当前显示的视图
        for (UIView *subView in self.view.subviews) {
            if ([subView isKindOfClass:JobsVerticalMenuSubView.class]) {
                [subView removeFromSuperview];
            }
        }
        /// 添加新的视图
        subview.frame = CGRectMake(self.tableView.frame.size.width,
                                   0,
                                   self.view.frame.size.width - self.tableView.frame.size.width,
                                   self.view.frame.size.height);
        [self.view addSubview:subview];
    };
}

- (jobsByVoidBlock _Nonnull)refreshLeftView {
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.tableView.reloadDatas();
        if (self.leftDataArray.count) {
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = jobsMakeIndexPathZero();
                [self.tableView selectRowAtIndexPath:indexPath
                                            animated:NO
                                      scrollPosition:UITableViewScrollPositionNone];
                if ([self.tableView.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
                    [self.tableView.delegate tableView:self.tableView
                               didSelectRowAtIndexPath:indexPath];
                }
            });
        }
    };
}
#pragma mark —— UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(__kindof UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.titleMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(__kindof UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return LeftCell.cellStyleDefaultWithTableView(tableView)
        .JobsRichViewByModel2(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        @jobs_strongify(self)
        data.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
    }));
}

- (CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LeftCell.cellHeightByModel(nil);
}

- (void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.displayView(self.rightViewArray[indexPath.row]);
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView){
        @jobs_weakify(self)
        _tableView = self.view.addSubview(jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self);
            tableView.showsVerticalScrollIndicator = NO;
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.backgroundColor = HEXCOLOR(0xFCFBFB);
            tableView.frame = jobsMakeCGRectByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                data.jobsX = 0;
                data.jobsY = JobsTopSafeAreaHeight() + JobsStatusBarHeight() + self.gk_navigationBar.mj_h;
                data.jobsWidth = TableViewWidth;
                data.jobsHeight = JobsMainScreen_HEIGHT() - JobsTopSafeAreaHeight() - JobsStatusBarHeight() - JobsTabBarHeight(AppDelegate.tabBarVC) - EditBtnHeight;
            });
        }));
    }return _tableView;
}

- (JobsSearchBar *)searchView {
    if (!_searchView) {
        _searchView = JobsSearchBar
            .BySize(CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40)))
            .JobsRichViewByModel2(nil)
            .JobsBlock1(^(id  _Nullable data) {
                
            });
        [self.gk_navigationBar.addSubview(_searchView) mas_makeConstraints:^(MASConstraintMaker *make) {
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
//                            JobsLog(@"data = %@",data);
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

- (BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = BaseButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFCFBFB))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(5.75))
            .jobsResetBtnBgImage(JobsIMG(@"编辑"))
            .jobsResetBtnTitleCor(HEXCOLOR(0xB0B0B0))
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"编辑"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toast(JobsInternationalization(@"编辑"));
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.view.addSubview(_editBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.tableView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
        }];
    }return _editBtn;
}

- (NSMutableArray<__kindof UIViewModel *> *)titleMutArr {
    if (!_titleMutArr) {
        /// 最初默认的数据
        _titleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"收藏");
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"真人");
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"体育");
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"电子");
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"棋牌");
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data1) {
                data1.textModel.text = JobsInternationalization(@"彩票");
            }));
        });
    }return _titleMutArr;
}

- (NSMutableArray<__kindof UIViewModel *> *)leftDataArray {
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    }return _leftDataArray;
}

- (__kindof UIViewModel *)leftViewCurrentSelectModel {
    if (!_leftViewCurrentSelectModel) {
        _leftViewCurrentSelectModel = UIViewModel.new;
    }return _leftViewCurrentSelectModel;
}

- (NSMutableArray<__kindof UIView *> *)rightViewArray {
    if (!_rightViewArray) {
        _rightViewArray = NSMutableArray.array;
    }return _rightViewArray;
}

@end
