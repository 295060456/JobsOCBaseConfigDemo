//
//  AFSecurityPolicy+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#elif __has_include("AFNetworking.h")
#import "AFNetworking.h"
#elif __has_include("AFNetworking-umbrella.h")
#import "AFNetworking-umbrella.h"
#else
#error "AFNetworking header not found"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AFSecurityPolicy (Extra)

+(JobsReturnAFSecurityPolicyByAFSSLPinningModeBlock _Nonnull)initBy;
+(AFSecurityPolicy *_Nonnull)initByModeNone;
+(AFSecurityPolicy *_Nonnull)initByModePublicKey;
+(AFSecurityPolicy *_Nonnull)initByModeCertificate;

@end

NS_ASSUME_NONNULL_END
