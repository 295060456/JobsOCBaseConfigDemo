//
//  FirstView.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import "JobsPushView.h"

@interface JobsPushView ()

@property(nonatomic,strong)BaseButton *push_btn;
@property(nonatomic,strong)BaseButton *pop_btn;

@property(nonatomic,strong)JobsPushView *pushView;

@end

@implementation JobsPushView

-(void)dealloc{
    JobsNotificationCenter.remove(self);
    NSLog(@"%@",JobsLocalFunc);
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.push_btn.alpha = 1;
        self.pop_btn.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)push_btn{
    @jobs_weakify(self)
    if(!_push_btn){
        _push_btn = BaseButton.jobsInit()
            .bgColor(JobsOrangeColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"点击按钮push出view"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                
    //            JobsViewNavigator *navigator = JobsViewNavigator.new;
    //            navigator.frame = self.bounds;
    //            self.pushView.navigator = navigator;
    //            [self addSubview:navigator];
    //            navigator.pushView(self.pushView,YES);
                
    //            self.navigator.frame = self.bounds;
    //            self.pushView.navigator = self.navigator;
    //            self.navigator.pushView(self.pushView,YES);

    //            self.configViewNavigatorByPushview_(self.pushView);
    //            self.navigator.pushView(self.pushView,YES);
    //
    //            self.pushView.configViewNavigatorBySuperview_(self);
    //            self.navigator.pushView(self.pushView,YES);
    //
                self.configViewNavigatorBySuperviewAndView_(self,self.pushView);
                self.navigator.pushView(self.pushView,YES);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_push_btn];
        [_push_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.mas_equalTo(JobsWidth(30));
        }];
        _push_btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _push_btn;
}

-(BaseButton *)pop_btn{
    @jobs_weakify(self)
    if(!_pop_btn){
        _pop_btn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"点我pop当前view"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                NSLog(@"%@",self.navigator);
                if(self.navigator) self.navigator.popViewAnimated(YES);
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        [self addSubview:_pop_btn];
        [_pop_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.push_btn);
            make.centerY.equalTo(self.push_btn);
            make.left.equalTo(self.push_btn.mas_right).offset(JobsWidth(10));
            make.height.mas_equalTo(JobsWidth(30));
        }];
        _pop_btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _pop_btn;
}

-(JobsPushView *)pushView{
    if(!_pushView){
        _pushView = JobsPushView.new;
        _pushView.frame = self.bounds;
        _pushView.backgroundColor = JobsRandomColor;
        _pushView.jobsRichViewByModel(nil);
    }return _pushView;
}

@end
