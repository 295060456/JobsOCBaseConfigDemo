//
//  UIView+EmptyData.m
//  DouDong-II
//
//  Created by Jobs on 2020/12/17.
//

#import "UIView+EmptyData.h"

@implementation UIView (EmptyData)
-(void)ifEmptyData{
#ifdef DEBUG
    //光板返回YES，有其他控件返回NO
    @jobs_weakify(self)
    BOOL (^checkSubviews)(void) = ^(){
        @jobs_strongify(self)
        if (self.subviews.count) {// 有控件
            /// return YES;//除了self.tipsLab就没有了，光板;return NO;//有其他控件
            return [self.subviews[0] isEqual:self.tipsLab];
        }return YES;//光板
    };
    self.tipsLab.alpha = checkSubviews();
#endif
}
#pragma mark —— @property(nonatomic,strong)UILabel *tipsLab;
JobsKey(_tipsLab)
@dynamic tipsLab;
-(UILabel *)tipsLab{
    UILabel *TipsLab = Jobs_getAssociatedObject(_tipsLab);
    if (!TipsLab) {
        TipsLab = UILabel.new;
        TipsLab.text = self.tipsTitle;
        TipsLab.textAlignment = NSTextAlignmentCenter;
        TipsLab.textColor = self.backgroundColor == JobsBlueColor ? JobsRedColor : JobsBlueColor;// 防止某些VC在调试阶段，设置view.backgroundColor为随机色
        TipsLab.font = UIFontWeightBoldSize(20);
        TipsLab.numberOfLines = 0;
        [TipsLab makeLabelByShowingType:UILabelShowingType_03];
        [self addSubview:TipsLab];
        [TipsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        Jobs_setAssociatedRETAIN_NONATOMIC(_tipsLab, TipsLab)
    }return TipsLab;
}

-(void)setTipsLab:(UILabel *)tipsLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tipsLab, tipsLab)
}
#pragma mark —— @property(nonatomic,strong)NSString *tipsTitle;
JobsKey(_tipsTitle)
@dynamic tipsTitle;
-(NSString *)tipsTitle{
    NSString *TipsTitle = Jobs_getAssociatedObject(_tipsTitle);
    if ([NSString isNullString:TipsTitle]) {
        TipsTitle = Internationalization(@"快来将我填满吧");
        Jobs_setAssociatedRETAIN_NONATOMIC(_tipsTitle, TipsTitle)
    }return TipsTitle;
}

-(void)setTipsTitle:(NSString *)tipsTitle{
    Jobs_setAssociatedRETAIN_NONATOMIC(_tipsTitle, tipsTitle)
}

@end
