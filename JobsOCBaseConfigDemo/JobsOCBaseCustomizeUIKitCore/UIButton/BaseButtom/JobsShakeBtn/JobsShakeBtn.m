//
//  JobsShakeBtn.m
//  My_BaseProj
//
//  Created by hello on 2019/7/4.
//  Copyright © 2019 Corp. All rights reserved.
//

#import "JobsShakeBtn.h"

@interface JobsShakeBtn ()
/// UI
@property(nonatomic,strong)UIView *coverView;/// 遮盖，在抖动时出现
@property(nonatomic,strong)UITapGestureRecognizer *iconBtnTap;
@property(nonatomic,strong)CAKeyframeAnimation *anim;

@end

@implementation JobsShakeBtn

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 调整位置
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.width;

    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    if (self.mj_w >= self.height) {
        self.titleLabel.height = 20;
        self.titleLabel.y = self.height - self.titleLabel.height;
    } else {
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.height = self.height - self.titleLabel.y;
    }

    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self bringSubviewToFront:_iconBtn];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.jobsResetBtnImage(JobsBuddleIMG(@"bundle",@"Others",nil,@"加号.png"));
    [self addLongPressGestureRecognizer];
    self.iconBtn.hidden = YES;
}
#pragma mark —— 一些私有方法
/// 添加长按手势
- (void)addLongPressGestureRecognizer {
    self.numberOfTouchesRequired = 1;
    self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
    self.minimumPressDuration = 0.1;
    self.numberOfTouchesRequired = 1;
    self.allowableMovement = 1;
    self.userInteractionEnabled = YES;
    self.target = self;
    @jobs_weakify(self)
    self.longPressGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                             UITapGestureRecognizer *_Nullable arg) {
        @jobs_strongify(self)
        if (![self.imageView.image isEqual:JobsBuddleIMG(nil,@"Others",nil,@"加号.png")]) {
            if (self.shaking) return nil;
            self.shaking = YES;
        }return nil;
    }];self.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
}
/// 是否执行动画
- (void)setShaking:(BOOL)shaking {
    if (shaking) {
        [self.layer addAnimation:self.anim
                          forKey:@"shake"];
        self.coverView.hidden = NO;
        self.iconBtn.hidden = NO;
    } else {
        [self.layer removeAllAnimations];
        self.coverView.hidden = YES;
        self.iconBtn.hidden = YES;
    }
}
/// 点击右上角按钮
- (void)iconClick{
    if(self.objectBlock)self.objectBlock(self);
}
#pragma mark —— lazyLoad
- (UIImageView *)iconBtn {
    if (!_iconBtn) {
        _iconBtn = [UIImageView.alloc initWithImage:JobsIMG(@"del_Photo")];
        _iconBtn.userInteractionEnabled = YES;
        _iconBtn.ableRespose = YES;
        [_iconBtn addGestureRecognizer:self.iconBtnTap];
        [self addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20,20));
            make.top.equalTo(self).offset(-20 / 2);
            make.right.equalTo(self).offset(20 / 2);
        }];
    }return _iconBtn;
}
/// 抖动动画
-(CAKeyframeAnimation *)anim{
    if (!_anim) {
    #define Angle2Radian(angle) ((angle) / 180.0 * M_PI)
        _anim = CAKeyframeAnimation.animation;
        _anim.keyPath = @"transform.rotation";
        _anim.values = @[@(Angle2Radian(-5)),
                        @(Angle2Radian(5)),
                        @(Angle2Radian(-5))];
        _anim.duration = 0.25;
        // 动画次数设置为最大
        _anim.repeatCount = MAXFLOAT;
        // 保持动画执行完毕后的状态
        _anim.removedOnCompletion = NO;
        _anim.fillMode = kCAFillModeForwards;
    }return _anim;
}

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = UIView.new;
        _coverView.backgroundColor = JobsClearColor;
        _coverView.hidden = YES;
        
        {
            _coverView.numberOfTouchesRequired = 1;
            _coverView.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            _coverView.minimumPressDuration = 0.1;
            _coverView.numberOfTouchesRequired = 1;
            _coverView.allowableMovement = 1;
            _coverView.userInteractionEnabled = YES;
            _coverView.target = self;
            @jobs_weakify(self)
            _coverView.tapGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                     UITapGestureRecognizer *_Nullable arg) {
                @jobs_strongify(self)
                self.shaking = NO;
                return nil;
            }];
            _coverView.tapGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
        }
        
        [self addSubview:_coverView];
        _coverView.frame = self.bounds;
    }return _coverView;
}

-(UITapGestureRecognizer *)iconBtnTap{
    if (!_iconBtnTap) {
        _iconBtnTap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(iconClick)];
    }return _iconBtnTap;
}

@end
