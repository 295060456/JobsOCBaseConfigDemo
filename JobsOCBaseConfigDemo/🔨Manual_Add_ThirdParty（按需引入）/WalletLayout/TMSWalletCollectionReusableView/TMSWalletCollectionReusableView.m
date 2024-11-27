//
//  TMSWalletCollectionReusableView.m
//  TMSWalletCollectionViewLayout
//
//  Created by TmmmS on 2019/8/8.
//  Copyright © 2019 TMS. All rights reserved.
//

#import "TMSWalletCollectionReusableView.h"

@interface TMSWalletCollectionReusableView ()

@property(nonatomic,strong)UILabel *label;

@end

@implementation TMSWalletCollectionReusableView
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = JobsBlueColor;
        
    }return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        self.label.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(14);
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(JobsWidth(15));
                make.centerY.equalTo(self);
            }];
        });
    }_label.text = self.viewModel.textModel.text;
    return _label;
}

@end
