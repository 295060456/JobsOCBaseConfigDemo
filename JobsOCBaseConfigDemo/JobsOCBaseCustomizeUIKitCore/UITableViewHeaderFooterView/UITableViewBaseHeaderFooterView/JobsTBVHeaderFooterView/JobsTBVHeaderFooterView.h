//
//  JobsTBVHeaderFooterView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/30.
//

#import "BaseTableViewHeaderFooterView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsTBVHeaderFooterView : BaseTableViewHeaderFooterView

@end

NS_ASSUME_NONNULL_END
/**
 
 /// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
 /// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
 - (UIView *)tableView:(UITableView *)tableView
 viewForHeaderInSection:(NSInteger)section{
     if(section == 0){
                 return BaseTableViewHeaderFooterView
                         .initByReuseIdentifier(@"")
             .byStyle(JobsHeaderViewStyle)/// 不写这三句有悬浮 1
             .bySection(section)/// 不写这三句有悬浮 2
             .byTableView(tableView)/// 不写这三句有悬浮 2
             .JobsRichViewByModel2(nil)
             .JobsBlock1(^(id _Nullable data) {

             });
     }else return UIView.new;
 }
 /// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
 /// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
 - (nullable UIView *)tableView:(UITableView *)tableView
         viewForFooterInSection:(NSInteger)section{
     if(self.viewModel.usesTableViewFooterView){
                 return BaseTableViewHeaderFooterView
                         .initByReuseIdentifier(@"")
             .byStyle(JobsFooterViewStyle)/// 不写这三句有悬浮 1
             .bySection(section)/// 不写这三句有悬浮 2
             .byTableView(tableView)/// 不写这三句有悬浮 2
             .JobsRichViewByModel2(nil)
             .JobsBlock1(^(id _Nullable data) {

             });
     }return nil;
 }
 
 */
