//
//  MyCollectionVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 6/22/24.
//

#import "MyCollectionVC.h"

@interface MyCollectionVC ()
/// UI
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;
@property(nonatomic,strong)UICollectionView *collectionView;
/// Data
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation MyCollectionVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
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
    self.collectionView.alpha = 1;
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
    // 添加 UIContextMenuInteraction 到每个集合视图单元格
    for (UICollectionViewCell *cell in self.collectionView.visibleCells) {
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
    // 获取点击位置在集合视图中的索引路径
    CGPoint locationInCollectionView = [self.collectionView convertPoint:location fromView:interaction.view];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:locationInCollectionView];
    // 确保索引路径有效
    if (indexPath) {
        // 确定触发菜单的单元格
        UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        // 配置预览视图控制器
        UIContextMenuConfiguration *configuration = [UIContextMenuConfiguration configurationWithIdentifier:indexPath
                                                                                          previewProvider:^UIViewController * _Nullable{
            // 创建并配置预览视图控制器
            PreviewVC *previewVC = [[PreviewVC alloc] init];
            previewVC.previewText = [NSString stringWithFormat:@"Preview for item %ld", (long)indexPath.item];
            return previewVC;
        } actionProvider:^UIMenu * _Nullable(NSArray<UIMenuElement *> *suggestedActions) {
            // 创建菜单项
            UIAction *action1 = [UIAction actionWithTitle:JobsInternationalization(@"Action 1")
                                                    image:nil
                                               identifier:nil
                                                  handler:^(__kindof UIAction * _Nonnull action) {
                NSLog(@"Action 1 selected for item %ld", (long)indexPath.item);
            }];
            UIAction *action2 = [UIAction actionWithTitle:JobsInternationalization(@"Action 2")
                                                    image:nil
                                               identifier:nil
                                                  handler:^(__kindof UIAction * _Nonnull action) {
                NSLog(@"Action 2 selected for item %ld", (long)indexPath.item);
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
#pragma mark —— UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataMutArr.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    @jobs_weakify(self)
    return [self jobsCollectionViewCellPlanAtIndexPath:indexPath
                                        collectionView:collectionView
                              collectionViewCellBlock0:^UICollectionViewCell * _Nullable{
        @jobs_strongify(self)
        BaiShaETProjOrderDetailsCVCell *cell = [BaiShaETProjOrderDetailsCVCell cellWithCollectionView:collectionView forIndexPath:indexPath];
        cell.jobsRichElementsInCellWithModel(self.dataMutArr[indexPath.section]);
        return cell;
    }
                              collectionViewCellBlock1:nil
                              collectionViewCellBlock2:nil
                              collectionViewCellBlock3:nil
                              collectionViewCellBlock4:nil];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 1;
}
#pragma mark —— UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self jobsCellPlanSizeForSectionAtIndexPath:indexPath.section
                                            cellBlock0:^CGSize{
        return [BaiShaETProjOrderDetailsCVCell cellSizeWithModel:self.dataMutArr[indexPath.section]];
    }
                                            cellBlock1:nil
                                            cellBlock2:nil
                                            cellBlock3:nil
                                            cellBlock4:nil];
}
/// 定义的是元素垂直之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return JobsWidth(12);
}
/// 定义的是UICollectionViewScrollDirectionVertical下，元素水平之间的间距。
/// UICollectionViewScrollDirectionHorizontal下，垂直和水平正好相反
/// Api自动计算一行的Cell个数，只有当间距小于此定义的最小值时才会换行，最小执行单元是Section（每个section里面的样式是统一的）
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
/// 内间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    return jobsSameEdgeInset(16);
}
#pragma mark —— lazyLoad
-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = UICollectionViewFlowLayout.new;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }return _layout;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero
                                           collectionViewLayout:self.layout];
        _collectionView.backgroundColor = HEXCOLOR(0xFCFBFB);
        _collectionView.dataLink(self);
        _collectionView.showsVerticalScrollIndicator = NO;
        
        _collectionView.registerCollectionViewClass();
        
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(self.gk_navigationBar.mas_bottom);
            make.bottom.equalTo(self.view).offset(JobsBottomSafeAreaHeight() + JobsWidth(64));
        }];
    }return _collectionView;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        {
            NSMutableArray <UIViewModel *>*mutArr = NSMutableArray.array;
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = JobsInternationalization(@"存款金额");
                viewModel.subTextModel.text = JobsInternationalization(@"10,000.00");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = JobsInternationalization(@"存款方式");
                viewModel.subTextModel.text = JobsInternationalization(@"虛擬幣充值");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = JobsInternationalization(@"訂單編號");
                viewModel.subTextModel.text = JobsInternationalization(@"YSF2025022302644565964");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = JobsInternationalization(@"轉賬姓名");
                viewModel.subTextModel.text = JobsInternationalization(@"張三 ");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = JobsInternationalization(@"銀行賬號");
                viewModel.subTextModel.text = JobsInternationalization(@"6230 5822 0031 5762 430");
                [mutArr addObject:viewModel];
            }
            
            {
                UIViewModel *viewModel = UIViewModel.new;
                viewModel.textModel.text = JobsInternationalization(@"轉賬地址");
                viewModel.subTextModel.text = JobsInternationalization(@"中國平安銀行");
                [mutArr addObject:viewModel];
            }
            UIViewModel *viewModel = UIViewModel.new;
            viewModel.jobsDataMutArr = mutArr;
            [_dataMutArr addObject:viewModel];
        }
    }return _dataMutArr;
}

@end
