//
//  TextCell.m
//  FM
//
//  Created by User on 7/27/24.
//

#import "TextCell.h"

@interface TextCell ()

@property(nonatomic,strong)UIView *bgView;

@end

@implementation TextCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.selectedBackgroundView = self.bgView;
        self.label.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.selectedBackgroundView = self.bgView;
        self.label.alpha = 1;
    }return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.label.frame = CGRectInset(self.bounds, 4, 2);
}
#pragma mark —— lazyLoad
-(UIView *)bgView{
    if(!_bgView){
        _bgView = UIView.new;
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:.2f];
    }return _bgView;
}

-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        _label.frame = self.bounds;
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
    }return _label;
}

@end
