//
//  JobsNavBarConfig.m
//  FM
//
//  Created by User on 7/24/24.
//

#import "JobsNavBarConfig.h"

@implementation JobsNavBarConfig

-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        _backBtnModel = UIButtonModel.new;
        _backBtnModel.backgroundImage = JobsIMG(@"返回");
        _backBtnModel.selected_backgroundImage = JobsIMG(@"返回");
        _backBtnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _backBtnModel.titleCor = JobsClearColor;
        _backBtnModel.selected_titleCor = JobsClearColor;
        _backBtnModel.roundingCorners = UIRectCornerAllCorners;
        _backBtnModel.longPressGestureEventBlock = ^id (id _Nullable weakSelf,
                                                        id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        };
        @jobs_weakify(self)
        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        };
    }return _backBtnModel;
}

-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = UIButtonModel.new;
        _closeBtnModel.backgroundImage = JobsIMG(@"关闭");
        _closeBtnModel.selected_backgroundImage = JobsIMG(@"关闭");
        _closeBtnModel.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
        _closeBtnModel.titleCor = JobsClearColor;
        _closeBtnModel.selected_titleCor = JobsClearColor;
        _closeBtnModel.roundingCorners = UIRectCornerAllCorners;
        _closeBtnModel.longPressGestureEventBlock = ^id(id _Nullable weakSelf,
                                                        id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        };
        @jobs_weakify(self)
        _closeBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        };
    }return _closeBtnModel;
}

-(NSString *)title{
    if(!_title){
        _title = JobsInternationalization(@"JobsNavBar");
    }return _title;
}

-(UIFont *)font{
    if(!_font){
        _font = bayonRegular(JobsWidth(20));
    }return _font;
}

-(UIColor *)titleCor{
    if(!_titleCor){
        _titleCor = JobsCor(@"#FFC700");
    }return _titleCor;
}

-(UIColor *)bgCor{
    if(!_bgCor){
        _bgCor = JobsClearColor;
    }return _bgCor;
}

@end
