//
//  JobsImageStyleTBVCell.m
//  FM
//
//  Created by User on 8/11/24.
//

#import "JobsImageStyleTBVCell.h"

@interface JobsImageStyleTBVCell ()
/// UI
@property(nonatomic,strong)UIImageView *backgroudImageView;
/// Data

@end

@implementation JobsImageStyleTBVCell
#pragma mark —— @synthesize UIViewModelProtocol
UIViewModelProtocol_synthesize
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsImageStyleTBVCell *cell = (JobsImageStyleTBVCell *)tableView.tableViewCellClass(JobsImageStyleTBVCell.class,@"");
        if (!cell) {
            cell = JobsImageStyleTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.backgroudImageView.alpha = 1;
    };
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
-(UIImageView *)backgroudImageView{
    if(!_backgroudImageView){
        _backgroudImageView = UIImageView.new;
        _backgroudImageView.image = self.viewModel.bgImage;
        [self.contentView addSubview:_backgroudImageView];
        [_backgroudImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _backgroudImageView;
}


@end
