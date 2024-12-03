//
//  JobsSearchShowHotwordsTBVCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/4.
//

#import "JobsSearchShowHotwordsTBVCell.h"

@interface JobsSearchShowHotwordsTBVCell ()

@property(nonatomic,strong)JobsHotLabelByMultiLine *jobsHotLabel;

@end

@implementation JobsSearchShowHotwordsTBVCell

#pragma mark —— BaseCellProtocol
+(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsSearchShowHotwordsTBVCell *cell = (JobsSearchShowHotwordsTBVCell *)tableView.tableViewCellClass(JobsSearchShowHotwordsTBVCell.class,@"");
        if (!cell) {
            cell = JobsSearchShowHotwordsTBVCell.initTableViewCellWithStyle(UITableViewCellStyleDefault);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }return cell;
    };
}

+(JobsReturnCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(NSMutableArray <UIViewModel *>*_Nullable data){
        CGFloat width = hotLabLeft + hotLabRight;
        CGFloat height = 0;
        int row = 1;
        for (UIViewModel *viewModel in data) {
            CGSize size = [UILabel sizeWithText:viewModel.textModel.text
                                           font:UIFontWeightRegularSize(JobsWidth(14))
                                        maxSize:CGSizeZero];
            width += size.width + hotLabOffsetX;
            height = size.height;
            if (width >= JobsSearchShowHotwordsTBVCellWidth) {
                width = hotLabLeft + hotLabRight;
                row += 1;
            }
        }
        CGFloat offset = JobsWidth(3);// 从何而来？
        return (height + hotLabOffsetY) * row + (hotLabTop + hotLabBottom) + offset;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIViewModel *>* _Nullable model) {
        @jobs_strongify(self)
        self.viewModelMutArr = model;
        if (self.viewModelMutArr.count) {
            self.jobsHotLabel.jobsRichViewByModel(self.viewModelMutArr);
        }
    };
}

#pragma mark —— lazyLoad
-(JobsHotLabelByMultiLine *)jobsHotLabel{
    if (!_jobsHotLabel) {
        _jobsHotLabel = JobsHotLabelByMultiLine.new;
        @jobs_weakify(self)
        [_jobsHotLabel actionObjectBlock:^(JobsHotLabelByMultiLineCVCell *cell) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(cell);
        }];
        [self.contentView addSubview:_jobsHotLabel];
        [_jobsHotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }return _jobsHotLabel;
}

@end
