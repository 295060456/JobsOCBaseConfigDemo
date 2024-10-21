//
//  UIButtonModel.m
//  MataShop
//
//  Created by Jobs Hi on 10/14/23.
//

#import "UIButtonModel.h"

@implementation UIButtonModel
UIViewModelProtocol_synthesize
@synthesize backgroundImage = _backgroundImage;
@synthesize normalImage = _normalImage;
@synthesize normalImageURLString = _normalImageURLString;
@synthesize normalBgImageURLString = _normalBgImageURLString;
@synthesize normalImageURL = _normalImageURL;
@synthesize normalBgImageURL = _normalBgImageURL;

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

-(UIRectCorner)roundingCorners{
    if(!_roundingCorners){
        _roundingCorners = UIRectCornerAllCorners;
    }return _roundingCorners;
}

-(JobsReturnRACDisposableByReturnIDByIDBlock _Nullable)jobsReturnedTestBlock{
    if(!_jobsReturnedTestBlock){
        _jobsReturnedTestBlock = ^RACDisposable *_Nonnull(JobsReturnIDByIDBlock _Nullable data) {
            NSLog(@"JobsTestBlock");
            return nil;
        };
    }return _jobsReturnedTestBlock;
}

//-(JobsReturnIDByIDBlock _Nullable)clickEventBlock{
//    if(!_clickEventBlock){
//        _clickEventBlock = ^id _Nullable(id _Nullable data){
//            NSLog(@"%s", __FUNCTION__);
//            return nil;
//        };
//    }return _clickEventBlock;
//}
//
//-(JobsReturnIDBySelectorBlock)longPressGestureEventBlock{
//    if(!_longPressGestureEventBlock){
//        _longPressGestureEventBlock = ^id _Nullable(id _Nullable weakSelf,id _Nullable arg){
//            NSLog(@"%s", __FUNCTION__);
//            return nil;
//        };
//    }return _longPressGestureEventBlock;
//}

-(jobsByVoidBlock _Nullable)jobsTestBlock{
    if (!_jobsTestBlock) {
        _jobsTestBlock = ^{
            NSLog(@"jobsTestBlock");
        };
    }return _jobsTestBlock;
}

-(void)setNormalImageURLString:(NSString *)normalImageURLString{
    _normalImageURLString = normalImageURLString.imageURLPlus;
    _normalImageURL = JobsUrl(self.normalImageURLString);
}

-(void)setNormalBgImageURLString:(NSString *)normalBgImageURLString{
    _normalBgImageURLString = normalBgImageURLString.imageURLPlus;
    _normalBgImageURL = JobsUrl(self.normalBgImageURLString);
}

@end
