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
@property(nonatomic,strong)JobsExcelConfigureViewModel *_Nonnull excelConfigureData;
@property(nonatomic,assign)CGPoint contentOffenset;

@end

@implementation JobsExcelContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.reloadDatas();
    }return self;
}
#pragma mark —— BaseViewProtocol
- (jobsByIDBlock _Nonnull)jobsRichViewByModel {
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.excelConfigureData = model;
        self.tableView.rowHeight = self.excelConfigureData.itemH;
        self.tableView.reloadDatas();
    };
}
#pragma mark —— UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.excelConfigureData.colNumber;
}
#pragma mark —— UITableViewDataSource
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = MainTableViewCell.cellStyleValue1WithTableView(tableView);
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.jobsRichElementsInCellWithModel(self.excelConfigureData);
//    cell.backgroundColor = cell.contentView.backgroundColor = indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2;
    cell.jobsRichElementsInCellWithModel2(self.excelConfigureData.contentArr[indexPath.row]);
    return cell;
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        [self.excelConfigureData.verticalScrollSignal sendNext:[NSValue valueWithCGPoint:scrollView.contentOffset]];
        self.configureContentOffSet(self.contentOffenset);
    }
}
#pragma mark —— MianTableViewCellDelegate
-(void)mianTableViewCellScrollerDid:(UIScrollView *)scrollview{
    if (scrollview.contentOffset.y != 0) {
        scrollview.contentOffset = CGPointMake(scrollview.contentOffset.x, 0);
        return;
    }
    self.contentOffenset = scrollview.contentOffset;
    [self.excelConfigureData.horizontalScrollSignal sendNext:[NSValue valueWithCGPoint:scrollview.contentOffset]];
    self.configureContentOffSet(scrollview.contentOffset);
}
#pragma mark —— 一些共有方法
-(jobsByPointBlock _Nonnull)configureContentOffSet{
    return ^(CGPoint point){
        [self.tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof MainTableViewCell *_Nonnull cell,
                                                                  NSUInteger idx,
                                                                  BOOL *_Nonnull stop) {
            [cell scrollerItemWithContentOffset:point];
        }];
    };
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
