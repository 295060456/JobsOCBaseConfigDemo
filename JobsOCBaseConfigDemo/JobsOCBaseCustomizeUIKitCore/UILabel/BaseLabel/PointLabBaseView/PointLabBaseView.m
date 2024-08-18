//
//  PointLabView.m
//  FM
//
//  Created by User on 8/15/24.
//

#import "PointLabBaseView.h"

@interface PointLabBaseView ()
/// UI
@property(nonatomic,strong)UIView *pointView;
@property(nonatomic,strong)UILabel *label;

@end

@implementation PointLabBaseView
@synthesize viewModel = _viewModel;
#pragma mark —— SysMethod
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.pointView.alpha = 1;
        self.label.alpha = 1;
    };
}
#pragma mark —— 一些公有方法
-(void)updatePointViewPositionWithOffsetY:(CGFloat)y{
    [self.pointView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(y);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)updateLabelPositionWithOffsetX:(CGFloat)x{
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pointView.mas_right).offset(x);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
#pragma mark —— lazyLoad
-(UIView *)pointView{
    if(!_pointView){
        _pointView = UIView.new;
        [self addSubview:_pointView];
        [_pointView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(8), JobsWidth(8)));
            make.left.top.equalTo(self);
        }];
    }return _pointView;
}

-(UILabel *)label{
    if(!_label){
        _label = UILabel.new;
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pointView.mas_right);
            make.top.bottom.right.equalTo(self);
        }];
    }return _label;
}

@end
