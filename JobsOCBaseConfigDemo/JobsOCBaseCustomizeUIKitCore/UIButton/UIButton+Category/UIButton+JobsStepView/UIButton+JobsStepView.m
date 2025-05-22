//
//  UIButton+JobsStepView.m
//  FMNormal
//
//  Created by Jobs on 2025/5/22.
//

#import "UIButton+JobsStepView.h"

@implementation UIButton (JobsStepView)

#pragma mark —— Prop_strong()__kindof UILabel *leftLab;
JobsKey(_leftLab)
@dynamic leftLab;
-(__kindof UILabel *)leftLab{
    return Jobs_getAssociatedObject(_leftLab);
}

-(void)setLeftLab:(__kindof UILabel *)leftLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_leftLab, leftLab)
}
#pragma mark —— Prop_strong()__kindof UILabel *rightLab;
JobsKey(_rightLab)
@dynamic rightLab;
-(__kindof UILabel *)rightLab{
    return Jobs_getAssociatedObject(_rightLab);
}

-(void)setRightLab:(__kindof UILabel *)rightLab{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rightLab, rightLab)
}

@end
