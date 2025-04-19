//
//  PopListView.h
//  FM
//
//  Created by User on 8/11/24.
//

#import "BaseView.h"
#import "JobsTextStyleTBVCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface PopListBaseView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

//Prop_assign()CGFloat cellHeight;
//Prop_assign()CGFloat cellWidth;

-(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof PopListBaseView *_Nonnull jobsMakePopListBaseView(jobsByPopListBaseViewBlock _Nonnull block){
    PopListBaseView *data = PopListBaseView.alloc.init;
    if (block) block(data);
    return data;
}
/**
 
 Prop_strong()PopListBaseView *nationalPopListView;
 Prop_copy()NSMutableArray <__kindof UIViewModel *>*nationalPopList_dataMutArr;
 
 -(PopListBaseView *)nationalPopListView{
     if(!_nationalPopListView){
         _nationalPopListView = PopListBaseView.new;
         _nationalPopListView.size = _nationalPopListView.viewSizeByModel(nil);
         _nationalPopListView.jobsRichViewByModel(self.nationalPopList_dataMutArr);
     }return _nationalPopListView;
 }

 -(NSMutableArray<__kindof UIViewModel *> *)nationalPopList_dataMutArr{
     if(!_nationalPopList_dataMutArr){
         _nationalPopList_dataMutArr = NSMutableArray.array;
         /// 装载本地假数据
         NSDictionary *dic = @"Countries".readLocalFileWithName;
         NSMutableArray <JobsCountriesModel *>*tags = [JobsCountriesModel mj_objectArrayWithKeyValuesArray:dic];
         
         for (JobsCountriesModel *model in tags) {
             UIViewModel *viewModel = UIViewModel.new;
             viewModel.text = model.chinese;
             viewModel.font = UIFontWeightRegularSize(JobsWidth(16));
             viewModel.textCor = JobsCor(@"#5D5D5D");
             viewModel.selectedTextCor = JobsWhiteColor;
             viewModel.bgSelectedCor = JobsCor(@"#5D5D5D");
             viewModel.bgCor = JobsCor(@"#1F1F1F");
             viewModel.textAlignment = NSTextAlignmentCenter;
             _nationalPopList_dataMutArr.add(viewModel);
             
         }
     }return _nationalPopList_dataMutArr;
 }
 */
