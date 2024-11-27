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
    if (self = [super initWithCoder:coder]) {
        self.label.alpha = 1;
    }return self;
}
#pragma mark —— LazyLoad
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.font = [UIFont boldSystemFontOfSize:14.f];
            label.textAlignment = NSTextAlignmentCenter;
            self.contentView.addSubview(label);
        });
    }return _label;
}

@end
