//
//  JobsIMVC.m
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import "JobsIMVC.h"

@interface JobsIMVC ()
/// UI
@property(nonatomic,strong)JobsIMInputview *inputview;
@property(nonatomic,strong)BaseButton *shareBtn;
@property(nonatomic,strong)UIColor *bgColour;
/// data
@property(nonatomic,strong)NSMutableArray <JobsIMChatInfoModel *>*chatInfoModelMutArr;//聊天信息
@property(nonatomic,strong)JobsIMChatInfoModel *chatInfoModel;

@end

@implementation JobsIMVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
    IQKeyboardManager.sharedManager.enable = NO;//该页面禁用
    [self keyboardByUpBlock:^(NSNotificationKeyboardModel * _Nullable data) {
        JobsLog(@"");
    } downBlock:^(NSNotificationKeyboardModel * _Nullable data) {
        JobsLog(@"");
    }];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        self.chatInfoModel = (JobsIMChatInfoModel *)self.viewModel.data;
        [self.chatInfoModelMutArr addObject:self.chatInfoModel];
        
        self.viewModel.textModel.text = self.chatInfoModel.userNameStr;
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"聊天列表");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;
    {
        @jobs_weakify(self)
        self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
    //        data.add(UIBarButtonItem.initBy(self.shareBtn));
        });
        self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(UIBarButtonItem.initBy(self.shareBtn));
        });
        self.makeNavByAlpha(1);
    }

    self.inputview.alpha = 1;
    self.tableView.reloadDatas();
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}
/// 必须这么写。在输入的时候会调用UIKeyboardWillChangeFrameNotification，只有在这里强制性的赋值
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    if (self.inputview.inputTextField.TFRiseHeight) {
        CGFloat H = self.inputview.inputTextField.TFRiseHeight;
        CGFloat h = JobsAdNoticeView.viewSizeByModel(nil).height;
        self.inputview.mj_y = self.inputview.inputAccessoryView ? (H - h) : H;
    }
}
#pragma mark —— 一些私有方法
-(void)simulateServer{
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        UIViewModel *viewModel = (UIViewModel *)self.requestParams;
        if ([viewModel.data isKindOfClass:JobsIMChatInfoModel.class]) {
            JobsIMChatInfoModel *requestParamsChatInfoModel = (JobsIMChatInfoModel *)viewModel.data;
            
            JobsIMChatInfoModel *chatInfoModel = JobsIMChatInfoModel.new;
            chatInfoModel.chatTextStr = @"有内鬼，取消交易";
            JobsTimeModel *timeModel = self.makeSpecificTime;
            chatInfoModel.chatTextTimeStr = [NSString stringWithFormat:@"%ld:%ld:%ld",timeModel.currentHour,timeModel.currentMin,timeModel.currentSec];
            chatInfoModel.userIconIMG = requestParamsChatInfoModel.userIconIMG;
            chatInfoModel.identification = @"我是服务器";
            chatInfoModel.userNameStr = requestParamsChatInfoModel.userNameStr;
            
            [self.chatInfoModelMutArr addObject:chatInfoModel];
            [self.tableView reloadData];
        }
    }
}
#pragma mark —— 通知方法
/// 键盘 弹出 和 收回 走这个方法
-(void)keyboardWillChangeFrameNotification:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat KeyboardOffsetY = beginFrame.origin.y - endFrame.origin.y;// 正则抬起 ，负值下降
    JobsLog(@"KeyboardOffsetY = %f",KeyboardOffsetY);
 
    if (KeyboardOffsetY > 0) {
        JobsLog(@"键盘抬起");
        KeyboardOffsetY -= JobsBottomSafeAreaHeight();
    }else if(KeyboardOffsetY < 0){
        JobsLog(@"键盘收回");
        KeyboardOffsetY += JobsBottomSafeAreaHeight();
    }else{
        JobsLog(@"键盘");
    }
    
    self.inputview.inputTextField.TFRiseHeight = self.inputview.mj_y;
    self.inputview.inputTextField.TFRiseHeight -= KeyboardOffsetY;
    self.inputview.mj_y = self.inputview.inputTextField.TFRiseHeight;
}

