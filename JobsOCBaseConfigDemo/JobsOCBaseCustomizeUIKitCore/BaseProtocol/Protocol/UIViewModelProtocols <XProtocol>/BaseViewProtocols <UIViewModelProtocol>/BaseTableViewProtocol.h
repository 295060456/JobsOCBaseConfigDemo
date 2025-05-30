//
//  BaseTableViewProtocol.h
//  FMNormal
//
//  Created by Jobs on 2025/5/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "UIScrollViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTableViewProtocol <UIScrollViewProtocol>
@optional
#pragma mark —— 数据源
-(JobsReturnScrollViewByIDBlock _Nonnull)dataLink;
#pragma mark —— UITableView
+(instancetype)initWithStylePlain;/// 一般用这个
+(instancetype)initWithStyleGrouped;/// 会在section之间自己预留一块空间
+(instancetype)initWithStyleInsetGrouped API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos);
-(JobsReturnTableViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnTableViewByDataSourceBlock _Nonnull)byDataSource;
-(JobsReturnTableViewByDataSourcePrefetchingBlock _Nonnull)byDataSourcePrefetching API_AVAILABLE(ios(10.0));
-(JobsReturnTableViewByDragDelegateBlock _Nonnull)byDragDelegate API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsReturnTableViewByDropDelegateBlock _Nonnull)byDropDelegate API_AVAILABLE(ios(11.0)) API_UNAVAILABLE(tvos, watchos);
-(JobsReturnTableViewByCellSeparatorStyleBlock _Nonnull)bySeparatorStyle;
-(JobsReturnTableViewByCorBlock _Nonnull)bySeparatorColor;
-(JobsReturnTableViewByViewBlock _Nonnull)byTableHeaderView;
-(JobsReturnTableViewByViewBlock _Nonnull)byTableFooterView;
-(JobsReturnTableViewByEdgeInsetsBlock _Nonnull)byContentInset;
#pragma mark —— UITableViewHeaderFooterView
-(JobsReturnRectByNSIntegerBlock _Nonnull)rectForHeaderInSection;
-(JobsReturnRectByNSIntegerBlock _Nonnull)rectForFooterInSection;
#pragma mark —— UITableViewCell
/// 对系统方法 cellForRowAtIndexPath 的二次封装
-(JobsReturnTableViewCellByIndexPathBlock _Nonnull)cellBy;
-(JobsReturnTableViewByMJRefreshHeaderBlock _Nonnull)byMJRefreshHeader;
-(JobsReturnTableViewByMJRefreshFooterBlock _Nonnull)byMJRefreshFooter;
/// 对系统方法 numberOfRowsInSection 的二次封装
-(JobsReturnByNSIntegerBlock _Nonnull)rowsInSection;
-(__kindof UITableViewCell *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
                                  tableViewCellClass:(Class _Nullable)tableViewCellClass;
-(__kindof UITableViewCell *)didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
                                    tableViewCellClass:(Class _Nullable)tableViewCellClass;
-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                              tableViewCellSalt:(NSString * _Nullable)cellSalt
                                      withStyle:(UITableViewCellStyle)cellStyle;
-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                   tableViewCellStyleValue1Salt:(NSString * _Nullable)salt;
-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                  tableViewCellStyleDefaultSalt:(NSString * _Nullable)salt;
-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                   tableViewCellStyleValue2Salt:(NSString * _Nullable)salt;
-(__kindof UITableViewCell *)tableViewCellClass:(Class <UITableViewCellProtocol>)tableViewCellClass
                 tableViewCellStyleSubtitleSalt:(NSString * _Nullable)salt;
#pragma mark —— 其他
/// 更多，参见： 关于UITableViewCell和UICollectionViewCell圆切角+Cell的偏移量.md
/// 隐藏最后一个单元格的分界线
-(void)hideSeparatorLineAtLast:(NSIndexPath *)indexPath cell:(__kindof UITableViewCell *)cell;
#pragma mark —— RegisterClass
-(void)registerTableViewClass;
/// 不加盐注册
-(jobsByClassBlock _Nonnull)registerTableViewClassBy;
/// 加盐注册
-(jobsByClassAndSaltBlock _Nonnull)registerTableViewClassBySalt;
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(JobsReturnTableViewByClassAndSaltStrBlock _Nonnull)registerHeaderFooterViewClass;
/// 注册 UITableViewCell 及其子类
-(JobsReturnTableViewByClassAndSaltStrBlock _Nonnull)registerTableViewCellClass;
/// 不使用 registerClass 直接创建 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByClsAndSaltStrBlock _Nonnull)tableViewCellClass;
/// 使用 registerClass 注册 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block _Nonnull)tableViewCellClassForIndexPath;
/// 一种用字符串取UITableViewHeaderFooterView及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock _Nonnull)tableViewHeaderFooterView;

@end

NS_ASSUME_NONNULL_END
