//
//  LoadMoreTBVCell.m
//  commentList
//
//  Created by Jobs on 2020/7/14.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsLoadMoreTBVCell.h"

@interface JobsLoadMoreTBVCell ()

Prop_strong()UILabel *titleLab;

@end

@implementation JobsLoadMoreTBVCell
#pragma mark —— BaseCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsLoadMoreTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsLoadMoreTBVCell);
        return cell;
    };
}

+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.sharedManager.cellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        self.titleLab.alpha = 1;
        return self;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = JobsInternationalization(@"点击加载更多").add(@"...");
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = JobsSystemYellowColor;
            [self.contentView.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            }];
        });
    }return _titleLab;
}
 
@end
