//
//  JobsVerticalMenuVC@0.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/31/24.
//

#import "JobsVerticalMenuVC@0.h"

@interface JobsVerticalMenuVC_0 ()
/// UI
@property(nonatomic,strong)UITableView *tableView; /// 左侧的标题
@property(nonatomic,strong)BaseButton *customerServiceBtn;
@property(nonatomic,strong)BaseButton *msgBtn;
@property(nonatomic,strong)BaseButton *editBtn;
@property(nonatomic,strong)JobsSearchBar *searchView;
/// Data
@property(nonatomic,strong)NSMutableArray <__kindof UIView *>*rightViewArray; /// 右侧的视图数组
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*titleMutArr;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*leftDataArray; /// 左边的数据源
@property(nonatomic,strong)UIViewModel *leftViewCurrentSelectModel;

@end

@implementation JobsVerticalMenuVC_0

- (void)dealloc {
    NSLog(@"%@", JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (void)loadView {
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;

    {
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
    }
    self.makeSubViews();
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
    self.tableView.alpha = 1;
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
- (jobsByVoidBlock)makeSubViews {
    return ^() {
        self.rightViewArray = NSMutableArray.array;
        for (int i = 0; i < self.titleMutArr.count; i++) {
            JobsVerticalMenuSubView *subView = JobsVerticalMenuSubView.new;
            subView.backgroundColor = JobsRandomColor;
            self.rightViewArray.add(subView);
        }
    };
}

//-(JobsReturnViewByClassBlock)makeSubViews{
//    return ^UIView *_Nullable(Class _Nonnull cls){
//        UIView *view = cls.new;
//        view.frame = CGRectMake(MenuWidth,
//                                0,
//                                JobsRealWidth() - MenuWidth,
//                                JobsRealHeight());
//        view.jobsRichElementsInViewWithModel(nil);
//        return view;
//    };
//}
/// 显示指定的右侧视图
- (jobsByViewBlock)displayView {
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

- (jobsByVoidBlock)refreshLeftView {
    return ^() {
        [self.tableView reloadData];
        if (self.leftDataArray.count) {
            @jobs_weakify(self)
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
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
    LeftCell *cell = LeftCell.cellStyleDefaultWithTableView(tableView);
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.textModel.text = self.titleMutArr[indexPath.row].textModel.text;
    cell.jobsRichElementsInCellWithModel(viewModel);
    return cell;
}

- (CGFloat)tableView:(__kindof UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [LeftCell cellHeightWithModel:nil];
}

- (void)tableView:(__kindof UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.displayView(self.rightViewArray[indexPath.row]);
}
#pragma mark —— lazyLoad
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

- (BaseButton *)customerServiceBtn {
    if (!_customerServiceBtn) {
        @jobs_weakify(self)
        _customerServiceBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                                background:nil
                                                buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                             textAlignment:NSTextAlignmentCenter
                                                          subTextAlignment:NSTextAlignmentCenter
                                                               normalImage:JobsIMG(@"人工客服")
                                                            highlightImage:nil
                                                           attributedTitle:nil
                                                   selectedAttributedTitle:nil
                                                        attributedSubtitle:nil
                                                                     title:nil
                                                                  subTitle:nil
                                                                 titleFont:nil
                                                              subTitleFont:nil
                                                                  titleCor:nil
                                                               subTitleCor:nil
                                                        titleLineBreakMode:NSLineBreakByWordWrapping
                                                     subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                       baseBackgroundColor:nil
                                                           backgroundImage:nil
                                                              imagePadding:JobsWidth(0)
                                                              titlePadding:JobsWidth(0)
                                                            imagePlacement:NSDirectionalRectEdgeNone
                                                contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                                  contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                             contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                         cornerRadiusValue:JobsWidth(0)
                                                           roundingCorners:UIRectCornerAllCorners
                                                      roundingCornersRadii:CGSizeZero
                                                            layerBorderCor:nil
                                                               borderWidth:JobsWidth(0)
                                                             primaryAction:nil
                                                longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                               id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                           clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _customerServiceBtn;
}

- (BaseButton *)msgBtn {
    if (!_msgBtn) {
        @jobs_weakify(self)
        _msgBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                    background:nil
                                    buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                 textAlignment:NSTextAlignmentCenter
                                              subTextAlignment:NSTextAlignmentCenter
                                                   normalImage:JobsIMG(@"消息")
                                                highlightImage:nil
                                               attributedTitle:nil
                                       selectedAttributedTitle:nil
                                            attributedSubtitle:nil
                                                         title:nil
                                                      subTitle:nil
                                                     titleFont:nil
                                                  subTitleFont:nil
                                                      titleCor:nil
                                                   subTitleCor:nil
                                            titleLineBreakMode:NSLineBreakByWordWrapping
                                         subtitleLineBreakMode:NSLineBreakByWordWrapping
                                           baseBackgroundColor:nil
                                               backgroundImage:nil
                                                  imagePadding:JobsWidth(0)
                                                  titlePadding:JobsWidth(0)
                                                imagePlacement:NSDirectionalRectEdgeNone
                                    contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                      contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                 contentInsets:jobsSameDirectionalEdgeInsets(0)
                                             cornerRadiusValue:JobsWidth(0)
                                               roundingCorners:UIRectCornerAllCorners
                                          roundingCornersRadii:CGSizeZero
                                                layerBorderCor:nil
                                                   borderWidth:JobsWidth(0)
                                                 primaryAction:nil
                                    longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                   id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                               clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _msgBtn;
}

- (JobsSearchBar *)searchView {
    if (!_searchView) {
        _searchView = JobsSearchBar.new;
        _searchView.Size = CGSizeMake(JobsMainScreen_WIDTH() / 3, JobsWidth(40));
        _searchView.jobsRichElementsInViewWithModel(nil);
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

- (BaseButton *)editBtn{
    if (!_editBtn) {
        @jobs_weakify(self)
        _editBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                     buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:JobsIMG(@"编辑")
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:JobsInternationalization(@"编辑")
                                                       subTitle:nil
                                                      titleFont:UIFontWeightRegularSize(12)
                                                   subTitleFont:nil
                                                       titleCor:HEXCOLOR(0xB0B0B0)
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:HEXCOLOR(0xFCFBFB)
                                                backgroundImage:nil
                                                   imagePadding:JobsWidth(5.75)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeLeading
                                     contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                       contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                  contentInsets:jobsSameDirectionalEdgeInsets(0)
                                              cornerRadiusValue:JobsWidth(0)
                                                roundingCorners:UIRectCornerAllCorners
                                           roundingCornersRadii:CGSizeZero
                                                 layerBorderCor:nil
                                                    borderWidth:JobsWidth(0)
                                                  primaryAction:nil
                                     longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                    id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            toast(JobsInternationalization(@"编辑"));
            return nil;
        }];
        [self.view addSubview:_editBtn];
        [_editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.top.equalTo(self.tableView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(TableViewWidth, EditBtnHeight));
        }];
    }return _editBtn;
}

- (NSMutableArray<UIViewModel *> *)titleMutArr {
    if (!_titleMutArr) {
        /// 最初默认的数据
        _titleMutArr = NSMutableArray.array;
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"收藏");
            _titleMutArr.add(viewModel);
        }
        
        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"真人");
            _titleMutArr.add(viewModel);
        }

        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"体育");
            _titleMutArr.add(viewModel);
        }

        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"电子");
            _titleMutArr.add(viewModel);
        }

        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"棋牌");
            _titleMutArr.add(viewModel);
        }

        {
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.textModel.text = JobsInternationalization(@"彩票");
            _titleMutArr.add(viewModel);
        }
    }return _titleMutArr;
}

- (NSMutableArray<UIViewModel *> *)leftDataArray {
    if (!_leftDataArray) {
        _leftDataArray = NSMutableArray.array;
    }return _leftDataArray;
}

- (UIViewModel *)leftViewCurrentSelectModel {
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
