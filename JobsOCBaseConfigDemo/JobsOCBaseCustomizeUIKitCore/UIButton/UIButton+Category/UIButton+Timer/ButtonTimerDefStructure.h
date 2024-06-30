//
//  ButtonTimerDefStructure.h
//  SelectorBlock
//
//  Created by Jobs on 2021/3/23.
//

#ifndef ButtonTimerDefStructure_h
#define ButtonTimerDefStructure_h
/// 时间显示风格
typedef enum : NSUInteger {
    /// 秒
    ShowTimeType_SS = 0,
    /// 分秒
    ShowTimeType_MMSS,
    /// 时分秒
    ShowTimeType_HHMMSS,
} ShowTimeType;
/// 文本显示类型
typedef enum : NSUInteger {
    /// TitleRuningStr（固定值） 相对于 currentTime（浮动值）在前面 | 首在前
    CequenceForShowTitleRuningStrType_front = 0,
    /// TitleRuningStr（固定值） 相对于 currentTime（浮动值）在后面 | 首在后
    CequenceForShowTitleRuningStrType_tail
} CequenceForShowTitleRuningStrType;

#endif /* ButtonTimerDefStructure_h */
