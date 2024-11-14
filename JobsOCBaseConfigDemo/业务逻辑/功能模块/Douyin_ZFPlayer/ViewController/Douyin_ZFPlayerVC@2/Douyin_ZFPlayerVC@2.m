//
//  Douyin_ZFPlayerVC@2.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "Douyin_ZFPlayerVC@2.h"

@interface Douyin_ZFPlayerVC_2 ()
/// UI
@property(nonatomic,strong)ZFPlayerController *player;
@property(nonatomic,strong)ZFAVPlayerManager *playerManager;
@property(nonatomic,strong)ZFDouYinControlView *controlView;
@property(nonatomic,strong)ZFCustomControlView *fullControlView;
@property(nonatomic,strong)JobsBitsMonitorSuspendLab *bitsMonitorSuspendLab;
/// Data
@property(nonatomic,strong)NSMutableArray <VideoModel_Core *>*dataMutArr;/// 我的数据源

@end

@implementation Douyin_ZFPlayerVC_2

-(void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
       
    }return self;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.bgCor = JobsClearColor;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    // self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    /// 全局只需要写一次。在AppDelegate里面进行配置
    NSError *error = nil;
    [KTVHTTPCache proxyStart:&error];
    if(error){
        NSLog(@"error = %@",error.description)
    }
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    self.tableView.reloadDatas();
    self.bitsMonitorSuspendLab.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
    JobsBitsMonitorCore.sharedManager.bitsMonitorRunMode = BitsMonitorManualRun;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [JobsBitsMonitorCore.sharedManager stop];
    [self.player.currentPlayerManager stop];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    /**
     * 请求到数据以后，刷新界面reloadData
     * 这个时候会先走UITableViewDelegate,UITableViewDataSource
     * 再viewWillLayoutSubviews-viewDidLayoutSubviews
     * 在这个时候拿到确定的当前self.indexPath进行播放
     */
//    if (self.dataMutArr.count) {
//        [self playTheVideoAtIndexPath:self.indexPath];
//        [self.tableView ly_hideEmptyView];
//    }else{
//        [self.tableView ly_showEmptyView];
//    }
}
#pragma mark —— 一些私有方法
-(void)requestData{
    /// 下拉时候一定要停止当前播放，不然有新数据，播放位置会错位。
    [self.player stopCurrentPlayingCell];
    /// 获取本地的数据
    NSDictionary *rootDict = @"data".readLocalFileWithName;
    NSArray *videoList = [rootDict objectForKey:@"list"];
    for (NSDictionary *dataDic in videoList) {
        VideoModel_Core *model = VideoModel_Core.byData(dataDic);
        self.dataMutArr.add(model);
    }
    /// 找到可以播放的视频并播放
    @jobs_weakify(self)
    [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        @jobs_strongify(self)
        [self playTheVideoAtIndexPath:indexPath];
    }];
    self.tableView.endRefreshing(self.dataMutArr.count);
//    [self endRefreshingWithNoMoreData:self.tableView];
}

