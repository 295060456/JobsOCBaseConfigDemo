//
//  JobsUploadingProgressView.m
//  DouDong-II
//
//  Created by xxx on 2021/1/12.
//

#import "JobsUploadingProgressView.h"

@interface JobsUploadingProgressView()
/// UI
@property(nonatomic,strong)UIBezierPath *bezier;
@property(nonatomic,strong)UILabel *refreshLabel;
@property(nonatomic,strong)UILabel *subrefreshLabel;
@property(nonatomic,strong)UIImageView *imgeV;
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)UIView *shapLayerView;
@property(nonatomic,strong)CAShapeLayer *shapLayer;
@property(nonatomic,strong)CAKeyframeAnimation *anim;
/// Data
@property(nonatomic,strong)NSTimerManager *nsTimerManager;

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
        self.imge = JobsIMG(@"icon_upload_imge");
        self.strokeColor = self.byPatternImage(JobsIMG(@"gradualColor").imageResize(CGSizeMake(50, 25)));; //圆环底色
        self.radius = 34;

        self.hidden = YES;
        self.backgroundColor = [[UIColor colorWithWhite:0.0 alpha:1.000] colorWithAlphaComponent:0.9];
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        
    }return self;
}
#pragma mark —— 一些公有方法
- (void)updateProgressText:(NSString *)progressText {
    self.hidden = NO;
    self.backView.hidden = NO;
    self.subrefreshLabel.text = progressText;
    if (self.nsTimerManager.timerCurrentStatus == NSTimerCurrentStatusPause) {
        [self.nsTimerManager nsTimecontinue];
    }else{
        self.nsTimerManager.nsTimeStartSysAutoInRunLoop();
    }[self starAnimation];
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
    [self.nsTimerManager nsTimePause];
    [self.nsTimerManager nsTimeDestroy];

    self.anim = nil;
}
#pragma mark —— lazyLoad
-(NSTimerManager *)nsTimerManager{
    if (!_nsTimerManager) {
        _nsTimerManager = NSTimerManager.new;
        // 顺时针:每一个时间间隔为 1 秒
        _nsTimerManager.timerStyle = TimerStyle_clockwise;
        _nsTimerManager.timeInterval = .5f;
        @jobs_weakify(self)
        [_nsTimerManager actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            self.refreshLabel.text = [self.refreshLabel.text isEqualToString:JobsInternationalization(@"正在上传...")] ? JobsInternationalization(@"正在上传") : [NSString stringWithFormat:@"%@.",self.refreshLabel.text];
        }];
    }return _nsTimerManager;
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
            self.shapLayerView.layer.add(layer);
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
            self.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
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
            self.shapLayerView.addSubview(imageView);
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
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
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
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
            label.textColor = JobsWhiteColor;
            label.textAlignment = NSTextAlignmentRight;
            label.font = UIFontWeightBoldSize(JobsWidth(12));
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-JobsWidth(8));
                make.bottom.equalTo(self).offset(-JobsWidth(8));
            }];
        });
    }return _subrefreshLabel;
}

@end
