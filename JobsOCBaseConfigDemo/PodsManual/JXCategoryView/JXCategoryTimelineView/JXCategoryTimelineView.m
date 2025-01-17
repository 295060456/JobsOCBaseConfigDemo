//
//  JXCategoryTimelineView.m
//  JXCategoryView
//
//  Created by jiaxin on 2019/7/23.
//  Copyright © 2019 jiaxin. All rights reserved.
//

#import "JXCategoryTimelineView.h"

@implementation JXCategoryTimelineView

- (void)initializeData {
    [super initializeData];

    _timeTitleFont = [UIFont boldSystemFontOfSize:JobsWidth(13)];
    self.titleFont = [UIFont systemFontOfSize:JobsWidth(10) weight:UIFontWeightRegular];
    _timeTitleSelectedFont = [UIFont boldSystemFontOfSize:JobsWidth(15)];
    self.titleSelectedFont = [UIFont systemFontOfSize:JobsWidth(10) weight:UIFontWeightRegular];
    _timeTitleNormalColor = JobsLightGrayColor;
    self.titleColor = JobsLightGrayColor;
    _timeTitleSelectedColor = JobsWhiteColor;
    self.titleSelectedColor = JobsWhiteColor;
}
//返回自定义的cell class
-(Class)preferredCellClass{
    return JXCategoryTimelineCell.class;
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = NSMutableArray.array;
    for (int i = 0; i < self.timeTitles.count; i++) {
        JXCategoryTimelineCellModel *cellModel = JXCategoryTimelineCellModel.new;
        [tempArray addObject:cellModel];
    }self.dataSource = (NSMutableArray *)tempArray;
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel
                   index:(NSInteger)index {
    [super refreshCellModel:cellModel
                      index:index];

    JXCategoryTimelineCellModel *model = (JXCategoryTimelineCellModel *)cellModel;
    model.timeTitle = self.timeTitles[index];
    model.timeTitleNormalColor = self.timeTitleNormalColor;
    model.timeTitleSelectedColor = self.timeTitleSelectedColor;
    model.timeTitleFont = self.timeTitleFont;
    model.timeTitleSelectedFont = self.timeTitleSelectedFont;
}

@end
