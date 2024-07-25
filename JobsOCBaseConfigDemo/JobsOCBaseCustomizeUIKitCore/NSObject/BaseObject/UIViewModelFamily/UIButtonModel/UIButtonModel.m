//
//  UIButtonModel.m
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import "UIButtonModel.h"

@implementation UIButtonModel
UIViewModelProtocol_synthesize
-(NSTextAlignment)textAlignment{
    if (!_textAlignment) {
        _textAlignment = NSTextAlignmentCenter;
    }return _textAlignment;
}

-(NSTextAlignment)subTextAlignment{
    if(!_subTextAlignment){
        _subTextAlignment = NSTextAlignmentCenter;
    }return _subTextAlignment;
}

-(JobsReturnIDByIDBlock)clickEventBlock{
    if(!_clickEventBlock){
        @jobs_weakify(self)
        _clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        };
    }return _clickEventBlock;
}

-(JobsSelectorBlock)longPressGestureEventBlock{
    if(!_longPressGestureEventBlock){
        _longPressGestureEventBlock = ^(id  _Nullable weakSelf,
                                        id  _Nullable arg) {
           NSLog(@"按钮的长按事件触发");
        };
    }return _longPressGestureEventBlock;
}

@end
