//
//  UIEditMenuInteraction+Extra.m
//  FM
//
//  Created by Admin on 11/12/2024.
//

#import "UIEditMenuInteraction+Extra.h"

@implementation UIEditMenuInteraction (Extra)

+(JobsReturnUIEditMenuInteractionByIDBlock _Nonnull)initBy{
    return ^UIEditMenuInteraction *_Nullable(id<UIEditMenuInteractionDelegate>_Nullable data){
        return [UIEditMenuInteraction.alloc initWithDelegate:data];
    };
}

@end
