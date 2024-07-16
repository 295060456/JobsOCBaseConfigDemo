//
//  MSCommentTableHeaderFooterView.m
//  MataShop
//
//  Created by Jobs Hi on 10/2/23.
//

#import "MSCommentTableHeaderFooterView.h"

@interface MSCommentTableHeaderFooterView ()

@end

@implementation MSCommentTableHeaderFooterView
@synthesize viewModel = _viewModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.y = JobsWidth(15);
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(void)richElementsInViewWithModel:(UIViewModel *_Nullable)model{
    if([model isKindOfClass:UIViewModel.class]){
        self.viewModel = model;
        self.textLabel.text = self.viewModel.textModel.text;
        self.textLabel.textColor = self.viewModel.textModel.textCor;
        self.textLabel.font = self.viewModel.textModel.font;
    }
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGFloat)heightForHeaderInSection:(id _Nullable)model{
    return JobsWidth(46);
}

@end
