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
Prop_strong()BaseButton *userHeadBtn;
/// Data
Prop_strong()NSMutableArray <UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation ViewController_1

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = @"返回".tr;
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = @"相关功能列表".tr;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = @"导航栏左侧底图".img;
    }
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRedColor;
    if (@available(iOS 11.0, *)) {
        [UIColor colorNamed:@"TextColor0"];
    }
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
    self.objBlock = ^(id data) {
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
                NSIndexPath *indexPath = jobsMakeIndexPathZero();/// 取第一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionTop
                                              animated:YES];/// 滚动到第一行
            }
        }
    };
    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
    UIInterfaceOrientation s = self.getInterfaceOrientation;
    DeviceOrientation d = self.getDeviceOrientation;
    JobsLog(@"");
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
    JobsLog(@"");
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
    return JobsBaseTableViewCell.cellHeightByModel(self.dataMutArr[indexPath.row]) * 3;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.row].cls) {
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.row].cls.new,
                                           self.dataMutArr[indexPath.row]);
    }else self.jobsToastMsg(@"尚未接入此功能".tr);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    cell.JobsRichViewByModel2(self.dataMutArr[indexPath.row]);
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
            .initByNormalImage(@"首页_头像".img)
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"用户信息展示(开发测试专用)".tr)
                        .bySubTitle(@"")
                        .byRequestParams(self.readUserInfo);
                }));
                [self forceComingToPushVC:viewModel.cls.new
                            requestParams:viewModel];// 测试专用
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });_userHeadBtn.sizer = CGSizeMake(JobsWidth(32), JobsWidth(32));
    }return _userHeadBtn;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            tableView.backgroundColor = JobsWhiteColor;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.dataLink(self);
            tableView.tableHeaderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
                /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
            });
            tableView.tableFooterView = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                label.text = @"- 没有更多的内容了 -".tr;
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
                    data.stateIdleTitle = @"下拉可以刷新".tr;
                    data.pullingTitle = @"下拉可以刷新".tr;
                    data.refreshingTitle = @"松开立即刷新".tr;
                    data.willRefreshTitle = @"刷新数据中".tr;
                    data.noMoreDataTitle = @"下拉可以刷新".tr;
                    data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                    data.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        /// 下拉刷新
                        NSObject.feedbackGenerator(nil);//震动反馈
                        self.tableView.endRefreshing(YES);
                        return nil;
                    };
                }));
                tableView.mj_footer = self.view.MJRefreshFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = @"".tr;
                    data.pullingTitle = @"".tr;
                    data.refreshingTitle = @"".tr;
                    data.willRefreshTitle = @"".tr;
                    data.noMoreDataTitle = @"".tr;
                    data.loadBlock = ^id _Nullable(id _Nullable data){
                        @jobs_strongify(self)
                        self.tableView.endRefreshing(YES);
                        return nil;
                    };
                }));tableView.mj_footer.hidden = YES;
            }
            [self.view addSubview:tableView];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view);
                make.top.equalTo(self.navBar.mas_bottom);
                [self make:make topOffset:10];
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
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"苹果滑动开锁".tr;
                model.subTitle = @"苹果滑动开锁".tr;
                model.cls = SlideToUnlockDemoVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsNavigationDemoVC".tr;
                model.subTitle = @"系统导航栏".tr;
                model.cls = JobsNavigationDemoVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsScrollLabelVC".tr;
                model.subTitle = @"当文本超出的时候，滚动展现文字的Label".tr;
                model.cls = JobsScrollLabelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTimer".tr;
                model.subTitle = @"☀️时间模块".tr;
                model.cls = JobsTimerVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CalendarVC".tr;
                model.subTitle = @"日历功能".tr;
                model.cls = CalendarVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsVerticalMenuMainVC".tr;
                model.subTitle = @"竖形菜单选择功能".tr;
                model.cls = JobsVerticalMenuMainVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsViewNavigatorTestVC".tr;
                model.subTitle = @"让 UIView 像 UINavigationController 一样支持 push 和 pop".tr;
                model.cls = JobsViewNavigatorTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Excel".tr;
                model.subTitle = @"Excel".tr;
                model.cls = ExcelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JXCategoryViewVerticalShowVC".tr;
                model.subTitle = @"JXCategoryView垂直表达".tr;
                model.cls = JXCategoryViewVerticalShowVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"发帖（图文）功能".tr;
                model.subTitle = @"相册获取资源+存/取未完成字符串".tr;
                model.cls = JobsPostVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"将图片用字符串（加盐）进行存取".tr;
                model.subTitle = @"一种图片加密的手段，简单而粗暴.".tr;
                model.cls = PicToStrStoreVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"iOS 热更新".tr;
                model.subTitle = @"".tr;
                model.cls = HotRefreshVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"iOS 多语言切换".tr;
                model.subTitle = @"".tr;
                model.cls = AppLanguageVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"FMDB示例".tr;
                model.subTitle = @"增删查改".tr;
                model.cls = FMDB_VC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Realm示例".tr;
                model.subTitle = @"增删查改".tr;
                model.cls = Realm_VC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"幸运轮盘".tr;
                model.subTitle = @"中间有抽奖按钮".tr;
                model.cls = LotteryVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"文本前有小圆点".tr;
                model.subTitle = @"包括对齐".tr;
                model.cls = PointLabTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"iOS Widget".tr;
                model.subTitle = @"".tr;
                model.cls = WidgetVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"手机横屏".tr;
                model.subTitle = @"全局设定".tr;
                model.cls = LandscapeSwitchVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Texture".tr;
                model.subTitle = @"byFaceBook".tr;
                model.cls = TextureDemoVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"本地推送通知".tr;
                model.subTitle = @"本地推送通知".tr;
                model.cls = LocalNotificationsVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"字符串解压缩".tr;
                model.subTitle = @"字符串解压缩".tr;
                model.cls = CompressStrVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"动态切换App图标".tr;
                model.subTitle = @"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本".tr;
                model.cls = AppIconSwitchingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"长按Cell出3D-Touch的菜单".tr;
                model.subTitle = @"PeekAndPop".tr;
                model.cls = PeekAndPopVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"系统剪切板测试".tr;
                model.subTitle = @"尝试控制粘贴提示".tr;
                model.cls = CtrlClipboardCueVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsAppDoor-1".tr;
                model.subTitle = @"登录注册的第一种表现形式".tr;
                model.cls = JobsAppDoorVC.class;
                model.requestParams = @(JobsAppDoorBgType_Video);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsAppDoor-2".tr;
                model.subTitle = @"登录注册的第二种表现形式".tr;
                model.cls = JobsAppDoorVC_Style2.class;
                model.requestParams = @(JobsAppDoorBgType_Video);
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Douyin_ZFPlayer_1".tr;
                model.subTitle = @"播放效果 1".tr;
                model.cls = Douyin_ZFPlayerVC_1.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Douyin_ZFPlayer_2".tr;
                model.subTitle = @"播放效果 2".tr;
                model.cls = Douyin_ZFPlayerVC_2.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"TransparentRegion".tr;
                model.subTitle = @"镂空特效".tr;
                model.cls = TransparentRegionVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsComment".tr;
                model.subTitle = @"📃评论功能".tr;
                model.cls = JobsCommentVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsSearch".tr;
                model.subTitle = @"🔍搜索功能".tr;
                model.cls = JobsSearchVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"ShadowTBVCell".tr;
                model.subTitle = @"";
                // model.cls = nil;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"相册选取图片和视频".tr;
                model.subTitle = @"".tr;
                model.cls = JobsShootingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"DynamicView".tr;
                model.subTitle = @"Gif图片读取".tr;
                model.cls = DynamicViewTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Progress".tr;
                model.subTitle = @"进度条".tr;
                model.cls = JobsProgressVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"IrregularView".tr;
                model.subTitle = @"不规则的按钮".tr;
                model.cls = TestIrregularViewTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTimerTestVC".tr;
                model.subTitle = @"🌛JobsTimer模块测试".tr;
                model.cls = NSTimerManagerTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsIMShowVC".tr;
                model.subTitle = @"IM模块".tr;
                model.cls = JobsIMShowVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"TestLabelVC".tr;
                model.subTitle = @"Label的科学管理".tr;
                model.cls = TestLabelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsDropDownListVC".tr;
                model.subTitle = @"👇🏻下拉列表".tr;
                model.cls = JobsDropDownListVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"YTKNetworkStudyVC".tr;
                model.subTitle = @"探究猿题库网络框架（YTKNetwork）".tr;
                model.cls = YTKNetworkStudyVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CoreTextLearningVC".tr;
                model.subTitle = @"探究CoreText".tr;
                model.cls = CoreTextLearningVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JXCategoryPopupVC".tr;
                model.subTitle = @"JXCategoryView+PopupView".tr;
                model.cls = JXCategoryPopupVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UITableViewCellEditorVC".tr;
                model.subTitle = @"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑".tr;
                model.cls = UITableViewCellEditorVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsSettingGestureVC".tr;
                model.subTitle = @"设置手势密码".tr;
                model.cls = JobsSettingGestureVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTestVC".tr;
                model.subTitle = @"进行测试的一个控制器".tr;
                model.cls = JobsTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CXBVC".tr;
                model.subTitle = @"CXB自研科技".tr;
                model.cls = CXBVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"OCDynamicRegisterVC".tr;
                model.subTitle = @"OC动态添加类、方法列表、属性列表".tr;
                model.cls = OCDynamicRegisterVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JXCategoryViewWithHeaderViewVC".tr;
                model.subTitle = @"JXCategoryView下拉放大头部视图".tr;
                model.cls = JXCategoryViewWithHeaderViewVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UILabelWordRotatingVC".tr;
                model.subTitle = @"UILabel文字旋转".tr;
                model.cls = UILabelWordRotatingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"TestBaseLabelVC".tr;
                model.subTitle = @"测试 -BaseLabel-".tr;
                model.cls = TestBaseLabelVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"RandomTestVC".tr;
                model.subTitle = @"随机数测试模块".tr;
                model.cls = RandomTestVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CustomTableViewCellVC".tr;
                model.subTitle = @"自定义UITableViewCell内置控件距离并添加复制按钮".tr;
                model.cls = CustomTableViewCellVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CustomBtnVC".tr;
                model.subTitle = @"自定义UIButton子控件的排布".tr;
                model.cls = CustomBtnVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"GXCardViewDemoVC".tr;
                model.subTitle = @"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果".tr;
                model.cls = GXCardViewDemoVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsWalletVC".tr;
                model.subTitle = @"UICollectionView实现重叠的卡包效果".tr;
                model.cls = JobsWalletVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsScrollViewVC".tr;
                model.subTitle = @"在指定的y区间内滑动视图(带吸边效果)".tr;
                model.cls = JobsScrollViewVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"转场动画探究".tr;
                model.subTitle = @"UIPresentationController的使用".tr;
                model.cls = JobsPresentingVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Masonry的应用与实践".tr;
                model.subTitle = @"UIPresentationController的使用".tr;
                model.cls = MasonryVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UITBVCellFoldVC";
                model.subTitle = @"UITableViewCell的折叠效果".tr;
                model.cls = UITBVCellFoldVC.class;
            })));
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"ProtocolKitVC";
                model.subTitle = @"Objective-C中实现协议扩展".tr;
                model.cls = ProtocolKitVC.class;
            })));
        });
    }return _dataMutArr;
}


@end
