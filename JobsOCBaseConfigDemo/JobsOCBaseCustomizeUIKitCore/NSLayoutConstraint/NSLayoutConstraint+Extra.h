//
//  NSLayoutConstraint+Extra.h
//  FM
//
//  Created by Admin on 27/11/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (Extra)

+(jobsByArrBlock _Nonnull)initBy;
+(jobsByArrBlock _Nonnull)deactivateBy;

@end

NS_ASSUME_NONNULL_END
