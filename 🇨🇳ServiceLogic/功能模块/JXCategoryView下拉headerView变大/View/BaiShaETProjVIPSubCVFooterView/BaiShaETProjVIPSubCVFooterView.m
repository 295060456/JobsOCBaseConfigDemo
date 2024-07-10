//
//  BaiShaETProjVIPSubCVFooterView.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/10.
//

#import "BaiShaETProjVIPSubCVFooterView.h"

@interface BaiShaETProjVIPSubCVFooterView ()

@property(nonatomic,strong)BaseLabel *titleLab;

@end

@implementation BaiShaETProjVIPSubCVFooterView

@synthesize viewModel = _viewModel;

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }return self;
}
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    self.viewModel = model;
    self.backgroundColor = HEXCOLOR(0xFCFBFB);
    self.titleLab.alpha = 1;
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(CGSize)collectionReusableViewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsMainScreen_WIDTH(nil), JobsWidth(50));
}
#pragma mark —— lazyLoad
-(BaseLabel *)titleLab{
    if (!_titleLab) {
        _titleLab = BaseLabel.new;
        _titleLab.text = self.viewModel.textModel.text;
        _titleLab.font = self.viewModel.textModel.font ? : notoSansBold(14);
        _titleLab.textColor = self.viewModel.textModel.textCor ? : HEXCOLOR(0xAE8330);
        _titleLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _titleLab;
}


@end
