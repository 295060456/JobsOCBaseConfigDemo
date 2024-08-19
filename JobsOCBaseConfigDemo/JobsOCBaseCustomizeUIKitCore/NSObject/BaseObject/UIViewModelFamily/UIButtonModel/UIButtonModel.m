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
        _longPressGestureEventBlock = ^(id _Nullable weakSelf,
                                        id _Nullable arg) {
           NSLog(@"按钮的长按事件触发");
        };
    }return _longPressGestureEventBlock;
}

-(UIImage *)highlightImage{
    if(!_highlightImage){
        _highlightImage = self.normalImage;
    }return _highlightImage;
}
/// 主标题的显示方式
-(UILabelShowingType)titleShowingType{
    if(!_titleShowingType){
        _titleShowingType = UILabelShowingType_03;
    }return _titleShowingType;
}
/// 副标题的显示方式
-(UILabelShowingType)subTitleShowingType{
    if(!_subTitleShowingType){
        _subTitleShowingType = UILabelShowingType_03;
    }return _subTitleShowingType;
}

-(JobsReturnRACDisposableByReturnIDByIDBlock _Nullable)jobsReturnedTestBlock{
    if(!_jobsReturnedTestBlock){
        _jobsReturnedTestBlock = ^RACDisposable *_Nonnull(JobsReturnIDByIDBlock _Nullable data) {
            NSLog(@"JobsTestBlock");
            return nil;
        };
    }return _jobsReturnedTestBlock;
}

-(jobsByVoidBlock _Nullable)jobsTestBlock{
    if (!_jobsTestBlock) {
        _jobsTestBlock = ^{
            NSLog(@"jobsTestBlock");
        };
    }return _jobsTestBlock;
}

@end
