//
//  LikeButton.m
//  EmitterAnimation
//
//  Created by 刘庆贺 on 2019/3/13.
//  Copyright © 2019 lmh. All rights reserved.
//

#import "RBCLikeButton.h"
#define leftTime 0.5

@interface RBCLikeButton(){
    /// 记录初始"上升数字"label的Y值
    CGFloat _incOrginY;
}
/// UI
@property(nonatomic,strong)CAEmitterLayer * explosionLayer;
@property(nonatomic,strong)UIImageView *backImageView;
@property(nonatomic,strong)UILabel *incLabel;
@property(nonatomic,strong)UILabel *countLabel;/// 点赞数量Label
/// Data
@property(nonatomic,assign)BOOL isNeedAnimation;/// 选中/取消时是否需要动画

@end

@implementation RBCLikeButton
BaseButtonProtocol_synthesize
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }return self;
}

+(instancetype)buttonWithConfiguration:(UIButtonConfiguration *)configuration
                         primaryAction:(nullable UIAction *)primaryAction{
    return [super buttonWithConfiguration:configuration primaryAction:primaryAction];
}
#pragma mark —— BaseButtonProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)richButtonByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable data){
        @jobs_strongify(self)
        self.viewModel = data;
        self.isNeedAnimation = YES;
        self.explosionLayer.opacity = 1;/// 设置粒子动画
        self.setupBy(data.jobsRect);/// 初始化其他控件
    };
}
/// 屏蔽drawRect
-(void)drawRect:(CGRect)rect {}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.backImageView.frame = self.imageView.frame;
    CGFloat countLabelWidth = 30;
    if(@available(iOS 16.0, *)){
        if (self.configuration.imagePlacement == NSDirectionalRectEdgeLeading) {
            self.countLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+5,
                                               self.imageView.top + (self.imageView.height - 15)/2 + 0.5,
                                               countLabelWidth,
                                               15);
        }else{
            self.countLabel.frame = CGRectMake((self.width - countLabelWidth)/2,
                                               self.height,
                                               countLabelWidth,
                                               15);
        }
    }else{
        if(self.buttonEdgeInsetsStyle == NSDirectionalRectEdgeLeading){
            self.countLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+5,
                                               self.imageView.top + (self.imageView.height - 15)/2 + 0.5,
                                               countLabelWidth,
                                               15);
        }else{
            self.countLabel.frame = CGRectMake((self.width - countLabelWidth)/2,
                                               self.height,
                                               countLabelWidth,
                                               15);
        }
    }
}
/// 没有高亮状态
-(void)setHighlighted:(BOOL)highlighted{}
/// 选中状态
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {  // 从取消状态到点击状态
        /// 1.隐藏点赞label
        self.countLabel.alpha = 0;
        self.countLabel.textColor = HEXCOLOR(0xFD5656);
        /// 不需要动画时,返回,不需要动画说明是获取数据后的赋值操作
        if (!_isNeedAnimation) {
            self.countLabel.alpha = 1;
            return;
        }
        /// 2.放大拳头动画
        [self enlargementAnimation];
        /// 开始动画时展示"+1"上升label,先隐藏它
        self.incLabel.hidden = NO;
        /// 延迟这里有问题,延迟时间设置为0则没有问题,如果添加了延时时间,那么已经开始的动画无法移除
        /// 3.执行上升数字动画
        [self performSelector:@selector(countAnimation) withObject:nil afterDelay:0.0];
        /// 4.执行粒子动画
        [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.2];
        /// 5.点赞数出现动画
        [self performSelector:@selector(countLabelAppearAnimation) withObject:nil afterDelay:0.5];
    }else{
        /// 从点击状态normal状态 无动画效果 如果点赞之后马上取消 那么也立马停止动画
        /// 手动取消赞时,隐藏"+1"上升label
        self.incLabel.hidden = YES;
        self.incLabel.alpha = 0;
        [self.incLabel.layer removeAllAnimations];
        self.countLabel.textColor = HEXCOLOR(0xCFD2D6);
    }
}
/// 当点赞数改变时,就改变
-(void)setThumpNum:(NSInteger)thumpNum {
    _thumpNum = thumpNum;
    self.countLabel.text = self.sentenceListStandard(toStringByLong(thumpNum));
}

-(void)setThumbWithSelected:(BOOL)selected
                   thumbNum:(NSInteger)thumbNum
                  animation:(BOOL)animation {
    self.isNeedAnimation = animation;
    self.selected = selected;
    self.thumpNum = thumbNum;
}

-(void)cancelLike{
    self.isNeedAnimation = NO;
    self.selected = NO;
}

