//
//  LMJDropdownMenu+Extra.m
//  Casino
//
//  Created by Jobs on 2022/1/11.
//

#import "LMJDropdownMenu+Extra.h"

@implementation LMJDropdownMenu (Extra)

-(__kindof UIButton *)great{
    return [self object:self
                getIvar:[self classGetInstanceVariableWithClass:LMJDropdownMenu.class
                                           instanceVariableName:@"mainBtn"]];
}

-(void)greatAtEmpty{
    UIButton *btn = self.great;
    btn.jobsResetBtnImage(JobsIMG(@"空白图"));
    btn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTrailing,JobsWidth(5));
}

@end
