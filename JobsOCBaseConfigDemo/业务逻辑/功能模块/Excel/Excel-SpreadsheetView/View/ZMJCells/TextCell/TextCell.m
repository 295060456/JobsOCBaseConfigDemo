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
        _bgView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.backgroundColor = RGBA_COLOR(0, 0, 1, .2f);
        });
    }return _bgView;
}

-(UILabel *)label{
    if(!_label){
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.frame = self.bounds;
            label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            label.textAlignment = NSTextAlignmentCenter;
            self.contentView.addSubview(label);
        });
    }return _label;
}

@end
