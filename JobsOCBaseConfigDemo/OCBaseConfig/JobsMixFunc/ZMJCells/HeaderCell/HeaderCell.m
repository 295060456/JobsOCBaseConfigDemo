//
//  HeaderCell.m
//  FM
//
//  Created by User on 7/27/24.
//

#import "HeaderCell.h"

@interface HeaderCell ()

@end

@implementation HeaderCell

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.label.alpha = 1;
        self.sortArrow.alpha = 1;
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.label.alpha = 1;
        self.sortArrow.alpha = 1;
    }return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.frame = CGRectInset(self.bounds, 4, 2);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.sortArrow sizeToFit];
    CGRect frame = self.sortArrow.frame;
    frame.origin.x = self.frame.size.width - self.sortArrow.frame.size.width - 8;
    frame.origin.y = (self.frame.size.height - self.sortArrow.frame.size.height) / 2;
    self.sortArrow.frame = frame;
}
#pragma mark —— lazyLoad
-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.frame = self.bounds;
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _label.font = UIFontWeightBoldSize(JobsWidth(14));
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 2;
        [self.contentView addSubview:_label];
    }return _label;
}

-(UILabel *)sortArrow{
    if(!_sortArrow){
        _sortArrow = UILabel.new;
        _sortArrow.text = @"";
//        _sortArrow.backgroundColor = JobsRedColor;
        _sortArrow.font = [UIFont boldSystemFontOfSize:14];
        _sortArrow.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_sortArrow];
    }return _sortArrow;
}

@end
