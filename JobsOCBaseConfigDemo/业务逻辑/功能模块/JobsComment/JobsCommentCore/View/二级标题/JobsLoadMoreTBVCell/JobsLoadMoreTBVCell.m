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
+(instancetype)cellStyleValue1WithTableView:(UITableView *)tableView{
    JobsLoadMoreTBVCell *cell = (JobsLoadMoreTBVCell *)[tableView tableViewCellClass:JobsLoadMoreTBVCell.class];
    if (!cell) {
        cell = [JobsLoadMoreTBVCell initTableViewCellWithStyle:UITableViewCellStyleDefault];
        cell.contentView.backgroundColor = JobsCommentConfig.sharedInstance.bgCor;
    }return cell;
}

+(CGFloat)cellHeightWithModel:(id _Nullable)model{
    return JobsCommentConfig.sharedInstance.cellHeight;
}

- (void)richElementsInCellWithModel:(id _Nullable)model{
    self.titleLab.alpha = 1;
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
