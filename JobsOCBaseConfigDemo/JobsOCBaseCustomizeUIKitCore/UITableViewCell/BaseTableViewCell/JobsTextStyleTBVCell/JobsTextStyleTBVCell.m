//
//  JobsTextStyleTBVCell.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsTextStyleTBVCell.h"

@interface JobsTextStyleTBVCell ()
/// UI
@property(nonatomic,strong)UILabel *lab;

@end

@implementation JobsTextStyleTBVCell
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    @jobs_weakify(self)
    return ^(UITableView * _Nonnull tableView) {
        @jobs_strongify(self)
        JobsTextStyleTBVCell *cell = (JobsTextStyleTBVCell *)tableView.tableViewCellClass(JobsTextStyleTBVCell.class,@"");
        if (!cell) {
            cell = JobsTextStyleTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;

}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(55);
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return [self.class cellHeightWithModel:model];
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return _viewModel;
}
#pragma mark —— lazyLoad
-(UILabel *)lab{
    if(!_lab){
        _lab = UILabel.new;
        _lab.text = self.viewModel.text;
        _lab.textAlignment = self.viewModel.textAlignment;
        _lab.textColor = self.viewModel.textCor;
        _lab.font = self.viewModel.font;
        [self.contentView addSubview:_lab];
        [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _lab;
}

@end
