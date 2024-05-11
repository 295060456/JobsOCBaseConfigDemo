//
//  JobsAppDoorInputViewBaseStyleModel.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyleModel.h"

@interface JobsAppDoorInputViewBaseStyleModel ()

@end

@implementation JobsAppDoorInputViewBaseStyleModel

- (instancetype)init{
    if (self = [super init]) {
        self.keyboardEnable = YES;
    }return self;
}

-(UIFont *)titleStrFont{
    if (!_titleStrFont) {
        _titleStrFont = UIFontWeightRegularSize(9);
    }return _titleStrFont;
}

-(UIColor *)titleStrCor{
    if (!_titleStrCor) {
        _titleStrCor = JobsWhiteColor;
    }return _titleStrCor;
}

-(UIFont *)placeholderFont{
    if (!_placeholderFont) {
        _placeholderFont = UIFontWeightRegularSize(14);
    }return _placeholderFont;
}

-(UIColor *)placeholderCor{
    if (!_placeholderCor) {
        _placeholderCor = HEXCOLOR(0x524740);
    }return _placeholderCor;
}

@end
