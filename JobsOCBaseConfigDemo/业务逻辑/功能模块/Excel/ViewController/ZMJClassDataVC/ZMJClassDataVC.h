//
//  ZMJClassDataVC.h
//  FM
//
//  Created by User on 7/29/24.
//

#import "BaseViewController.h"

#if __has_include(<ZMJGanttChart/ZMJGanttChart.h>)
#import <ZMJGanttChart/ZMJGanttChart.h>
#else
#import "ZMJGanttChart.h"
#endif

#import "TextCell.h"
#import "HeaderCell.h"

typedef NS_ENUM(NSInteger, ZMJSorting) {
    ZMJAscending = 0,
    ZMJDsescending
};

static NSString * getSymbol(ZMJSorting sorting) {
    switch (sorting) {
        case ZMJAscending:
            return @"\u25B2";/// 黑色上三角形（▲）
            break;
        case ZMJDsescending:
            return @"\u25BC";/// 黑色下三角形（▼）
            break;
        default:
            break;
    }
}

typedef struct SortedColumn {
    NSInteger column;
    ZMJSorting sorting;
} SortedColumn;

NS_ASSUME_NONNULL_BEGIN

@interface ZMJClassDataVC : BaseViewController
<
SpreadsheetViewDelegate
,SpreadsheetViewDataSource
>

@end

NS_ASSUME_NONNULL_END
