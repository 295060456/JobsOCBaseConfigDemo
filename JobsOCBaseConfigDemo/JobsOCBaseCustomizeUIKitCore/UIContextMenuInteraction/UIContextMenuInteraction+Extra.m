//
//  UIContextMenuInteraction+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/3.
//

#import "UIContextMenuInteraction+Extra.h"

@implementation UIContextMenuInteraction (Extra)

+(JobsRetContextMenuInteractionByIDBlock _Nonnull)initByDelegate{
    return ^UIContextMenuInteraction *_Nonnull(id <UIContextMenuInteractionDelegate>_Nullable data){
        return [UIContextMenuInteraction.alloc initWithDelegate:data];
    };
}

@end