-(void)keyboardDidChangeFrameNotification:(NSNotification *)notification{}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsIMChatInfoTBVCell.cellHeightByModel(self.chatInfoModelMutArr[indexPath.row]);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.chatInfoModelMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsIMChatInfoTBVCell *cell = JobsIMChatInfoTBVCell.cellStyleValue1WithTableView(tableView);
    cell.isShowChatUserName = YES;
    cell.indexPath = indexPath;
    cell.delegate = self;
    cell.allowsMultipleSwipe = YES;
    cell.jobsRichElementsCellBy(self.chatInfoModelMutArr[indexPath.row]);
    return cell;
}
#if isAllowSysEdit
/// 右划
-(nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView
 leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (@available(iOS 11.0, *)) {
        UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal
                                                                                      title:@"删除"
                                                                                    handler:^(UIContextualAction * _Nonnull action,
                                                                                              __kindof UIView * _Nonnull sourceView,
                                                                                              void (^ _Nonnull completionHandler)(BOOL)) {
            [WHToast showErrorWithMessage:@"删除"
                                 duration:2
                            finishHandler:^{
              
            }];
        }];
        //设置图片，但是设置不了原图，都是被默认为白色了，字体也是
        UIImage *image = [JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"分享") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [deleteRowAction setImage:image];
        deleteRowAction.backgroundColor = [UIColor redColor];

        UIContextualAction *editRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal
                                                                                    title:@"编辑"
                                                                                  handler:^(UIContextualAction * _Nonnull action,
                                                                                            __kindof UIView * _Nonnull sourceView,
                                                                                            void (^ _Nonnull completionHandler)(BOOL)) {
            [WHToast showErrorWithMessage:@"编辑"
                                 duration:2
                            finishHandler:^{
              
            }];
        }];
        editRowAction.image = JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"删除");
        editRowAction.backgroundColor = [UIColor blueColor];
        UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction,editRowAction]];
        //设置全屏滑动时不自定响应事件
        config.performsFirstActionWithFullSwipe = false;
        return config;
    }else{
        return nil;
    }
}
/// 左划
-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView
trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (@available(iOS 11.0, *)) {
        UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal
                                                                                      title:@"删除"
                                                                                    handler:^(UIContextualAction * _Nonnull action,
                                                                                              __kindof UIView * _Nonnull sourceView,
                                                                                              void (^ _Nonnull completionHandler)(BOOL)) {
        }];
        UIImage *image = [JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"分享")  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [deleteRowAction setImage:image];
        deleteRowAction.backgroundColor = [UIColor redColor];
        UIContextualAction *editRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal
                                                                                    title:@"编辑"
                                                                                  handler:^(UIContextualAction * _Nonnull action,
                                                                                            __kindof UIView * _Nonnull sourceView,
                                                                                            void (^ _Nonnull completionHandler)(BOOL)) {
        }];
        editRowAction.image = JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"删除");
        editRowAction.backgroundColor = [UIColor blueColor];

        UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction,editRowAction]];
        config.performsFirstActionWithFullSwipe = false;
        return config;
    }else{
        return nil;
    }
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView
                 editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (@available(iOS 13.0, *)) {
        //UITableViewRowAction' is deprecated: first deprecated in iOS 13.0 - Use UIContextualAction and related APIs instead.
        return nil;
    }else{
        UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                                          title:@"删除"
                                                                        handler:^(UITableViewRowAction * _Nonnull action,
                                                                                  NSIndexPath * _Nonnull indexPath) {
            [WHToast showErrorWithMessage:@"删除"
                                 duration:2
                            finishHandler:nil];
            // 点击删除按钮需要执行的方法
            [tableView setEditing:NO
                         animated:YES];
        }];
        // 修改背景颜色
        action.backgroundColor = HEXCOLOR(0xEB1163);
        return @[action];
    }
}
#pragma clang diagnostic pop
-(void)tableView:(UITableView *)tableView
willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在 iOS11 以下系统,因为方法线程问题,需要放到主线程执行, 不然没有效果
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        [self setupSlideBtnWithEditingIndexPath:indexPath];
    });
}
//MARK: 设置左滑按钮的样式
-(void)setupSlideBtnWithEditingIndexPath:(NSIndexPath *)editingIndexPath{
    // 判断系统是否是 iOS13 及以上版本
    if (@available(iOS 13.0, *)) {
        for (UIView *subView in self.tableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"_UITableViewCellSwipeContainerView")] &&
                [subView.subviews count] >= 1) {
                // 修改图片
                UIView *remarkContentView = subView.subviews.firstObject;
                [self setupRowActionView:remarkContentView];
            }
        }return;
    }
    // 判断系统是否是 iOS11 及以上版本
    if (@available(iOS 11.0, *)) {
        for (UIView *subView in self.tableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UISwipeActionPullView")] &&
                [subView.subviews count] >= 1) {
                // 修改图片
                UIView *remarkContentView = subView;
                [self setupRowActionView:remarkContentView];
            }
        }return;
    }
    // iOS11 以下的版本
    JobsIMChatInfoTBVCell *cell = [self.tableView cellForRowAtIndexPath:editingIndexPath];
    for (UIView *subView in cell.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITableViewCellDeleteConfirmationView")] &&
            [subView.subviews count] >= 1) {
            // 修改图片
            UIView *remarkContentView = subView;
            [self setupRowActionView:remarkContentView];
        }
    }
}

