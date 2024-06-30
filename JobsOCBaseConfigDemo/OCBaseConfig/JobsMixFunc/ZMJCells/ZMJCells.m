//
//  ZMJCells.m
//  ZMJGanttChart_Example
//
//  Created by Jason on 2018/1/29.
//  Copyright © 2018年 keshiim. All rights reserved.
//

#import "ZMJCells.h"
#import "ZMJCell+CustomView.h"

#pragma mark —— ZMJHeaderCell
@implementation ZMJHeaderCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0];
        self.btn.alpha = 1;
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.backgroundColor = [UIColor colorWithWhite:0.95f alpha:1.0];
        self.btn.alpha = 1;
    }return self;
}

@end
#pragma mark —— ZMJTextCell
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
#pragma mark —— ZMJTaskCell
@implementation ZMJTaskCell : ZMJCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {}
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.btn.alpha = 1;
}

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

