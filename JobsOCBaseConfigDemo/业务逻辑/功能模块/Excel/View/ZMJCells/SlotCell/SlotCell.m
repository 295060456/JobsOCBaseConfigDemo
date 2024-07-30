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

    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {

    }return self;
}

- (void)setMinutes:(NSInteger)minutes {
    _minutes = minutes;
    self.minutesLabel.text = [NSString stringWithFormat:@"%02ld", (long)minutes];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTableHighlight:(NSString *)tableHighlight {
    _tableHighlight = tableHighlight;
    self.tableHighlightLabel.text = tableHighlight;
}
#pragma mark —— LazyLoad
-(UILabel *)minutesLabel{
    if(!_minutesLabel){
        _minutesLabel = UILabel.new;
        [self addSubview:_minutesLabel];
    }return _minutesLabel;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = UILabel.new;
        [self addSubview:_titleLabel];
    }return _titleLabel;
}

-(UILabel *)tableHighlightLabel{
    if(!_tableHighlightLabel){
        _tableHighlightLabel = UILabel.new;
        [self addSubview:_tableHighlightLabel];
    }return _tableHighlightLabel;
}

@end
