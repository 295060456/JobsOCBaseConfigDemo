//
//  UIScrollView+JobsEmptyData.m
//  FM
//
//  Created by Admin on 14/11/2024.
//

#import "UIScrollView+JobsEmptyData.h"

@implementation UIScrollView (JobsEmptyData)
#pragma mark —— @property(nonatomic,strong)UITextModel *textModelEmptyData;
JobsKey(_textModelEmptyData)
@dynamic textModelEmptyData;
-(UIButtonModel *)textModelEmptyData{
    return Jobs_getAssociatedObject(_textModelEmptyData);
}

-(void)setTextModelEmptyData:(UITextModel *)textModelEmptyData{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textModelEmptyData, textModelEmptyData)
}
#pragma mark —— @property(nonatomic,strong)UIButtonModel *buttonModelEmptyData;
JobsKey(_buttonModelEmptyData)
@dynamic buttonModelEmptyData;
-(UIButtonModel *)buttonModelEmptyData{
    return Jobs_getAssociatedObject(_buttonModelEmptyData);
}

-(void)setButtonModelEmptyData:(UIButtonModel *)buttonModelEmptyData{
    Jobs_setAssociatedRETAIN_NONATOMIC(_buttonModelEmptyData, buttonModelEmptyData)
}

@end
