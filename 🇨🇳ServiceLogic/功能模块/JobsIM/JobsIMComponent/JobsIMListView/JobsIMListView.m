//
//  JobsIMListView.m
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsIMListView.h"

@interface JobsIMListView ()
/// UI
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIColor *bgColour;
/// Data
@property(nonatomic,strong)NSMutableArray <JobsIMListDataModel *>*jobsIMListMutArr;

@end

@implementation JobsIMListView

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(id _Nullable)model{
    self.tableView.alpha = 1;
}
#pragma mark —— 一些私有方法
/// 下拉刷新
-(void)pullToRefresh{
    NSLog(@"下拉刷新");
    [self endRefreshing:self.tableView];
}
///上拉加载更多
- (void)loadMoreRefresh{
    NSLog(@"上拉加载更多");
//    [self.tableView reloadData];
    //特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
    self.tableView.pagingEnabled = NO;
    @jobs_weakify(self)
    [self delay:2
          doSth:^(id data) {
        @jobs_strongify(self)
        [self delayMethods];
    }];
}

-(void)delayMethods{
    self.tableView.mj_footer.state = MJRefreshStateIdle;
    self.tableView.mj_footer.hidden = YES;
    self.tableView.pagingEnabled = YES;
}
#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JobsIMListTBVCell cellHeightWithModel:nil];
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objectBlock) self.objectBlock(self.jobsIMListMutArr[indexPath.row]);
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.jobsIMListMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsIMListTBVCell *cell = [JobsIMListTBVCell cellStyleValue1WithTableView:tableView];
    cell.indexPath = indexPath;
    cell.delegate = self;
    cell.allowsMultipleSwipe = YES;
    [cell richElementsInCellWithModel:self.jobsIMListMutArr[indexPath.row]];
    return cell;
}
#pragma mark —— MGSwipeTableCellDelegate
-(void)swipeTableCellWillBeginSwiping:(nonnull MGSwipeTableCell *)cell{
    [self feedbackGenerator];//震动反馈
}
/// 点击了第几个滑动出现的按钮？
-(BOOL)swipeTableCell:(MGSwipeTableCell *)cell
  tappedButtonAtIndex:(NSInteger)index
            direction:(MGSwipeDirection)direction
        fromExpansion:(BOOL)fromExpansion{
    NSLog(@"Delegate: button tapped, %@ position, index %d, from Expansion: %@",direction == MGSwipeDirectionLeftToRight ? @"left" : @"right", (int)index, fromExpansion ? @"YES" : @"NO");
    return YES;
}

-(void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Tapped accessory button");
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.new;
        _tableView.backgroundColor = self.bgColour;
        _tableView.pagingEnabled = YES;//这个属性为YES会使得Tableview一格一格的翻动
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"noData"
                                                            titleStr:@"暂无数据"
                                                           detailStr:@""];
        
        if (self.jobsIMListMutArr.count) {
            [_tableView ly_hideEmptyView];
        }else{
            [_tableView ly_showEmptyView];
        }
        
//        _tableView.mj_header = MJRefreshWithLottieTableViewHeader.new;
//        _tableView.mj_header.jsonString = @"12345.json";
//        [_tableView.mj_header beginRefreshing];
        _tableView.mj_footer.hidden = NO;
        
        @jobs_weakify(self)
        _tableView.mj_header = [LOTAnimationMJRefreshHeader headerWithRefreshingBlock:^{
            @jobs_strongify(self)
            sleep(3);
            [self pullToRefresh];
        }];
        
    }return _tableView;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = [UIColor colorWithPatternImage:JobsBuddleIMG(@"⚽️PicResource", @"Telegram",nil, @"1")];
    }return _bgColour;
}

-(NSMutableArray<JobsIMListDataModel *> *)jobsIMListMutArr{
    if (!_jobsIMListMutArr) {
        _jobsIMListMutArr = NSMutableArray.array;
        
        JobsIMListDataModel *model0 = JobsIMListDataModel.new;
        model0.usernameStr = @"马化腾";
        model0.contentStr = @"晚上西藏饭店3楼喜马拉雅厅不见不散，到了电话";
        model0.timeStr = @"22:54";
        model0.userHeaderIMG = [UIImage animatedGIFNamed:@"动态头像_1 尺寸126"];
        
        JobsIMListDataModel *model1 = JobsIMListDataModel.new;
        model1.usernameStr = @"马云";
        model1.contentStr = @"刘总请再给我一次机会";
        model1.timeStr = @"05:34";
        model1.userHeaderIMG = [UIImage animatedGIFNamed:@"动态头像_2 尺寸126"];
        
        JobsIMListDataModel *model2 = JobsIMListDataModel.new;
        model2.usernameStr = @"李嘉诚";
        model2.contentStr = @"小刘我很看好你，什么时候有空过来坐坐";
        model2.timeStr = @"02:14";
        model2.userHeaderIMG = [UIImage animatedGIFNamed:@"动态头像_1 尺寸126"];
        
        JobsIMListDataModel *model3 = JobsIMListDataModel.new;
        model3.usernameStr = @"蔚来卡地亚花园城营销小王";
        model3.contentStr = @"刘总给你留了一套独栋，什么时候有空过来办手续";
        model3.timeStr = @"20:34";
        model3.userHeaderIMG = [UIImage animatedGIFNamed:@"动态头像_2 尺寸126"];
        
        [_jobsIMListMutArr addObject:model0];
        [_jobsIMListMutArr addObject:model1];
        [_jobsIMListMutArr addObject:model2];
        [_jobsIMListMutArr addObject:model3];
        
    }return _jobsIMListMutArr;
}

@end
