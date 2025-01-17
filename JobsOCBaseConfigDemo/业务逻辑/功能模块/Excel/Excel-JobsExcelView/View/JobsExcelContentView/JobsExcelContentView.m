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
@property(nonatomic,strong,nonnull)JobsExcelConfigureViewModel *excelConfigureData;
@property(nonatomic,assign)CGPoint contentOffenset;

@end

@implementation JobsExcelContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView.reloadDatas();
    }return self;
}
/// 在某些情况下，当UITableView加载到一个子UIView上的时候，只有在layoutSubviews刷新页面的时候，UITableView才会有Frame
-(void)layoutSubviews{
    [super layoutSubviews];
    self.tableView.reloadDatas();
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
    return self.excelConfigureData.rowNumber;
}
#pragma mark —— UITableViewDataSource
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = MainTableViewCell.cellStyleValue1WithTableView(tableView);
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.jobsRichElementsCellBy(self.excelConfigureData);
//    cell.backgroundColor = cell.contentView.backgroundColor = indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2;
    cell.jobsRichElementsCellByModel(self.excelConfigureData.contentArr[indexPath.row]);
    return cell;
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        [self.excelConfigureData.verticalScrollSignal sendNext:NSValue.byPoint(scrollView.contentOffset)];
        self.configureContentOffSet(self.contentOffenset);
    }
}
#pragma mark —— MianTableViewCellDelegate
-(jobsByScrollViewBlock _Nonnull)mianTableViewCellScrollerDid{
    @jobs_weakify(self)
    return ^(__kindof UIScrollView *_Nullable scrollView){
        @jobs_strongify(self)
        if (scrollView.contentOffset.y != 0) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
            return;
        }
        self.contentOffenset = scrollView.contentOffset;
        [self.excelConfigureData.horizontalScrollSignal sendNext:NSValue.byPoint(scrollView.contentOffset)];
        self.configureContentOffSet(scrollView.contentOffset);
    };
}
#pragma mark —— 一些共有方法
-(jobsByPointBlock _Nonnull)configureContentOffSet{
    @jobs_weakify(self)
    return ^(CGPoint point){
        @jobs_strongify(self)
        [self.tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof MainTableViewCell *_Nonnull cell,
                                                                  NSUInteger idx,
                                                                  BOOL *_Nonnull stop) {
            cell.scrollerItemBy(point);
        }];
    };
}
#pragma mark —— LazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = UITableView.initWithStylePlain;
        _tableView.backgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
        _tableView.dataLink(self);
        _tableView.rowHeight = self.excelConfigureData.itemH;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.buttonModelEmptyData = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.title = JobsInternationalization(@"No Datas");
            data.titleCor = JobsWhiteColor;
            data.titleFont = bayonRegular(JobsWidth(30));
            data.normalImage = JobsIMG(@"暂无数据");
            data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponentBy(0);
            data.jobsOffsetX = JobsWidth(-100);
            data.jobsOffsetY = 0;
        });
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }return _tableView;
}

@end
