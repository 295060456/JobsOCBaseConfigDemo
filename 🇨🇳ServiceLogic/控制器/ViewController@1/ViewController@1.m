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
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UILabel *tableFooterView;
@property(nonatomic,strong)UIButton *userHeadBtn;
/// Data
@property(nonatomic,strong)NSMutableArray <UITableViewCell *>*tbvCellMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation ViewController_1

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
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
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    }
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    NSDictionary *dic = @"UserData".readLocalFileWithName;
    JobsUserModel *userModel = [JobsUserModel mj_objectWithKeyValues:dic];
    [self saveUserInfo:userModel];// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navLeftBarButtonItem = [UIBarButtonItem.alloc initWithCustomView:self.userHeadBtn];
    self.tableView.alpha = 1;
    self.suspendBtn.alpha = 1;
    @jobs_weakify(self)
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
    NSLog(@"");
//    self.menuView.alpha = JobsAppTool.currentInterfaceOrientationMask == UIInterfaceOrientationMaskLandscape;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— 一些私有方法
#pragma mark —— BaseViewProtocol
/// 下拉刷新 （子类要进行覆写）
-(void)pullToRefresh{
    [self feedbackGenerator];//震动反馈
    [self endRefreshing:self.tableView];
}
/// 上拉加载更多 （子类要进行覆写）
-(void)loadMoreRefresh{
    [self pullToRefresh];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JobsBaseTableViewCell cellHeightWithModel:self.dataMutArr[indexPath.row]] * 2;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.row].cls) {
        [self comingToPushVC:self.dataMutArr[indexPath.row].cls.new
               requestParams:self.dataMutArr[indexPath.row]];
    }else{
        [WHToast jobsToastMsg:JobsInternationalization(@"尚未接入此功能")];
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    [cell richElementsInCellWithModel:self.dataMutArr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
-(UIButton *)userHeadBtn{
    if (!_userHeadBtn) {
        _userHeadBtn = UIButton.new;
        _userHeadBtn.normalImage = JobsIMG(@"首页_头像");
        _userHeadBtn.normalTitle = JobsInternationalization(@"");
        @jobs_weakify(self)
        [_userHeadBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:@"用户信息展示(开发测试专用)" attributeSubTitle:nil];
            viewModel.cls = JobsShowObjInfoVC.class;
            viewModel.requestParams = self.readUserInfo;
            [self forceComingToPushVC:viewModel.cls.new
                        requestParams:viewModel];// 测试专用
            return nil;
        }];
        _userHeadBtn.size = CGSizeMake(JobsWidth(32), JobsWidth(32));
        [_userHeadBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                         imagePadding:JobsWidth(1)];
    }return _userHeadBtn;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.showsVerticalScrollIndicator = NO;
        [self dataLinkByTableView:_tableView];
        _tableView.tableHeaderView = UIView.new;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = self.tableFooterView;/// 这里接入的就是一个UIView的派生类
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        _tableView.contentInset = UIEdgeInsetsMake(JobsWidth(0),
                                                   JobsWidth(0),
                                                   JobsWidth(100),
                                                   JobsWidth(0));
        {
            MJRefreshConfigModel *refreshConfigHeader = MJRefreshConfigModel.new;
            refreshConfigHeader.stateIdleTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.pullingTitle = JobsInternationalization(@"下拉可以刷新");
            refreshConfigHeader.refreshingTitle = JobsInternationalization(@"松开立即刷新");
            refreshConfigHeader.willRefreshTitle = JobsInternationalization(@"刷新数据中");
            refreshConfigHeader.noMoreDataTitle = JobsInternationalization(@"下拉可以刷新");
            
            MJRefreshConfigModel *refreshConfigFooter = MJRefreshConfigModel.new;
            refreshConfigFooter.stateIdleTitle = JobsInternationalization(@"");
            refreshConfigFooter.pullingTitle = JobsInternationalization(@"");
            refreshConfigFooter.refreshingTitle = JobsInternationalization(@"");
            refreshConfigFooter.willRefreshTitle = JobsInternationalization(@"");
            refreshConfigFooter.noMoreDataTitle = JobsInternationalization(@"");
            
            self.refreshConfigHeader = refreshConfigHeader;
            self.refreshConfigFooter = refreshConfigFooter;
            
            _tableView.mj_header = self.mjRefreshNormalHeader;
            _tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
        }
        
        {
            _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:JobsInternationalization(@"暂无数据")
                                                                titleStr:JobsInternationalization(@"暂无数据")
                                                               detailStr:JobsInternationalization(@"")];
            
            _tableView.ly_emptyView.titleLabTextColor = JobsLightGrayColor;
            _tableView.ly_emptyView.contentViewOffset = -JobsWidth(180);
            _tableView.ly_emptyView.titleLabFont = [UIFont systemFontOfSize:JobsWidth(16) weight:UIFontWeightMedium];
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
        [_tableFooterView makeLabelByShowingType:UILabelShowingType_03];
    }return _tableFooterView;
}

