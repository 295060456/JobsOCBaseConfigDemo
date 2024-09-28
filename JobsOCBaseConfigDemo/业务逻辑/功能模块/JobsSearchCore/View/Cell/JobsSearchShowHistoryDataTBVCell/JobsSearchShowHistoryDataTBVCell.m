//
//  JobsSearchShowHistoryDataTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchShowHistoryDataTBVCell.h"

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

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(50);
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.textLabel.text = model;
    };
}

@end
