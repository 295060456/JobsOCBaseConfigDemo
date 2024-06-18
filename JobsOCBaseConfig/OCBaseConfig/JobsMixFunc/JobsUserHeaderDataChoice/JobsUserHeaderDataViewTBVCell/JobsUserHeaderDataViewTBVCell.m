//
//  JobsUserHeaderDataViewTBVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "JobsUserHeaderDataViewTBVCell.h"

@interface JobsUserHeaderDataViewTBVCell ()

@property(nonatomic,strong)UILabel *titleLab;

@end

@implementation JobsUserHeaderDataViewTBVCell

@synthesize viewModel = _viewModel;

#pragma mark —— UITableViewCellProtocol
/// UITableViewCell
+(instancetype)cellStyleDefaultWithTableView:(UITableView *)tableView{
    JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)[tableView tableViewCellClass:JobsUserHeaderDataViewTBVCell.class];
    if (!cell) {
        cell = [JobsUserHeaderDataViewTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = HEXCOLOR(0xFFFFFF);
    }return cell;
}
/// 左边：imageView＋textLabel；右边：detailTextLabel。
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)[tableView tableViewCellClass:JobsUserHeaderDataViewTBVCell.class];
    if (!cell) {
        cell = [JobsUserHeaderDataViewTBVCell initTableViewCellWithStyle:UITableViewCellStyleValue1];
    }return cell;
}
/// 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(instancetype)cellStyleValue2WithTableView:(UITableView *)tableView{
    JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)[tableView tableViewCellClass:JobsUserHeaderDataViewTBVCell.class];
    if (!cell) {
        cell = [JobsUserHeaderDataViewTBVCell initTableViewCellWithStyle:UITableViewCellStyleValue2];
    }return cell;
}
/// 左边：imageView；左上：textLabel；左下：detailTextLabel。主标题字体大且加黑，副标题字体小在主标题下边。
+(instancetype)cellStyleSubtitleWithTableView:(UITableView *)tableView{
    JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)[tableView tableViewCellClass:JobsUserHeaderDataViewTBVCell.class];
    if (!cell) {
        cell = [JobsUserHeaderDataViewTBVCell initTableViewCellWithStyle:UITableViewCellStyleSubtitle];
    }return cell;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)cellHeightWithModel:(UIViewModel *_Nullable)model{
    return JobsWidth(46);
}

-(NSString *)getTitleValue{
    return self.titleLab.text;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = self.viewModel.textModel.text.nullString ? JobsInternationalization(@"请设置标题") : self.viewModel.textModel.text;
        _titleLab.textColor = self.viewModel.textModel.textCor;
        _titleLab.font = self.viewModel.textModel.font;
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _titleLab;
}

@end
