//
//  FMHomeMainBizSubView.h
//  FM_Normal
//
//  Created by Admin on 11/4/2025.
//

#import "JobsBlock.h"
#import "BaseView.h"
#import "JobsBtnStyleTBVCell.h"
#import "ThreeClassCell.h"
#import "FMGameCVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMHomeMainBizSubView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
,UICollectionViewDelegate
,UICollectionViewDataSource
>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof FMHomeMainBizSubView *_Nonnull jobsMakeBizSubView(jobsByBizSubViewBlock _Nonnull block){
    FMHomeMainBizSubView *data = FMHomeMainBizSubView.alloc.init;
    if (block) block(data);
    return data;
}

/**
 
 Prop_strong()NSMutableArray <FMHomeMainBizSubView *>*subViewMutArr;
 
 FMHomeMainBizSubView *subView = self.subViewMutArr[indexPath.item];
 self.bringSubviewToFront(subView);
 
 -(NSMutableArray<FMHomeMainBizSubView *> *)subViewMutArr{
     if(!_subViewMutArr){
         @jobs_weakify(self)
         _subViewMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <FMHomeMainBizSubView *>* _Nullable arr) {
             @jobs_strongify(self)
             for (UIButtonModel *buttonModel in self.dataMutArr) {
                 arr.add(jobsMakeBizSubView(^(__kindof FMHomeMainBizSubView * _Nullable subView) {
                     @jobs_strongify(self)
                     subView.jobsRichViewByModel(nil);
                     self.addSubview(subView);
                     [subView mas_makeConstraints:^(MASConstraintMaker *make) {
                         make.size.mas_equalTo(FMHomeMainBizSubView.viewSizeByModel(nil));
                         make.centerX.equalTo(self);
                         make.top.equalTo(self.collectionView.mas_bottom);
                     }];
                 }));
             }
         });
     }return _subViewMutArr;
 }

*/
