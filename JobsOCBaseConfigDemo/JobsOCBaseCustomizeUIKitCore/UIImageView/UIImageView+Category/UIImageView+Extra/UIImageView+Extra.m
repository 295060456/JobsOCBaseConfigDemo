//
//  UIImageView+Extra.m
//  FM
//
//  Created by Admin on 4/11/2024.
//

#import "UIImageView+Extra.h"

@implementation UIImageView (Extra)

+(JobsRetImageViewByImageBlock _Nonnull)initBy{
    return ^__kindof UIImageView *_Nonnull(UIImage *_Nullable data){
        return [UIImageView.alloc initWithImage:data];
    };
}

-(JobsRetImageViewByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof UIImageView *_Nonnull(UIImage *_Nullable data){
        @jobs_strongify(self)
        self.image = data;
        return self;
    };
}

@end
