//
//  JobsExcelLeftListView.m
//  JobsExcelView
//
//  Created by mac on 17/6/16.
//  Copyright © 2017年 Mephsito. All rights reserved.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsExcelLeftListView.h"

@interface JobsExcelLeftListView()
/// Data
@property(nonatomic,strong,nonnull)JobsExcelConfigureViewModel *excelConfigureData;

@end

@implementation JobsExcelLeftListView
@synthesize racDisposable = _racDisposable;
- (void)dealloc {
    [self.racDisposable dispose];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.tableView.alpha = 1;
    }return self;
}
#pragma mark —— BaseViewProtocol
- (jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsExcelConfigureViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.excelConfigureData = model;
        self.tableView.rowHeight = model.itemH;
        self.tableView.reloadDatas();
    };
}
#pragma mark —— UITableView 数据源
-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.excelConfigureData.rowNumber;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.excelConfigureData.itemH;
}
#pragma mark —— UITableView 代理
-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewOneCell *cell = TableViewOneCell.cellStyleValue1WithTableView(tableView);
    
    cell.backgroundColor = indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2;
    cell.jobsRichElementsCellBy(self.excelConfigureData);
    
    UIButtonModel *model = (UIButtonModel *)self.excelConfigureData.leftListDatas[indexPath.row];
    cell.jobsRichElementsCellByModel(model);
    
    return cell;
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    JobsLog(@"KKK3 = %f", scrollView.contentOffset.y);
    /// 防止在初始情况下，无意义的往下拉动👇🏻
    if (scrollView.contentOffset.y < 0) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }else{
        /// 防止在初始情况下，无意义的往上拉动👆🏻
        CGFloat d = ((self.excelConfigureData.colNumber + 1) * self.excelConfigureData.itemH - self.excelConfigureData.XZExcelH) + self.excelConfigureData.scrollOffsetY;
        if(scrollView.contentOffset.y > d) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, d);
        }
        if(scrollView.contentOffset.y <= d) {
            self.excelConfigureData.VerticalScrollValue = NSValue.byPoint(scrollView.contentOffset);
        }
    }
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
        _tableView.dataLink(self);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.buttonModelEmptyData = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            /// 这里不显示，传没有配置的UIButtonModel
        });
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _tableView;
}

@end
