//
//  UIStackView+Extra.m
//  FM
//
//  Created by Admin on 3/12/2024.
//

#import "UIStackView+Extra.h"

@implementation UIStackView (Extra)

-(JobsReturnViewByViewBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(__kindof UIView *_Nullable subView) {
        @jobs_strongify(self)
        [self addArrangedSubview:subView];
        return subView;
    };
}

@end
