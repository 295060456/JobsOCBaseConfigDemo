//
//  BaseTableViewHeaderFooterView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/30.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
#import "UIViewModelProtocol.h"
#import "UITableView+Expand.h"
#import "UITableViewHeaderFooterView+BaseTableViewHeaderFooterViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewHeaderFooterView : UITableViewHeaderFooterView
<
BaseViewProtocol,
UIViewModelProtocol
>

@end

NS_ASSUME_NONNULL_END
/**
 
 /// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
 /// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
 - (nullable __kindof UIView *)tableView:(UITableView *)tableView
                  viewForHeaderInSection:(NSInteger)section{
     /// 什么不配置就是悬浮
     /// JobsHeaderFooterViewStyleNone 还是悬浮
     /// JobsHeaderViewStyle 不是悬浮
     return BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
         .byStyle(JobsHeaderViewStyle)/// 悬浮开关
         .bySection(section)/// 悬浮配置
         .JobsRichViewByModel2(nil)
         .JobsBlock1(^(id _Nullable data) {
             
         });
 }
 
 /// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
 /// tableView.registerHeaderFooterViewClass(BaseTableViewHeaderFooterView.class,@"");
 - (nullable __kindof UIView *)tableView:(UITableView *)tableView
            viewForFooterInSection:(NSInteger)section{
     /// 什么不配置就是悬浮
     /// JobsHeaderFooterViewStyleNone 还是悬浮
     /// JobsHeaderViewStyle 不是悬浮
     return BaseTableViewHeaderFooterView.initByReuseIdentifier(tableView,@"")
         .byStyle(JobsHeaderViewStyle)/// 悬浮开关
         .bySection(section)/// 悬浮配置
         .JobsRichViewByModel2(nil)
         .JobsBlock1(^(id _Nullable data) {
             
         });
 }
 
 */
