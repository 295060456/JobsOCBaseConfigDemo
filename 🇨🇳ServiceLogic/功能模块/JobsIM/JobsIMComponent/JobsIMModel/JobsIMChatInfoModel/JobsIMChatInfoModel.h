//
//  JobsIMChatInfoModel.h
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import <Foundation/Foundation.h>
#import "JobsIMDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMChatInfoModel : NSObject

@property(nonatomic,copy,nullable)NSString *userID;/// 发出该聊天的用户ID
@property(nonatomic,copy,nullable)NSString *userNameStr;/// 发出该聊天的用户名
@property(nonatomic,strong,nullable)UIImage *userIconIMG;/// 发出该聊天的用户头像
@property(nonatomic,copy,nullable)NSString *userIconURLStr;/// 发出该聊天的用户头像地址
@property(nonatomic,copy,nullable)NSString *chatTextTimeStr;/// 发出该聊天的时间戳
@property(nonatomic,copy,nullable)NSString *chatTextStr;/// 发出该聊天的文本信息
/// 全局ID
@property(nonatomic,copy,nullable)NSString *identification;/// 该聊天对应的数据库坐标ID
@property(nonatomic,assign)JobsIMChatMessageType messageType;/// 消息类型:1、文本, 2、礼物, 3、表情
@property(nonatomic,assign)JobsIMChatInfoDirection chatInfoDirection;/// 消息的发送方向

@end

NS_ASSUME_NONNULL_END
