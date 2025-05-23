//
//  JobsUserHeaderDataView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/19.
//

#import "BaseView.h"
#import "JobsBlock.h"
#import "JobsUserHeaderDataViewTBVCell.h"
#import "JobsUserHeaderDataViewForHeaderInSection.h"
#import "UITableView+RegisterClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserHeaderDataView : BaseView
<
BaseViewProtocol
,UITableViewDelegate
,UITableViewDataSource
>

-(__kindof JobsUserHeaderDataView *)makeImageByBlock:(jobsByIDBlock _Nullable)block
                                         finishBlock:(jobsByVoidBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
/**
 -(JobsUserHeaderDataView *)userHeaderDataView{
     if(!_userHeaderDataView){
         @jobs_weakify(self)
         _userHeaderDataView = [JobsUserHeaderDataView.new makeImageByBlock:^(UIImage *_Nullable image) {
             @jobs_strongify(self)
             self.currentBtn.jobsResetBtnBgImage(image);/// 永远值显示最后选择的图
         } finishBlock:^{
             @jobs_strongify(self)
             [self->_userHeaderDataView tf_hide:^{
                 @jobs_strongify(self)
                 self.popupParameter = nil;
             }];
         }];
     }return _userHeaderDataView;
 }
 */
