//
//  ViewController@1.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "ViewController@1.h"

BOOL ISLogin;
@interface ViewController_1 ()
/// UI
@property(nonatomic,strong)BaseButton *userHeadBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation ViewController_1

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        NSLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = JobsInternationalization(@"相关功能列表");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRedColor;
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.userHeadBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.deleteBtn));
    });
    self.makeNavByAlpha(1);
    self.navBar.backBtn.jobsVisible = NO;
    self.navBar.titleLab.text = self.viewModel.textModel.text;
    
    self.tableView.reloadDatas();
    self.suspendBtn.alpha = 1;
    self.objectBlock = ^(id data) {
        @jobs_strongify(self)
        if ([data isKindOfClass:JobsSuspendBtn.class]) {
            JobsSuspendBtn *suspendBtn = (JobsSuspendBtn *)data;
            if (suspendBtn.selected) {
                NSInteger s = self.tableView.numberOfSections;/// 有多少组
                if (s < 1) return;
                NSInteger r = [self.tableView numberOfRowsInSection:s - 1];/// 最后一组有多少行
                if (r < 1) return;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r - 1 inSection:s - 1];/// 取最后一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionBottom
                                              animated:YES];/// 滚动到最后一行
            }else{
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];/// 取第一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionTop
                                              animated:YES];/// 滚动到第一行
            }
        }
    };
    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
    UIInterfaceOrientation s = self.getInterfaceOrientation;
    DeviceOrientation d = self.getDeviceOrientation;
    NSLog(@"");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_dataMutArr.count) {
        [self.dataMutArr removeAllObjects];
        _dataMutArr = nil;
    }
    [self.tableView.mj_header beginRefreshing];
    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
    UIInterfaceOrientation s = self.getInterfaceOrientation;
    DeviceOrientation d = self.getDeviceOrientation;
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
    UIInterfaceOrientation s = self.getInterfaceOrientation;
    DeviceOrientation d = self.getDeviceOrientation;
//    self.menuView.alpha = JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellHeightByModel(self.dataMutArr[indexPath.row]) * 2;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.row].cls) {
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.row].cls.new,
                                           self.dataMutArr[indexPath.row]);
    }else self.jobsToastMsg(JobsInternationalization(@"尚未接入此功能"));
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
-(BaseButton *)userHeadBtn{
    if (!_userHeadBtn) {
        @jobs_weakify(self)
        _userHeadBtn = BaseButton
            .initByNormalImage(JobsIMG(@"首页_头像"))
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.title = JobsInternationalization(@"用户信息展示(开发测试专用)");
                    model.subTitle = @"";
                    model.requestParams = self.readUserInfo;
                }));
                [self forceComingToPushVC:viewModel.cls.new
                            requestParams:viewModel];// 测试专用
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });_userHeadBtn.sizer = CGSizeMake(JobsWidth(32), JobsWidth(32));
    }return _userHeadBtn;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakePlainTableView(^(__kindof UITableView * _Nullable tableView) {
            tableView.backgroundColor = JobsWhiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.dataLink(self);
            tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.tableFooterView = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                label.text = JobsInternationalization(@"- 没有更多的内容了 -");
                label.font = UIFontWeightRegularSize(12);
                label.textAlignment = NSTextAlignmentCenter;
                label.textColor = HEXCOLOR(0xB0B0B0);
        //        _tableFooterView.size = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(48));
                label.makeLabelByShowingType(UILabelShowingType_03);
            });/// 这里接入的就是一个UIView的派生类
            tableView.separatorColor = HEXCOLOR(0xEEEEEE);
            tableView.contentInset = UIEdgeInsetsMake(JobsWidth(0),
                                                      JobsWidth(0),
                                                      JobsWidth(100),
                                                      JobsWidth(0));
            {
                tableView.mj_header = self.view.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
                    data.pullingTitle = JobsInternationalization(@"下拉可以刷新");
                    data.refreshingTitle = JobsInternationalization(@"松开立即刷新");
                    data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                    data.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
                    data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                    data.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        /// 下拉刷新
                        self.feedbackGenerator();//震动反馈
                        self.tableView.endRefreshing(YES);
                        return nil;
                    };
                }));
                tableView.mj_footer = self.view.MJRefreshFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = JobsInternationalization(@"");
                    data.pullingTitle = JobsInternationalization(@"");
                    data.refreshingTitle = JobsInternationalization(@"");
                    data.willRefreshTitle = JobsInternationalization(@"");
                    data.noMoreDataTitle = JobsInternationalization(@"");
                    data.loadBlock = ^id _Nullable(id _Nullable data){
                        @jobs_strongify(self)
                        self.tableView.endRefreshing(YES);
                        return nil;
                    };
                }));tableView.mj_footer.hidden = YES;
            }
            [self.view addSubview:tableView];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                    make.top.equalTo(self.navBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                }else{
                    if (self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 系统、GK均隐藏
                        make.edges.equalTo(self.view);
                    }else{
                        if (!self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 用系统的导航栏
                            make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil));
                        }
                        if (self.setupNavigationBarHidden && !self.gk_statusBarHidden) {// 用GK的导航栏
                            make.top.equalTo(self.gk_navigationBar.mas_bottom);
                        }make.left.right.bottom.equalTo(self.view);
                    }
                }
            }];
        });
    }return _tableView;
}

