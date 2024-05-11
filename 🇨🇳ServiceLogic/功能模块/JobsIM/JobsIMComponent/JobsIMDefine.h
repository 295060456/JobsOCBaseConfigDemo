//
//  JobsIMDefine.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/13.
//

#ifndef JobsIMDefine_h
#define JobsIMDefine_h

#define isAllowSysEdit NO// 编译期就要优先进去，所以不能用属性

static inline CGFloat JobsIMInputviewHeight(void){
    return 60;
}

static inline CGFloat JobsIMChatInfoTimeLabWidth(void){
    return 55;
}

static inline CGFloat JobsIMChatInfoTBVDefaultCellHeight(void){
    return 50;
}

static inline CGFloat JobsIMChatInfoTBVChatContentLabWidth(void){
    return JobsMainScreen_WIDTH() - JobsIMChatInfoTimeLabWidth() - (JobsIMChatInfoTBVDefaultCellHeight() - 5) - 20;
}

static inline CGFloat JobsIMChatInfoTBVChatContentLabDefaultWidth(void){
    return 30;
}
/// 消息显示位置
typedef NS_ENUM(NSInteger,InfoLocation) {
    InfoLocation_Unknown = 0,
    InfoLocation_Left = 1,
    InfoLocation_Right = 2
};

/// 消息的发送方向
typedef NS_ENUM(NSInteger,JobsIMChatInfoDirection) {
    JobsIMChatInfoDirection_Unknown = 0,
    JobsIMChatInfoDirection_Send,/// 对方
    JobsIMChatInfoDirection_Receive/// 自己
};
/// 消息类型
typedef NS_ENUM(NSInteger,JobsIMChatMessageType) {
    JobsIMChatMessageType_Text = 0,/// 文本
    JobsIMChatMessageType_Gift,/// 礼物
    JobsIMChatMessageType_expression,/// 表情
};

#endif /* JobsIMDefine_h */
