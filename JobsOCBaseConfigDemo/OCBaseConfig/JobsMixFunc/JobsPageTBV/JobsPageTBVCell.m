//
//  JobsPageTBVCell.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsPageTBVCell.h"

@interface JobsPageTBVCell ()

@property(nonatomic,strong)UILabel *textLab;

@end

@implementation JobsPageTBVCell
#pragma mark —— UITableViewCellProtocol
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleSubtitleWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsPageTBVCell *cell = (JobsPageTBVCell *)tableView.tableViewCellClass(JobsPageTBVCell.class,@"");
        if (!cell) {
            cell = JobsPageTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
    //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = cell.contentView.backgroundColor = JobsClearColor;
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(jobsByIDBlock _Nonnull)richElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model) {
            self.textLab.textColor = model.textModel.textCor;
            self.textLab.text = model.textModel.text;
            self.textLab.font = model.textModel.font;
            self.textLab.backgroundColor = model.bgCor;
        //    self.imageView.image = (UIImage *)model[@"image"];
        }
    };
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
