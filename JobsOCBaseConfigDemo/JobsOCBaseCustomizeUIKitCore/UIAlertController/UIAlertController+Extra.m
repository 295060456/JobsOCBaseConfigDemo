//
//  UIAlertController+Extra.m
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import "UIAlertController+Extra.h"

@implementation UIAlertController (Extra)

-(JobsReturnAlertControllerByActionBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^UIAlertController *_Nullable(UIAlertAction *_Nonnull action) {
        @jobs_strongify(self)
        [self addAction:action];
        return self;
    };
}

@end
