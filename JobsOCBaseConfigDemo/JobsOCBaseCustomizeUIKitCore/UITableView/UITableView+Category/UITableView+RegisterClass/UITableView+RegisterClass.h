//
//  UITableView+RegisterClass.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (RegisterClass)
#pragma mark —— 注册
-(void)registerTableViewClass;
/// 注册 HeaderFooterView 及其子类 jobsByClassBlock
-(jobsByClassAndSaltStrBlock _Nonnull)registerHeaderFooterViewClass;
/// 注册 UITableViewCell 及其子类
-(jobsByClassAndSaltStrBlock _Nonnull)registerTableViewCellClass;
#pragma mark —— 取值
/// 不使用 registerClass 直接创建 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByClsAndSaltStrBlock _Nonnull)tableViewCellClass;
/// 使用 registerClass 注册 UITableViewCell ❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewCellByCls_SaltStr_IndexPath_Block _Nonnull)tableViewCellClassForIndexPath;
/// 一种用字符串取UITableViewHeaderFooterView及其子类的方法❤️复用字符串是目标类的类名❤️
-(JobsReturnTableViewHeaderFooterViewByClsAndSaltStrBlock _Nonnull)tableViewHeaderFooterView;

@end

NS_ASSUME_NONNULL_END
/// 用于 +(JobsReturnTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultWithTableView；内部
#ifndef JobsRegisterDequeueTableViewCell
#define JobsRegisterDequeueTableViewCell(CellClass,CellStyle) \
({ \
    CellClass *cell = (CellClass *)tableView.tableViewCellClass(CellClass.class,@""); \
    if (!cell) { \
        cell = (CellClass *)CellClass.initTableViewCellWithStyle(CellStyle); \
        cell.selectionStyle = UITableViewCellSelectionStyleNone; \
    } \
    cell; \
})
#endif /* JobsRegisterDequeueTableViewCell */
/// UITableViewCellStyleDefault
#ifndef JobsRegisterDequeueTableViewDefaultCell
#define JobsRegisterDequeueTableViewDefaultCell(CellClass) JobsRegisterDequeueTableViewCell(CellClass,UITableViewCellStyleDefault);
#endif /* JobsRegisterDequeueTableViewDefaultCell */
/// UITableViewCellStyleValue1
#ifndef JobsRegisterDequeueTableViewValue1Cell
#define JobsRegisterDequeueTableViewValue1Cell(CellClass) JobsRegisterDequeueTableViewCell(CellClass,UITableViewCellStyleValue1);
#endif /* JobsRegisterDequeueTableViewValue1Cell */
/// UITableViewCellStyleValue2
#ifndef JobsRegisterDequeueTableViewValue2Cell
#define JobsRegisterDequeueTableViewValue2Cell(CellClass) JobsRegisterDequeueTableViewCell(CellClass,UITableViewCellStyleValue12);
#endif /* JobsRegisterDequeueTableViewValue2Cell */
/// UITableViewCellStyleSubtitle
#ifndef JobsRegisterDequeueTableViewSubtitleCell
#define JobsRegisterDequeueTableViewSubtitleCell(CellClass) JobsRegisterDequeueTableViewCell(CellClass,UITableViewCellStyleSubtitle);
#endif /* JobsRegisterDequeueTableViewSubtitleCell */