-(void)recoverLike{
    self.isNeedAnimation = NO;
    self.thumpNum += 1;
    self.selected = YES;
}
/// 开始粒子动画
-(void)startAnimation{
    self.explosionLayer.birthRate = 1;/// 设置颗粒个数
    self.explosionLayer.beginTime = CACurrentMediaTime() - 0.2;/// 开始动画
    [self performSelector:@selector(autoStopAnimation) withObject:nil afterDelay:leftTime];/// 延迟停止动画
}
/// 自动结束粒子动画
-(void)autoStopAnimation{
    // 用KVC设置颗粒个数
    self.explosionLayer.birthRate = 0;
    [self.explosionLayer removeAllAnimations];
}
#pragma mark —— 一些私有方法
-(jobsByFrameBlock _Nonnull)setupBy{
    @jobs_weakify(self)
    return ^(CGRect frame){
        @jobs_strongify(self)
        self.backImageView.alpha = 1;
        self.incLabel.alpha = 1;
        self.countLabel.alpha = 1;
        self.explosionLayer.position = CGPointMake(self.bounds.size.width * 0.5,
                                                   self.bounds.size.height * 0.5);
        /// 设置"+1"上升label的frame
        CGFloat height = 30;
        CGFloat width = height;
        self.incLabel.frame = CGRectMake((self.width - width)/2,
                                         (self.height - height)/2,
                                         width,
                                         height);
        /// 记录"+1"上升label的初始Y值
        self->_incOrginY = self.incLabel.frame.origin.y;
    };
}

-(JobsReturnStringByStringBlock _Nonnull)sentenceListStandard{
    return ^__kindof NSString *_Nullable(NSString *_Nullable orginStr){
        NSInteger orginInt = orginStr.integerValue;
        if (orginInt >= 10000) {
            NSInteger wan = orginInt / 10000;
            NSInteger qian = (orginInt - wan * 10000)/1000;
            return qian > 0 ? [NSString stringWithFormat:@"%ld.%ldw",wan,qian] : [NSString stringWithFormat:@"%ldw",wan];
        }else if (orginInt >= 1000){
            NSInteger qian = orginInt / 1000;
            NSInteger bai = (orginInt - qian * 1000)/100;
            return bai > 0 ? [NSString stringWithFormat:@"%ld.%ldk",qian,bai] :[NSString stringWithFormat:@"%ldk",qian];
        }else return orginStr;
    };
}
/// 手动结束动画
-(jobsByVoidBlock _Nonnull)manualStopAnimation{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.incLabel.alpha = 0;
        [self.incLabel.layer removeAllAnimations];
    };
}
/// 点赞数值出现动画
-(jobsByVoidBlock _Nonnull)countLabelAppearAnimation{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if (self.selected){ /// 如果此时取消了点赞,则不执行动画
            @jobs_weakify(self)
            [@"countLabel" makeCAKeyframeAnimationByBlock:^(CAKeyframeAnimation * _Nullable animation) {
                @jobs_strongify(self)
                animation.duration = 0.8;
                animation.calculationMode = kCAAnimationCubic;
                animation.keyPath = @"opacity";
                animation.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                    data.add(@0.2);
                    data.add(@0.5);
                    data.add(@0.8);
                    data.add(@1);
                });[self.countLabel.layer addAnimation:animation forKey:nil];
            }];
        }self.countLabel.alpha = 1;
    };
}
/// 拳头放大动画
-(jobsByVoidBlock _Nonnull)enlargementAnimation{
    @jobs_weakify(self)
    return ^(){
        /// 通过键帧动画实现缩放
        @jobs_strongify(self)
        jobsMakeCAKeyframeAnimation(^(CAKeyframeAnimation * _Nullable animation) {
            @jobs_strongify(self)
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.5,@2.0,@3.5];
            animation.duration = 0.25;
            animation.calculationMode = kCAAnimationCubic;
            [self.backImageView.layer addAnimation:animation forKey:nil];
        });self.backImageView.alpha = 0.2;
    };
}