-(void)setupRowActionView:(UIView *)rowActionView{
    // 切割圆角
    rowActionView.cornerCutToCircleWithCornerRadius(20);
    // 改变父 View 的frame，这句话是因为我在 contentView 里加了另一个 View，为了使划出的按钮能与其达到同一高度
    CGRect frame = rowActionView.frame;
    frame.origin.y += 7;
    frame.size.height -= 13;
    rowActionView.frame = frame;
    // 拿到按钮,设置图片
    UIButton *button = rowActionView.subviews.firstObject;
    button.backgroundColor = JobsRedColor;
    [button jobsResetBtnTitle:@"删除"];
    [button jobsResetBtnImage:JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"删除")];
}
#endif

// USE_MG_DELEGATE
//-(NSArray *)swipeTableCell:(JobsIMChatInfoTBVCell *)cell
//  swipeButtonsForDirection:(MGSwipeDirection)direction
//             swipeSettings:(MGSwipeSettings *)swipeSettings
//         expansionSettings:(MGSwipeExpansionSettings *)expansionSettings{
//    if (direction == MGSwipeDirectionLeftToRight) {
//        return [cell createLeftButtons];
//    }else {
//        return [cell createRightButtons];
//    }
//}

-(void)swipeTableCellWillBeginSwiping:(nonnull MGSwipeTableCell *)cell{
    self.feedbackGenerator(nil);//震动反馈
}
/// 点击了第几个滑动出现的按钮？
-(BOOL)swipeTableCell:(MGSwipeTableCell *)cell
  tappedButtonAtIndex:(NSInteger)index
            direction:(MGSwipeDirection)direction
        fromExpansion:(BOOL)fromExpansion{
    JobsLog(@"Delegate: button tapped, %@ position, index %d, from Expansion: %@",direction == MGSwipeDirectionLeftToRight ? @"left" : @"right", (int)index, fromExpansion ? @"YES" : @"NO");
    return YES;
}

