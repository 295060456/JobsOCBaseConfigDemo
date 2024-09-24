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
        @jobs_weakify(self)
        _backBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.backgroundImage = JobsIMG(@"返回");
            data.selected_backgroundImage = JobsIMG(@"返回");
            data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            data.titleCor = JobsClearColor;
            data.selected_titleCor = JobsClearColor;
            data.roundingCorners = UIRectCornerAllCorners;
            data.longPressGestureEventBlock = ^id (id _Nullable weakSelf,
                                                   id _Nullable arg) {
                NSLog(@"按钮的长按事件触发");
                return nil;
            };
            data.clickEventBlock = ^id(BaseButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                return nil;
            };
        });
    }return _backBtnModel;
}

-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        @jobs_weakify(self)
        _closeBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.backgroundImage = JobsIMG(@"关闭");
            data.selected_backgroundImage = JobsIMG(@"关闭");
            data.baseBackgroundColor = JobsClearColor.colorWithAlphaComponent(0);
            data.titleCor = JobsClearColor;
            data.selected_titleCor = JobsClearColor;
            data.roundingCorners = UIRectCornerAllCorners;
            data.longPressGestureEventBlock = ^id(id _Nullable weakSelf,
                                                  id _Nullable arg) {
                NSLog(@"按钮的长按事件触发");
                return nil;
            };
            data.clickEventBlock = ^id(BaseButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                return nil;
            };
        });
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
