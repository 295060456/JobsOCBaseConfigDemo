//
//  DataCollectionViewCell.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/22.
//

#import "JobsSearchDataCVCell.h"

@interface JobsSearchDataCVCell ()

@property(nonatomic,strong)UILabel *serialNumLab;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,copy)NSString *serialStr;
@property(nonatomic,copy)NSString *contentStr;
@property(nonatomic,strong)UIColor *serialNumLabBGCor;

@end

@implementation JobsSearchDataCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = JobsWhiteColor;
        self.contentView.backgroundColor = JobsWhiteColor;
    }return self;
}
#pragma mark —— BaseCellProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichElementsInCellWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.serialStr = toStringByLong(self.indexPath.row + 1);
        self.viewModel = model;
        switch (self.indexPath.row) {
            case 0:{
                self.serialNumLabBGCor = RGB_COLOR(245, 58, 50);
            }break;
            case 1:{
                self.serialNumLabBGCor = RGB_COLOR(255, 115, 38);
            }break;
            case 2:{
                self.serialNumLabBGCor = RGB_COLOR(253, 198, 48);
            }break;
            default:{
                self.serialNumLabBGCor = RGB_COLOR(232, 232, 232);
            }break;
        }
        self.serialNumLab.alpha = 1;
        self.contentLab.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)serialNumLab{
    if (!_serialNumLab) {
        @jobs_weakify(self)
        _serialNumLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = self.serialStr;
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = JobsWhiteColor;
            label.backgroundColor = self.serialNumLabBGCor;
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(20, 20));
                make.left.equalTo(self.contentView).offset(10);
                make.centerY.equalTo(self.contentView);
            }];label.cornerCutToCircleWithCornerRadius(3);
        });
    }return _serialNumLab;
}

-(UILabel *)contentLab{
    if (!_contentLab) {
        @jobs_weakify(self)
        _contentLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = self.viewModel.textModel.text;
            label.textColor = JobsLightGrayColor;
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.serialNumLab);
                make.left.equalTo(self.serialNumLab.mas_right).offset(5);
            }];
        });
    }return _contentLab;
}

@end
