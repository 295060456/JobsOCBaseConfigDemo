//
//  UITabBarItem+Extra.h
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (Extra)

-(jobsByCorBlock _Nonnull)titleTextAttributesByNormalState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByHighlightedState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByDisabledState;
-(jobsByCorBlock _Nonnull)titleTextAttributesBySelectedState API_AVAILABLE(ios(9.0));
-(jobsByCorBlock _Nonnull)titleTextAttributesByFocusedState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByApplicationState;
-(jobsByCorBlock _Nonnull)titleTextAttributesByReservedState;

@end

NS_ASSUME_NONNULL_END
