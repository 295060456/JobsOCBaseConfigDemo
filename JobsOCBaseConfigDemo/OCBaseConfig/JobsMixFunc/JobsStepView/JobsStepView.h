//
//  JobsStepView.h
//  FM
//
//  Created by User on 7/31/24.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsStepView : BaseView

@property(nonatomic,strong,null_resettable)UIColor *leftLabBgCor;
@property(nonatomic,strong,null_resettable)UIColor *rightLabBgCor;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(JobsStepView *)stepView{
     if(!_stepView){
         _stepView = JobsStepView.new;
         _stepView.backgroundColor = JobsRedColor;
         [self addSubview:_stepView];
         [_stepView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.center.equalTo(self);
             make.size.mas_equalTo(_stepView.viewSizeByModel(nil)]);
         }];
        _stepView.jobsRichViewByModel(self.btnModelMutArr);
     }return _stepView;
 }

 -(NSMutableArray<UIButtonModel *> *)btnModelMutArr{
     if(!_btnModelMutArr){
         _btnModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
             data.add(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data1) {
                 data1.title = JobsInternationalization(@"第一步");
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
                 data1.title = JobsInternationalization(@"第二步");
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
                 data1.title = JobsInternationalization(@"第三步");
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
         });
     }return _btnModelMutArr;
 }
 
 */
