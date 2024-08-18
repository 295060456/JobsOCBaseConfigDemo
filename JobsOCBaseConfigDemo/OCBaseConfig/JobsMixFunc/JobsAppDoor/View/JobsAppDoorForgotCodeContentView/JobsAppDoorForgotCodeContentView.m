//
//  JobsAppDoorForgotCodeContentView.m
//  Casino
//
//  Created by Jobs on 2021/11/22.
//

#import "JobsAppDoorForgotCodeContentView.h"

@class JobsAppDoorDoorInputViewBaseStyle;

@interface JobsAppDoorForgotCodeContentView ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;// 标题
@property(nonatomic,strong)UIButton *backToLoginBtn;// 返回登录
@property(nonatomic,strong)UIButton *contactCustomerServiceBtn;// 联系客服按钮
@property(nonatomic,strong)UILabel *subTitleLab;// 副标题
@property(nonatomic,strong)JobsHotLabelWithSingleLine *hl;
/// Data
//@property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
//@property(nonatomic,strong)BaiShaETProjCustomerContactModel *customerContactModel;

@end

@implementation JobsAppDoorForgotCodeContentView
#pragma mark - Lifecycle
- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = Cor2;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        [self customerContact:^(CasinoCustomerContactModel *data) {
            @jobs_strongify(self)
            self.backToLoginBtn.alpha = 1;
            self.titleLab.alpha = 1;
            self.contactCustomerServiceBtn.alpha = 1;
            if (self.hotLabelDataMutArr.count) {
                self.hl.alpha = 1;
            }
        }];
    };
}
#pragma mark —— 网络请求
/// 获取客服联系方式
-(void)customerContact:(jobsByIDBlock)block{

}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = JobsInternationalization(Title10);
        _titleLab.textColor = JobsWhiteColor;
        _titleLab.font = UIFontWeightRegularSize(20);
        _titleLab.makeLabelByShowingType(UILabelShowingType_03);
        [self addSubview:_titleLab];
        _titleLab.centerX = (self.width - self.backToLoginBtn.width) / 2;
        _titleLab.top = JobsWidth(20);
    }return _titleLab;
}

-(UIButton *)backToLoginBtn{
    if (!_backToLoginBtn) {
        _backToLoginBtn = UIButton.new;
        _backToLoginBtn.titleLabel.numberOfLines = 0;
        _backToLoginBtn.backgroundColor = Cor1;
        _backToLoginBtn.titleLabel.font = UIFontWeightMediumSize(13);
        _backToLoginBtn.alpha = 0.7f;
        _backToLoginBtn.normalTitleColor(Cor3);
        _backToLoginBtn.normalTitle(Title1);
        _backToLoginBtn.normalImage(JobsIMG(@"用户名称"));
        [_backToLoginBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            [self endEditing:YES];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_backToLoginBtn];
        [_backToLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(btnWidth);
        }];
        [self layoutIfNeeded];
        [_backToLoginBtn layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeTop
                                            imagePadding:JobsWidth(8)];
    }return _backToLoginBtn;
}

-(UIButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        _contactCustomerServiceBtn = UIButton.new;
        _contactCustomerServiceBtn.normalImage(JobsIMG(JobsInternationalization(@"zaixiankefu_en")));
        @jobs_weakify(self)
        [_contactCustomerServiceBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            NSLog(@"返回登录");
            @jobs_strongify(self)
//            if (self.customerContactModel.onlineUrl.customerAccount.nullString) {
//                [self customerContact:nil];
//            }else{
//                [NSObject openURL:self.customerContactModel.onlineUrl.customerAccount];
//            }
            [self endEditing:YES];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_contactCustomerServiceBtn];
        [_contactCustomerServiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(230), JobsWidth(50)));
            make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(15));
            make.centerX.equalTo(self.titleLab);
        }];

    }return _contactCustomerServiceBtn;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = UILabel.new;
        _subTitleLab.text = JobsInternationalization(Title11);
        _subTitleLab.textAlignment = NSTextAlignmentCenter;
        _subTitleLab.numberOfLines = 0;
        _subTitleLab.textColor = JobsWhiteColor;
        _subTitleLab.font = UIFontWeightMediumSize(12);
        _subTitleLab.makeLabelByShowingType(UILabelShowingType_03);
        [self addSubview:_subTitleLab];
        [_subTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contactCustomerServiceBtn);
            make.top.equalTo(self.contactCustomerServiceBtn.mas_bottom).offset(JobsWidth(56));
            make.width.mas_equalTo(self.width - JobsWidth(80));
        }];
    }return _subTitleLab;
}

-(JobsHotLabelWithSingleLine *)hl{
    if (!_hl) {
        _hl = JobsHotLabelWithSingleLine.new;
        _hl.backgroundColor = JobsClearColor;
        _hl.labelShowingType = UILabelShowingType_02;
        _hl.elementDefaultSize = CGSizeMake(JobsWidth(46), JobsWidth(46));
        [self actionForHotLabel:_hl];
        [self addSubview:_hl];
        [_hl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.subTitleLab);
            make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(29));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(250), JobsWidth(50)));
        }];
        [self layoutIfNeeded];
        _hl.jobsRichElementsInViewWithModel(self.hotLabelDataMutArr);
    }return _hl;
}
/**
    在 @interface NSObject (AppTools)<AppToolsProtocol>里
    对下列属性进行统一管理
    @property(nonatomic,strong)NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
    @property(nonatomic,strong)BaiShaETProjCustomerContactModel *customerContactModel;
 */
//-(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
//    if (!_hotLabelDataMutArr) {
//        _hotLabelDataMutArr = NSMutableArray.array;
//
//        for (CasinoCustomerContactElementModel *element in self.customerContactModel.customerList) {
//            UIViewModel *vm = UIViewModel.new;
//
//            vm.requestParams = element;
//            vm.bgImageURLString = [self.BaseUrl stringByAppendingString:element.appIconUrl];
//            vm.text = JobsInternationalization(@"");
//            vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
//            vm.offsetXForEach = JobsWidth(46);
//            vm.offsetYForEach = JobsWidth(46);
//            [_hotLabelDataMutArr addObject:vm];
//        }
//
//    }return _hotLabelDataMutArr;
//}

@end

