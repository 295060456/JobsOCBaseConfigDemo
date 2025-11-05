//
//  JobsIMListView.m
//  JobsIM
//
//  Created by Jobs on 2020/11/17.
//

#import "JobsIMListView.h"

@interface JobsIMListView ()
/// UI
Prop_strong()UIColor *bgColour;
/// Data
Prop_strong()NSMutableArray <JobsIMListDataModel *>*jobsIMListMutArr;

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
    JobsIMListTBVCell *cell = JobsIMListTBVCell.cellStyleValue1WithTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .byDelegate(self)
        .jobsRichElementsTableViewCellBy(self.jobsIMListMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {
             
        });
    return cell.byAllowsMultipleSwipe(YES);
}
#pragma mark —— MGSwipeTableCellDelegate
-(void)swipeTableCellWillBeginSwiping:(nonnull MGSwipeTableCell *)cell{
    NSObject.feedbackGenerator(nil);//震动反馈
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
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self);
            tableView.backgroundColor = self.bgColour;
            tableView.pagingEnabled = YES;//这个属性为YES会使得Tableview一格一格的翻动
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            tableView.showsVerticalScrollIndicator = NO;
            [self.addSubview(tableView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
            {
                tableView.mj_header = self.LOTAnimationMJRefreshHeaderBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
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
                tableView.mj_footer = self.MJRefreshAutoGifFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.stateIdleTitle = JobsInternationalization(@"");
                    data.pullingTitle = JobsInternationalization(@"");
                    data.refreshingTitle = JobsInternationalization(@"");
                    data.willRefreshTitle = JobsInternationalization(@"");
                    data.noMoreDataTitle = JobsInternationalization(@"");
                    data.loadBlock = ^id _Nullable(id  _Nullable data) {
                        @jobs_strongify(self)
                        JobsLog(@"上拉加载更多");
                        // 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                        tableView.pagingEnabled = NO;
                        tableView.mj_footer.state = MJRefreshStateIdle;
                        tableView.mj_footer.hidden = YES;
                        tableView.pagingEnabled = YES;
                        tableView.endRefreshing(self.jobsIMListMutArr.count);
                        return nil;
                    };
                }));
                tableView.mj_footer.backgroundColor = JobsRedColor;
                tableView.mj_footer.hidden = NO;
            }
        });
    }return _tableView;
}

-(NSMutableArray<JobsIMListDataModel *> *)jobsIMListMutArr{
    if (!_jobsIMListMutArr) {
        _jobsIMListMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<JobsIMListDataModel *> * _Nullable arr) {
            arr.add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.usernameStr = @"马化腾";
                model.contentStr = @"晚上西藏饭店3楼喜马拉雅厅不见不散，到了电话";
                model.timeStr = @"22:54";
                model.userHeaderIMG = UIImage.animatedGIFByName(@"动态头像_1 尺寸126");
            })).add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.usernameStr = @"马云";
                model.contentStr = @"刘总请再给我一次机会";
                model.timeStr = @"05:34";
                model.userHeaderIMG = UIImage.animatedGIFByName(@"动态头像_2 尺寸126");
            })).add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.usernameStr = @"李嘉诚";
                model.contentStr = @"小刘我很看好你，什么时候有空过来坐坐";
                model.timeStr = @"02:14";
                model.userHeaderIMG = UIImage.animatedGIFByName(@"动态头像_1 尺寸126");
            })).add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.usernameStr = @"蔚来卡地亚花园城营销小王";
                model.contentStr = @"刘总给你留了一套独栋，什么时候有空过来办手续";
                model.timeStr = @"20:34";
                model.userHeaderIMG = UIImage.animatedGIFByName(@"动态头像_1\2 尺寸126");;
            }));
        });
    }return _jobsIMListMutArr;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = self.byPatternImage(JobsBuddleIMG(@"⚽️PicResource", @"Telegram",nil, @"1"));
    }return _bgColour;
}

@end
