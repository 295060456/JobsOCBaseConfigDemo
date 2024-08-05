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
-(UILabel *)label{
    if(!_label){
        _label = [UILabel new];
        _label.frame = self.bounds;
        
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _label.backgroundColor = [UIColor darkGrayColor];
        _label.font = [UIFont systemFontOfSize:15];
        _label.textColor = [[UIColor lightTextColor] colorWithAlphaComponent:.7];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 2;
        [self addSubview:_label];
    }return _label;
}

@end
