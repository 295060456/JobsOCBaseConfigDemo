//
//  A_VC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "A_VC.h"

@interface A_VC ()

@end

@implementation A_VC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = JobsInternationalization(@"");
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsYellowColor;
    
    self.makeNavByAlpha(1);
    
    self.tableView.reloadDatas();
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— UINavigationControllerDelegate
// nav 协议方法的实现 告知 Nav 去使用 UIViewControllerAnimatedTransitioning协议中的方法
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return [toVC isKindOfClass:B_VC.class] ? PushAnimation.new : nil;
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MyFansTBVCell.cellHeightByModel(nil);
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    B_VC *b = B_VC.new;
    b.indexPath = indexPath;
    self.comingToPushVCByRequestParams(b,jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        data.image = toStringByNSInteger(indexPath.row).add(@".jpeg").img;
        data.backBtnTitleModel.text = @"B_VC";
    }));
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(void)tableView:(UITableView *)tableView
didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    // highlight的时候，做一下缩放的动画
    MyFansTBVCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [UIView animateWithDuration:0.3
                     animations:^{
        cell.transform = CGAffineTransformMakeScale(0.97, 0.97);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3
                         animations:^{
            cell.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    }];
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return MyFansTBVCell.cellStyleValue1WithTableView(tableView)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(@(indexPath.row % 4))
            .JobsBlock1(^(id _Nullable data) {
             
            });
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self);
            tableView.backgroundColor = JobsWhiteColor;
            tableView.pagingEnabled = YES;//这个属性为YES会使得Tableview一格一格的翻动
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.showsVerticalScrollIndicator = NO;
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0 ;
            tableView.mj_header = self.mjRefreshGifHeader;
            tableView.mj_footer = self.mjRefreshAutoGifFooter;
            tableView.mj_footer.hidden = NO;
            [self.view.addSubview(tableView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            }];self.view.refresh();
        });
    }return _tableView;
}

@end
