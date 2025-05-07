//
//  NSObject+LiveChat.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <Foundation/Foundation.h>
#import "APIKey.h"
#import "JobsBlock.h"
@import LiveChat;
//#  pod 'LiveChat' # 第三方的聊天工具 https://github.com/livechat/chat-window-ios
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LiveChat)<LiveChatDelegate>

-(jobsByVoidBlock _Nonnull)openChat;

@end

NS_ASSUME_NONNULL_END
