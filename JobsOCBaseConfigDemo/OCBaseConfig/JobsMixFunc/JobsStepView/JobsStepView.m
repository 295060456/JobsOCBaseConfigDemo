//
//  JobsStepView.m
//  FM
//
//  Created by User on 7/31/24.
//

#import "JobsStepView.h"

@interface JobsStepView ()

@property(nonatomic,strong)NSMutableArray <BaseButton *>*btnMutArr;
@property(nonatomic,strong)NSMutableArray <UIButtonModel *>*btnModelMutArr;

@end

@implementation JobsStepView
@synthesize viewModel = _viewModel;
#pragma mark —— BaseProtocol
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
    /// 内部指定圆切角
    [self appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                    cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
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
    return ^(NSMutableArray <UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.btnModelMutArr = model;
        self.makeBtn();
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return CGSizeMake(JobsWidth(400), JobsWidth(62));
}

-(CGSize)viewSizeWithModel:(UIViewModel *_Nullable)model{
    return [self.class viewSizeWithModel:nil];
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock)makeBtn{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        int f = 0;
        for (UIButtonModel *buttonModel in self.btnModelMutArr) {
            @jobs_weakify(self)
            BaseButton *btn = BaseButton.initByButtonModel(buttonModel);
            [self addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.height.mas_equalTo([self viewSizeWithModel:nil].height);
            }];
            [self layoutIfNeeded];
            NSLog(@"");
            if(self.btnMutArr.count){
                UIView *view = self.btnMutArr.lastObject;
                CGFloat d = (([self viewSizeWithModel:nil].width - btn.width * self.btnModelMutArr.count) / (self.btnModelMutArr.count - 1));
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).offset(d);
                }];
            }else{
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self);
                }];
            }
            
            if(self.btnMutArr.count){
                if (f == self.btnModelMutArr.count - 1){
                    [self makeLeftLab:btn buttonModel:buttonModel];
                }else{
                    [self makeLeftLab:btn buttonModel:buttonModel];
                    [self makeRightLab:btn buttonModel:buttonModel];
                }
            }else{
                [self makeRightLab:btn buttonModel:buttonModel];
            }
            
            [self.btnMutArr addObject:btn];
            f++;
        }
    };
}
#pragma mark —— 一些私有方法
-(void)makeRightLab:(UIButton *)btn buttonModel:(UIButtonModel *)buttonModel{
    UILabel *rightLab = UILabel.new;
    rightLab.backgroundColor = self.rightLabBgCor;
    [self addSubview:rightLab];
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btn.imageView);
        make.left.equalTo(btn.mas_right);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(buttonModel.rightViewWidth);
    }];
}

-(void)makeLeftLab:(UIButton *)btn buttonModel:(UIButtonModel *)buttonModel{
    UILabel *leftLab = UILabel.new;
    leftLab.backgroundColor = self.leftLabBgCor;
    [self addSubview:leftLab];
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btn.imageView);
        make.right.equalTo(btn.mas_left);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(buttonModel.leftViewWidth);
    }];
}
#pragma mark —— lazyLoad
-(NSMutableArray<BaseButton *> *)btnMutArr{
    if(!_btnMutArr){
        _btnMutArr = NSMutableArray.array;
    }return _btnMutArr;
}

-(NSMutableArray<UIButtonModel *> *)btnModelMutArr{
    if(!_btnModelMutArr){
        _btnModelMutArr = NSMutableArray.array;
    }return _btnModelMutArr;
}

-(UIColor *)leftLabBgCor{
    if(!_leftLabBgCor){
        _leftLabBgCor = JobsWhiteColor;
    }return _leftLabBgCor;
}

-(UIColor *)rightLabBgCor{
    if(!_rightLabBgCor){
        _rightLabBgCor = JobsWhiteColor;
    }return _rightLabBgCor;
}

@end
