//
//  NSString+Menu.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "NSString+Menu.h"

@implementation NSString (Menu)

-(JobsReturnMenuItemBySELBlock _Nonnull)initMenuItemBy{
    @jobs_weakify(self)
    return ^__kindof UIMenuItem *_Nullable(SEL _Nullable data){
        @jobs_strongify(self)
        return [UIMenuItem.alloc initWithTitle:self action:data];
    };
}

@end
