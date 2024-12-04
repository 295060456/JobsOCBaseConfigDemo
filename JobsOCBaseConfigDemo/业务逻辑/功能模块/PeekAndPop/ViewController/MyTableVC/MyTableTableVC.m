//
//  MyTableTableVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 6/22/24.
//

#import "MyTableTableVC.h"

@interface MyTableTableVC ()
/// UI
@property(nonatomic,strong)BaiShaETProjChoiceStadiumTBVHeaderView *tbvHeaderView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;
@property(nonatomic,strong)NSMutableArray <JobsBaseTableViewCell *>*tbvCellMutArr;

@end

@implementation MyTableTableVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    self.tableView.reloadDatas();
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 添加 UIContextMenuInteraction 到每个表格单元格
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        UIContextMenuInteraction *interaction = [UIContextMenuInteraction.alloc initWithDelegate:self];
        [cell addInteraction:interaction];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
   
}
#pragma mark —— 一些私有方法
+(NSMutableArray<UIViewModel *> *)createDataMutArr{
    NSMutableArray <UIViewModel *>*dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG體育");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG真人");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG電子");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG彩票");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DG棋牌");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
        data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
            viewModel.textModel.text = JobsInternationalization(@"DA電子");
            viewModel.subTextModel.text = JobsInternationalization(@"");
        }));
    });return dataMutArr;
}
#pragma mark - UIContextMenuInteractionDelegate
/**
 * 当长按触发上下文菜单交互时调用此方法。
 * 返回一个 UIContextMenuConfiguration 对象，用于配置菜单的内容和行为。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param location 触发上下文菜单的位置。
 * @return 一个 UIContextMenuConfiguration 对象，用于配置菜单内容和行为。
 */
- (nullable UIContextMenuConfiguration *)contextMenuInteraction:(UIContextMenuInteraction *)interaction
                                 configurationForMenuAtLocation:(CGPoint)location {
    // 获取点击位置在表视图中的索引路径
    CGPoint locationInTableView = [self.tableView convertPoint:location fromView:interaction.view];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:locationInTableView];
    // 确保索引路径有效
    if (indexPath) {
        // 确定触发菜单的单元格
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        // 配置预览视图控制器
        UIContextMenuConfiguration *configuration = [UIContextMenuConfiguration configurationWithIdentifier:indexPath
                                                                                          previewProvider:^UIViewController * _Nullable{
            // 创建并配置预览视图控制器
            PreviewVC *previewVC = [[PreviewVC alloc] init];
            previewVC.previewText = [NSString stringWithFormat:@"Preview for row %ld", (long)indexPath.row];
            return previewVC;
        } actionProvider:^UIMenu * _Nullable(NSArray<UIMenuElement *> *suggestedActions) {
            // 创建菜单项
            UIAction *action1 = [UIAction actionWithTitle:JobsInternationalization(@"Action 1")
                                                    image:nil
                                               identifier:nil
                                                  handler:^(__kindof UIAction * _Nonnull action) {
                NSLog(@"Action 1 selected for row %ld", (long)indexPath.row);
            }];
            UIAction *action2 = [UIAction actionWithTitle:JobsInternationalization(@"Action 2")
                                                    image:nil
                                               identifier:nil
                                                  handler:^(__kindof UIAction * _Nonnull action) {
                NSLog(@"Action 2 selected for row %ld", (long)indexPath.row);
            }];
            // 创建并返回菜单
            return [UIMenu menuWithTitle:JobsInternationalization(@"") children:@[action1, action2]];
        }];return configuration;
    }return nil;
}
/**
 * 提供一个定制的 UITargetedPreview 对象，用于在高亮显示菜单项时使用。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @param identifier 被高亮显示的菜单项的标识符。
 * @return 一个定制的 UITargetedPreview 对象，或 nil 表示使用默认行为。
 */
//- (nullable UITargetedPreview *)contextMenuInteraction:(UIContextMenuInteraction *)interaction
//                                         configuration:(UIContextMenuConfiguration *)configuration
//                 highlightPreviewForItemWithIdentifier:(id<NSCopying>)identifier {
//    // 提供高亮显示时的预览
//}
/**
 * 提供一个定制的 UITargetedPreview 对象，用于在菜单项消失时使用。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @param identifier 被消失的菜单项的标识符。
 * @return 一个定制的 UITargetedPreview 对象，或 nil 表示使用默认行为。
 */
//- (nullable UITargetedPreview *)contextMenuInteraction:(UIContextMenuInteraction *)interaction
//                                         configuration:(UIContextMenuConfiguration *)configuration
//                 dismissalPreviewForItemWithIdentifier:(id<NSCopying>)identifier {
//    // 提供消失时的预览
//}
/**
 * 当用户选择一个菜单项并触发预览操作时调用此方法。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @param animator 一个动画器对象，用于自定义预览动画。
 */
