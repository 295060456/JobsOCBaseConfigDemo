//
//  UITableView+Expand.m
//  DouDong-II
//
//  Created by Jobs on 2021/4/10.
//

#import "UITableView+Expand.h"

@implementation UITableView (Expand)
#pragma mark —— 数据源
-(jobsByIDBlock _Nonnull)dataLink{
    @jobs_weakify(self)
    return ^(id _Nonnull target) {
        @jobs_strongify(self)
        self.delegate = target;
        self.dataSource = target;
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
#pragma mark —— UITableViewHeaderFooterView
-(JobsReturnRectByNSIntegerBlock _Nonnull)rectForHeaderInSection{
    @jobs_weakify(self)
    return ^CGRect(NSInteger section){
        @jobs_strongify(self)
        return [self rectForHeaderInSection:section];
    };
}

-(JobsReturnRectByNSIntegerBlock _Nonnull)rectForFooterInSection{
    @jobs_weakify(self)
    return ^CGRect(NSInteger section){
        @jobs_strongify(self)
        return [self rectForFooterInSection:section];
    };
}
#pragma mark —— UITableViewCell
/// 对系统方法 cellForRowAtIndexPath 的二次封装
-(JobsReturnTableViewCellByIndexPathBlock _Nonnull)cellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(NSIndexPath *_Nonnull indexPath){
        @jobs_strongify(self)
        return [self cellForRowAtIndexPath:indexPath];
    };
}
/// 对系统方法 numberOfRowsInSection 的二次封装
-(JobsReturnByNSIntegerBlock _Nonnull)rowsInSection{
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
