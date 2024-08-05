//
//  MyBlankCell.m
//  FM
//
//  Created by User on 7/30/24.
//

#import "MyBlankCell.h"

@interface MyBlankCell ()

@end

@implementation MyBlankCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    }return self;
}

#pragma mark —— LazyLoad

@end
