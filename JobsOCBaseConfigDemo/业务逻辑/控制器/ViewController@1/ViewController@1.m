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
//@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *tableFooterView;
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
        data.add(JobsBarButtonItem(self.userHeadBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
//        data.add(JobsBarButtonItem(self.deleteBtn));
    });
    self.makeNavByAlpha(1);
    
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
    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
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
    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
    UIInterfaceOrientation s = self.getInterfaceOrientation;
    DeviceOrientation d = self.getDeviceOrientation;
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
    UIInterfaceOrientation s = self.getInterfaceOrientation;
    DeviceOrientation d = self.getDeviceOrientation;
//    self.menuView.alpha = JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
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
        _userHeadBtn = BaseButton
            .initByNormalImage(JobsIMG(@"首页_头像"))
            .bgColor(JobsClearColor.colorWithAlphaComponent(0))
            .onClick(^(UIButton *x){
                if (self.objectBlock) self.objectBlock(x);
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:@"用户信息展示(开发测试专用)" attributeSubTitle:nil];
                viewModel.cls = JobsShowObjInfoVC.class;
                viewModel.requestParams = self.readUserInfo();
                [self forceComingToPushVC:viewModel.cls.new
                            requestParams:viewModel];// 测试专用
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        _userHeadBtn.Size = CGSizeMake(JobsWidth(32), JobsWidth(32));
    }return _userHeadBtn;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.new;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataLink(self);
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = self.tableFooterView;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        _tableView.contentInset = UIEdgeInsetsMake(JobsWidth(0),
                                                   JobsWidth(0),
                                                   JobsWidth(100),
                                                   JobsWidth(0));
        {
            _tableView.mj_header = self.view.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
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
            _tableView.mj_footer = self.view.MJRefreshFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
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
            }));
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                                                titleStr:JobsInternationalization(@"暂无数据")
                                                               detailStr:JobsInternationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = -JobsWidth(180);
            _tableView.ly_emptyView.titleLabFont = UIFontSystemFontOfSize(JobsWidth(16));
        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 系统、GK均隐藏
                make.edges.equalTo(self.view);
            }else{
                if (!self.setupNavigationBarHidden && self.gk_statusBarHidden) {// 用系统的导航栏
                    make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil));
                }
                
                if (self.setupNavigationBarHidden && !self.gk_statusBarHidden) {// 用GK的导航栏
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }
                
                make.left.right.bottom.equalTo(self.view);
            }
        }];
    }return _tableView;
}

-(UILabel *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = UILabel.new;
        _tableFooterView.text = JobsInternationalization(@"- 没有更多的内容了 -");
        _tableFooterView.font = UIFontWeightRegularSize(12);
        _tableFooterView.textAlignment = NSTextAlignmentCenter;
        _tableFooterView.textColor = HEXCOLOR(0xB0B0B0);
//        _tableFooterView.size = CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(48));
        _tableFooterView.makeLabelByShowingType(UILabelShowingType_03);
    }return _tableFooterView;
}

