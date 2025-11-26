//
//  UITableView+Extra.h
//  DouDong-II
//
//  Created by Jobs on 2021/4/10.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseTableViewProtocol.h"

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

/**
 ❤️UITableViewStylePlain ❤️
 不实现footer、header设置方法，默认无header、footer；
                                        iOS 11                                                                         |                      < iOS 11
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    viewForHeaderInSection           |      只实现此方法header高度为系统默认                                                |   只实现此方法header设置无效
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    heightForHeaderInSection        |       只实现此方法header设置无效                                                          |  只实现此方法header高度设置有效
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                            同时实现 viewForHeaderInSection 和 heightForHeaderInSection        |
                                    header高度设置有效                                                            |
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 【 footer设置同header设置】
 
 
 ❤️UITableViewStyleGrouped ❤️
 不实现footer、header设置方法，默认无header、footer；
                                        iOS 11                                                                         |                      < iOS 11
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    viewForHeaderInSection           |      只实现此方法header高度为系统默认                                                |   只实现此方法header高度为系统默认
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    heightForHeaderInSection        |       只实现此方法header高度为系统默认                                                |  实现此方法header高度设置有效，不可为0
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                            同时实现 viewForHeaderInSection 和 heightForHeaderInSection        |
                                    header高度设置有效                                                            |
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 【 footer设置同header设置】
 
 综上所诉:
 1、iOS 11 设置 header 高度必须同时实现 viewForHeaderInSection 和 heightForHeaderInSection ；
 2、iOS 11 之前版本只设置 heightForHeaderInSection 即可设置 header 高度，只是在 UITableViewStyleGrouped 时无法设置 header 高度为0，设置0时高度为系统默认高度；

 作者：JimmyL
 链接：https://www.jianshu.com/p/65425a9d98e3
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 */
NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Extra)<BaseTableViewProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UITableView *_Nonnull jobsMakeTableViewByGrouped(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStyleGrouped;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakeTableViewByPlain(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStylePlain;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof UITableView *_Nonnull jobsMakeTableViewByInsetGrouped(jobsByTableViewBlock _Nonnull block){
    UITableView *data = UITableView.initWithStyleInsetGrouped;
    if (block) block(data);
    return data;
}
/**
 # 写法1
 /// BaseViewProtocol
 @synthesize tableView = _tableView;
 -(UITableView *)tableView{
     if (!_tableView) {
         /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
         @jobs_weakify(self)
         _tableView = self.view.addSubview(jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
             @jobs_strongify(self)
             tableView.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                 .bySeparatorColor(HEXCOLOR(0xEEE2C8))
                 .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                 .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                 .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                     /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                 }))
                 .byTableFooterView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                     /// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                 }))
                 .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                     data.title = @"NO MESSAGES FOUND".tr;
                     data.titleCor = JobsWhiteColor;
                     data.titleFont = bayonRegular(JobsWidth(30));
                     data.normalImage = @"小狮子".img;
                 }))
                 .showsVerticalScrollIndicatorBy(NO)
                 .showsHorizontalScrollIndicatorBy(NO)
                 .byScrollEnabled(YES)
                 .byBgCor(JobsClearColor);

             if(@available(iOS 11.0, *)) {
                 tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
             }else{
                 SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
             }
             
 //            {
 //                tableView.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
 //                    @jobs_strongify(self)
 //                    NSObject.feedbackGenerator(nil);//震动反馈
 //                    self->_tableView.endRefreshing(YES);
 //                    return nil;
 //                }]);
 //                tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
 //            }
             
 //            {/// 设置tabAnimated相关属性
 //                // 可以不进行手动初始化，将使用默认属性
 //                tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
 //                                                                      cellHeight:[JobsBaseTableViewCell cellHeightWithModel:nil]];
 //                tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
 //                [tableView tab_startAnimation];   // 开启动画
 //            }
             
 //            {
 //              [tableView xzm_addNormalHeaderWithTarget:self
 //                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
 //                                                                                     id _Nullable arg) {
 //                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
 //                  @jobs_strongify(self)
 //                  /// 在需要结束刷新的时候调用（只能调用一次）
 //                  /// _tableView.endRefreshing();
 //                  return nil;
 //              }, MethodName(self), self)];
 //
 //              [tableView xzm_addNormalFooterWithTarget:self
 //                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
 //                                                                                     id _Nullable arg) {
 //                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
 //                  @jobs_strongify(self)
 //                  /// 在需要结束刷新的时候调用（只能调用一次）
 //                  /// _tableView.endRefreshing();
 //                  return nil;
 //              }, MethodName(self), self)];
 //              [tableView.xzm_header beginRefreshing];
 //          }
         })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             /// TODO
         }).on().dataLink(self);/// dataLink(self)不能写在Block里面，会出问题
     }return _tableView;
 }
 # 写法2
 /// BaseViewProtocol
 @synthesize tableView = _tableView;
 -(UITableView *)tableView{
     if (!_tableView) {
         @jobs_weakify(self)
         _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
             @jobs_strongify(self)
             tableView.dataLink(self);
             /// TODO
             [self.view.addSubview(tableView) mas_makeConstraints:^(MASConstraintMaker *make) {
                 /// TODO
             }];
         });
     }return _tableView;
 }
 */
