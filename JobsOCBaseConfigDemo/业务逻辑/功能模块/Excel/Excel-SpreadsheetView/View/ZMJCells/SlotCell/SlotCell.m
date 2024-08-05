//
//  SlotCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "SlotCell.h"

@interface SlotCell ()

@property(nonatomic,strong)UILabel *minutesLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *tableHighlightLabel;

@end

@implementation SlotCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.minutesLabel.alpha = 1;
        self.titleLabel.alpha = 1;
        self.tableHighlightLabel.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.minutesLabel.alpha = 1;
        self.titleLabel.alpha = 1;
        self.tableHighlightLabel.alpha = 1;
    }return self;
}

- (void)setMinutes:(NSInteger)minutes {
    _minutes = minutes;
    self.minutesLabel.text = [NSString stringWithFormat:@"%02ld", (long)minutes];
    self.minutesLabel.makeLabelByShowingType(UILabelShowingType_03);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    self.titleLabel.makeLabelByShowingType(UILabelShowingType_03);
}

- (void)setTableHighlight:(NSString *)tableHighlight {
    _tableHighlight = tableHighlight;
    self.tableHighlightLabel.text = tableHighlight;
    self.tableHighlightLabel.makeLabelByShowingType(UILabelShowingType_03);
}
#pragma mark —— LazyLoad
-(UILabel *)minutesLabel{
    if(!_minutesLabel){
        _minutesLabel = UILabel.new;
        [self addSubview:_minutesLabel];
        [_minutesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self);
            make.height.mas_equalTo(JobsWidth(10));
        }];
    }return _minutesLabel;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = UILabel.new;
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.minutesLabel.mas_bottom);
            make.left.equalTo(self);
            make.height.mas_equalTo(JobsWidth(10));
        }];
    }return _titleLabel;
}

-(UILabel *)tableHighlightLabel{
    if(!_tableHighlightLabel){
        _tableHighlightLabel = UILabel.new;
        [self addSubview:_tableHighlightLabel];
        [_tableHighlightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.left.equalTo(self);
            make.height.mas_equalTo(JobsWidth(10));
        }];
    }return _tableHighlightLabel;
}

@end
