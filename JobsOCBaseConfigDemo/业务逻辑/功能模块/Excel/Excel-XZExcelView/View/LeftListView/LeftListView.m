//
//  LeftListView.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "LeftListView.h"

@interface LeftListView()

@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,strong)NSValue *VerticalScrollValue;/**垂直滚动 */

@end

@implementation LeftListView

- (void)dealloc{
     [self.viewModel removeObserver:self forKeyPath:VerticalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableV.alpha = 1;
    }return self;
}

- (void)viewBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel = viewModel;
    self.tableV.rowHeight = viewModel.itemH;
    [self.viewModel addObserver:self
                     forKeyPath:VerticalScrollBegin
                        options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                        context:nil];
}
#pragma mark —— KVO 监听
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    XZExcelConfigureViewModel *viewModel = (XZExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:VerticalScrollBegin]) {
        self.tableV.contentOffset=viewModel.VerticalScrollValue.CGPointValue;
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
    TableViewOneCell *cell = [TableViewOneCell dequeneCellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewOneCell *showCell = (TableViewOneCell *)cell;
    showCell.backgroundColor = indexPath.row %2 ? JobsCor(@"#000000").colorWithAlphaComponent(.3f) : JobsCor(@"#4B00AB").colorWithAlphaComponent(.3f);
    [showCell cellBindViewModel:self.viewModel];
    TableModel *model = self.viewModel.contentArr[indexPath.row];
    [showCell cellBindModel:model];
}
#pragma mark —— scrollerView代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.viewModel setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:VerticalScrollBegin];
}
#pragma mark —— lazyLoad
- (UITableView *)tableV{
    if (!_tableV) {
        _tableV = [UITableView.alloc initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableV.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableV];
        [_tableV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _tableV;
}

@end