-(void)playTheVideoAtIndexPath:(NSIndexPath *)indexPath{
    VideoModel_Core *data = (VideoModel_Core *)self.dataMutArr[indexPath.row];
    
    {
        NSString *URLString = [data.videoIdcUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *URL = [KTVHTTPCache proxyURLWithOriginalURL:URLString.jobsUrl];
        [self.player playTheIndexPath:indexPath assetURL:URL];
    }

    [self.controlView resetControlView];
    [self.controlView showCoverViewWithUrl:data.thumbnail_url];
    [self.fullControlView showTitle:JobsInternationalization(@"custom landscape controlView")
                     coverURLString:data.thumbnail_url //data.videoImg
                     fullScreenMode:ZFFullScreenModeLandscape];
}
/// 指定到某一行播放
-(void)playTheIndex:(NSInteger)index{
    @jobs_weakify(self)
    [self.tableView scrollToRowAtIndexPath:JobsIndexPathForRow(0, index)
                          atScrollPosition:UITableViewScrollPositionNone
                                  animated:NO];
    [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
        @jobs_strongify(self)
        [self playTheVideoAtIndexPath:indexPath];
    }];
    /// 如果是最后一行，去请求新数据
    if (index == self.dataMutArr.count - 1) {
        /// 加载下一页数据
//        [self requestData:YES];
        [self requestData];
    }
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
    return NO;
}
#pragma clang diagnostic pop
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden{
    return NO;
}
#pragma mark —— ZFDouYinCellDelegate
-(void)zf_douyinRotation{
    UIInterfaceOrientation orientation = UIInterfaceOrientationUnknown;
    if(self.player.isFullScreen){
        orientation = UIInterfaceOrientationPortrait;
    }else{
        orientation = UIInterfaceOrientationLandscapeRight;
    }
    [self.player rotateToOrientation:orientation
                            animated:YES
                          completion:nil];
}
#pragma mark —— UIScrollViewDelegate 列表播放必须实现
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [scrollView zf_scrollViewDidEndDecelerating];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    [scrollView zf_scrollViewDidEndDraggingWillDecelerate:decelerate];
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    [scrollView zf_scrollViewDidScrollToTop];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [scrollView zf_scrollViewDidScroll];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [scrollView zf_scrollViewWillBeginDragging];
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsVideoTBVCell.cellHeightByModel(tableView);
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexPath = indexPath;
    JobsVideoTBVCell *cell = JobsVideoTBVCell.cellStyleValue1WithTableView(tableView);
    cell.delegate = self;
    cell.index = indexPath.row;
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    return cell;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self playTheVideoAtIndexPath:indexPath];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark —— lazyLoad
-(JobsBitsMonitorSuspendLab *)bitsMonitorSuspendLab{
    if (!_bitsMonitorSuspendLab) {
        _bitsMonitorSuspendLab = JobsBitsMonitorSuspendLab.new;
        _bitsMonitorSuspendLab.font = UIFontWeightBoldSize(10);
        _bitsMonitorSuspendLab.backgroundColor = JobsLightGrayColor;
        _bitsMonitorSuspendLab.textColor = JobsRedColor;
        @jobs_weakify(self)
        _bitsMonitorSuspendLab.vc = weak_self;
        _bitsMonitorSuspendLab.isAllowDrag = YES;//悬浮效果必须要的参数
        [self.view addSubview:_bitsMonitorSuspendLab];
        _bitsMonitorSuspendLab.frame = JobsBitsMonitorSuspendLab.viewFrameByModel(nil);
    }return _bitsMonitorSuspendLab;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
- (UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.initWithStylePlain;
        _tableView.pagingEnabled = YES;
        _tableView.backgroundColor = JobsLightGrayColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollsToTop = NO;
        
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
        }
        
        {
            _tableView.mj_header = self.view.MJRefreshNormalHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉刷新数据");
                data.pullingTitle = JobsInternationalization(@"下拉刷新数据");
                data.refreshingTitle = JobsInternationalization(@"正在刷新数据");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉刷新数据");
                data.automaticallyChangeAlpha = YES;/// 根据拖拽比例自动切换透明度
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    NSLog(@"下拉刷新");
                    self.currentPage = @(1);
                    [self requestData];
                //    [self requestData:NO];
                //    [self playVideo];
                    return nil;
                };
            }));
            _tableView.mj_footer = self.view.MJRefreshAutoNormalFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel *_Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"上拉加载数据");
                data.pullingTitle = JobsInternationalization(@"上拉加载数据");
                data.refreshingTitle = JobsInternationalization(@"正在加载数据");
                data.willRefreshTitle = JobsInternationalization(@"加载数据中");
                data.noMoreDataTitle = JobsInternationalization(@"没有更多数据");
                data.loadBlock = ^id _Nullable(id _Nullable data) {
                    @jobs_strongify(self)
                    NSLog(@"上拉加载更多");
                    self.currentPage = @(self.currentPage.integerValue + 1);
                    [self requestData];
                //    NSLog(@"currentPageNum = %ld",self.currentPage);
                //    [self requestData:YES];
                //    [self playVideo];
                    return nil;
                };
            }));
            _tableView.mj_footer.hidden = NO;
        }
        
//        {// 设置tabAnimated相关属性
//            _tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                  cellHeight:JobsBaseTableViewCell.cellHeightByModel(nil)];
//            _tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeBinAnimation;
//            _tableView.tabAnimated.canLoadAgain = YES;
////            _tableView.tabAnimated.animatedBackViewCornerRadius = JobsWidth(8);
////            _tableView.tabAnimated.animatedBackgroundColor = JobsRedColor;
//            [_tableView tab_startAnimation];   // 开启动画
//        }
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }make.bottom.equalTo(self.view.mas_bottom);
        }];
    }return _tableView;
}

