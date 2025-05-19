//
//  UITableView+RegisterClass.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/26.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (RegisterClass)<BaseTableViewProtocol>

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
