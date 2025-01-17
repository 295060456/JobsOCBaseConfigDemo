//
//  JobsIMListView.m
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsIMListView.h"

@interface JobsIMListView ()
/// UI
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
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.tableView.reloadDatas();
    };
}
#pragma mark —— 一些私有方法

#pragma mark —————————— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsIMListTBVCell.cellHeightByModel(nil);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objBlock) self.objBlock(self.jobsIMListMutArr[indexPath.row]);
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.jobsIMListMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsIMListTBVCell *cell = JobsIMListTBVCell.cellStyleValue1WithTableView(tableView);
    cell.indexPath = indexPath;
    cell.delegate = self;
    cell.allowsMultipleSwipe = YES;
    cell.jobsRichElementsCellBy(self.jobsIMListMutArr[indexPath.row]);
    return cell;
}
#pragma mark —— MGSwipeTableCellDelegate
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
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        {
            _tableView.mj_header = self.LOTAnimationMJRefreshHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"下拉刷新数据");
                data.pullingTitle = JobsInternationalization(@"下拉刷新数据");
                data.refreshingTitle = JobsInternationalization(@"正在刷新数据");
                data.willRefreshTitle = JobsInternationalization(@"刷新数据中");
                data.noMoreDataTitle = JobsInternationalization(@"下拉刷新数据");
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    JobsLog(@"下拉刷新");
                    self.tableView.endRefreshing(self.jobsIMListMutArr.count);
                    return nil;
                };
            }));
            _tableView.mj_footer = self.MJRefreshAutoGifFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                data.stateIdleTitle = JobsInternationalization(@"");
                data.pullingTitle = JobsInternationalization(@"");
                data.refreshingTitle = JobsInternationalization(@"");
                data.willRefreshTitle = JobsInternationalization(@"");
                data.noMoreDataTitle = JobsInternationalization(@"");
                data.loadBlock = ^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self)
                    JobsLog(@"上拉加载更多");
                    // 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                    self.tableView.pagingEnabled = NO;
                    self.tableView.mj_footer.state = MJRefreshStateIdle;
                    self.tableView.mj_footer.hidden = YES;
                    self.tableView.pagingEnabled = YES;
                    self.tableView.endRefreshing(self.jobsIMListMutArr.count);
                    return nil;
                };
            }));
            _tableView.mj_footer.backgroundColor = JobsRedColor;
            _tableView.mj_footer.hidden = NO;
        }
    }return _tableView;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = self.byPatternImage(JobsBuddleIMG(@"⚽️PicResource", @"Telegram",nil, @"1"));
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
