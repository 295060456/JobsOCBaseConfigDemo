//
//  NSString+Reachability.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <Foundation/Foundation.h>
#if __has_include(<Reachability/Reachability.h>)
#import <Reachability/Reachability.h>
#else
#import "Reachability.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Reachability)

-(Reachability *_Nonnull)makeReachability;

@end

NS_ASSUME_NONNULL_END
