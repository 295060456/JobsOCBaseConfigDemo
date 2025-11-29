//
//  UITableView+Extra.m
//  DouDong-II
//
//  Created by Jobs on 2021/4/10.
//

#import "UITableView+Extra.h"

@implementation UITableView (Extra)
#pragma mark —— 数据源
-(JobsRetScrollViewByIDBlock _Nonnull)dataLink{
    @jobs_weakify(self)
    return ^__kindof UITableView *(id _Nonnull target) {
        @jobs_strongify(self)
        self.byDelegate(target);
        self.byDataSource(target);
        return self;
    };
}
/// 用于显示 UITableView
-(JobsRetScrollViewByIDBlock _Nonnull)byShow{
    @jobs_weakify(self)
    return ^__kindof UITableView *(id _Nonnull target) {
        @jobs_strongify(self)
        self.dataLink(target);
        self.reloadDatas();
        return self;
    };
}
#pragma mark —— UITableView
+(instancetype)initWithStylePlain{
    return [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStylePlain];
}

+(instancetype)initWithStyleGrouped{
    return [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStyleGrouped];
}

+(instancetype)initWithStyleInsetGrouped API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos){
    return [UITableView.alloc initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
}
#pragma mark —— BaseTableViewProtocol
-(JobsRetTableViewByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(id <UITableViewDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.delegate = delegate;
        return self;
    };
}

-(JobsRetTableViewByDataSourceBlock _Nonnull)byDataSource{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(id <UITableViewDataSource>_Nullable dataSource){
        @jobs_strongify(self)
        self.dataSource = dataSource;
        return self;
    };
}

-(JobsRetTableViewByDataSourcePrefetchingBlock _Nonnull)byDataSourcePrefetching API_AVAILABLE(ios(10.0)){
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(id <UITableViewDataSourcePrefetching>_Nullable dataSourcePrefetching){
        @jobs_strongify(self)
        self.prefetchDataSource = dataSourcePrefetching;
        return self;
    };
}

-(JobsRetTableViewByDragDelegateBlock _Nonnull)byDragDelegate API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(id <UITableViewDragDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.dragDelegate = delegate;
        return self;
    };
}

-(JobsRetTableViewByDropDelegateBlock _Nonnull)byDropDelegate API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(id <UITableViewDropDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.dropDelegate = delegate;
        return self;
    };
}

-(JobsRetTableViewByCellSeparatorStyleBlock _Nonnull)bySeparatorStyle{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(UITableViewCellSeparatorStyle style){
        @jobs_strongify(self)
        self.separatorStyle = style;
        return self;
    };
}

-(JobsRetTableViewByUIScrollViewContentInsetAdjustmentBehaviorBlock _Nonnull)byContentInsetAdjustmentBehavior API_AVAILABLE(ios(11.0), tvos(11.0)) API_UNAVAILABLE(watchos){
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(UIScrollViewContentInsetAdjustmentBehavior behavior){
        @jobs_strongify(self)
        self.contentInsetAdjustmentBehavior = behavior;
        return self;
    };
}

-(JobsRetTableViewByCorBlock _Nonnull)bySeparatorColor{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.separatorColor = cor;
        return self;
    };
}

-(JobsRetTableViewByViewBlock _Nonnull)byTableHeaderView{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(__kindof UIView *_Nullable view){
        @jobs_strongify(self)
        self.tableHeaderView = view;
        return self;
    };
}

-(JobsRetTableViewByViewBlock _Nonnull)byTableFooterView{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(__kindof UIView *_Nullable view){
        @jobs_strongify(self)
        self.tableFooterView = view;
        return self;
    };
}

-(JobsRetTableViewByEdgeInsetsBlock _Nonnull)byContentInset{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(UIEdgeInsets inset){
        @jobs_strongify(self)
        self.contentInset = inset;
        return self;
    };
}

-(JobsRetTableViewByMJRefreshConfigModelBlock _Nonnull)byMJRefreshConfigModel{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(MJRefreshConfigModel *_Nullable refreshConfigModel){
        @jobs_strongify(self)
        self.handleWord(refreshConfigModel);/// 文字
        return self;
    };
}

-(JobsReturnTableViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(__kindof MJRefreshHeader * _Nullable header){
        @jobs_strongify(self)
        self.mj_header = header;
        self.mj_header.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
        return self;
    };
}

