//
//  JobsUserHeaderDataViewTBVCell.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "JobsUserHeaderDataViewTBVCell.h"

@interface JobsUserHeaderDataViewTBVCell ()

Prop_strong()UILabel *titleLab;

@end

@implementation JobsUserHeaderDataViewTBVCell
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— UITableViewCellProtocol
/// UITableViewCell
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsUserHeaderDataViewTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsUserHeaderDataViewTBVCell);
        cell.backgroundColor = HEXCOLOR(0xFFFFFF);
        return cell;
    };
}
/// 左边：imageView＋textLabel；右边：detailTextLabel。
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)tableView.tableViewCellClass(JobsUserHeaderDataViewTBVCell.class,@"");
        if (!cell) {
            cell = JobsUserHeaderDataViewTBVCell.initTableViewCellWithStyle(UITableViewCellStyleValue1);
        }return cell;
    };
}
/// 左边：textLabel字体偏小；右边：detailTextLabel。imageView可选（显示在最左边）
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue2WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)tableView.tableViewCellClass(JobsUserHeaderDataViewTBVCell.class,@"");
        if (!cell) {
            cell = JobsUserHeaderDataViewTBVCell.initTableViewCellWithStyle(UITableViewCellStyleValue2);
        }return cell;
    };
}
/// 左边：imageView；左上：textLabel；左下：detailTextLabel。主标题字体大且加黑，副标题字体小在主标题下边。
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleSubtitleWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsUserHeaderDataViewTBVCell *cell = (JobsUserHeaderDataViewTBVCell *)tableView.tableViewCellClass(JobsUserHeaderDataViewTBVCell.class,@"");
        if (!cell) {
            cell = JobsUserHeaderDataViewTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
        }return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.titleLab.alpha = 1;
        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(46);
    };
}

-(NSString *)getTitleValue{
    return self.titleLab.text;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = self.contentView.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(isNull(self.viewModel.textModel.text) ? JobsInternationalization(@"请设置标题") : self.viewModel.textModel.text)
                .byTextCor(self.viewModel.textModel.textCor)
                .byFont(self.viewModel.textModel.font)
                .byTextAlignment(NSTextAlignmentCenter);
        })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
            @jobs_strongify(self)
            make.edges.equalTo(self.contentView);
        }).on();
    }return _titleLab;
}

@end
