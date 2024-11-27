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
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.font = UIFontWeightBoldSize(JobsWidth(14));
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 2;
            self.contentView.addSubview(label);
        });
    }return _label;
}

-(UILabel *)sortArrow{
    if(!_sortArrow){
        _sortArrow = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.text = @"";
//            label.backgroundColor = JobsRedColor;
            label.font = [UIFont boldSystemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            self.contentView.addSubview(label);
        });
    }return _sortArrow;
}

@end
