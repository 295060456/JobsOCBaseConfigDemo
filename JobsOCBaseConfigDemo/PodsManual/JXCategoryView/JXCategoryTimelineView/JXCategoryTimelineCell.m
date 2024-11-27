//
//  JXCategoryTimelineCell.m
//  JXCategoryView
//
//  Created by jiaxin on 2019/7/23.
//  Copyright © 2019 jiaxin. All rights reserved.
//

#import "JXCategoryTimelineCell.h"
#import "JXCategoryTimelineCellModel.h"

@interface JXCategoryTimelineCell ()

@property(nonatomic,strong)UILabel *timeLabel;

@end

@implementation JXCategoryTimelineCell

-(void)initializeViews{
    [super initializeViews];
    self.timeLabel.alpha = 1;
}

-(void)reloadData:(JXCategoryBaseCellModel *)cellModel{
    [super reloadData:cellModel];
    JXCategoryTimelineCellModel *myCellModel = (JXCategoryTimelineCellModel *)cellModel;
    self.timeLabel.text = myCellModel.timeTitle;
    if (myCellModel.isSelected) {
        self.timeLabel.textColor = myCellModel.timeTitleSelectedColor;
        self.timeLabel.font = myCellModel.timeTitleSelectedFont;
    }else {
        self.timeLabel.textColor = myCellModel.timeTitleNormalColor;
        self.timeLabel.font = myCellModel.timeTitleFont;
    }
}
#pragma mark —— lazyLoad
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        @jobs_weakify(self)
        _timeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textAlignment = NSTextAlignmentCenter;
            label.translatesAutoresizingMaskIntoConstraints = NO;
            self.contentView.addSubview(label);
            NSLayoutConstraint.initBy(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                arr.add([NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0]);
                arr.add([NSLayoutConstraint constraintWithItem:label
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.contentView
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1
                                                      constant:20]);
            }));
        });
    }return _timeLabel;
}

@end