-(jobsByVoidBlock _Nonnull)countAnimation{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        /// 1、添加数字+1透明度动画
        jobsMakeCAKeyframeAnimation(^(CAKeyframeAnimation * _Nullable animation) {
            animation.duration = 0.5;
            animation.calculationMode = kCAAnimationCubic;
            animation.keyPath = @"opacity";
            animation.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@0.5);
                data.add(@0.8);
                data.add(@1.0);
            });[self.incLabel.layer addAnimation:animation forKey:nil];
        });
        /// 开始动画时"+1"上升label回到起始位置
        self.incLabel.top = self->_incOrginY;
        /// 防止label闪烁
        self.incLabel.alpha = 1;
        /// 2、添加"+1"慢慢变大动画
        jobsMakeCAKeyframeAnimation(^(CAKeyframeAnimation * _Nullable animation) {
            animation.duration = 1.0;
            animation.calculationMode = kCAAnimationCubic;
            animation.keyPath = @"transform.scale";
            animation.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(@1.0);
                data.add(@1.1);
                data.add(@1.2);
            });[self.incLabel.layer addAnimation:animation forKey:nil];
        });
        /// 3、添加"+1"s向上位移动画
        [UIView animateWithDuration:0.5
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
            @jobs_strongify(self)
            self.incLabel.top = self->_incOrginY - 18;
        } completion:^(BOOL finished) {
            @jobs_strongify(self)
            /// 4、添加"+1"慢慢消失动画
            jobsMakeCAKeyframeAnimation(^(CAKeyframeAnimation *_Nullable animation) {
                @jobs_strongify(self)
                animation.duration = 0.5;
                animation.calculationMode = kCAAnimationCubic;
                animation.keyPath = @"opacity";
                animation.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                    data.add(@0.8);
                    data.add(@0.5);
                    data.add(@0);
                });[self.incLabel.layer addAnimation:animation forKey:nil];
            });self.incLabel.alpha = 0;
        }];
    };
}
#pragma mark —— LazyLoad
-(UILabel *)countLabel{
    if(!_countLabel){
        @jobs_weakify(self)
        _countLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(12);
            label.textColor = HEXCOLOR(0xCFD2D6);
            label.text = @"0";
            label.numberOfLines = 1;
            if(@available(iOS 16.0, *)){
                if (self.configuration.imagePlacement == NSDirectionalRectEdgeLeading) {
                    label.textAlignment = NSTextAlignmentLeft;
                }else{
                    label.textAlignment = NSTextAlignmentCenter;
                }
            }else{
                if(self.buttonEdgeInsetsStyle == NSDirectionalRectEdgeLeading){
                    label.textAlignment = NSTextAlignmentLeft;
                }else{
                    label.textAlignment = NSTextAlignmentCenter;
                }
            }self.addSubview(label);
        });
    }return _countLabel;
}

-(UILabel *)incLabel{
    if(!_incLabel){
        @jobs_weakify(self)
        _incLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(13);
            label.textColor = HEXCOLOR(0xFD5656);
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"+1";
            label.alpha = 0;
            label.numberOfLines = 1;
            self.addSubview(label);
        });
    }return _incLabel;
}

-(UIImageView *)backImageView{
    if(!_backImageView){
        @jobs_weakify(self)
        _backImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView.image = JobsBuddleIMG(@"bundle",
                                            @"RBCLikeButton",
                                            nil,
                                            @"day_like_red");
            self.addSubview(imageView);
        });
    }return _backImageView;
}
/// 发射源
-(CAEmitterLayer *)explosionLayer{
    if(!_explosionLayer){
        _explosionLayer = jobsMakeCAEmitterLayer(^(__kindof CAEmitterLayer * _Nullable layer) {
            self.layer.add(layer);
            /// 发射位置 - 粒子从哪里出现开始扩散
            /// layer.emitterSize = CGSizeMake(self.bounds.size.width + 3, self.bounds.size.height + 3);
            layer.emitterShape = kCAEmitterLayerPoint;/// 发射源的形状
            layer.birthRate = 0;/// 每秒发射cell的数量
            layer.emitterMode = kCAEmitterLayerVolume;/// 发射模式: 从发射体的哪个位置发出c粒子: 某个点,表面,边缘,体内(3D)
            layer.renderMode = kCAEmitterLayerAdditive;/// 粒子的渲染模式
            /// 粒子
            layer.emitterCells = @[jobsMakeCAEmitterCell(^(__kindof CAEmitterCell * _Nullable cell) {
                cell.alphaSpeed = -1.0;/// 透明度变化速度
                cell.alphaRange = 0.5;/// 透明度变化范围
                cell.lifetime = leftTime;/// 粒子存在时间
                cell.lifetimeRange = 0.5;/// 粒子存在时间的范围
                cell.birthRate = 15;/// 每个cell可以释放多少个粒子
                cell.velocity = 75.f;/// 粒子扩散的速度
                cell.velocityRange = 10.f;/// 粒子扩散的速度上下区间 +10 or -10
                //最大 - M_PI_4/2  粒子发射方向
                cell.emissionLongitude = - M_PI_2;
                cell.emissionRange = M_PI_2;
                cell.scale = 0.08;/// 粒子形变大小
                //explosionCell.scaleRange = 0.02;/// 形变范围
                cell.contents = (id)[JobsBuddleIMG(@"bundle",@"RBCLikeButton",nil, @"spark_red") CGImage];/// 粒子内容
                cell.color = HEXCOLOR(0xFE6262).CGColor;/// 粒子初始颜色
                /// 粒子其他混合颜色
                cell.redRange = 10;
                cell.greenRange = 10;
                cell.blueRange = 10;
                /// 混合色颜色变化速度
                cell.redSpeed = 10;
                cell.greenSpeed = 10;
                cell.blueSpeed = 10;
            })];
        });
    }return _explosionLayer;
}

@end
