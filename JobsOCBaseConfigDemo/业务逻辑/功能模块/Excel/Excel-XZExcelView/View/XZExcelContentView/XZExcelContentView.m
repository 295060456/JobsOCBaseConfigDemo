//
//  XZExcelContentView.m
//  XZExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//

#import "XZExcelContentView.h"

@interface XZExcelContentView()

@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)XZExcelConfigureViewModel *viewModel;
@property(nonatomic,assign)CGPoint contentOffenset;

@end

@implementation XZExcelContentView

- (void)dealloc{
    [self.viewModel removeObserver:self forKeyPath:VerticalScrollBegin];
    [self.viewModel removeObserver:self forKeyPath:HorizontalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableV.alpha = 1;
    }return self;
}

- (void)viewBindViewModel:(XZExcelConfigureViewModel *)viewModel{
    self.viewModel = viewModel;
    self.tableV.rowHeight = self.viewModel.itemH;
    [self.tableV reloadData];
    
    [self.viewModel addObserver:self
                     forKeyPath:VerticalScrollBegin
                        options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                        context:nil];
    
    [self.viewModel addObserver:self
                     forKeyPath:HorizontalScrollBegin
                        options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                        context:nil];
}
#pragma mark —— KVO 监听
- (void)observeValueForKeyPath:(NSString *)keyPath 
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    XZExcelConfigureViewModel *viewModel=(XZExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:VerticalScrollBegin]) {
        self.tableV.contentOffset=viewModel.VerticalScrollValue.CGPointValue;
    }else if ([keyPath isEqualToString:HorizontalScrollBegin]){
       [self configureContentOffSet:viewModel.HorizontalScrollValue.CGPointValue];
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
    
    MainTableViewCell *cell=[MainTableViewCell dequeneCellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCell *showCell=(MainTableViewCell *)cell;
    showCell.delegate=self;
    [showCell cellBindViewModel:self.viewModel];
    
    TableModel *model=self.viewModel.contentArr[indexPath.row];
    [showCell cellBindModel:model];
}
#pragma mark —— scroller 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableV) {
        [self.viewModel setValue:[NSValue valueWithCGPoint:scrollView.contentOffset]
                          forKey:VerticalScrollBegin];
        [self configureContentOffSet:self.contentOffenset];
    }
}
#pragma mark ——  mainCell 代理
- (void)mianTableViewCellScrollerDid:(UIScrollView *)scrollview{
    if (scrollview.contentOffset.y != 0) {
        scrollview.contentOffset = CGPointMake(scrollview.contentOffset.x, 0);
        return;
    }
    self.contentOffenset = scrollview.contentOffset;
    [self.viewModel setValue:[NSValue valueWithCGPoint:scrollview.contentOffset]
                      forKey:HorizontalScrollBegin];
    [self configureContentOffSet:scrollview.contentOffset];
}

- (void)configureContentOffSet:(CGPoint )point{
    [self.tableV.visibleCells enumerateObjectsUsingBlock:^(__kindof MainTableViewCell * _Nonnull cell,
                                                           NSUInteger idx,
                                                           BOOL * _Nonnull stop) {
        [cell scrollerItemWithContentOffset:point];
    }];
}
#pragma mark —— LazyLoad
- (UITableView *)tableV{
    if (!_tableV) {
        _tableV = [UITableView.alloc initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.rowHeight = self.viewModel.itemH;
        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableV];
        [_tableV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];

    }return _tableV;
}

@end
