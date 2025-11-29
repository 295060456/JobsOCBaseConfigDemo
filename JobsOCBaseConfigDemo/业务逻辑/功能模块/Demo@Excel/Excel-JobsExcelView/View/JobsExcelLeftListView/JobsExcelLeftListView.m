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
Prop_strong(nonnull)JobsExcelConfigureViewModel *excelConfigureData;

@end

@implementation JobsExcelLeftListView
/// RACProtocol
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
        self.tableView.byShow(self);
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
    @jobs_weakify(self)
    return TableViewOneCell.cellStyleValue1WithTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .byIndexPath(indexPath)
        .jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable vm) {
            @jobs_strongify(self)
            vm.data = self.excelConfigureData;
            vm.buttonModel = (UIButtonModel *)self.excelConfigureData.leftListDatas[indexPath.row];
        }))
        .JobsBlock1(^(id _Nullable data) {
             
        }).byBgColor(indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2);
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
-(UITableView *)tableView{
    if (!_tableView) {
        /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
        @jobs_weakify(self)
        _tableView = self.addSubview(jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
//                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = @"NO MESSAGES FOUND".tr;
                    data.titleCor = JobsWhiteColor;
                    data.titleFont = bayonRegular(JobsWidth(30));
                    data.normalImage = @"小狮子".img;
                }))
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byBgColor(JobsClearColor);

            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }))
        .addOn(self)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        });
    }return _tableView;
}

@end
