//
//  WGradientProgressLab.m
//  Shooting
//
//  Created by Jobs on 2020/9/9.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "WGradientProgressView.h"

@interface WGradientProgressView ()

@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIImageView *imgV;

@end

@implementation WGradientProgressView

static dispatch_once_t dispatchOnce;
- (instancetype)init{
    if (self = [super init]) {
        dispatchOnce = 0;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    dispatch_once(&dispatchOnce, ^{
        if (self.img) {
            self.imgV.alpha = 1;
        }
        self.titleLab.alpha = 1;
    });
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = self.titleStr;
            label.textColor = self.titleColor;
            label.font = self.titleFont;
            [label sizeToFit];
            if (self.img) {
                [self.imgV addSubview:label];
            }else self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self);
            }];
        });
    }return _titleLab;
}

-(UIImageView *)imgV{
    if (!_imgV) {
        @jobs_weakify(self)
        _imgV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = self.img;
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _imgV;
}

-(UIFont *)titleFont{
    if (!_titleFont) {
        _titleFont = UIFontWeightRegularSize(JobsWidth(6.5));
    }return _titleFont;
}

-(UIColor *)titleColor{
    if (!_titleColor) {
        _titleColor = JobsRedColor;
    }return _titleColor;
}

-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    _titleLab.text = _titleStr;
//    [self.titleLab sizeToFit];
}

@end
