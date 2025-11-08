//
//  UIActivityIndicatorView+Extra.m
//  FMNormal
//
//  Created by Jobs on 2025/5/9.
//

#import "UIActivityIndicatorView+Extra.h"

@implementation UIActivityIndicatorView (Extra)

+(JobsRetActivityIndicatorViewByNSInteger _Nonnull)initBy{
    return ^__kindof UIActivityIndicatorView *_Nullable(UIActivityIndicatorViewStyle data){
        return [UIActivityIndicatorView.alloc initWithActivityIndicatorStyle:data];
    };
}

@end
