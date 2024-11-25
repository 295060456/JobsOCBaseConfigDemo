//
//  NSString+_3rd.m
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import "NSString+_3rd.h"

@implementation NSString (_3rd)

-(Reachability *_Nonnull)makeReachability{
    return [Reachability reachabilityWithHostname:self];
}

@end
