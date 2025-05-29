//
//  JXCategoryImageView+Extra.h
//  FMNormal
//
//  Created by Jobs on 2025/5/29.
//

#import "JobsBlock.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryImageView (Extra)

-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)byImageNames;
-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)bySelectedImageNames;
-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)byImageInfoArray;
-(JobsReturnCategoryImageViewByStringsBlock _Nonnull)bySelectedImageInfoArray;
-(JobsReturnCategoryImageViewBySizeBlock _Nonnull)byImageSize;
-(JobsReturnCategoryImageViewByCGFloatBlock _Nonnull)byImageCornerRadius;
-(JobsReturnCategoryImageViewByBOOLBlock _Nonnull)byImageZoomEnabled;
-(JobsReturnCategoryImageViewByNSIntegerBlock _Nonnull)byImageZoomScale;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(JXCategoryImageView *)categoryView{
     if (!_categoryView) {
         @jobs_weakify(self)
         _categoryView = self.view.addSubview(jobsMakeCategoryImageView(^(JXCategoryImageView * _Nullable view) {
             view.byImageNames(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .bySelectedImageNames(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .byImageInfoArray(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .bySelectedImageInfoArray(jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>* _Nullable arr) {
                 arr.add(@"彩票_已选择")
                     .add(@"电子_已选择")
                     .add(@"棋牌_已选择")
                     .add(@"全部游戏_已选择")
                     .add(@"体育_已选择")
                     .add(@"真人直播_已选择");
             }))
             .byImageSize(CGSizeMake(JobsWidth(30), JobsWidth(30)))
             .byImageCornerRadius(JobsWidth(8))
             .byImageZoomEnabled(YES)
             .byImageZoomScale(2)
             .byDefaultSelectedIndex(1)/// 默认从第二个开始显示
             .byCellSpacing(JobsWidth(-20))
             .byContentScrollView(self.listContainerView.scrollView)/// 关联cotentScrollView，关联之后才可以互相联动！！！
             .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray <JXCategoryIndicatorLineView *>* _Nullable arr) {
                 arr.add(jobsMakeCategoryIndicatorLineView(^(JXCategoryIndicatorLineView * _Nullable view) {
                     view.indicatorColor = HEXCOLOR(0xFFEABA);
                     view.indicatorHeight = JobsWidth(4);
                     view.indicatorWidthIncrement = JobsWidth(10);
                     view.verticalMargin = 0;
                 }));
             }))/// 二选一
             .byIndicators(jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                 arr.add(jobsMakeCategoryIndicatorBackgroundView(^(JXCategoryIndicatorBackgroundView * _Nullable view) {
                     view.indicatorHeight = JobsWidth(30);
                     view.indicatorWidth = JobsWidth(76);
                     view.indicatorColor = HEXCOLOR(0xFFEABA);
                     view.indicatorCornerRadius = JXCategoryViewAutomaticDimension;
                 }));
             }))/// 二选一
             .byDelegate(self)
             .byBgCor(JobsClearColor);
         }))
         .setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(0);
             make.left.right.equalTo(self.view);
             make.height.mas_equalTo(listContainerViewDefaultOffset);
         }).on();
     }return _categoryView;
 }
 
 */
