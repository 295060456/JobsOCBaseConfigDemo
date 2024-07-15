//
//  LZTabBar.m
//  LZTabBarController
//
//  Created by Artron_LQQ on 2016/12/12.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZTabBar.h"

@interface LZTabBar ()

@property(nonatomic,strong)UIVisualEffectView *effectView;
@property(nonatomic,strong)UIView *topLine;

@end

@implementation LZTabBar

- (instancetype)init {
    if (self = [super init]) {
        
    }return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.effectView.frame = self.bounds;
    [self setupItems];
    self.topLine.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 0.6);
}

- (void)setupItems {
    CGFloat width = CGRectGetWidth(self.frame)/self.items.count;
    CGFloat height = CGRectGetHeight(self.frame);
    for (int i = 0; i < self.items.count; i++) {
        LZTabBarItem *item = [self.items objectAtIndex:i];
        item.frame = CGRectMake(i*width, 0, width, height);
        [self addSubview:item];
        item.delegate = self;
    }
}
#pragma mark —— LZTabBarDelegate
- (void)tabBarItem:(LZTabBarItem *)item
    didSelectIndex:(NSInteger)index {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBar:didSelectItem:atIndex:)]) {
        [self.delegate tabBar:self
                didSelectItem:item
                      atIndex:index];
    }
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = UIView.new;
        _topLine.backgroundColor = JobsGrayColor;
        [self addSubview:_topLine];
    }return _topLine;
}

- (UIVisualEffectView *)effectView {
    if (!_effectView) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _effectView = [UIVisualEffectView.alloc initWithEffect:effect];
        _effectView.alpha = 1.0;
        [self addSubview:_effectView];
    }return _effectView;
}

@end
