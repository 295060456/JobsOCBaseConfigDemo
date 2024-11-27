//
//  TimeTitleCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "TimeTitleCell.h"

@interface TimeTitleCell ()

@end

@implementation TimeTitleCell

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
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.font = UIFontBoldSystemFontOfSize(JobsWidth(12));
            label.textAlignment = NSTextAlignmentCenter;
            self.contentView.addSubview(label);
        });
    }return _label;
}

@end
