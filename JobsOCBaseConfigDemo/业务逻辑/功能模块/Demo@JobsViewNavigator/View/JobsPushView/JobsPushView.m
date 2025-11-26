//
//  FirstView.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import "JobsPushView.h"

@interface JobsPushView ()

Prop_strong()BaseButton *push_btn;
Prop_strong()BaseButton *pop_btn;

Prop_strong()JobsPushView *pushView;

@end

@implementation JobsPushView

-(void)dealloc{
    JobsNotificationCenter.remove(self);
    JobsLog(@"%@",JobsLocalFunc);
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
            .bgColorBy(JobsOrangeColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"点击按钮push出view".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                
//                JobsViewNavigator *navigator = self.addSubview(jobsMakeViewNavigator(^(__kindof JobsViewNavigator * _Nullable navigator) {
//                    navigator.frame = self.bounds;
//                    self.pushView.navigator = navigator;
//                }));
//                navigator.pushView(self.pushView,YES);
//
//                self.navigator.frame = self.bounds;
//                self.pushView.navigator = self.navigator;
//                self.navigator.pushView(self.pushView,YES);
//
//                self.configViewNavigatorByPushview_(self.pushView);
//                self.navigator.pushView(self.pushView,YES);
//
//                self.pushView.configViewNavigatorBySuperview_(self);
//                self.navigator.pushView(self.pushView,YES);
//
                self.configViewNavigatorBySuperviewAndView_(self,self.pushView);
                self.navigator.pushView(self.pushView,YES);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.addSubview(_push_btn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.mas_equalTo(JobsWidth(30));
        }];_push_btn.makeBtnTitleByShowingType(UILabelShowingType_03);
    }return _push_btn;
}

-(BaseButton *)pop_btn{
    @jobs_weakify(self)
    if(!_pop_btn){
        _pop_btn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"点我pop当前view".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                JobsLog(@"%@",self.navigator);
                if(self.navigator) self.navigator.popViewAnimated(YES);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self.addSubview(_pop_btn) mas_makeConstraints:^(MASConstraintMaker *make) {
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
