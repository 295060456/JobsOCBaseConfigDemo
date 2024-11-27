//
//  ScheduleCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "ScheduleCell.h"

@interface ScheduleCell ()

@end

@implementation ScheduleCell

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

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.frame = CGRectInset(self.bounds, 4, 0);
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.backgroundView.backgroundColor = color;
}
#pragma mark —— LazyLoad
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.font = [UIFont boldSystemFontOfSize:12.f];
            label.textAlignment = NSTextAlignmentLeft;
            self.contentView.addSubview(label);
        });
    }return _label;
}

@end
