//
//  JobsUploadingProgressView.m
//  DouDong-II
//
//  Created by xxx on 2021/1/12.
//

#import "JobsUploadingProgressView.h"

@interface JobsUploadingProgressView()
/// UI
Prop_strong()UIBezierPath *bezier;
Prop_strong()UILabel *refreshLabel;
Prop_strong()UILabel *subrefreshLabel;
Prop_strong()UIImageView *imgeV;
Prop_strong()UIView *backView;
Prop_strong()UIView *shapLayerView;
Prop_strong()CAShapeLayer *shapLayer;
Prop_strong()CAKeyframeAnimation *anim;

@end

@implementation JobsUploadingProgressView
static JobsUploadingProgressView *static_uploadingProgressView = nil;
+(instancetype)sharedManager{
    @synchronized(self){
        if (!static_uploadingProgressView) {
            static_uploadingProgressView = [JobsUploadingProgressView.alloc initWithFrame:CGRectMake((JobsMainScreen_WIDTH() - 267) / 2,
                                                                                                   JobsMainScreen_HEIGHT() / 2 - 76,
                                                                                                   267,
                                                                                                   76)];
        }
    }return static_uploadingProgressView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        static_uploadingProgressView = self;
        [MainWindow addSubview:self];
        [MainWindow bringSubviewToFront:self];
        self.imge = @"icon_upload_imge".img;
        self.strokeColor = self.byPatternImage(@"gradualColor".img.imageResize(CGSizeMake(50, 25)));; //圆环底色
        self.radius = 34;

        self.hidden = YES;
        
        self.backgroundColor = JobsWhiteColor.colorWithAlphaComponentBy(.9f);
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        
    }return self;
}
#pragma mark —— 一些公有方法
- (void)updateProgressText:(NSString *)progressText {
    self.hidden = NO;
    self.backView.hidden = NO;
    self.subrefreshLabel.text = progressText;
    [self starAnimation];
}
#pragma mark —— 一些私有方法
/// 创建动画
- (void)starAnimation{
    self.shapLayer.hidden = NO;
    self.imgeV.alpha = 1;
}

-(void)dismiss{
    self.hidden = YES;
    self.backView.hidden = YES;
    [self.shapLayer removeAnimationForKey:@"CLAnimation"];
    [self.timer stop];

    self.anim = nil;
}
#pragma mark —— lazyLoad
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeNSTimer)
            .byTimerStyle(TimerStyle_clockwise) // 倒计时模式
            .byTimeInterval(1)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                self.refreshLabel.byText(JobsInternationalization(@"正在上传..."));
                if (self.objBlock) self.objBlock(timer);
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"倒计时结束...");
                if (self.objBlock) self.objBlock(timer);
            });

            timer.accumulatedElapsed       = 0;
            timer.lastStartDate            = nil;
        });
    }return _timer;
}

- (CAShapeLayer *)shapLayer{
    if (!_shapLayer) {
        @jobs_weakify(self)
        _shapLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer.frame = CGRectMake(0, 0, self.radius, self.radius);
            layer.fillColor = JobsClearColor.CGColor;
            layer.lineWidth = 2.0f;
            layer.strokeColor = self.strokeColor.CGColor;//线条颜色
            layer.path = self.bezier.CGPath;
            layer.strokeStart = 0;
            layer.strokeEnd = 0.85;
            [layer addAnimation:self.anim forKey:@"CLAnimation"];
            self.shapLayerView.layer.addSublayer(layer);
        });
    }return _shapLayer;
}

-(UIBezierPath *)bezier{
    if (!_bezier) {
        _bezier = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,
                                                                    0,
                                                                    self.radius,
                                                                    self.radius)];//画个圆
    }return _bezier;
}

-(CAKeyframeAnimation *)anim{
    if (!_anim) {
        _anim = jobsMakeCAKeyframeAnimation(^(__kindof CAKeyframeAnimation * _Nullable animation) {
            animation.repeatCount = MAXFLOAT;
            animation.duration = 1;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            animation.keyPath = @"transform.rotation";
            animation.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@(M_PI/4.0));
                data.add(@(M_PI * 2/4.0));
                data.add(@(M_PI * 3/4.0));
                data.add(@(4 * M_PI /4.0));
                data.add(@(5 *M_PI/4.0));
                data.add(@(6 *M_PI/4.0));
                data.add(@(7 *M_PI/4.0));
                data.add(@(8 * M_PI /4.0));
                data.add(@(8 * M_PI /4.0 + M_PI/4.0));
            });
        });
    }return _anim;
}

- (UIView *)shapLayerView{
    if (!_shapLayerView) {
        @jobs_weakify(self)
        _shapLayerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            [self.addSubview(view) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.left.equalTo(self).offset(JobsWidth(62));
                make.height.offset(self.radius + JobsWidth(2));
                make.width.offset(self.radius + JobsWidth(2));
            }];
        });
    }return _shapLayerView;
}

-(UIImageView *)imgeV{
    if (!_imgeV) {
        @jobs_weakify(self)
        _imgeV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = self.imge;
            [self.shapLayerView.addSubview(imageView) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.shapLayerView).offset(-JobsWidth(2)); // 由于图片不是对称的，需要位置微调
                make.centerX.equalTo(self.shapLayerView).offset(-JobsWidth(8)); // 位置微调
                make.size.mas_equalTo(CGSizeMake(JobsWidth(12), JobsWidth(20)));
            }];
        });
    }return _imgeV;
}

- (UILabel *)refreshLabel{
    if (!_refreshLabel) {
        @jobs_weakify(self)
        _refreshLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = JobsWhiteColor;
            label.text = JobsInternationalization(@"正在上传...");
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.shapLayerView.mas_right).offset(JobsWidth(12));
                make.centerY.equalTo(self);
            }];
        });
    }return _refreshLabel;
}

- (UILabel *)subrefreshLabel{
    if (!_subrefreshLabel) {
        @jobs_weakify(self)
        _subrefreshLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentRight)
                .byFont(UIFontWeightBoldSize(JobsWidth(12)));
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-JobsWidth(8));
                make.bottom.equalTo(self).offset(-JobsWidth(8));
            }];
        });
    }return _subrefreshLabel;
}

@end
