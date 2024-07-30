//
//  ZMJTextCell.m
//  FM
//
//  Created by User on 7/27/24.
//

#import "ZMJTextCell.h"

@interface ZMJTextCell ()

@end

@implementation ZMJTextCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.btn.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.btn.alpha = 1;
    }return self;
}

@end
