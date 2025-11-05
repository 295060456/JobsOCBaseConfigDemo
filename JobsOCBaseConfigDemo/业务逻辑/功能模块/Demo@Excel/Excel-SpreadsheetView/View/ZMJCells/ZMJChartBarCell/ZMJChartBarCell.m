//
//  ZMJChartBarCell.m
//  FM
//
//  Created by User on 7/27/24.
//

#import "ZMJChartBarCell.h"

@interface ZMJChartBarCell ()

@end

@implementation ZMJChartBarCell : ZMJCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.alpha = 1;
    self.colorBarView.alpha = 1;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        
    }return self;
}

@end
