//
//  JobsStepView.h
//  FM
//
//  Created by User on 7/31/24.
//

#import "BaseView.h"
#import "JobsBlock.h"
#import "DefineProperty.h"
#import "UIButton+JobsStepView.h"
#import "JobsDefineAllEnumHeader.h"            // 此文件用来存储记录全局的一些枚举

NS_ASSUME_NONNULL_BEGIN

@interface JobsStepView : BaseView

+(JobsRetBtnModelByStrAndImagesBlock _Nonnull)makeButtonModelBy;
/// 值越大 = 按钮之间的距离越小
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byOffset;
/// 设置左边线长度
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byLeftViewWidth;
/// 设置右边线长度
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byRightViewWidth;
/// 设置按钮之间的距离
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byBtnOffset;
/// 设置第一个按钮距离父视图左边的距离
-(JobsReturnStepViewByCGFloatBlock _Nonnull)byFirstBtnLeftOffset;
/// 设置左边线（高亮）颜色
-(JobsReturnStepViewByColorBlock _Nonnull)byLeftLabHighlightBgCor;
/// 设置左边线（普通）颜色
-(JobsReturnStepViewByColorBlock _Nonnull)byLeftLabNormalBgCor;
/// 设置右边线（高亮）颜色
-(JobsReturnStepViewByColorBlock _Nonnull)byRightLabHighlightBgCor;
/// 设置右边线（普通）颜色
-(JobsReturnStepViewByColorBlock _Nonnull)byRightLabNormalBgCor;
/// 设置当前显示状态
-(JobsReturnStepViewByNSIntegerBlock _Nonnull)byStatus;

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
         _stepView = self.view.addSubview(jobsMakeStepView(^(__kindof JobsStepView * _Nullable stepView) {
             stepView.byOffset(JobsWidth(10))
             .byLeftViewWidth(JobsWidth(60))
             .byRightViewWidth(JobsWidth(60))
             .byBtnOffset(JobsWidth(60))
             .byFirstBtnLeftOffset(JobsWidth(24))
             .byLeftLabHighlightBgCor(JobsCor(@"#C71A1A"))
             .byRightLabHighlightBgCor(JobsCor(@"#C71A1A"))
             .byLeftLabNormalBgCor(JobsGrayColor)
             .byRightLabNormalBgCor(JobsGrayColor)
             .byStatus(VerificationStatusVerifying)
             .jobsRichViewByModel(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButtonModel *>* _Nullable data) {
                 data.add(JobsStepView.makeButtonModelBy(JobsInternationalization(@"Unverified"),@"正在进行第一步".img,@"正在进行第一步".img))
                     .add(JobsStepView.makeButtonModelBy(JobsInternationalization(@"Verifiying"),@"还未进行第二步".img,@"正在进行第二步".img))
                     .add(JobsStepView.makeButtonModelBy(JobsInternationalization(@"Verified"),@"还未进行第三步".img,@"正在进行第三步".img));
             }));
         })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             make.top.equalTo(self.gk_navigationBar.mas_bottom);
             make.centerX.equalTo(self.view);
             make.size.mas_equalTo(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(100)));
         }).on().byBgCor(JobsWhiteColor);
     }return _stepView;
 }
 
 */