-(NSMutableArray<UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        _tbvCellMutArr = NSMutableArray.array;
        for (UIViewModel *viewModel in self.dataMutArr) {
            [_tbvCellMutArr addObject:[JobsBaseTableViewCell cellStyleValue1WithTableView:self.tableView]];
        }
    }return _tbvCellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"将图片用字符串（加盐）进行存取")
                                                           attributeSubTitle:JobsInternationalization(@"一种图片加密的手段，简单而粗暴.")];
            
            viewModel.cls = PicToStrStoreVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"iOS 热更新")
                                                           attributeSubTitle:JobsInternationalization(@"")];
            
            viewModel.cls = HotRefreshVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"iOS 多语言切换")
                                                           attributeSubTitle:JobsInternationalization(@"")];
            
            viewModel.cls = AppLanguageVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"FMDB示例")
                                                           attributeSubTitle:JobsInternationalization(@"增删查改")];
            
            viewModel.cls = FMDB_VC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Realm示例")
                                                           attributeSubTitle:JobsInternationalization(@"增删查改")];
            
            viewModel.cls = Realm_VC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"iOS Widget")
                                                           attributeSubTitle:JobsInternationalization(@"")];
            
            viewModel.cls = WidgetVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"手机横屏")
                                                           attributeSubTitle:JobsInternationalization(@"全局设定")];
            
            viewModel.cls = LandscapeSwitchVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"本地推送通知")
                                                           attributeSubTitle:JobsInternationalization(@"本地推送通知")];
            
            viewModel.cls = LocalNotificationsVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"字符串解压缩")
                                                           attributeSubTitle:JobsInternationalization(@"字符串解压缩")];
            
            viewModel.cls = CompressStrVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"动态切换App图标")
                                                           attributeSubTitle:JobsInternationalization(@"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本")];

            viewModel.cls = AppIconSwitchingVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"长按Cell出3D-Touch的菜单")
                                                           attributeSubTitle:JobsInternationalization(@"PeekAndPop")];

            viewModel.cls = PeekAndPopVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"系统剪切板测试")
                                                           attributeSubTitle:JobsInternationalization(@"尝试控制粘贴提示")];
            
            viewModel.cls = CtrlClipboardCueVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsAppDoor-1")
                                                           attributeSubTitle:JobsInternationalization(@"登录注册的第一种表现形式")];
            viewModel.cls = JobsAppDoorVC.class;
            viewModel.requestParams = @(JobsAppDoorBgType_video);
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsAppDoor-2")
                                                           attributeSubTitle:JobsInternationalization(@"登录注册的第二种表现形式")];
            viewModel.cls = JobsAppDoorVC_Style2.class;
            viewModel.requestParams = @(JobsAppDoorBgType_video);
            [_dataMutArr addObject:viewModel];
        }

        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Douyin_ZFPlayer_1")
                                                           attributeSubTitle:JobsInternationalization(@"播放效果 1")];
            viewModel.cls = Douyin_ZFPlayerVC_1.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Douyin_ZFPlayer_2")
                                                           attributeSubTitle:JobsInternationalization(@"播放效果 2")];
            viewModel.cls = Douyin_ZFPlayerVC_2.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"TransparentRegion")
                                                           attributeSubTitle:JobsInternationalization(@"镂空特效")];
            viewModel.cls = TransparentRegionVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsComment")
                                                           attributeSubTitle:JobsInternationalization(@"📃评论功能")];
            viewModel.cls = JobsCommentVC.class;
            [_dataMutArr addObject:viewModel];
        }
    
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsSearch")
                                                           attributeSubTitle:JobsInternationalization(@"🔍搜索功能")];
            viewModel.cls = JobsSearchVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"ShadowTBVCell")
                                                           attributeSubTitle:nil];
