//
//  JobsIMDefine.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/13.
//

#ifndef JobsIMDefine_h
#define JobsIMDefine_h

#define isAllowSysEdit NO// 编译期就要优先进去，所以不能用属性

#ifndef INFO_LOCATION_ENUM_DEFINED
#define INFO_LOCATION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, InfoLocation) {
    InfoLocation_Unknown = 0,
    InfoLocation_Left = 1,
    InfoLocation_Right = 2
};
#endif /* INFO_LOCATION_ENUM_DEFINED */

#ifndef JOBS_IM_CHAT_INFO_DIRECTION_ENUM_DEFINED
#define JOBS_IM_CHAT_INFO_DIRECTION_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMChatInfoDirection) {
    JobsIMChatInfoDirection_Unknown = 0,
    JobsIMChatInfoDirection_Send,/// 对方
    JobsIMChatInfoDirection_Receive/// 自己
};
#endif /* JOBS_IM_CHAT_INFO_DIRECTION_ENUM_DEFINED */

#ifndef JOBS_IM_CHAT_MESSAGE_TYPE_ENUM_DEFINED
#define JOBS_IM_CHAT_MESSAGE_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsIMChatMessageType) {
    JobsIMChatMessageType_Text = 0,/// 文本
    JobsIMChatMessageType_Gift,/// 礼物
    JobsIMChatMessageType_expression,/// 表情
};
#endif /* JOBS_IM_CHAT_MESSAGE_TYPE_ENUM_DEFINED */

NS_INLINE CGFloat JobsIMInputviewHeight(void){
    return 60;
}

NS_INLINE CGFloat JobsIMChatInfoTimeLabWidth(void){
    return 55;
}

NS_INLINE CGFloat JobsIMChatInfoTBVDefaultCellHeight(void){
    return 50;
}

NS_INLINE CGFloat JobsIMChatInfoTBVChatContentLabWidth(void){
    return JobsMainScreen_WIDTH() - JobsIMChatInfoTimeLabWidth() - (JobsIMChatInfoTBVDefaultCellHeight() - 5) - 20;
}

NS_INLINE CGFloat JobsIMChatInfoTBVChatContentLabDefaultWidth(void){
    return 30;
}

#endif /* JobsIMDefine_h */
