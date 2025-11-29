//
//  SlideToUnlockView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/29/25.
//

#import "SlideToUnlockView.h"

@interface SlideToUnlockView ()

Prop_assign()CGFloat thumbInset;
Prop_assign()CGSize  thumbSize;
Prop_assign()CGFloat panStartProgress;   // < 手势开始时的进度备份
Prop_assign()CGFloat progress;           // < 0 ~ 1，映射滑块位置

Prop_strong()UIView *trackView;
Prop_strong()UILabel *titleLabel;
Prop_strong()UIImageView  *arrow;
Prop_strong()UIView *thumbView;

Prop_strong()MASConstraint *thumbLeadingConstraint;

@end

@implementation SlideToUnlockView
#pragma mark - Init
-(instancetype)init{
    if(self = [super init]){
        [self commonInit];
    }return self;
}

-(void)commonInit{
    self.backgroundColor = UIColor.clearColor;
    self.thumbInset = 4.f;
    self.thumbSize  = CGSizeMake(52.f, 52.f);
    self.progress   = 0.f;

    self.trackView.byVisible(YES);// 轨道
    self.titleLabel.byVisible(YES);// 中央文字
    self.thumbView.byVisible(YES);// 滑块
    self.arrow.byVisible(YES);// 箭头
}
#pragma mark —— Layout
-(void)layoutSubviews {
    [super layoutSubviews];
    self.byUpdateLayoutForProgress(NO);
}
#pragma mark —— 一些公有方法
/// State
-(void)setProgress:(CGFloat)progress {
    CGFloat v = MIN(MAX(progress, 0.f), 1.f);
    if (fabs(_progress - v) < FLT_EPSILON) { return; }
    _progress = v;
    self.byUpdateLayoutForProgress(NO);
}
/// DSL: byOnUnlock 点语法
-(SlideToUnlockView * _Nonnull (^)(jobsByVoidBlock _Nullable))byOnUnlock{
    @jobs_weakify(self)
    return ^SlideToUnlockView * (jobsByVoidBlock handler) {
        @jobs_strongify(self)
        self.onUnlock = handler;
        return self;
    };
}
#pragma mark —— 一些私有方法
/// 更新根据 progress 的布局
-(jobsByBOOLBlock _Nonnull)byUpdateLayoutForProgress{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (self.bounds.size.width <= 0) return;
        CGFloat maxOffset = self.bounds.size.width - self.thumbInset - self.thumbSize.width;
        CGFloat offset = self.thumbInset + maxOffset * self.progress;
        [self.thumbLeadingConstraint setOffset:offset];
        self.titleLabel.alpha = 1.f - self.progress * 0.8f;
        if (animated) {
            [UIView animateWithDuration:0.2 animations:^{
                @jobs_strongify(self)
                [self layoutIfNeeded];
            }];
        }
    };
}

-(jobsByBOOLBlock _Nonnull)byResetAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        self.progress = 0.f;
        self.byUpdateLayoutForProgress(animated);
    };
}
#pragma mark - Lazyload
-(UIView *)trackView{
    if (!_trackView) {
        @jobs_weakify(self)
        _trackView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = UIColor.systemGray5Color;
            view.layer.cornerRadius = 28.f;
            view.layer.masksToBounds = YES;
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
        });
    }return _trackView;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = @"滑动以解锁".tr;
            label.textColor = UIColor.darkGrayColor;
            label.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 16, 0, 16));
            }];
        });
    }return _titleLabel;
}

-(UIView *)thumbView{
    if(!_thumbView){
        @jobs_weakify(self)
        _thumbView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = UIColor.whiteColor;
            view.layer.cornerRadius = self.thumbSize.height / 2.f;
            view.layer.masksToBounds = YES; // 和你 Swift 一样
            view.layer.shadowColor = UIColor.blackColor.CGColor;
            view.layer.shadowOpacity = 0.15f;
            view.layer.shadowRadius = 4.f;
            view.layer.shadowOffset = CGSizeMake(0, 2);
            view.userInteractionEnabled = YES;
            view.addGesture([jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
                /// 这里写手势的配置
            }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable pan) {
                /// 这里写手势的触发
                @jobs_strongify(self)
                UIView *container = pan.view.superview;
                if (!container) return;
                CGPoint translation = [pan translationInView:container];
                CGFloat dragWidth = MAX(container.bounds.size.width
                                        - self.thumbInset * 2.f
                                        - self.thumbSize.width,
                                        1.f);

                switch (pan.state) {
                    case UIGestureRecognizerStateBegan: {
                        self.panStartProgress = self.progress;
                    } break;

                    case UIGestureRecognizerStateChanged: {
                        CGFloat delta = translation.x / dragWidth;
                        self.progress = self.panStartProgress + delta;
                        [self layoutIfNeeded];
                    } break;

                    case UIGestureRecognizerStateEnded:
                    case UIGestureRecognizerStateCancelled:
                    case UIGestureRecognizerStateFailed: {
                        if (self.progress > 0.85f) {
                            self.progress = 1.f;
                            self.byUpdateLayoutForProgress(YES);
                            if (self.onUnlock) self.onUnlock();
                            // 如果希望可重复使用，稍后自动复位
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)),
                                           dispatch_get_main_queue(), ^{
                                @jobs_strongify(self)
                                if(self) self.byResetAnimated(YES);
                            });
                        } else {
                            self.byResetAnimated(YES);
                        }
                    } break;

                    default:
                        break;
                }
            }]);
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerY.equalTo(self);
                make.size.mas_equalTo(self.thumbSize);
                self.thumbLeadingConstraint = make.leading.equalTo(self).offset(self.thumbInset);
            }];
        });
    }return _thumbView;
}

-(UIImageView *)arrow{
    if(!_arrow){
        @jobs_weakify(self)
        _arrow = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.tintColor = UIColor.systemBlueColor;
            imageView.image = [UIImage systemImageNamed:@"chevron.right" withConfiguration:[UIImageSymbolConfiguration configurationWithPointSize:18 weight:UIImageSymbolWeightBold]];
            [self.thumbView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.thumbView);
            }];
        });
    }return _arrow;
}

@end
