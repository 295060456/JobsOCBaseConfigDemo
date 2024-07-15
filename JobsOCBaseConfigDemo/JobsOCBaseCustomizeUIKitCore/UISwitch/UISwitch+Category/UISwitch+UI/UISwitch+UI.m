//
//  UISwitch+UI.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/24.
//

#import "UISwitch+UI.h"

@implementation UISwitch (UI)

-(RACDisposable *)jobsSwitchClickEventBlock:(jobsByIDBlock)subscribeNextBlock{
    return [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIButton * _Nullable x) {
        if(subscribeNextBlock) subscribeNextBlock(x);
    }];
}

@end
