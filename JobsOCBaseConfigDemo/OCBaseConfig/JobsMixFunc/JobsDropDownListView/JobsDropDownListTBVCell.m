//
//  JobsDropDownListTBVCell.m
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import "JobsDropDownListTBVCell.h"

@interface JobsDropDownListTBVCell ()

@end

@implementation JobsDropDownListTBVCell
#pragma mark —— @synthesize UITableViewCellProtocol
UITableViewCellProtocol_synthesize
UITableViewCell_UIViewModelProtocolSynthesize
#pragma mark —— UITableViewCellProtocol
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsDropDownListTBVCell *cell = (JobsDropDownListTBVCell *)[tableView tableViewCellClass:JobsDropDownListTBVCell.class];
    if (!cell) {
        cell = [JobsDropDownListTBVCell initTableViewCellWithStyle:UITableViewCellStyleValue1];
    }return cell;
}
#pragma mark —— BaseCellProtocol
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        [self richElementsInCellWithModel:nil];
        self.selectionStyle = UITableViewCellSelectionStyleNone;// 取消点击效果 【不能在cellStyleValue1WithTableView里面写】
        self.backgroundColor = self.contentView.backgroundColor = HEXCOLOR(0xFBF7E3);
        self.selectedBackgroundView = [UIView.alloc initWithFrame:self.frame];// 这句不可省略
        self.selectedBackgroundView.backgroundColor = HEXCOLOR(0xE4B94B);
    }return self;
}

-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if (model) {
        self.viewModel = model;
        self.textLabel.text = [NSString stringWithFormat:@"%@",model.textModel.text];
        self.detailTextLabel.text = [NSString stringWithFormat:@"%@",model.subTextModel.text];
    }
}

+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    
    UIViewModel *vm = UIViewModel.new;
    vm.textModel.font = UIFontWeightRegularSize(14);
    vm.jobsWidth = JobsMainScreen_WIDTH() - JobsWidth(200);
    vm.textModel.text = vm.subTextModel.text;
    vm.textModel.textLineSpacing = 0;
    
    return [UIView heightByData:model ? : vm] + JobsWidth(20);
}

@end
