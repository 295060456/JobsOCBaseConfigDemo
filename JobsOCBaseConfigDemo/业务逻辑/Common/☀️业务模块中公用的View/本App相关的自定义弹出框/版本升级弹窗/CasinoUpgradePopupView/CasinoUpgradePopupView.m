//
//  CasinoUpgradePopupView.m
//  Casino
//
//  Created by Jobs on 2021/12/25.
//

#import "CasinoUpgradePopupView.h"

@interface CasinoUpgradePopupView ()
/// UI
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)CasinoUpgradeContentView *upgradeContentView;
/// Data

@end

@implementation CasinoUpgradePopupView

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.backgroundColor = JobsWhiteColor;
        self.imageView.alpha = 1;
        self.upgradeContentView.jobsRichElementsInViewWithModel(model);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(290), JobsWidth(207 + 20));
}
#pragma mark —— lazyLoad
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = UIImageView.new;
        _imageView.image = JobsIMG(@"弹窗升级背景图");
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self);
            make.top.equalTo(self).offset(-JobsWidth(117));
            make.height.mas_equalTo(JobsWidth(207));
        }];
    }return _imageView;
}

-(CasinoUpgradeContentView *)upgradeContentView{
    if (!_upgradeContentView) {
        _upgradeContentView = CasinoUpgradeContentView.new;
        @jobs_weakify(self)
        [_upgradeContentView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(data);
        }];
        [self addSubview:_upgradeContentView];
        [_upgradeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo([CasinoUpgradeContentView viewSizeWithModel:nil]);
            make.top.equalTo(self.imageView.mas_bottom);
            make.centerX.equalTo(self);
        }];
    }return _upgradeContentView;
}

@end
