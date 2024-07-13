//
//  JobsCustomTabBaritem.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/13/24.
//

#import "JobsCustomTabBaritem.h"

@implementation JobsCustomTabBaritem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.button];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.button.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.button.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.button.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.button.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

@end
