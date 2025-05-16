//
//  UITableView+Expand.h
//  DouDong-II
//
//  Created by Jobs on 2021/4/10.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Expand)
#pragma mark —— 数据源
-(jobsByIDBlock _Nonnull)dataLink;
#pragma mark —— UITableView
+(instancetype)initWithStylePlain;/// 一般用这个
+(instancetype)initWithStyleGrouped;/// 会在section之间自己预留一块空间
+(instancetype)initWithStyleInsetGrouped API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(tvos);
#pragma mark —— UITableViewHeaderFooterView
-(JobsReturnRectByNSIntegerBlock _Nonnull)rectForHeaderInSection;
-(JobsReturnRectByNSIntegerBlock _Nonnull)rectForFooterInSection;
#pragma mark —— UITableViewCell
/// 对系统方法 cellForRowAtIndexPath 的二次封装
-(JobsReturnTableViewCellByIndexPathBlock _Nonnull)cellBy;
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
-(void)hideSeparatorLineAtLast:(NSIndexPath *)indexPath
                          cell:(__kindof UITableViewCell *)cell;
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