-(NSMutableArray<UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(NSMutableArray <UITableViewCell *>*_Nullable data) {
            @jobs_strongify(self)
            [self.dataMutArr enumerateObjectsUsingBlock:^(UIViewModel * _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }];
        });
    }return _tbvCellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsScrollLabelVC");
                model.subTitle = JobsInternationalization(@"当文本超出的时候，滚动展现文字的Label");
                model.cls = JobsScrollLabelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"CalendarVC");
                model.subTitle = JobsInternationalization(@"日历功能");
                model.cls = CalendarVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsVerticalMenuMainVC");
                model.subTitle = JobsInternationalization(@"竖形菜单选择功能");
                model.cls = JobsVerticalMenuMainVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsViewNavigatorTestVC");
                model.subTitle = JobsInternationalization(@"让 UIView 像 UINavigationController 一样支持 push 和 pop");
                model.cls = JobsViewNavigatorTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"Excel");
                model.subTitle = JobsInternationalization(@"Excel");
                model.cls = ExcelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JXCategoryViewVerticalShowVC");
                model.subTitle = JobsInternationalization(@"JXCategoryView垂直表达");
                model.cls = JXCategoryViewVerticalShowVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"发帖（图文）功能");
                model.subTitle = JobsInternationalization(@"相册获取资源+存/取未完成字符串");
                model.cls = JobsPostVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"将图片用字符串（加盐）进行存取");
                model.subTitle = JobsInternationalization(@"一种图片加密的手段，简单而粗暴.");
                model.cls = PicToStrStoreVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"iOS 热更新");
                model.subTitle = JobsInternationalization(@"");
                model.cls = HotRefreshVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"iOS 多语言切换");
                model.subTitle = JobsInternationalization(@"");
                model.cls = AppLanguageVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"FMDB示例");
                model.subTitle = JobsInternationalization(@"增删查改");
                model.cls = FMDB_VC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"Realm示例");
                model.subTitle = JobsInternationalization(@"增删查改");
                model.cls = Realm_VC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"幸运轮盘");
                model.subTitle = JobsInternationalization(@"中间有抽奖按钮");
                model.cls = LotteryVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"文本前有小圆点");
                model.subTitle = JobsInternationalization(@"包括对齐");
                model.cls = PointLabTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"iOS Widget");
                model.subTitle = JobsInternationalization(@"");
                model.cls = WidgetVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"手机横屏");
                model.subTitle = JobsInternationalization(@"全局设定");
                model.cls = LandscapeSwitchVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"本地推送通知");
                model.subTitle = JobsInternationalization(@"本地推送通知");
                model.cls = LocalNotificationsVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"字符串解压缩");
                model.subTitle = JobsInternationalization(@"字符串解压缩");
                model.cls = CompressStrVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"动态切换App图标");
                model.subTitle = JobsInternationalization(@"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本");
                model.cls = AppIconSwitchingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"长按Cell出3D-Touch的菜单");
                model.subTitle = JobsInternationalization(@"PeekAndPop");
                model.cls = PeekAndPopVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"系统剪切板测试");
                model.subTitle = JobsInternationalization(@"尝试控制粘贴提示");
                model.cls = CtrlClipboardCueVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsAppDoor-1");
                model.subTitle = JobsInternationalization(@"登录注册的第一种表现形式");
                model.cls = JobsAppDoorVC.class;
                model.requestParams = @(JobsAppDoorBgType_video);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsAppDoor-2");
                model.subTitle = JobsInternationalization(@"登录注册的第二种表现形式");
                model.cls = JobsAppDoorVC_Style2.class;
                model.requestParams = @(JobsAppDoorBgType_video);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"Douyin_ZFPlayer_1");
                model.subTitle = JobsInternationalization(@"播放效果 1");
                model.cls = Douyin_ZFPlayerVC_1.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"Douyin_ZFPlayer_2");
                model.subTitle = JobsInternationalization(@"播放效果 2");
                model.cls = Douyin_ZFPlayerVC_2.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"TransparentRegion");
                model.subTitle = JobsInternationalization(@"镂空特效");
                model.cls = TransparentRegionVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsComment");
                model.subTitle = JobsInternationalization(@"📃评论功能");
                model.cls = JobsCommentVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsSearch");
                model.subTitle = JobsInternationalization(@"🔍搜索功能");
                model.cls = JobsSearchVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"ShadowTBVCell");
                model.subTitle = @"";
                // model.cls = nil;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"相册选取图片和视频");
                model.subTitle = JobsInternationalization(@"");
                model.cls = JobsShootingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"DynamicView");
                model.subTitle = JobsInternationalization(@"Gif图片读取");
                model.cls = DynamicViewTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"Progress");
                model.subTitle = JobsInternationalization(@"进度条");
                model.cls = JobsProgressVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"IrregularView");
                model.subTitle = JobsInternationalization(@"不规则的按钮");
                model.cls = TestIrregularViewTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsTimer");
                model.subTitle = JobsInternationalization(@"☀️时间模块");
                model.cls = JobsTimerVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"NSTimerManagerTestVC");
                model.subTitle = JobsInternationalization(@"🌛NSTimerManager模块测试");
                model.cls = NSTimerManagerTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsIMShowVC");
                model.subTitle = JobsInternationalization(@"IM模块");
                model.cls = JobsIMShowVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"TestLabelVC");
                model.subTitle = JobsInternationalization(@"Label的科学管理");
                model.cls = TestLabelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsDropDownListVC");
                model.subTitle = JobsInternationalization(@"👇🏻下拉列表");
                model.cls = JobsDropDownListVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"YTKNetworkStudyVC");
                model.subTitle = JobsInternationalization(@"探究猿题库网络框架（YTKNetwork）");
                model.cls = YTKNetworkStudyVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"CoreTextLearningVC");
                model.subTitle = JobsInternationalization(@"探究CoreText");
                model.cls = CoreTextLearningVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JXCategoryPopupVC");
                model.subTitle = JobsInternationalization(@"JXCategoryView+PopupView");
                model.cls = JXCategoryPopupVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"UITableViewCellEditorVC");
                model.subTitle = JobsInternationalization(@"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑");
                model.cls = UITableViewCellEditorVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsSettingGestureVC");
                model.subTitle = JobsInternationalization(@"设置手势密码");
                model.cls = JobsSettingGestureVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsTestVC");
                model.subTitle = JobsInternationalization(@"进行测试的一个控制器");
                model.cls = JobsTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"CXBVC");
                model.subTitle = JobsInternationalization(@"CXB自研科技");
                model.cls = CXBVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"OCDynamicRegisterVC");
                model.subTitle = JobsInternationalization(@"OC动态添加类、方法列表、属性列表");
                model.cls = OCDynamicRegisterVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JXCategoryViewWithHeaderViewVC");
                model.subTitle = JobsInternationalization(@"JXCategoryView下拉放大头部视图");
                model.cls = JXCategoryViewWithHeaderViewVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"UILabelWordRotatingVC");
                model.subTitle = JobsInternationalization(@"UILabel文字旋转");
                model.cls = UILabelWordRotatingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"TestBaseLabelVC");
                model.subTitle = JobsInternationalization(@"测试 -BaseLabel-");
                model.cls = TestBaseLabelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"RandomTestVC");
                model.subTitle = JobsInternationalization(@"随机数测试模块");
                model.cls = RandomTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"CustomTableViewCellVC");
                model.subTitle = JobsInternationalization(@"自定义UITableViewCell内置控件距离并添加复制按钮");
                model.cls = CustomTableViewCellVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"CustomBtnVC");
                model.subTitle = JobsInternationalization(@"自定义UIButton子控件的排布");
                model.cls = CustomBtnVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"GXCardViewDemoVC");
                model.subTitle = JobsInternationalization(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果");
                model.cls = GXCardViewDemoVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsWalletVC");
                model.subTitle = JobsInternationalization(@"UICollectionView实现重叠的卡包效果");
                model.cls = JobsWalletVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"JobsScrollViewVC");
                model.subTitle = JobsInternationalization(@"在指定的y区间内滑动视图(带吸边效果)");
                model.cls = JobsScrollViewVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"转场动画探究");
                model.subTitle = JobsInternationalization(@"UIPresentationController的使用");
                model.cls = JobsPresentingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = JobsInternationalization(@"Masonry的应用与实践");
                model.subTitle = JobsInternationalization(@"UIPresentationController的使用");
                model.cls = MasonryVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UITBVCellFoldVC";
                model.subTitle = JobsInternationalization(@"UITableViewCell的折叠效果");
                model.cls = UITBVCellFoldVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"ProtocolKitVC";
                model.subTitle = JobsInternationalization(@"Objective-C中实现协议扩展");
                model.cls = ProtocolKitVC.class;
            })));
        });
    }return _dataMutArr;
}

@end
