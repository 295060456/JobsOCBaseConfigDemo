//
//  DayTitleCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "DayTitleCell.h"

@interface DayTitleCell ()

@end

@implementation DayTitleCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.label.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        self.label.alpha = 1;
    }return self;
}
#pragma mark —— LazyLoad
-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.frame = self.bounds;
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _label.font = [UIFont boldSystemFontOfSize:14.f];
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
    }return _label;
}

@end
