//
//  JobsDetailsInfoStyleTBVCell.m
//  FMNormal
//
//  Created by Jobs on 2025/5/15.
//

#import "JobsDetailsInfoStyleTBVCell.h"

@interface JobsDetailsInfoStyleTBVCell ()

Prop_strong()UIImageView *detailsInfoImageView;

@end

@implementation JobsDetailsInfoStyleTBVCell
@synthesize viewModel = _viewModel;
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView{
    return ^__kindof UITableViewCell *_Nullable(UITableView * _Nonnull tableView) {
        JobsDetailsInfoStyleTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsDetailsInfoStyleTBVCell);
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsReturnTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(__kindof UIViewModel *_Nullable data) {
        @jobs_strongify(self)
        if(data.isKindOfClass(UIViewModel.class)){
            self.viewModel = data;
            self.imageView.image = self.viewModel.image;
            self.textLabel
                .byText(self.viewModel.text)
                .byTextAlignment(self.viewModel.textAlignment)
                .byFont(self.viewModel.font)
                .byTextCor(self.viewModel.textCor);
            self.detailsInfoImageView.image = self.viewModel.titleImage;
            [self.detailsInfoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.viewModel.jobsSize);
                /// 如果有系统向右的箭头，此时这个offset其实是于箭头左边距的距离
                if(self.viewModel.jobsOffsetX) make.right.equalTo(self.contentView).offset(self.viewModel.jobsOffsetX);
            }];
        }return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— lazyLoad
-(UIImageView *)detailsInfoImageView{
    if(!_detailsInfoImageView){
        @jobs_weakify(self)
        _detailsInfoImageView = self.contentView
            .addSubview(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.backgroundColor = JobsClearColor;
            })).masonryBy(^(MASConstraintMaker *_Nonnull make){
                @jobs_strongify(self)
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(self.contentView);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(50), JobsWidth(50)));
            });
    }return _detailsInfoImageView;
}

@end
