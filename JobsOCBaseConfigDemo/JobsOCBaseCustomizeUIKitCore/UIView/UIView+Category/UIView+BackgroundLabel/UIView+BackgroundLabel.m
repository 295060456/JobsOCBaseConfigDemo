//
//  UIView+BackgroundLabel.m
//  Casino
//
//  Created by Jobs on 2021/12/6.
//

#import "UIView+BackgroundLabel.h"

@implementation UIView (BackgroundLabel)
#pragma mark —— @property(nonatomic,strong)UILabel *backgroundLabel;
JobsKey(_backgroundLabel)
@dynamic backgroundLabel;
-(UILabel *)backgroundLabel{
    UILabel *BackgroundLabel = Jobs_getAssociatedObject(_backgroundLabel);
    if (!BackgroundLabel) {
        BackgroundLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.userInteractionEnabled = YES;
            self.addSubview(label);
            self.sendSubviewToBack(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundLabel, label)
        });
    }return BackgroundLabel;
}

-(void)setBackgroundLabel:(UILabel *)backgroundLabel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundLabel, backgroundLabel)
}

@end
