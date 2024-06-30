//
//  JobsPageTBVCell.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsPageTBVCell.h"
#import "NSObject+Extras.h"

@interface JobsPageTBVCell ()

@property(nonatomic,strong)UILabel *textLab;

@end

@implementation JobsPageTBVCell
#pragma mark —— UITableViewCellProtocol
+(instancetype)cellStyleSubtitleWithTableView:(UITableView *)tableView{
    JobsPageTBVCell *cell = (JobsPageTBVCell *)[tableView tableViewCellClass:JobsPageTBVCell.class];
    if (!cell) {
        cell = [JobsPageTBVCell initTableViewCellWithStyle:UITableViewCellStyleSubtitle];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = cell.contentView.backgroundColor = JobsClearColor;
    }return cell;
}
#pragma mark —— BaseCellProtocol
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    if (model) {
        self.textLab.textColor = model.textModel.textCor;
        self.textLab.text = model.textModel.text;
        self.textLab.font = model.textModel.font;
        self.textLab.backgroundColor = model.bgCor;
    //    self.imageView.image = (UIImage *)model[@"image"];
    }
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return 0.f;
}
#pragma mark —— lazyLoad
-(UILabel *)textLab{
    if (!_textLab) {
        _textLab = UILabel.new;
        [self.contentView addSubview:_textLab];
        [_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _textLab;
}

@end
