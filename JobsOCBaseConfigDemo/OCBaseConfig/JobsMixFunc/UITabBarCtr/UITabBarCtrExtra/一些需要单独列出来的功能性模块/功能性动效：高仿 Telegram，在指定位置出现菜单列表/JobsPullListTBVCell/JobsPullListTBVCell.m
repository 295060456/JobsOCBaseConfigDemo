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

+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsPullListTBVCell *cell = (JobsPullListTBVCell *)[tableView tableViewCellClass:JobsPullListTBVCell.class];
    if (!cell) {
        cell = [JobsPullListTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }return cell;
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.textLabel.text = model.textModel.text;
    self.imageView.image = model.image;
}

@end
