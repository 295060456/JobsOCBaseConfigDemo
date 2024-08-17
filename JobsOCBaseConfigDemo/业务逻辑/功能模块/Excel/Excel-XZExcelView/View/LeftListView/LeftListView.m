//
//  LeftListView.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "LeftListView.h"

@interface LeftListView()
/// UI
@property(nonatomic,strong)UITableView *tableView;
/// Data
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,strong)NSValue *VerticalScrollValue;/**垂直滚动 */

@end

@implementation LeftListView

- (void)dealloc{
     [self.viewModel removeObserver:self forKeyPath:VerticalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.alpha = 1;
    }return self;
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(XZExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.tableView.rowHeight = model.itemH;
        [self.viewModel addObserver:self
                         forKeyPath:VerticalScrollBegin
                            options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                            context:nil];
    };
}
#pragma mark —— KVO 监听
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    XZExcelConfigureViewModel *viewModel = (XZExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:VerticalScrollBegin]) {
        self.tableView.contentOffset = viewModel.VerticalScrollValue.CGPointValue;
    }
}
#pragma mark —— UITableView 数据源
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return  self.viewModel.rowNumber;
}
#pragma mark —— UITableView 代理
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewOneCell *cell = TableViewOneCell.cellStyleValue1WithTableView(tableView);
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewOneCell *showCell = (TableViewOneCell *)cell;
    showCell.backgroundColor = indexPath.row %2 ? JobsCor(@"#000000").colorWithAlphaComponent(.3f) : JobsCor(@"#4B00AB").colorWithAlphaComponent(.3f);
    showCell.jobsRichElementsInCellWithModel(self.viewModel);
    
    TableModel *model = self.viewModel.contentArr[indexPath.row];
    showCell.jobsRichElementsInCellWithModel2(model);
}
#pragma mark —— scrollerView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /// 防止在初始情况下，无意义的往下拉动
    if (scrollView.contentOffset.y < 0) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }else{
        self.viewModel.jobsKVC(VerticalScrollBegin,[NSValue valueWithCGPoint:scrollView.contentOffset]);
    }
}
#pragma mark —— lazyLoad
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _tableView.dataLink(self);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _tableView;
}

@end
