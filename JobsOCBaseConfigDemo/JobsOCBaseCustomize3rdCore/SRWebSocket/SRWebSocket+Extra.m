//
//  SRWebSocket+Extra.m
//  FM
//
//  Created by Admin on 21/12/2024.
//

#import "SRWebSocket+Extra.h"

@implementation SRWebSocket (Extra)

+(JobsReturnSRWebSocketByNSURLRequestBlock _Nonnull)initByURLRequest{
    return ^SRWebSocket *_Nonnull(NSURLRequest *_Nullable webSocket){
        return [SRWebSocket.alloc initWithURLRequest:webSocket];
    };
}

@end
