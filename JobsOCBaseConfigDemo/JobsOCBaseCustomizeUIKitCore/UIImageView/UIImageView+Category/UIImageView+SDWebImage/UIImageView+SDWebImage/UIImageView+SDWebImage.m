//
//  UIImageView+SDWebImage.m
//  FM
//
//  Created by User on 9/5/24.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)

-(jobsByVoidBlock _Nonnull)load {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        NSURL *url = Jobs_getAssociatedObject(_imageURL);
        UIImage *placeholder = Jobs_getAssociatedObject(_placeholderImage);
        SDWebImageOptions options = [Jobs_getAssociatedObject(_options) integerValue];
        SDExternalCompletionBlock completion = Jobs_getAssociatedObject(_completed);
        [self sd_setImageWithURL:url
                placeholderImage:placeholder
                         options:options
                       completed:completion];
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnImageViewByURLBlock imageURL;
JobsKey(_imageURL)
@dynamic imageURL;
-(JobsReturnImageViewByURLBlock _Nonnull)imageURL {
    return ^(NSURL *imageURL) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_imageURL, imageURL)
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnImageViewByImageBlock placeholderImage;
JobsKey(_placeholderImage)
@dynamic placeholderImage;
-(JobsReturnImageViewByImageBlock _Nonnull)placeholderImage {
    return ^(UIImage *placeholderImage) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderImage, placeholderImage)
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnImageViewBySDWebImageOptionsBlock options;
JobsKey(_options)
@dynamic options;
-(JobsReturnImageViewBySDWebImageOptionsBlock _Nonnull)options{
    return ^UIImageView *_Nullable(SDWebImageOptions options) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_options, @(options));
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnImageViewBySDExternalCompletionBlock completed;
JobsKey(_completed)
@dynamic completed;
- (JobsReturnImageViewBySDExternalCompletionBlock _Nonnull)completed {
    return ^UIImageView *_Nullable(SDExternalCompletionBlock completion) {
        Jobs_setAssociatedCOPY_NONATOMIC(_completed,completion);
        return self;
    };
}

@end