-(NSMutableArray<UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        _tbvCellMutArr = jobsMakeMutArr(^(NSMutableArray <UITableViewCell *>*_Nullable data) {
            @jobs_weakify(self)
            for (UIViewModel *viewModel in self.dataMutArr) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }
        });
    }return _tbvCellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsVerticalMenuMainVC")
                                                               attributeSubTitle:JobsInternationalization(@"竖形菜单选择功能")];
                viewModel.cls = JobsVerticalMenuMainVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsViewNavigatorTestVC")
                                                               attributeSubTitle:JobsInternationalization(@"让 UIView 像 UINavigationController 一样支持 push 和 pop")];

                viewModel.cls = JobsViewNavigatorTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Excel")
                                                               attributeSubTitle:JobsInternationalization(@"Excel")];

                viewModel.cls = ExcelVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JXCategoryViewVerticalShowVC")
                                                               attributeSubTitle:JobsInternationalization(@"JXCategoryView垂直表达")];
                viewModel.cls = JXCategoryViewVerticalShowVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"发帖（图文）功能")
                                                               attributeSubTitle:JobsInternationalization(@"相册获取资源+存/取未完成字符串")];
                viewModel.cls = JobsPostVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"将图片用字符串（加盐）进行存取")
                                                               attributeSubTitle:JobsInternationalization(@"一种图片加密的手段，简单而粗暴.")];
                
                viewModel.cls = PicToStrStoreVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"iOS 热更新")
                                                               attributeSubTitle:JobsInternationalization(@"")];
                
                viewModel.cls = HotRefreshVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"iOS 多语言切换")
                                                               attributeSubTitle:JobsInternationalization(@"")];
                
                viewModel.cls = AppLanguageVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"FMDB示例")
                                                               attributeSubTitle:JobsInternationalization(@"增删查改")];
                
                viewModel.cls = FMDB_VC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Realm示例")
                                                               attributeSubTitle:JobsInternationalization(@"增删查改")];
                
                viewModel.cls = Realm_VC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"幸运轮盘")
                                                               attributeSubTitle:JobsInternationalization(@"中间有抽奖按钮")];
                
                viewModel.cls = LotteryVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"文本前有小圆点")
                                                               attributeSubTitle:JobsInternationalization(@"包括对齐")];
                
                viewModel.cls = PointLabTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"iOS Widget")
                                                               attributeSubTitle:JobsInternationalization(@"")];
                
                viewModel.cls = WidgetVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"手机横屏")
                                                               attributeSubTitle:JobsInternationalization(@"全局设定")];
                
                viewModel.cls = LandscapeSwitchVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"本地推送通知")
                                                               attributeSubTitle:JobsInternationalization(@"本地推送通知")];
                
                viewModel.cls = LocalNotificationsVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"字符串解压缩")
                                                               attributeSubTitle:JobsInternationalization(@"字符串解压缩")];
                
                viewModel.cls = CompressStrVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"动态切换App图标")
                                                               attributeSubTitle:JobsInternationalization(@"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本")];

                viewModel.cls = AppIconSwitchingVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"长按Cell出3D-Touch的菜单")
                                                               attributeSubTitle:JobsInternationalization(@"PeekAndPop")];

                viewModel.cls = PeekAndPopVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"系统剪切板测试")
                                                               attributeSubTitle:JobsInternationalization(@"尝试控制粘贴提示")];
                
                viewModel.cls = CtrlClipboardCueVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsAppDoor-1")
                                                               attributeSubTitle:JobsInternationalization(@"登录注册的第一种表现形式")];
                viewModel.cls = JobsAppDoorVC.class;
                viewModel.requestParams = @(JobsAppDoorBgType_video);
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsAppDoor-2")
                                                               attributeSubTitle:JobsInternationalization(@"登录注册的第二种表现形式")];
                viewModel.cls = JobsAppDoorVC_Style2.class;
                viewModel.requestParams = @(JobsAppDoorBgType_video);
                data.add(viewModel);
            }

            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Douyin_ZFPlayer_1")
                                                               attributeSubTitle:JobsInternationalization(@"播放效果 1")];
                viewModel.cls = Douyin_ZFPlayerVC_1.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Douyin_ZFPlayer_2")
                                                               attributeSubTitle:JobsInternationalization(@"播放效果 2")];
                viewModel.cls = Douyin_ZFPlayerVC_2.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"TransparentRegion")
                                                               attributeSubTitle:JobsInternationalization(@"镂空特效")];
                viewModel.cls = TransparentRegionVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsComment")
                                                               attributeSubTitle:JobsInternationalization(@"📃评论功能")];
                viewModel.cls = JobsCommentVC.class;
                data.add(viewModel);
            }
        
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsSearch")
                                                               attributeSubTitle:JobsInternationalization(@"🔍搜索功能")];
                viewModel.cls = JobsSearchVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"ShadowTBVCell")
                                                               attributeSubTitle:nil];
    //            viewModel.cls =
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"相册选取图片和视频")
                                                               attributeSubTitle:JobsInternationalization(@"")];
                viewModel.cls = JobsShootingVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"DynamicView")
                                                               attributeSubTitle:JobsInternationalization(@"Gif图片读取")];
                viewModel.cls = DynamicViewTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Progress")
                                                               attributeSubTitle:JobsInternationalization(@"进度条")];
                viewModel.cls = JobsProgressVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"IrregularView")
                                                               attributeSubTitle:JobsInternationalization(@"不规则的按钮")];
                viewModel.cls = TestIrregularViewTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsTimer")
                                                               attributeSubTitle:JobsInternationalization(@"☀️时间模块")];
                viewModel.cls = JobsTimerVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"NSTimerManagerTestVC")
                                                               attributeSubTitle:JobsInternationalization(@"🌛NSTimerManager模块测试")];
                viewModel.cls = NSTimerManagerTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsIMShowVC")
                                                               attributeSubTitle:JobsInternationalization(@"IM模块")];
                viewModel.cls = JobsIMShowVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"TestLabelVC")
                                                               attributeSubTitle:JobsInternationalization(@"Label的科学管理")];
                viewModel.cls = TestLabelVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsDropDownListVC")
                                                               attributeSubTitle:JobsInternationalization(@"👇🏻下拉列表")];
                viewModel.cls = JobsDropDownListVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"YTKNetworkStudyVC")
                                                               attributeSubTitle:JobsInternationalization(@"探究猿题库网络框架（YTKNetwork）")];
                viewModel.cls = YTKNetworkStudyVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CoreTextLearningVC")
                                                               attributeSubTitle:JobsInternationalization(@"探究CoreText")];
                viewModel.cls = CoreTextLearningVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JXCategoryPopupVC")
                                                               attributeSubTitle:JobsInternationalization(@"JXCategoryView+PopupView")];
                viewModel.cls = JXCategoryPopupVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"UITableViewCellEditorVC")
                                                               attributeSubTitle:JobsInternationalization(@"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑")];
                viewModel.cls = UITableViewCellEditorVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsSettingGestureVC")
                                                               attributeSubTitle:JobsInternationalization(@"设置手势密码")];
                viewModel.cls = JobsSettingGestureVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsTestVC")
                                                               attributeSubTitle:JobsInternationalization(@"进行测试的一个控制器")];
                viewModel.cls = JobsTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CXBVC")
                                                               attributeSubTitle:JobsInternationalization(@"CXB自研科技")];
                viewModel.cls = CXBVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"OCDynamicRegisterVC")
                                                               attributeSubTitle:JobsInternationalization(@"OC动态添加类、方法列表、属性列表")];
                viewModel.cls = OCDynamicRegisterVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JXCategoryViewWithHeaderViewVC")
                                                               attributeSubTitle:JobsInternationalization(@"JXCategoryView下拉放大头部视图")];
                viewModel.cls = JXCategoryViewWithHeaderViewVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"UILabelWordRotatingVC")
                                                               attributeSubTitle:JobsInternationalization(@"UILabel文字旋转")];
                viewModel.cls = UILabelWordRotatingVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"TestBaseLabelVC")
                                                               attributeSubTitle:JobsInternationalization(@"测试 -BaseLabel-")];
                viewModel.cls = TestBaseLabelVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"RandomTestVC")
                                                               attributeSubTitle:JobsInternationalization(@"随机数测试模块")];
                viewModel.cls = RandomTestVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CustomTableViewCellVC")
                                                               attributeSubTitle:JobsInternationalization(@"自定义UITableViewCell内置控件距离并添加复制按钮")];
                viewModel.cls = CustomTableViewCellVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CustomBtnVC")
                                                               attributeSubTitle:JobsInternationalization(@"自定义UIButton子控件的排布")];
                viewModel.cls = CustomBtnVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"GXCardViewDemoVC")
                                                               attributeSubTitle:JobsInternationalization(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果")];
                viewModel.cls = GXCardViewDemoVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsWalletVC")
                                                               attributeSubTitle:JobsInternationalization(@"UICollectionView实现重叠的卡包效果")];
                viewModel.cls = JobsWalletVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsScrollViewVC")
                                                               attributeSubTitle:JobsInternationalization(@"在指定的y区间内滑动视图(带吸边效果)")];
                viewModel.cls = JobsScrollViewVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"转场动画探究")
                                                               attributeSubTitle:JobsInternationalization(@"UIPresentationController的使用")];
                viewModel.cls = JobsPresentingVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Masonry的应用与实践")
                                                               attributeSubTitle:JobsInternationalization(@"UIPresentationController的使用")];
                viewModel.cls = MasonryVC.class;
                data.add(viewModel);
            }
            
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:@"UITBVCellFoldVC"
                                                               attributeSubTitle:JobsInternationalization(@"UITableViewCell的折叠效果")];
                viewModel.cls = UITBVCellFoldVC.class;
                data.add(viewModel);
            }
            
            {
                UIViewModel *viewModel = [self configViewModelWithAttributeTitle:@"ProtocolKitVC"
                                                               attributeSubTitle:JobsInternationalization(@"Objective-C中实现协议扩展")];
                viewModel.cls = ProtocolKitVC.class;
                data.add(viewModel);
            }
        });
    }return _dataMutArr;
}

@end
