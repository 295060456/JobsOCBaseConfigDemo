//
//  JobsSearchHoveringHeaderView.m
//  JobsSearch
//
//  Created by Jobs on 2020/10/2.
//

#import "JobsSearchTableViewHeaderView.h"

@interface JobsSearchTableViewHeaderView()

@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *delBtn;

@end

@implementation JobsSearchTableViewHeaderView

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = JobsWhiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— 一些私有方法
-(UIButton *)getDelBtn{
    return _delBtn;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:UIViewModel.class]) {
            self.viewModel = model ? : UIViewModel.new;
            self.titleLab.text = self.viewModel.textModel.text;
            self.delBtn.alpha = 1;
        }
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 50.f;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = self.viewModel.textModel.textCor;
            label.backgroundColor = self.viewModel.bgCor;
            label.font = self.viewModel.textModel.font;
            label.textAlignment = NSTextAlignmentLeft;
            self.contentView.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.right.bottom.equalTo(self.contentView);
                make.left.equalTo(self.contentView).offset(JobsWidth(10));
            }];
        });
    }return _titleLab;
}

-(UIButton *)delBtn{
    if (!_delBtn) {
        _delBtn = UIButton.new;
        _delBtn.jobsResetBtnImage(JobsIMG(@"垃圾箱"));
        @jobs_weakify(self)
        [_delBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if(self.objectBlock)self.objectBlock(x);
            return nil;
        }];
        [self.contentView addSubview:_delBtn];
        [_delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(25), JobsWidth(25)));
            make.right.equalTo(self.contentView).offset(-JobsWidth(10));
            make.centerY.equalTo(self.contentView);
        }];
    }return _delBtn;
}

@end
