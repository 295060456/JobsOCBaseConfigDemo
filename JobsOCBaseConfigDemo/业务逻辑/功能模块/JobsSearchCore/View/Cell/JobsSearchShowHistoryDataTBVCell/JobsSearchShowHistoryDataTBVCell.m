//
//  JobsSearchShowHistoryDataTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchShowHistoryDataTBVCell.h"
#import "UITableViewCell+WhiteArrows.h"

@interface JobsSearchShowHistoryDataTBVCell ()

@end

@implementation JobsSearchShowHistoryDataTBVCell
#pragma mark —— BaseCellProtocol
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsSearchShowHistoryDataTBVCell *cell = (JobsSearchShowHistoryDataTBVCell *)tableView.tableViewCellClass(JobsSearchShowHistoryDataTBVCell.class,@"");
        if (!cell) {
            cell = JobsSearchShowHistoryDataTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //        cell.contentView.backgroundColor = JobsRandomColor;
            cell.imageView.image = JobsIMG(@"时钟");
        }return cell;
    };
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 50;
}

-(void)richElementsInCellWithModel:(id _Nullable)model{
    self.textLabel.text = model;
}

@end
