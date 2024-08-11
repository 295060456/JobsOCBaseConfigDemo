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
#pragma mark —— UITableViewCell
-(UITableViewCell __kindof *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
                                  tableViewCellClass:(Class _Nullable)tableViewCellClass{
    NSLog(@"%s", __FUNCTION__);
    if (tableViewCellClass) {
        for (UITableViewCell *cell in self.visibleCells) {
            if ([cell isKindOfClass:tableViewCellClass]) {
                cell.selected = NO;
                cell.getViewModel.jobsSelected = NO;
            }
        }
    }
    UITableViewCell *cell = (UITableViewCell *)[self cellForRowAtIndexPath:indexPath];
    cell.selected = !cell.selected;// 当程序运行到cellForRowAtIndexPath，赋值失效
    cell.jobsSelected = !cell.jobsSelected;// 当程序运行到cellForRowAtIndexPath，赋值失效
    cell.getViewModel.jobsSelected = !cell.getViewModel.jobsSelected;/// 建议用model来修改
    return cell;
}

-(UITableViewCell __kindof *)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
                                    tableViewCellClass:(Class _Nullable)tableViewCellClass{
    NSLog(@"%s", __FUNCTION__);
    UITableViewCell *cell = (UITableViewCell *)[self cellForRowAtIndexPath:indexPath];
    cell.selected = !cell.selected;
    cell.getViewModel.jobsSelected = !cell.getViewModel.jobsSelected;
    return cell;
}

-(UITableViewCell __kindof *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                   tableViewCellStyleValue1Salt:(NSString * _Nullable)salt{
    if(!salt) salt = @"";
    UITableViewCell *tableViewCell = (UITableViewCell *)self.tableViewCellClass(tableViewCellClass,salt);
    if (!tableViewCell) {
        tableViewCell = [UITableViewCell initTableViewCell:tableViewCellClass
                                                 withStyle:UITableViewCellStyleValue1];
        tableViewCell.settingForTableViewCell();
    }return tableViewCell;
}

-(UITableViewCell __kindof *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                  tableViewCellStyleDefaultSalt:(NSString * _Nullable)salt{
    if(!salt) salt = @"";
    UITableViewCell *tableViewCell = (UITableViewCell *)self.tableViewCellClass(tableViewCellClass,salt);
    if (!tableViewCell) {
        tableViewCell = [UITableViewCell initTableViewCell:tableViewCellClass
                                                 withStyle:UITableViewCellStyleDefault];
        tableViewCell.settingForTableViewCell();
    }return tableViewCell;
}

-(UITableViewCell __kindof *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                   tableViewCellStyleValue2Salt:(NSString * _Nullable)salt{
    if(!salt) salt = @"";
    UITableViewCell *tableViewCell = (UITableViewCell *)self.tableViewCellClass(tableViewCellClass,salt);
    if (!tableViewCell) {
        tableViewCell = [UITableViewCell initTableViewCell:tableViewCellClass
                                                 withStyle:UITableViewCellStyleValue2];
        tableViewCell.settingForTableViewCell();
    }return tableViewCell;
}

-(UITableViewCell __kindof *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                 tableViewCellStyleSubtitleSalt:(NSString * _Nullable)salt{
    if(!salt) salt = @"";
    UITableViewCell *tableViewCell = (UITableViewCell *)self.tableViewCellClass(tableViewCellClass,salt);
    if (!tableViewCell) {
        tableViewCell = [UITableViewCell initTableViewCell:tableViewCellClass
                                                 withStyle:UITableViewCellStyleSubtitle];
        tableViewCell.settingForTableViewCell();
    }return tableViewCell;
}
#pragma mark —— 其他
/// 更多，参见： 关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量.md
/// 隐藏最后一个单元格的分界线
-(void)hideSeparatorLineAtLast:(NSIndexPath *)indexPath
                          cell:(UITableViewCell __kindof *)cell{
    /// 判断是否是该 section 的最后一行
    if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1){
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
    }
}

@end
