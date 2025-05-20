//
//  JobsStepView.m
//  FM
//
//  Created by User on 7/31/24.
//

#import "JobsStepView.h"

@interface JobsStepView ()

Prop_assign()VerificationStatus status;
Prop_strong(null_resettable)UIColor *leftLabBgCor;
Prop_strong(null_resettable)UIColor *rightLabBgCor;
Prop_assign()CGFloat leftViewWidth;
Prop_assign()CGFloat rightViewWidth;
Prop_assign()CGFloat btnOffset;
Prop_assign()CGFloat offset;/// 值越大 = 按钮之间的距离越小
Prop_copy()NSMutableArray <__kindof BaseButton *>*btnMutArr;
Prop_copy()NSMutableArray <__kindof UIButtonModel *>*btnModelMutArr;

@end

@implementation JobsStepView
/// AppToolsProtocol
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
    return ^(NSMutableArray <__kindof UIButtonModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.btnModelMutArr = model;
        self.makeBtn(self.status);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(400), JobsWidth(62));
    };
}
#pragma mark —— 一些公有方法
/// 值越大 = 按钮之间的距离越小
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byOffset{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.offset = data;
        return self;
    };
}
/// 设置左边线长度
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byLeftViewWidth{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.leftViewWidth = data;
        return self;
    };
}
/// 设置右边线长度
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byRightViewWidth{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.rightViewWidth = data;
        return self;
    };
}
/// 设置按钮之间的距离
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byBtnOffset{
    @jobs_weakify(self)
    return ^ __kindof JobsStepView *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.btnOffset = data;
        return self;
    };
}
/// 设置左边线颜色
-(JobsReturnStepViewByColorBlock _Nonnull)byLeftLabBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.leftLabBgCor = cor;
        return self;
    };
}
/// 设置右边线颜色
-(JobsReturnStepViewByColorBlock _Nonnull)byRightLabBgCor{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(UIColor *_Nullable cor){
        @jobs_strongify(self)
        self.rightLabBgCor = cor;
        return self;
    };
}
/// 设置当前显示状态
-(JobsReturnStepViewByNSIntegerBlock _Nonnull)byStatus{
    @jobs_weakify(self)
    return ^__kindof JobsStepView *_Nullable(VerificationStatus status){
        @jobs_strongify(self)
        self.status = status;
        return self;
    };
}

+(JobsReturnButtonModelByStringAndImagesBlock _Nonnull)makeButtonModelBy{
    return ^__kindof UIButtonModel *_Nullable(__kindof NSString *_Nullable title,
                                              UIImage *_Nullable image,
                                              UIImage *_Nullable highlightImage){
        return jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
            data1.title = title;
            data1.titleCor = JobsCor(@"#111111");
            data1.titleFont = pingFangHKRegular(JobsWidth(14));
            data1.normalImage = image;
            data1.highlightImage = highlightImage;
            data1.imagePlacement = NSDirectionalRectEdgeTop;
            data1.imagePadding = JobsWidth(8);
            data1.roundingCorners = UIRectCornerAllCorners;
            data1.baseBackgroundColor = JobsClearColor;
        });
    };
}
#pragma mark —— 一些私有方法
-(jobsByNSIntegerBlock)makeBtn{
    @jobs_weakify(self)
    return ^(VerificationStatus status){
        @jobs_strongify(self)
        int f = 0;
        for (UIButtonModel *buttonModel in self.btnModelMutArr) {
            BaseButton *btn = BaseButton.initByButtonModel(buttonModel);
            [self.addSubview(btn) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.height.mas_equalTo(self.viewSizeByModel(nil).height);
            }];self.refresh();
            if(self.btnMutArr.count){
                UIView *view = self.btnMutArr.lastObject;
                CGFloat d = ((self.viewSizeByModel(nil).width - btn.width * self.btnModelMutArr.count - self.offset) / (self.btnModelMutArr.count - 1));
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(view.mas_right).offset(self.btnOffset ? : d);
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
            self.btnMutArr.add(btn);
            f++;
        }
        for (NSInteger i = 0; i <= status; i++) {
            if (i < self.btnMutArr.count) {
                self.btnMutArr[i].highlighted = YES;
                [self.btnMutArr[i] setNeedsUpdateConfiguration];/// 会触发 configurationUpdateHandler
            }
        }
    };
}

-(void)makeRightLab:(UIButton *)btn buttonModel:(UIButtonModel *)buttonModel{
    @jobs_weakify(self)
    jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        @jobs_strongify(self)
        [self.addSubview(label.byBgCor(self.rightLabBgCor)) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(btn.imageView);
            make.left.equalTo(btn.mas_right);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(self.rightViewWidth);
        }];
    }).alpha = 1;
}

-(void)makeLeftLab:(UIButton *)btn buttonModel:(UIButtonModel *)buttonModel{
    @jobs_weakify(self)
    jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        @jobs_strongify(self)
        [self.addSubview(label.byBgCor(self.leftLabBgCor)) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(btn.imageView);
            make.right.equalTo(btn.mas_left);
            make.height.mas_equalTo(1);
            make.width.mas_equalTo(self.leftViewWidth);
        }];
    }).alpha = 1;
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

-(CGFloat)leftViewWidth{
    if(!_leftViewWidth){
        _leftViewWidth = JobsWidth(80);
    }return _leftViewWidth;
}

-(CGFloat)rightViewWidth{
    if(!_rightViewWidth){
        _rightViewWidth = JobsWidth(80);
    }return _rightViewWidth;
}

@end