-(ZFPlayerController *)player{
    if (!_player) {
        /// player,tag值必须在cell里设置
        _player = [ZFPlayerController playerWithScrollView:self.tableView
                                             playerManager:self.playerManager
                                          containerViewTag:kPlayerViewTag];
        _player.disableGestureTypes = ZFPlayerDisableGestureTypesPan | ZFPlayerDisableGestureTypesPinch;
        _player.controlView = self.controlView;

        _player.allowOrentitaionRotation = NO;
        _player.WWANAutoPlay = YES;
        /// 1.0是完全消失时候
        _player.playerDisapperaPercent = 1.0;
        
        @jobs_weakify(self)
        _player.playerDidToEnd = ^(id _Nonnull asset) {
            @jobs_strongify(self)
            [self->_player.currentPlayerManager replay];
        };
        
        _player.orientationWillChange = ^(ZFPlayerController * _Nonnull player,
                                          BOOL isFullScreen) {
            AppDelegate.sharedManager.allowOrentitaionRotation = isFullScreen;
            @jobs_strongify(self)
            self->_player.controlView.hidden = YES;
        };
        
        _player.orientationDidChanged = ^(ZFPlayerController * _Nonnull player,
                                          BOOL isFullScreen) {
            @jobs_strongify(self)
            self->_player.controlView.hidden = NO;
            self->_player.controlView = isFullScreen ? self.fullControlView : self.controlView;
        };
        /// 更新另一个控制层的时间
        _player.playerPlayTimeChanged = ^(id<ZFPlayerMediaPlayback>  _Nonnull asset,
                                          NSTimeInterval currentTime,
                                          NSTimeInterval duration) {
            @jobs_strongify(self)
            if ([self->_player.controlView isEqual:self.fullControlView]) {
                [self.controlView videoPlayer:self->_player
                                  currentTime:currentTime
                                    totalTime:duration];
            } else if ([self->_player.controlView isEqual:self.controlView]) {
                [self.fullControlView videoPlayer:self->_player
                                      currentTime:currentTime
                                        totalTime:duration];
            }
        };
        /// 更新另一个控制层的缓冲时间
        _player.playerBufferTimeChanged = ^(id<ZFPlayerMediaPlayback>  _Nonnull asset,
                                            NSTimeInterval bufferTime) {
            @jobs_strongify(self)
            if ([self->_player.controlView isEqual:self.fullControlView]) {
                [self.controlView videoPlayer:self->_player
                                   bufferTime:bufferTime];
            } else if ([self->_player.controlView isEqual:self.controlView]) {
                [self.fullControlView videoPlayer:self->_player
                                       bufferTime:bufferTime];
            }else{}
        };
        /// 停止的时候找出最合适的播放
        _player.zf_scrollViewDidEndScrollingCallback = ^(NSIndexPath * _Nonnull indexPath) {
            @jobs_strongify(self)
            if (self->_player.playingIndexPath) return;
            if (indexPath.row == self.dataMutArr.count - 1) {
                /// 加载下一页数据
//                [self requestData:YES];
                [self requestData];
                [self.tableView reloadData];
            }[self playTheVideoAtIndexPath:indexPath];
        };
    }return _player;
}

-(ZFAVPlayerManager *)playerManager{
    if (!_playerManager) {
        _playerManager = ZFAVPlayerManager.new;
    }return _playerManager;
}

-(ZFDouYinControlView *)controlView{
    if (!_controlView){
        _controlView = ZFDouYinControlView.new;
    }return _controlView;
}

-(ZFCustomControlView *)fullControlView{
    if (!_fullControlView) {
        _fullControlView = ZFCustomControlView.new;
    }return _fullControlView;
}

