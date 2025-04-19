//
//  UIGestureRecognizer+ReactiveCocoaProtected.m
//  GestureRecognizerRACExt
//
//  Created by kaiinui on 2014/09/07.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//  特别鸣谢：https://github.com/kaiinui/UIGestureRecognizer-RACExtension

#import "UIGestureRecognizer+ReactiveCocoaProtected.h"

@implementation UIGestureRecognizer (ReactiveCocoaProtected)
#pragma mark —— Prop_strong()RACGestureRecognizerActionHandler *rac_gestureHandler;
JobsKey(_rac_gestureHandler)
@dynamic rac_gestureHandler;
-(RACGestureRecognizerActionHandler *)rac_gestureHandler{
    return Jobs_getAssociatedObject(_rac_gestureHandler);
}

-(void)setRac_gestureHandler:(RACGestureRecognizerActionHandler *)rac_gestureHandler{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rac_gestureHandler, rac_gestureHandler);
}
#pragma mark —— Prop_strong()RACSubject *rac_subject;
JobsKey(_rac_subject)
@dynamic rac_subject;
-(RACSubject *)rac_subject{
    return Jobs_getAssociatedObject(_rac_subject);
}

-(void)setRac_subject:(RACSubject *)rac_subject{
    Jobs_setAssociatedRETAIN_NONATOMIC(_rac_subject, rac_subject);
}

@end
