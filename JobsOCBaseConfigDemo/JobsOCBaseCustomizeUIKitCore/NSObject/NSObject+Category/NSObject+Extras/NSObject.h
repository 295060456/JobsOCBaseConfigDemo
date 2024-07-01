//
//  NSObject.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/17.
//

#ifndef NSObject_h
#define NSObject_h

#ifndef JobsIndexPath_h
#define JobsIndexPath_h
typedef struct {
    NSInteger section;
    NSInteger rowOrItem;
} JobsIndexPath;
#endif /* JobsIndexPath_h */

#ifndef CompareRes_h
#define CompareRes_h
typedef NS_ENUM(NSInteger, CompareRes) {
    CompareRes_Error,
    CompareRes_MoreThan,  /// >
    CompareRes_Equal,     /// ==
    CompareRes_LessThan   /// <
};
#endif /* CompareRes_h */

#ifndef JobsSearchStrategy_h
#define JobsSearchStrategy_h
typedef NS_ENUM(NSInteger, JobsSearchStrategy) {
    JobsSearchStrategy_Accurate = 0, /// 精确查询
    JobsSearchStrategy_Fuzzy         /// 模糊查询
};
#endif /* JobsSearchStrategy_h */

#ifndef ScrollDirection_h
#define ScrollDirection_h
typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionNone = 0,
    ScrollDirectionRight,       /// 右👉🏻
    ScrollDirectionLeft,        /// 左👈🏻
    ScrollDirectionUp,          /// 上面👆🏻
    ScrollDirectionDown,        /// 下面👇🏻
    ScrollDirectionRight_UP,    /// 右上👉🏻👆🏻
    ScrollDirectionLeft_UP,     /// 左上👈🏻👆🏻
    ScrollDirectionRight_Down,  /// 右下👉🏻👇🏻
    ScrollDirectionLeft_Down    /// 左下👈🏻👇🏻
};
#endif /* ScrollDirection_h */

#endif /* NSObject_h */
