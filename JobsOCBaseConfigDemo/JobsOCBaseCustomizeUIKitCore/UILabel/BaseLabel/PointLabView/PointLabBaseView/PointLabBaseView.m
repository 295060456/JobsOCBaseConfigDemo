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
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
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
    }];self.refresh();
}

-(void)updateLabelPositionWithOffsetX:(CGFloat)x{
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pointView.mas_right).offset(x);
    }];self.refresh();
}
#pragma mark —— lazyLoad
-(UIView *)pointView{
    if(!_pointView){
        @jobs_weakify(self)
        _pointView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            self.addSubview(view);
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(8), JobsWidth(8)));
                make.left.top.equalTo(self);
            }];
        });
    }return _pointView;
}

-(UILabel *)label{
    if(!_label){@jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.pointView.mas_right);
                make.top.bottom.right.equalTo(self);
            }];
        });
    }return _label;
}

@end
