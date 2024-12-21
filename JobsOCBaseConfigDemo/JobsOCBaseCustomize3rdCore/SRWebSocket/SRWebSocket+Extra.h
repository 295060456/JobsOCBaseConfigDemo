//
//  SRWebSocket+Extra.h
//  FM
//
//  Created by Admin on 21/12/2024.
//

#import "JobsBlock.h"

#if __has_include(<SocketRocket/SocketRocket.h>)
#import <SocketRocket/SRWebSocket.h>
#else
#import "SRWebSocket.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SRWebSocket (Extra)

+(JobsReturnSRWebSocketByNSURLRequestBlock _Nonnull)initByURLRequest;

@end

NS_ASSUME_NONNULL_END