- (void)contextMenuInteraction:(UIContextMenuInteraction *)interaction
willPerformPreviewActionForMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
                      animator:(id<UIContextMenuInteractionCommitAnimating>)animator {
    // 处理预览操作
}
/**
 * 当上下文菜单将要显示时调用此方法。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @param animator 一个动画器对象，用于自定义显示动画。
 */
- (void)contextMenuInteraction:(UIContextMenuInteraction *)interaction
willDisplayMenuForConfiguration:(UIContextMenuConfiguration *)configuration
                      animator:(nullable id<UIContextMenuInteractionAnimating>)animator {
    // 处理菜单显示
}
/**
 * 当上下文菜单将要结束时调用此方法。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @param animator 一个动画器对象，用于自定义结束动画。
 */
- (void)contextMenuInteraction:(UIContextMenuInteraction *)interaction
       willEndForConfiguration:(UIContextMenuConfiguration *)configuration
                      animator:(nullable id<UIContextMenuInteractionAnimating>)animator {
    // 处理菜单结束
}
/**
 * 提供一个定制的 UITargetedPreview 对象，用于在高亮显示菜单时使用。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @return 一个定制的 UITargetedPreview 对象，或 nil 表示使用默认行为。
 */
//- (nullable UITargetedPreview *)contextMenuInteraction:(UIContextMenuInteraction *)interaction
//           previewForHighlightingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration {
//    // 提供菜单高亮显示时的预览
//}
/**
 * 提供一个定制的 UITargetedPreview 对象，用于在菜单消失时使用。
 *
 * @param interaction 触发该方法的 UIContextMenuInteraction 对象。
 * @param configuration 当前菜单配置。
 * @return 一个定制的 UITargetedPreview 对象，或 nil 表示使用默认行为。
 */
//- (nullable UITargetedPreview *)contextMenuInteraction:(UIContextMenuInteraction *)interaction
//             previewForDismissingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration {
//    // 提供菜单消失时的预览
//}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (JobsBaseTableViewCell *cell in self.tbvCellMutArr) {
        cell.imageView.jobsVisible = NO;
    }
    
    JobsBaseTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.imageView.jobsVisible = !cell.imageView.jobsVisible;
    
    if (self.objectBlock) self.objectBlock(self.dataMutArr[indexPath.row]);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(46);
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = self.tbvCellMutArr[indexPath.row];
    cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.row]);
    cell.textLabel.textColor = HEXCOLOR(0x757575);
    cell.textLabel.font = UIFontWeightRegularSize(16);
    cell.textLabelFrameOffsetX = JobsWidth(16);
    cell.imageViewFrameOffsetX = JobsMainScreen_WIDTH() - JobsWidth(50);
    cell.imageView.image = JobsIMG(@"红色的对勾");
    cell.imageView.jobsVisible = NO;
    cell.backgroundColor = cell.contentView.backgroundColor = HEXCOLOR(0xFFFCF7);
    return cell;
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStyleGrouped;
        _tableView.backgroundColor = JobsWhiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tbvHeaderView;/// 这里接入的就是一个UIView的派生类
        _tableView.tableFooterView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
        });
        _tableView.separatorColor = HEXCOLOR(0xEEEEEE);
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0);
        [_tableView registerTableViewClass];
        if(@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _tableView;
}

-(BaiShaETProjChoiceStadiumTBVHeaderView *)tbvHeaderView{
    if (!_tbvHeaderView) {
        _tbvHeaderView = BaiShaETProjChoiceStadiumTBVHeaderView.new;
        _tbvHeaderView.sizer = BaiShaETProjChoiceStadiumTBVHeaderView.viewSizeByModel(nil);
        _tbvHeaderView.text = JobsInternationalization(@"選擇場館");
        _tbvHeaderView.textColor = HEXCOLOR(0x3D4A58);
        _tbvHeaderView.font = UIFontWeightBoldSize(16);
        _tbvHeaderView.textAlignment = NSTextAlignmentCenter;
    }return _tbvHeaderView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = [MyTableTableVC createDataMutArr];
    }return _dataMutArr;
}

-(NSMutableArray<JobsBaseTableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            [self.dataMutArr  enumerateObjectsUsingBlock:^(UIViewModel *_Nonnull obj,
                                                           NSUInteger idx,
                                                           BOOL *_Nonnull stop) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }];
        });
    }return _tbvCellMutArr;
}

@end

