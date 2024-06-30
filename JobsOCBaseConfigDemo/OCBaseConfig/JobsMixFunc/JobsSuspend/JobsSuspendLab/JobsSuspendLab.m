//
//  JobsSuspendLab.m
//  Search
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsSuspendLab.h"

@interface JobsSuspendLab ()

@end

@implementation JobsSuspendLab

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = self.backgroundColor ? :JobsBlackColor;
        self.text = JobsNonnullString(self.text, JobsInternationalization(@"No Data"));
        self.internationalizationKEY = @"No Data";
        self.textAlignment = NSTextAlignmentCenter;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.enabled = self.isAllowDrag;
    self.userInteractionEnabled = self.isAllowDrag;
//    [self cornerCutToCircleWithCornerRadius:self.height / 2];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    if(self.objectBlock) self.objectBlock(@1);
}

@end
