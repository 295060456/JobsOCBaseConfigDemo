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
             
        }).byBgCor(indexPath.row % 2 ? self.excelConfigureData.cor1 : self.excelConfigureData.cor2);
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
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                }))
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = JobsInternationalization(@"NO MESSAGES FOUND");
                    data.titleCor = JobsWhiteColor;
                    data.titleFont = bayonRegular(JobsWidth(30));
                    data.normalImage = JobsIMG(@"小狮子");
                }))
                .showsVerticalScrollIndicatorBy(NO)
                .showsHorizontalScrollIndicatorBy(NO)
                .byScrollEnabled(YES)
                .byBgCor(JobsClearColor);

            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            
//            {
//                tableView.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
//                    @jobs_strongify(self)
//                    self.feedbackGenerator(nil);//震动反馈
//                    self->_tableView.endRefreshing(YES);
//                    return nil;
//                }]);
//                tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
//            }
            
//            {/// 设置tabAnimated相关属性
//                // 可以不进行手动初始化，将使用默认属性
//                tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                      cellHeight:[JobsBaseTableViewCell cellHeightWithModel:nil]];
//                tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//                [tableView tab_startAnimation];   // 开启动画
//            }
            
//            {
//              [tableView xzm_addNormalHeaderWithTarget:self
//                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
//                                                                                     id _Nullable arg) {
//                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
//                  @jobs_strongify(self)
//                  /// 在需要结束刷新的时候调用（只能调用一次）
//                  /// _tableView.endRefreshing();
//                  return nil;
//              }, MethodName(self), self)];
//
//              [tableView xzm_addNormalFooterWithTarget:self
//                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
//                                                                                     id _Nullable arg) {
//                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
//                  @jobs_strongify(self)
//                  /// 在需要结束刷新的时候调用（只能调用一次）
//                  /// _tableView.endRefreshing();
//                  return nil;
//              }, MethodName(self), self)];
//              [tableView.xzm_header beginRefreshing];
//          }
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }).on().dataLink(self);/// dataLink(self)不能写在Block里面，会出问题
    }return _tableView;
}

@end
