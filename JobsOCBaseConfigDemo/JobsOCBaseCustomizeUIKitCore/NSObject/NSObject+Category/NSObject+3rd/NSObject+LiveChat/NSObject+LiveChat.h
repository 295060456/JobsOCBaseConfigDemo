//
//  NSObject+LiveChat.h
//  FM
//
//  Created by Admin on 26/11/2024.
//

#import <Foundation/Foundation.h>
#import "APIKey.h"
@import LiveChat;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LiveChat)<LiveChatDelegate>

-(jobsByVoidBlock _Nonnull)openChat;

@end

NS_ASSUME_NONNULL_END
