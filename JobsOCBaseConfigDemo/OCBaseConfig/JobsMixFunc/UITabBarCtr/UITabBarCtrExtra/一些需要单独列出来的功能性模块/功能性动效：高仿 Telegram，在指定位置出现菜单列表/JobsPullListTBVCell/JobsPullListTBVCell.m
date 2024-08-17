//
//  JobsPullListTBVCell.m
//  TabbarItemLottie
//
//  Created by Jobs on 2020/10/15.
//

#import "JobsPullListTBVCell.h"

@interface JobsPullListTBVCell ()

@end

@implementation JobsPullListTBVCell

+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsPullListTBVCell *cell = (JobsPullListTBVCell *)tableView.tableViewCellClass(JobsPullListTBVCell.class,@"");
        if (!cell) {
            cell = JobsPullListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.textLabel.text = model.textModel.text;
        self.imageView.image = model.image;
    };
}

@end
