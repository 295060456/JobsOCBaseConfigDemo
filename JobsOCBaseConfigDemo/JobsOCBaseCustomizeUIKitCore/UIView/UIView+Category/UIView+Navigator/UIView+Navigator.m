//
//  UIView+Navigator.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/3/24.
//

#import "UIView+Navigator.h"

@implementation UIView (Navigator)
#pragma mark —— 汇总方法
/// 推页面
-(jobsByViewBlock _Nonnull)pushTo{
    @jobs_weakify(self)
    return ^(__kindof UIView *_Nullable nextView){
        @jobs_strongify(self)
        self.configViewNavigatorByPushview(nextView);
        nextView.navigator = self.navigator;
        self.navigator.pushView(nextView,YES);
    };
}
/// 退回到上一个页面
-(jobsByBOOLBlock _Nonnull)popViewAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        self.navigator.popViewAnimated(YES);
    };
}
/// 退回到根页面
-(jobsByBOOLBlock _Nonnull)popToRootViewAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        self.navigator.popToRootViewAnimated(YES);
    };
}
#pragma mark —— 配置
-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable superview) {
        @jobs_strongify(self)
        self.configViewNavigatorBySuperview_(superview);
        [superview addSubview:superview.navigator];
    };
}

-(jobsByViewBlock _Nonnull)configViewNavigatorBySuperview_{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable superview) {
        @jobs_strongify(self)
        superview.navigator.frame = superview.bounds;
        self.navigator = superview.navigator;
    };
}

-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable pushview) {
        @jobs_strongify(self)
        self.configViewNavigatorByPushview_(pushview);
        [self addSubview:self.navigator];
    };
}

-(jobsByViewBlock _Nonnull)configViewNavigatorByPushview_{
    @jobs_weakify(self)
    return ^(UIView __kindof * _Nullable pushview) {
        @jobs_strongify(self)
        self.navigator.frame = self.bounds;
        pushview.navigator = self.navigator;
    };
}

-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView{
    @jobs_weakify(self)
    return ^(UIView *_Nullable superview,
             UIView *_Nullable view) {
        @jobs_strongify(self)
        self.configViewNavigatorBySuperviewAndView_(superview,view);
        [superview addSubview:self.navigator];
    };
}

-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView_{
    @jobs_weakify(self)
    return ^(UIView *_Nullable superview,
             UIView *_Nullable view) {
        @jobs_strongify(self)
        self.navigator.frame = view.bounds;
        view.navigator = superview.navigator;
    };
}
#pragma mark —— @property(nonatomic,strong)JobsViewNavigator *navigator;
JobsKey(_navigator)
@dynamic navigator;
-(JobsViewNavigator *)navigator{
    JobsViewNavigator *Navigator = Jobs_getAssociatedObject(_navigator);
    if(!Navigator){
        Navigator = JobsViewNavigator.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_navigator, Navigator)
    }return Navigator;
}

-(void)setNavigator:(JobsViewNavigator *)navigator{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navigator, navigator)
}

@end
