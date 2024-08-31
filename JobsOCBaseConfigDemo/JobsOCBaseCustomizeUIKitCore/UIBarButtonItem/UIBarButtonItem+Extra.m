//
//  UIBarButtonItem+Extra.m
//  FM
//
//  Created by User on 8/31/24.
//

#import "UIBarButtonItem+Extra.h"

@implementation UIBarButtonItem (Extra)

-(JobsReturnBarButtonItemByViewBlock)JobsBarButtonItem{
    return ^(__kindof UIView *_Nullable view){
        return [UIBarButtonItem.alloc initWithCustomView:view];
    };
}

@end
