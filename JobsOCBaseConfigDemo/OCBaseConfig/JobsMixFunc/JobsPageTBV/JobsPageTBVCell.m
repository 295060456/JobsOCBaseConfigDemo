//
//  JobsPageTBVCell.m
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "JobsPageTBVCell.h"

@interface JobsPageTBVCell ()

Prop_strong()UILabel *textLab;

@end

@implementation JobsPageTBVCell
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleSubtitleWithTableView{
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
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model) {
            self.textLab.textColor = model.textModel.textCor;
            self.textLab.text = model.textModel.text;
            self.textLab.font = model.textModel.font;
            self.textLab.backgroundColor = model.bgCor;
        //    self.imageView.image = (UIImage *)model[@"image"];
        } return self;
    };
}

-(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.f;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)textLab{
    if (!_textLab) {
        @jobs_weakify(self)
        _textLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _textLab;
}

@end