//            viewModel.cls =
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"发帖（图文）功能")
                                                           attributeSubTitle:JobsInternationalization(@"相册获取资源+存/取未完成字符串")];
            viewModel.cls = JobsPostVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"相册选取图片和视频")
                                                           attributeSubTitle:JobsInternationalization(@"")];
            viewModel.cls = JobsShootingVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"DynamicView")
                                                           attributeSubTitle:JobsInternationalization(@"Gif图片读取")];
            viewModel.cls = DynamicViewTestVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Progress")
                                                           attributeSubTitle:JobsInternationalization(@"进度条")];
            viewModel.cls = JobsProgressVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"IrregularView")
                                                           attributeSubTitle:JobsInternationalization(@"不规则的按钮")];
            viewModel.cls = TestIrregularViewTestVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsTimer")
                                                           attributeSubTitle:JobsInternationalization(@"☀️时间模块")];
            viewModel.cls = JobsTimerVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"NSTimerManagerTestVC")
                                                           attributeSubTitle:JobsInternationalization(@"🌛NSTimerManager模块测试")];
            viewModel.cls = NSTimerManagerTestVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsIMShowVC")
                                                           attributeSubTitle:JobsInternationalization(@"IM模块")];
            viewModel.cls = JobsIMShowVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"TestLabelVC")
                                                           attributeSubTitle:JobsInternationalization(@"Label的科学管理")];
            viewModel.cls = TestLabelVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsDropDownListVC")
                                                           attributeSubTitle:JobsInternationalization(@"👇🏻下拉列表")];
            viewModel.cls = JobsDropDownListVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"YTKNetworkStudyVC")
                                                           attributeSubTitle:JobsInternationalization(@"探究猿题库网络框架（YTKNetwork）")];
            viewModel.cls = YTKNetworkStudyVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CoreTextLearningVC")
                                                           attributeSubTitle:JobsInternationalization(@"探究CoreText")];
            viewModel.cls = CoreTextLearningVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JXCategoryPopupVC")
                                                           attributeSubTitle:JobsInternationalization(@"JXCategoryView+PopupView")];
            viewModel.cls = JXCategoryPopupVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"UITableViewCellEditorVC")
                                                           attributeSubTitle:JobsInternationalization(@"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑")];
            viewModel.cls = UITableViewCellEditorVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsSettingGestureVC")
                                                           attributeSubTitle:JobsInternationalization(@"设置手势密码")];
            viewModel.cls = JobsSettingGestureVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsTestVC")
                                                           attributeSubTitle:JobsInternationalization(@"进行测试的一个控制器")];
            viewModel.cls = JobsTestVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CXBVC")
                                                           attributeSubTitle:JobsInternationalization(@"CXB自研科技")];
            viewModel.cls = CXBVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"OCDynamicRegisterVC")
                                                           attributeSubTitle:JobsInternationalization(@"OC动态添加类、方法列表、属性列表")];
            viewModel.cls = OCDynamicRegisterVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JXCategoryViewWithHeaderViewVC")
                                                           attributeSubTitle:JobsInternationalization(@"JXCategoryView下拉放大头部视图")];
            viewModel.cls = JXCategoryViewWithHeaderViewVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"UILabelWordRotatingVC")
                                                           attributeSubTitle:JobsInternationalization(@"UILabel文字旋转")];
            viewModel.cls = UILabelWordRotatingVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JXCategoryViewVerticalShowVC")
                                                           attributeSubTitle:JobsInternationalization(@"JXCategoryView垂直表达")];
            viewModel.cls = JXCategoryViewVerticalShowVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsVerticalMenuVC")
                                                           attributeSubTitle:JobsInternationalization(@"竖形菜单选择功能")];
            viewModel.cls = JobsVerticalMenuVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"TestBaseLabelVC")
                                                           attributeSubTitle:JobsInternationalization(@"测试 -BaseLabel-")];
            viewModel.cls = TestBaseLabelVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"RandomTestVC")
                                                           attributeSubTitle:JobsInternationalization(@"随机数测试模块")];
            viewModel.cls = RandomTestVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CustomTableViewCellVC")
                                                           attributeSubTitle:JobsInternationalization(@"自定义UITableViewCell内置控件距离并添加复制按钮")];
            viewModel.cls = CustomTableViewCellVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"CustomBtnVC")
                                                           attributeSubTitle:JobsInternationalization(@"自定义UIButton子控件的排布")];
            viewModel.cls = CustomBtnVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"GXCardViewDemoVC")
                                                           attributeSubTitle:JobsInternationalization(@"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果")];
            viewModel.cls = GXCardViewDemoVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsWalletVC")
                                                           attributeSubTitle:JobsInternationalization(@"UICollectionView实现重叠的卡包效果")];
            viewModel.cls = JobsWalletVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"JobsScrollViewVC")
                                                           attributeSubTitle:JobsInternationalization(@"在指定的y区间内滑动视图(带吸边效果)")];
            viewModel.cls = JobsScrollViewVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"转场动画探究")
                                                           attributeSubTitle:JobsInternationalization(@"UIPresentationController的使用")];
            viewModel.cls = JobsPresentingVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:JobsInternationalization(@"Masonry的应用与实践")
                                                           attributeSubTitle:JobsInternationalization(@"UIPresentationController的使用")];
            viewModel.cls = MasonryVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
        
        {
            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:@"UITBVCellFoldVC"
                                                           attributeSubTitle:JobsInternationalization(@"UITableViewCell的折叠效果")];
            viewModel.cls = UITBVCellFoldVC.class;
            [_dataMutArr addObject:viewModel];
        }
        
//        {
//            UIViewModel *viewModel = [self configViewModelWithAttributeTitle:@"ProtocolKitVC"
//                                                           attributeSubTitle:JobsInternationalization(@"Objective-C中实现协议扩展")];
//            viewModel.cls = ProtocolKitVC.class;
//            [_dataMutArr addObject:viewModel];
//        }
        
    }return _dataMutArr;
}

@end
