//
//  ImageNumberView.h
//  Casino
//
//  Created by Jobs on 2021/11/29.
//

#import "BaseView.h"
#import "JobsImageNumberViewCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsImageNumberView : BaseView
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>

@end

NS_ASSUME_NONNULL_END

/**
 
 【137 宽度包含5个数组一个小数点，一个数字差不多22.5宽】
 
 // Data
 @property(nonatomic,strong)NSMutableArray <UIImage *>*dataMutArr;
 
 // Data -> View
 UIViewModel *viewModel = UIViewModel.new;
 viewModel.text = @"123.99";
 self.dataMutArr = [self translateToArr:viewModel.text.floatValue
                      saveBitAfterPoint:2];
 self.imageNumberView.jobsRichElementsInViewWithModel(self.dataMutArr);
 
 */
