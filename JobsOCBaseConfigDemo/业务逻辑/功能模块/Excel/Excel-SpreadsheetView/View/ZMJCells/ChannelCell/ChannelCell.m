//
//  ChannelCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "ChannelCell.h"

@interface ChannelCell ()

@end

@implementation ChannelCell

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

- (void)setChannel:(NSString *)channel {
    _channel = channel;
    self.label.text = channel;
}
#pragma mark —— LazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.backgroundColor = JobsDarkGrayColor;
            label.font = UIFontWeightBoldSize(JobsWidth(15));
            label.textColor = JobsLightGrayColor.colorWithAlphaComponentBy(.7f);
            label.textAlignment = NSTextAlignmentCenter;
            label.numberOfLines = 2;
            self.addSubview(label);
        });
    }return _label;
}

@end
