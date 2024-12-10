//
//  NSString+Reachability.m
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import "NSString+Reachability.h"

@implementation NSString (Reachability)

-(Reachability *_Nonnull)makeReachability{
    return [Reachability reachabilityWithHostname:self];
}

@end
