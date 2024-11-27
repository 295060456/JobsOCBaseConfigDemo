//
//  JhtBannerCardView.m
//  JhtBannerScrollView
//
//  GitHub主页: https://github.com/jinht
//  CSDN博客: http://blog.csdn.net/anticipate91
//
//  Created by Jinht on 2017/6/2.
//  Copyright © 2017年 JhtBannerScrollView. All rights reserved.
//

#import "JhtBannerCardView.h"

@interface JhtBannerCardView ()

@end

@implementation JhtBannerCardView
//这里只用init方法行不通
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.cardLab.alpha = 1;
        self.cardImageView.alpha = 1;

        // 覆盖在mainImageView上的view（蒙板）
        self.coverView.alpha = 1;
        self.cornerCutToCircleWithCornerRadius(8.f);
    }return self;
}
#pragma mark —— LazyLoad
- (UIImageView *)cardImageView {
    if (!_cardImageView) {
        @jobs_weakify(self)
        _cardImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.userInteractionEnabled = YES;
            self.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
            self->_cardLab = nil;//removeFromSuperview 和 alpha = 0 都没有办法达到nil的效果
        });
    }return _cardImageView;
}

-(UILabel *)cardLab{
    if (!_cardLab) {
        @jobs_weakify(self)
        _cardLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textAlignment = NSTextAlignmentCenter;
            label.userInteractionEnabled = YES;
            /// 确定 _cardLab 宽度,使字体大小自适应
            label.adjustsFontSizeToFitWidth = YES;
            label.minimumScaleFactor = 0.1;/// 设置允许文本显示的最小字体
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];self->_cardImageView = nil;/// removeFromSuperview 和 alpha = 0 都没有办法达到nil的效果
        });
    }return _cardLab;
}

-(UIView *)coverView{
    if (!_coverView){
        @jobs_weakify(self)
        _coverView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
//            view.backgroundColor = JobsWhiteColor;
            self.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _coverView;
}

@end
