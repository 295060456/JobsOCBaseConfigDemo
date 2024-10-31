//
//  JobsExcelContentView.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsExcelContentView.h"

@interface JobsExcelContentView()
/// Data
@property(nonatomic,strong)JobsExcelConfigureViewModel *excelConfigureData;
@property(nonatomic,assign)CGPoint contentOffenset;

@end

@implementation JobsExcelContentView

-(void)dealloc{
    [self.excelConfigureData removeObserver:self forKeyPath:VerticalScrollBegin];
    [self.excelConfigureData removeObserver:self forKeyPath:HorizontalScrollBegin];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.reloadDatas();
    }return self;
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.excelConfigureData = model;
        self.tableView.rowHeight = self.excelConfigureData.itemH;
        [self.tableView reloadData];
        
        [self.excelConfigureData addObserver:self
                         forKeyPath:VerticalScrollBegin
                            options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                            context:nil];
        
        [self.excelConfigureData addObserver:self
                         forKeyPath:HorizontalScrollBegin
                            options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                            context:nil];
    };
}
#pragma mark —— KVO 监听
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    JobsExcelConfigureViewModel *excelConfigureData = (JobsExcelConfigureViewModel *)object;
    if ([keyPath isEqualToString:VerticalScrollBegin]) {
        self.tableView.contentOffset = excelConfigureData.VerticalScrollValue.CGPointValue;
    }else if ([keyPath isEqualToString:HorizontalScrollBegin]){
       [self configureContentOffSet:excelConfigureData.HorizontalScrollValue.CGPointValue];
    }
}
#pragma mark —— UITableView 数据源
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.excelConfigureData.colNumber;
}
#pragma mark —— UITableView 代理
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = MainTableViewCell.cellStyleValue1WithTableView(tableView);
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.jobsRichElementsInCellWithModel(self.excelConfigureData);
    cell.backgroundColor = cell.contentView.backgroundColor = indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2;
    cell.jobsRichElementsInCellWithModel2(self.excelConfigureData.contentArr[indexPath.row]);
    return cell;
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        self.excelConfigureData.jobsKVC(VerticalScrollBegin,[NSValue valueWithCGPoint:scrollView.contentOffset]);
        [self configureContentOffSet:self.contentOffenset];
    }
}
#pragma mark —— MianTableViewCellDelegate
- (void)mianTableViewCellScrollerDid:(UIScrollView *)scrollview{
    if (scrollview.contentOffset.y != 0) {
        scrollview.contentOffset = CGPointMake(scrollview.contentOffset.x, 0);
        return;
    }
    self.contentOffenset = scrollview.contentOffset;
    self.excelConfigureData.jobsKVC(HorizontalScrollBegin,[NSValue valueWithCGPoint:scrollview.contentOffset]);
    [self configureContentOffSet:scrollview.contentOffset];
}

- (void)configureContentOffSet:(CGPoint)point{
    [self.tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof MainTableViewCell * _Nonnull cell,
                                                              NSUInteger idx,
                                                              BOOL * _Nonnull stop) {
        [cell scrollerItemWithContentOffset:point];
    }];
}
#pragma mark —— LazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _tableView.dataLink(self);
        _tableView.rowHeight = self.excelConfigureData.itemH;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _tableView;
}

@end
