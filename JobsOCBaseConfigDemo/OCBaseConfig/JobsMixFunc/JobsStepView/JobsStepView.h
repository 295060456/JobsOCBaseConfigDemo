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
             make.size.mas_equalTo([_stepView viewSizeWithModel:nil]);
         }];
        _stepView.jobsRichElementsInViewWithModel(self.btnModelMutArr);
     }return _stepView;
 }

 -(NSMutableArray<UIButtonModel *> *)btnModelMutArr{
     if(!_btnModelMutArr){
         _btnModelMutArr = NSMutableArray.array;
         {
             UIButtonModel *buttonModel = UIButtonModel.new;
             buttonModel.title = JobsInternationalization(@"第一步");
             buttonModel.titleCor = JobsWhiteColor;
             buttonModel.titleFont = UIFontWeightRegularSize(14);
             buttonModel.normalImage = JobsIMG(@"正在进行第一步");
             buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
             buttonModel.imagePadding = JobsWidth(10);
             buttonModel.roundingCorners = UIRectCornerAllCorners;
             buttonModel.leftViewWidth = JobsWidth(80);
             buttonModel.rightViewWidth = JobsWidth(80);
             buttonModel.selected = YES;
             [_btnModelMutArr addObject:buttonModel];
         }
         
         {
             UIButtonModel *buttonModel = UIButtonModel.new;
             buttonModel.title = JobsInternationalization(@"第二步");
             buttonModel.titleCor = JobsWhiteColor;
             buttonModel.titleFont = UIFontWeightRegularSize(14);
             buttonModel.normalImage = JobsIMG(@"还未进行第二步");
             buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
             buttonModel.imagePadding = JobsWidth(10);
             buttonModel.roundingCorners = UIRectCornerAllCorners;
             buttonModel.leftViewWidth = JobsWidth(80);
             buttonModel.rightViewWidth = JobsWidth(80);
             buttonModel.selected = YES;
             [_btnModelMutArr addObject:buttonModel];
         }
         
         {
             UIButtonModel *buttonModel = UIButtonModel.new;
             buttonModel.title = JobsInternationalization(@"第三步");
             buttonModel.titleCor = JobsWhiteColor;
             buttonModel.titleFont = UIFontWeightRegularSize(14);
             buttonModel.normalImage = JobsIMG(@"还未进行第三步");
             buttonModel.imagePlacement = NSDirectionalRectEdgeTop;
             buttonModel.imagePadding = JobsWidth(10);
             buttonModel.roundingCorners = UIRectCornerAllCorners;
             buttonModel.leftViewWidth = JobsWidth(80);
             buttonModel.rightViewWidth = JobsWidth(80);
             buttonModel.selected = YES;
             [_btnModelMutArr addObject:buttonModel];
         }
     }return _btnModelMutArr;
 }

 
 */
