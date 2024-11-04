//
//  UIImageView+Extra.m
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import "UIImageView+Extra.h"

@implementation UIImageView (Extra)

+(JobsReturnImageViewByImageBlock _Nonnull)initBy{
    return ^__kindof UIImageView *_Nonnull(UIImage *_Nullable data){
        return [UIImageView.alloc initWithImage:data];
    };
}

@end
