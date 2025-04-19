//
//  UITextItem+Extra.m
//  FM
//
//  Created by Admin on 11/12/2024.
//

#import "UITextItem+Extra.h"

@implementation UITextItem (Extra)

#pragma mark —— Prop_strong()UITextView *textView;
JobsKey(_textView)
@dynamic textView;
-(UITextView *)textView{
    return Jobs_getAssociatedObject(_textView);
}

-(void)setTextView:(UITextView *)textView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_textView, textView)
}

@end
