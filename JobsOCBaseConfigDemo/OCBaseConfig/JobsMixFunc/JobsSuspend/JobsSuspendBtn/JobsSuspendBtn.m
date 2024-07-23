//
//  JobsSuspendBtn.m
//  Search
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsSuspendBtn.h"

@interface JobsSuspendBtn ()

@end

@implementation JobsSuspendBtn
BaseViewProtocol_synthesize
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = self.backgroundColor ? :JobsBlackColor;

        [self addTarget:self
    touchUpInsideAction:[self jobsSelectorBlock:^id _Nullable(id _Nullable weakSelf,
                                                              id _Nullable arg) {
            NSLog(@"Hello Jobs");
            return nil;
        }]];
        self.cornerCutToCircleWithCornerRadius(JobsWidth(8));
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.panRcognize.enabled = self.isAllowDrag;// 关键代码
}
#pragma mark —— 复写父类方法
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
}

@end
