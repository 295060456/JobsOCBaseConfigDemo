//
//  NSObject.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/6/17.
//

#ifndef NSObject_h
#define NSObject_h

typedef struct{
    NSInteger section;
    NSInteger rowOrItem;
}JobsIndexPath;

typedef NS_ENUM(NSInteger, CompareRes) {
    CompareRes_Error,
    /// >
    CompareRes_MoreThan,
    /// ==
    CompareRes_Equal,
    /// <
    CompareRes_LessThan
};

typedef NS_ENUM(NSInteger, JobsSearchStrategy) {
    /// 精确查询
    JobsSearchStrategy_Accurate = 0,
    /// 模糊查询
    JobsSearchStrategy_Fuzzy
};

typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionNone = 0,
    /// 右👉🏻
    ScrollDirectionRight,
    /// 左👈🏻
    ScrollDirectionLeft,
    /// 上面👆🏻
    ScrollDirectionUp,
    /// 下面👇🏻
    ScrollDirectionDown,
    /// 右上👉🏻👆🏻
    ScrollDirectionRight_UP,
    /// 左上👈🏻👆🏻
    ScrollDirectionLeft_UP,
    /// 右下👉🏻👇🏻
    ScrollDirectionRight_Down,
    /// 左下👈🏻👇🏻
    ScrollDirectionLeft_Down,
};


#endif /* NSObject_h */