-(NSMutableArray <VideoModel_Core *>*)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <VideoModel_Core *>*_Nullable data) {
            /// 第1条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4";
                data1.videoTitle = JobsInternationalization(@"第1条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第2条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4";
                data1.videoTitle = JobsInternationalization(@"第2条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第3条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/peter/mac-peter-tpl-cc-us-2018_1280x720h.mp4";
                data1.videoTitle = JobsInternationalization(@"第3条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第4条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/grimes/mac-grimes-tpl-cc-us-2018_1280x720h.mp4";
                data1.videoTitle = JobsInternationalization(@"第4条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第5条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7194236f31b2e1e3da0fe06cfed4ba2b.mp4";
                data1.videoTitle = JobsInternationalization(@"第5条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第6条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
                data1.videoTitle = JobsInternationalization(@"第6条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第7条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"http://vjs.zencdn.net/v/oceans.mp4";
                data1.videoTitle = JobsInternationalization(@"第7条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第8条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://media.w3.org/2010/05/sintel/trailer.mp4";
                data1.videoTitle = JobsInternationalization(@"第8条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第9条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4";
                data1.videoTitle = JobsInternationalization(@"第9条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
            /// 第10条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1.videoIdcUrl = @"https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_2mb.mp4";
                data1.videoTitle = JobsInternationalization(@"第10条视频");
                data1.videoImg = @"视频封面.jpg";
            }));
        });
    }return _dataMutArr;
}
@synthesize pageSize = _pageSize;
-(NSNumber *)pageSize{
    if(!_pageSize){
        _pageSize = @(6);
    }return _pageSize;
}
#pragma mark —— 暂时用不到的
-(void)requestData:(BOOL)isLoadMore{
    /// 下拉时候一定要停止当前播放，不然有新数据，播放位置会错位。
    [self.player stopCurrentPlayingCell];
    NSLog(@"当前是否有网：%d 状态：%ld",ZBRequestManager.isNetworkReachable,ZBRequestManager.networkReachability);
    DataManager.sharedManager.tag = ReuseIdentifier;
    /**
     公共配置
     插件机制
     证书设置
     */
    RequestTool *config = RequestTool.new;
    config.languageType = HTTPRequestHeaderLanguageCN;
    RequestTool.setupPublicParametersBy(config);
    
    @jobs_weakify(self)
    extern NSString *appInterfaceTesting;
    [JobsNetworkingAPI requestApi:This.appInterfaceTesting.funcName
                     parameters:@{@"pageSize":self.pageSize,
                                  @"pageNum":self.currentPage}
                   successBlock:^(JobsResponseModel *data) {
        @jobs_strongify(self)
        NSLog(@"");
        if([data.data isKindOfClass:NSArray.class]){
            NSArray *tempDataArr = (NSArray *)data.data;
            {// 数据组装
                /**
                    上拉加载更多
                    请求到有实际意义上的数据 ——> 上拉加载更多
                    请求到没有有实际意义上的数据 ——>  没有更多数据了
                 */
                
                /**
                 下拉刷新
                    请求到有实际意义上的数据 ——> 清除以前的旧的数据 下拉可以刷新
                    请求到没有有实际意义上的数据 ——> 不清除以前的旧的数据 下拉可以刷新
                 */
                
                // 如果当前操作是下拉刷新 并且 请求到的数组里面有值——>清除已有的数据
                if (!isLoadMore && tempDataArr.count) {
                    [self.dataMutArr removeAllObjects];
                }
                
                if (isLoadMore) {
                    if (tempDataArr.count) {
                        [self.dataMutArr addObjectsFromArray:tempDataArr];
                        self->_tableView.endRefreshing(self.dataMutArr.count);//上拉加载更多
                    }else{
                        self->_tableView.endRefreshingWithNoMoreData(self.dataMutArr.count);//没有更多数据了
                    }
                }
            }
            /// 找到可以播放的视频并播放
            @jobs_weakify(self)
            [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
                @jobs_strongify(self)
                [self playTheVideoAtIndexPath:indexPath];
            }];
        }
    }failureBlock:^(id data) {
        @jobs_strongify(self)
        if (self.currentPage.integerValue > 1) {
            self.currentPage = @(self.currentPage.integerValue - 1);
        }
    }];
}
//#pragma mark - ZFTableViewCellDelegate
//-(void)zf_playTheVideoAtIndexPath:(NSIndexPath *)indexPath{
//    [self playTheVideoAtIndexPath:indexPath];
//}
// 刷新加载最新数据（以前的数据全部清空）
//-(void)playVideo{
//    /// 下拉时候一定要停止当前播放，不然有新数据，播放位置会错位。
//    [self.player stopCurrentPlayingCell];
//    /// 找到可以播放的视频并播放
//    @jobs_weakify(self)
//    [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
//        @jobs_strongify(self)
//        [self playTheVideoAtIndexPath:indexPath];
//    }];
//
//    [self endRefreshing:self.tableView];//上拉加载更多
//}

@end
