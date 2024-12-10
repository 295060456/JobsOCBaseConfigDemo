//
//  UITabBarItem+Extra.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "UITabBarItem+Extra.h"

@implementation UITabBarItem (Extra)
-(jobsByCorBlock _Nonnull)titleTextAttributesByNormalState{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateNormal];
    };
}

-(jobsByCorBlock _Nonnull)titleTextAttributesByHighlightedState{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateHighlighted];
    };
}

-(jobsByCorBlock _Nonnull)titleTextAttributesByDisabledState{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateDisabled];
    };
}

-(jobsByCorBlock _Nonnull)titleTextAttributesBySelectedState API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateSelected];
    };
}

-(jobsByCorBlock _Nonnull)titleTextAttributesByFocusedState{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateFocused];
    };
}

-(jobsByCorBlock _Nonnull)titleTextAttributesByApplicationState{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateApplication];
    };
}

-(jobsByCorBlock _Nonnull)titleTextAttributesByReservedState{
    @jobs_weakify(self)
    return ^(UIColor *_Nullable data){
        @jobs_strongify(self)
        [self setTitleTextAttributes:@{NSForegroundColorAttributeName:data}
                            forState:UIControlStateReserved];
    };
}

@end
