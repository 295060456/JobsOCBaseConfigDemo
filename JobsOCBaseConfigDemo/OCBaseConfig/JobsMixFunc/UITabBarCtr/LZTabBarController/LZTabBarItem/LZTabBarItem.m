//
//  LZTabBarItem.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/14.
//

#import "LZTabBarItem.h"

static NSInteger defaultTag = 100000;

@interface LZTabBarItem ()

@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *titleLabel;

@end

@implementation LZTabBarItem

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [UITapGestureRecognizer.alloc initWithTarget:self
                                                                            action:@selector(itemClicked:)];
        [self addGestureRecognizer:tap];
    }return self;
}

- (void)setTag:(NSInteger)tag {
    
    [super setTag:tag + defaultTag];
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = UIImageView.new;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_iconImageView];
    }return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.new;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = JobsGrayColor;
        [self addSubview:_titleLabel];
    }return _titleLabel;
}

- (void)setIcon:(NSString *)icon {
    _icon = icon;
    self.iconImageView.image = [UIImage imageNamed:icon];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat space = 6.0;
    switch (self.type) {
        case LZTabBarItemTypeDefault: {
            CGFloat iconHeight = (CGRectGetHeight(self.frame) - space * 3)*2/3.0 ;
            self.iconImageView.frame = CGRectMake(space,
                                                  space,
                                                  CGRectGetWidth(self.frame) - 2 * space,
                                                  iconHeight);
            self.titleLabel.frame = CGRectMake(space, 
                                               CGRectGetMaxY(self.iconImageView.frame) + space,
                                               CGRectGetWidth(self.frame) - 2*space,
                                               iconHeight/2.0);
        }
            break;
        case LZTabBarItemTypeImage: {
            self.iconImageView.frame = CGRectMake(space,
                                                  space,
                                                  CGRectGetWidth(self.frame) - 2*space, 
                                                  CGRectGetHeight(self.frame) - 2*space);
        }
            break;
        case LZTabBarItemTypeText: {
            self.titleLabel.frame = CGRectMake(space,
                                               space,
                                               CGRectGetWidth(self.frame) - 2*space,
                                               CGRectGetHeight(self.frame) - 2*space);
        }
            break;
            
        default:
            break;
    }
//    if (self.icon.length > 0 && self.title.length > 0) {
//
//        CGFloat iconHeight = (CGRectGetHeight(self.frame) - space * 3)*2/3.0 ;
//        self.iconImageView.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2 * space, iconHeight);
//        self.titleLabel.frame = CGRectMake(space, CGRectGetMaxY(self.iconImageView.frame) + space, CGRectGetWidth(self.frame) - 2*space, iconHeight/2.0);
//    } else if (self.icon.length > 0 && self.title.length <= 0) {
//
//        self.iconImageView.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2*space, CGRectGetHeight(self.frame) - 2*space);
//    } else if (self.title.length > 0 && self.icon.length <= 0) {
//
//        self.titleLabel.frame = CGRectMake(space, space, CGRectGetWidth(self.frame) - 2*space, CGRectGetHeight(self.frame) - 2*space);
//    }
}

- (void)itemClicked:(UITapGestureRecognizer *)tap {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarItem:didSelectIndex:)]) {
        [self.delegate tabBarItem:self didSelectIndex:self.tag - defaultTag];
    }
}

@end

