//
//  JobsNavBarConfig.m
//  FM
//
//  Created by User on 7/24/24.
//

#import "JobsNavBarConfig.h"
JobsNavBarConfig *static_navBarConfig = nil;
static dispatch_once_t static_navBarConfigOnceToken;
@implementation JobsNavBarConfig
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_navBarConfigOnceToken = 0;
    static_navBarConfig = nil;
}

+(instancetype)sharedManager{
    dispatch_once(&static_navBarConfigOnceToken, ^{
        static_navBarConfig = JobsNavBarConfig.new;
    });return static_navBarConfig;
}
#pragma mark —— LazyLoad
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel;
        _backBtnModel.longPressGestureEventBlock = ^id (id _Nullable weakSelf,
                                                        id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        };
        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        };
    }return _backBtnModel;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
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