-(JobsReturnTableViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable(__kindof MJRefreshFooter * _Nullable header){
        @jobs_strongify(self)
        self.mj_footer = header;
        self.mj_footer.automaticallyChangeAlpha = YES; /// 根据拖拽比例自动切换透明度
        return self;
    };
}
#pragma mark —— UITableViewHeaderFooterView
-(JobsRetFrameByNSIntegerBlock _Nonnull)rectForHeaderInSection{
    @jobs_weakify(self)
    return ^CGRect(NSInteger section){
        @jobs_strongify(self)
        return [self rectForHeaderInSection:section];
    };
}

-(JobsRetFrameByNSIntegerBlock _Nonnull)rectForFooterInSection{
    @jobs_weakify(self)
    return ^CGRect(NSInteger section){
        @jobs_strongify(self)
        return [self rectForFooterInSection:section];
    };
}
#pragma mark —— UITableViewCell
/// 对系统方法 cellForRowAtIndexPath 的二次封装
-(JobsRetTableViewCellByIndexPathBlock _Nonnull)cellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(NSIndexPath *_Nonnull indexPath){
        @jobs_strongify(self)
        return [self cellForRowAtIndexPath:indexPath];
    };
}
/// 对系统方法 numberOfRowsInSection 的二次封装
-(JobsRetByNSIntegerBlock _Nonnull)rowsInSection{
    @jobs_weakify(self)
    return ^NSInteger(NSInteger Section){
        @jobs_strongify(self)
        return [self numberOfRowsInSection:Section];
    };
}

-(__kindof UITableViewCell *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
                                  tableViewCellClass:(Class _Nullable)tableViewCellClass{
    JobsLog(@"%s", __FUNCTION__);
    if (tableViewCellClass) {
        for (UITableViewCell *cell in self.visibleCells) {
            if ([cell isKindOfClass:tableViewCellClass]) {
                cell.selected = NO;
                cell.getViewModel.jobsSelected = NO;
            }
        }
    }
    UITableViewCell *cell = (UITableViewCell *)self.cellBy(indexPath);
    cell.selected = !cell.selected;
    cell.jobsSelected = !cell.jobsSelected;
    cell.getViewModel.jobsSelected = !cell.getViewModel.jobsSelected;/// 建议用model来修改
    return cell;
}

-(__kindof UITableViewCell *)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
                                    tableViewCellClass:(Class _Nullable)tableViewCellClass{
    JobsLog(@"%s", __FUNCTION__);
    UITableViewCell *cell = (UITableViewCell *)self.cellBy(indexPath);
    cell.selected = !cell.selected;
    cell.getViewModel.jobsSelected = !cell.getViewModel.jobsSelected;
    return cell;
}

-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                              tableViewCellSalt:(NSString * _Nullable)cellSalt
                                      withStyle:(UITableViewCellStyle)cellStyle{
    if(!cellSalt) cellSalt = @"";
    UITableViewCell *tableViewCell = (UITableViewCell *)self.tableViewCellClass(tableViewCellClass,cellSalt);
    if (!tableViewCell) {
        tableViewCell = [tableViewCellClass initTableViewCell:tableViewCellClass
                                                    withStyle:cellStyle];
        tableViewCell.settingForTableViewCell();
    }return tableViewCell;
}

-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                   tableViewCellStyleValue1Salt:(NSString * _Nullable)salt{
    return [self tableViewCellClass:tableViewCellClass
                  tableViewCellSalt:salt
                          withStyle:UITableViewCellStyleValue1];
}

-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                  tableViewCellStyleDefaultSalt:(NSString * _Nullable)salt{
    return [self tableViewCellClass:tableViewCellClass
                  tableViewCellSalt:salt
                          withStyle:UITableViewCellStyleDefault];
}

-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                   tableViewCellStyleValue2Salt:(NSString * _Nullable)salt{
    return [self tableViewCellClass:tableViewCellClass
                  tableViewCellSalt:salt
                          withStyle:UITableViewCellStyleValue2];
}

-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                 tableViewCellStyleSubtitleSalt:(NSString * _Nullable)salt{
    return [self tableViewCellClass:tableViewCellClass
                  tableViewCellSalt:salt
                          withStyle:UITableViewCellStyleSubtitle];
}
#pragma mark —— 其他
/// 更多，参见： 关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量.md
/// 隐藏最后一个单元格的分界线
-(void)hideSeparatorLineAtLast:(NSIndexPath *)indexPath
                          cell:(__kindof UITableViewCell *)cell{
    /// 判断是否是该 section 的最后一行
    if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1){
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
    }
}

@end
