//
//  AFSecurityPolicy+Extra.m
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import "AFSecurityPolicy+Extra.h"

@implementation AFSecurityPolicy (Extra)

+(JobsReturnAFSecurityPolicyByAFSSLPinningModeBlock _Nonnull)initBy{
    return ^AFSecurityPolicy *_Nonnull(AFSSLPinningMode data){
        return [AFSecurityPolicy policyWithPinningMode:data];
    };
}

+(AFSecurityPolicy *_Nonnull)initByModeNone{
    return [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
}

+(AFSecurityPolicy *_Nonnull)initByModePublicKey{
    return [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
}

+(AFSecurityPolicy *_Nonnull)initByModeCertificate{
    return [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
}

@end