-(void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    JobsLog(@"Tapped accessory button");
}
#pragma mark —— lazyLoad
-(JobsIMInputview *)inputview{
    if (!_inputview) {
        _inputview = JobsIMInputview.new;
        @jobs_weakify(self)
        [_inputview actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:ZYTextField.class]){
                ZYTextField *tf = (ZYTextField *)data;
                {/// 装填我方数据并刷新UI
                    JobsTimeModel *timeModel = self.makeSpecificTime;
                    self.chatInfoModelMutArr.add(jobsMakeIMChatInfoModel(^(JobsIMChatInfoModel * _Nullable data) {
                        data.chatTextStr = tf.text;
                        data.chatTextTimeStr = toStringByNSInteger(timeModel.currentHour)
                            .add(@":")
                            .add(toStringByNSInteger(timeModel.currentMin))
                            .add(@":")
                            .add(toStringByNSInteger(timeModel.currentSec));
                        data.userIconIMG = JobsBuddleIMG(@"bundle", @"头像", nil, @"头像_1");//我自己的头像
                        data.identification = @"我是我自己";
                        data.userNameStr = @"Jobs";
                    }));[self.tableView reloadData];
                }
                /// 模拟服务器请求对方数据
                @jobs_weakify(self)
                [self delay:1 doSth:^(id data) {
                    @jobs_strongify(self)
                    [self simulateServer];
                }];
            }else{}
        }];
        [self.view addSubview:_inputview];
        [_inputview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(JobsIMInputviewHeight());
            make.left.right.equalTo(self.view);
            JobsLog(@"%f",JobsBottomSafeAreaHeight());
            make.bottom.equalTo(self.view).offset(-JobsBottomSafeAreaHeight());
        }];
        _inputview.jobsRichViewByModel(nil);
    }return _inputview;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = UITableView.new;
        _tableView.backgroundColor = self.bgColour;
        _tableView.pagingEnabled = YES;//这个属性为YES会使得Tableview一格一格的翻动
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataLink(self);
        [self.view insertSubview:_tableView belowSubview:self.inputview];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }
            make.left.right.equalTo(self.view);
            make.bottom.equalTo(self.inputview.mas_top);
        }];
        [self.view layoutIfNeeded];
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        {
            _tableView.mj_header = self.view.LOTAnimationMJRefreshHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉刷新数据");
                data.pullingTitle = JobsInternationalization(@"下拉刷新数据");
                data.refreshingTitle = JobsInternationalization(@"正在刷新数据");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉刷新数据");
                data.loadBlock = ^id _Nullable(id _Nullable data) {
                    @jobs_strongify(self)
                    self.tableView.endRefreshing(self.chatInfoModelMutArr.count);
                    return nil;
                };
            }));
            _tableView.mj_footer = self.view.MJRefreshAutoGifFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    JobsLog(@"上拉加载更多");
                    /// 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                    self.tableView.pagingEnabled = NO;
                    self.tableView.mj_footer.state = MJRefreshStateIdle;
                    self.tableView.mj_footer.hidden = YES;
                    self.tableView.pagingEnabled = YES;
                    self->_tableView.endRefreshingWithNoMoreData(self.chatInfoModelMutArr.count);
                    return nil;
                };
            }));
            _tableView.mj_footer.backgroundColor = JobsRedColor;
            _tableView.mj_footer.hidden = NO;
            self.view.mjRefreshTargetView = _tableView;
        }
    }return _tableView;
}

-(BaseButton *)shareBtn{
    if (!_shareBtn) {
        @jobs_weakify(self)
        _shareBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(23 / 2))
            .jobsResetBtnImage(JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"分享"))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toast(JobsInternationalization(@"正在研发中...敬请期待"));
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        _shareBtn.width = JobsWidth(23);
        _shareBtn.height = JobsWidth(23);
    }return _shareBtn;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = self.byPatternImage(JobsBuddleIMG(@"⚽️PicResource", @"Telegram",nil, @"1"));
    }return _bgColour;
}

-(NSMutableArray<JobsIMChatInfoModel *> *)chatInfoModelMutArr{
    if (!_chatInfoModelMutArr) {
        _chatInfoModelMutArr = NSMutableArray.array;
    }return _chatInfoModelMutArr;
}

@end
