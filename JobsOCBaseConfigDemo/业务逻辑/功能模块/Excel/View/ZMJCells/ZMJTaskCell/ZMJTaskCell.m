//
//  ZMJTaskCell.m
//  FM
//
//  Created by User on 7/27/24.
//

#import "ZMJTaskCell.h"

@interface ZMJTaskCell ()

@end

@implementation ZMJTaskCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        
    }return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.alpha = 1;
}

@end
