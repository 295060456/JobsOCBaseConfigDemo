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
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
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
        _push_btn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                      background:nil
                                      buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                   textAlignment:NSTextAlignmentCenter
                                                subTextAlignment:NSTextAlignmentCenter
                                                     normalImage:nil
                                                  highlightImage:nil
                                                 attributedTitle:nil
                                         selectedAttributedTitle:nil
                                              attributedSubtitle:nil
                                                           title:JobsInternationalization(@"点击按钮push出view")
                                                        subTitle:nil
                                                       titleFont:UIFontWeightRegularSize(12)
                                                    subTitleFont:nil
                                                        titleCor:JobsWhiteColor
                                                     subTitleCor:nil
                                              titleLineBreakMode:NSLineBreakByWordWrapping
                                           subtitleLineBreakMode:NSLineBreakByWordWrapping
                                             baseBackgroundColor:JobsOrangeColor
                                                 backgroundImage:nil
                                                    imagePadding:JobsWidth(0)
                                                    titlePadding:JobsWidth(0)
                                                  imagePlacement:NSDirectionalRectEdgeNone
                                      contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                        contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                   contentInsets:jobsSameDirectionalEdgeInsets(0)
                                               cornerRadiusValue:JobsWidth(8)
                                                 roundingCorners:UIRectCornerAllCorners
                                            roundingCornersRadii:CGSizeZero
                                                  layerBorderCor:nil
                                                     borderWidth:JobsWidth(1)
                                                   primaryAction:nil
                                      longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                     id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
          }
                                                 clickEventBlock:^id(BaseButton *x){
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
            
            return nil;
        }];
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
        _pop_btn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                     buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:nil
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:JobsInternationalization(@"点我pop当前view")
                                                       subTitle:nil
                                                      titleFont:UIFontWeightRegularSize(12)
                                                   subTitleFont:nil
                                                       titleCor:JobsWhiteColor
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:JobsOrangeColor
                                                backgroundImage:nil
                                                   imagePadding:JobsWidth(0)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeNone
                                     contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                       contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                  contentInsets:jobsSameDirectionalEdgeInsets(0)
                                              cornerRadiusValue:JobsWidth(8)
                                                roundingCorners:UIRectCornerAllCorners
                                           roundingCornersRadii:CGSizeZero
                                                 layerBorderCor:nil
                                                    borderWidth:JobsWidth(1)
                                                  primaryAction:nil
                                     longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                    id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
         }
                                                clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            NSLog(@"%@",self.navigator);
            if(self.navigator) self.navigator.popViewAnimated(YES);
            return nil;
        }];
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
        _pushView.jobsRichElementsInViewWithModel(nil);
    }return _pushView;
}

@end
