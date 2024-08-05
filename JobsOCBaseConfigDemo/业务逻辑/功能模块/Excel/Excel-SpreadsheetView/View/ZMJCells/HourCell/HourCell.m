//
//  HourCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "HourCell.h"

@interface HourCell ()

@end

@implementation HourCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.label.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.label.alpha = 1;
    }return self;
}
#pragma mark —— LazyLoad
-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.frame = self.bounds;
        
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _label.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:0.8 alpha:1];
        _label.font = [UIFont systemFontOfSize:12];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 2;
        [self addSubview:_label];
    }return _label;
}

@end
