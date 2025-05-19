//
//  UIScrollView+EmptyData.m
//  FM
//
//  Created by Admin on 14/11/2024.
//

#import "UIScrollView+EmptyData.h"

@implementation UIScrollView (EmptyData)
#pragma mark —— Prop_assign()JobsEmptyViewType jobsEmptyViewType;
JobsKey(_jobsEmptyViewType)
@dynamic jobsEmptyViewType;
-(BOOL)jobsEmptyViewType{
    return [Jobs_getAssociatedObject(_jobsEmptyViewType) unsignedIntegerValue];
}

-(void)setJobsEmptyViewType:(JobsEmptyViewType)jobsEmptyViewType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsEmptyViewType, @(jobsEmptyViewType))
}
#pragma mark —— Prop_strong()UITextModel *textModelEmptyData;
JobsKey(_textModelEmptyData)
@dynamic textModelEmptyData;
-(UIButtonModel *)textModelEmptyData{
    return Jobs_getAssociatedObject(_textModelEmptyData);
}

-(void)setTextModelEmptyData:(UITextModel *)textModelEmptyData{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textModelEmptyData, textModelEmptyData)
}
#pragma mark —— Prop_strong()UIButtonModel *buttonModelEmptyData;
JobsKey(_buttonModelEmptyData)
@dynamic buttonModelEmptyData;
-(UIButtonModel *)buttonModelEmptyData{
    return Jobs_getAssociatedObject(_buttonModelEmptyData);
}

-(void)setButtonModelEmptyData:(UIButtonModel *)buttonModelEmptyData{
    Jobs_setAssociatedRETAIN_NONATOMIC(_buttonModelEmptyData, buttonModelEmptyData)
}
#pragma mark —— Prop_strong()UIView *emptyDataView;
JobsKey(_emptyDataView)
@dynamic emptyDataView;
-(__kindof UIView *)emptyDataView{
    return Jobs_getAssociatedObject(_emptyDataView);
}

-(void)setEmptyDataView:(__kindof UIView *)emptyDataView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_emptyDataView, emptyDataView)
}

@end
