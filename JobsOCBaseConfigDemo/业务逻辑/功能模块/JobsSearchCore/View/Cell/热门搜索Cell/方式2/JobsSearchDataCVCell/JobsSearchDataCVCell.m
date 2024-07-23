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
@property(nonatomic,strong)NSString *serialStr;
@property(nonatomic,strong)NSString *contentStr;
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
-(void)richElementsInCellWithModel:(UIViewModel *_Nullable)model{
    self.serialStr = [NSString stringWithFormat:@"%ld",self.indexPath.row + 1];
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
}
#pragma mark —— lazyLoad
-(UILabel *)serialNumLab{
    if (!_serialNumLab) {
        _serialNumLab = UILabel.new;
        _serialNumLab.text = self.serialStr;
        _serialNumLab.textAlignment = NSTextAlignmentCenter;
        _serialNumLab.textColor = JobsWhiteColor;
        _serialNumLab.backgroundColor = self.serialNumLabBGCor;
        [self.contentView addSubview:_serialNumLab];
        [_serialNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.left.equalTo(self.contentView).offset(10);
            make.centerY.equalTo(self.contentView);
        }];
        _serialNumLab.cornerCutToCircleWithCornerRadius(3);
    }return _serialNumLab;
}

-(UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = UILabel.new;
        _contentLab.text = self.viewModel.textModel.text;
        _contentLab.textColor = JobsLightGrayColor;
        [self.contentView addSubview:_contentLab];
        [_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.serialNumLab);
            make.left.equalTo(self.serialNumLab.mas_right).offset(5);
        }];
    }return _contentLab;
}

@end
