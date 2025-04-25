//
//  JobsTextLabStyleTBVCell.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsTextLabStyleTBVCell.h"

@interface JobsTextLabStyleTBVCell ()

@end

@implementation JobsTextLabStyleTBVCell
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
BaseLayerProtocol_synthesize_part3
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsTextLabStyleTBVCell *cell = (JobsTextLabStyleTBVCell *)tableView.tableViewCellClass(JobsTextLabStyleTBVCell.class,@"");
        if (!cell) {
            cell = JobsTextLabStyleTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsCellBy{
    @jobs_weakify(self)
    return ^(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.backgroundColor = self.contentView.backgroundColor = self.viewModel.bgCor;
        self.label.alpha = 1;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return self.viewModel;
}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            /// 富文本的优先级大于普通文本
            if(self.viewModel.attributedTitle){
                label.attributedText = self.viewModel.attributedTitle;
            }else label.text = self.viewModel.text;
            label.numberOfLines = 0;
            label.lineBreakMode = NSLineBreakByWordWrapping;
            label.textAlignment = self.viewModel.textAlignment;
            label.textColor = self.viewModel.textCor;
            label.font = self.viewModel.font;
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _label;
}

@end
