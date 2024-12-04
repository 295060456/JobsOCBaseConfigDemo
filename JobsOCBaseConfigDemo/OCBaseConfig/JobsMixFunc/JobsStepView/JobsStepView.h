//
//  JobsStepView.h
//  FM
//
//  Created by User on 7/31/24.
//

#import "BaseView.h"
#import "JobsBlock.h"
#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsStepView : BaseView

Prop_strong(null_resettable)UIColor *leftLabBgCor;
Prop_strong(null_resettable)UIColor *rightLabBgCor;
Prop_assign()CGFloat offset;/// 值越大 = 按钮之间的距离越小

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsStepView *_Nonnull jobsMakeStepView(jobsByStepViewBlock _Nonnull block){
    JobsStepView *data = JobsStepView.alloc.init;
    if (block) block(data);
    return data;
}

/**
 
 -(JobsStepView *)stepView{
     if(!_stepView){
         _stepView = jobsMakeStepView(^(__kindof JobsStepView * _Nullable stepView) {
             stepView.backgroundColor = JobsClearColor;
             stepView.offset = JobsWidth(10);
             self.addSubview(stepView);
             [stepView mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.top.equalTo(self).offset(JobsWidth(20));
                 make.left.equalTo(self).offset(JobsWidth(10));
                 make.size.mas_equalTo(stepView.viewSizeByModel(nil));
             }];stepView.jobsRichViewByModel(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                 data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                     data1.title = JobsInternationalization(@"Unverified");
                     data1.titleCor = JobsWhiteColor;
                     data1.titleFont = UIFontWeightRegularSize(14);
                     data1.normalImage = JobsIMG(@"正在进行第一步");
                     data1.imagePlacement = NSDirectionalRectEdgeTop;
                     data1.imagePadding = JobsWidth(8);
                     data1.roundingCorners = UIRectCornerAllCorners;
                     data1.leftViewWidth = JobsWidth(80);
                     data1.rightViewWidth = JobsWidth(80);
                     data1.baseBackgroundColor = JobsClearColor;
                     data1.selected = YES;
                 }));
                 data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                     data1.title = JobsInternationalization(@"Verifiying");
                     data1.titleCor = JobsWhiteColor;
                     data1.titleFont = UIFontWeightRegularSize(14);
                     data1.normalImage = JobsIMG(@"还未进行第二步");
                     data1.imagePlacement = NSDirectionalRectEdgeTop;
                     data1.imagePadding = JobsWidth(8);
                     data1.roundingCorners = UIRectCornerAllCorners;
                     data1.leftViewWidth = JobsWidth(80);
                     data1.rightViewWidth = JobsWidth(80);
                     data1.baseBackgroundColor = JobsClearColor;
                     data1.selected = YES;
                 }));
                 data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                     data1.title = JobsInternationalization(@"Verified");
                     data1.titleCor = JobsWhiteColor;
                     data1.titleFont = UIFontWeightRegularSize(14);
                     data1.normalImage = JobsIMG(@"还未进行第三步");
                     data1.imagePlacement = NSDirectionalRectEdgeTop;
                     data1.imagePadding = JobsWidth(8);
                     data1.roundingCorners = UIRectCornerAllCorners;
                     data1.leftViewWidth = JobsWidth(80);
                     data1.rightViewWidth = JobsWidth(80);
                     data1.baseBackgroundColor = JobsClearColor;
                     data1.selected = YES;
                 }));
             }));
         });
     }return _stepView;
 }
 
 */
