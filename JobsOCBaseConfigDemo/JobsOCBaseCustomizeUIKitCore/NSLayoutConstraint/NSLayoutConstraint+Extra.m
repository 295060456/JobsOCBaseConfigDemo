//
//  NSLayoutConstraint+Extra.m
//  FM
//
//  Created by Admin on 27/11/2024.
//

#import "NSLayoutConstraint+Extra.h"

@implementation NSLayoutConstraint (Extra)

+(jobsByArrBlock _Nonnull)initBy{
    return ^(NSArray *_Nullable data){
        return [NSLayoutConstraint activateConstraints:data];
    };
}

+(jobsByArrBlock _Nonnull)deactivateBy{
    return ^(NSArray *_Nullable data){
        return [NSLayoutConstraint deactivateConstraints:data];
    };
}

@end
