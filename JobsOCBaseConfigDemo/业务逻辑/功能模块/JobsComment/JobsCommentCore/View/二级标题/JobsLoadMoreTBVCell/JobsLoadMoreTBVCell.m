//
//  LoadMoreTBVCell.m
//  commentList
//
//  Created by Jobs on 2020/7/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsLoadMoreTBVCell.h"

@interface JobsLoadMoreTBVCell ()

@property(nonatomic,strong)UILabel *titleLab;

@end

@implementation JobsLoadMoreTBVCell
#pragma mark —— BaseCellProtocol
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsLoadMoreTBVCell *cell = (JobsLoadMoreTBVCell *)tableView.tableViewCellClass(JobsLoadMoreTBVCell.class,@"");
        if (!cell) {
            cell = JobsLoadMoreTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.contentView.backgroundColor = JobsCommentConfig.sharedInstance.bgCor;
        }return cell;
    };
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return JobsCommentConfig.sharedInstance.cellHeight;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.titleLab.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = @"点击加载更多...";
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.backgroundColor = [UIColor systemYellowColor];
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _titleLab;
}

@end
