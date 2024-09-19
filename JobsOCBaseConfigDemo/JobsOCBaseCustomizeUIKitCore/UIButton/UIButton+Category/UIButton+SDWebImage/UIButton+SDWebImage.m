//
//  UIButton+SDWebImage.m
//  FM
//
//  Created by User on 9/19/24.
//

#import "UIButton+SDWebImage.h"

@implementation UIButton (SDWebImage)
#pragma mark —— 一些私有方法
-(SDWebImageModel *)makeSDWebImageModel{
    SDWebImageModel *sdWebImageModel = SDWebImageModel.new;
    sdWebImageModel.url = Jobs_getAssociatedObject(_imageURL);
    sdWebImageModel.placeholder = Jobs_getAssociatedObject(_placeholderImage);
    sdWebImageModel.options = [Jobs_getAssociatedObject(_options) integerValue];
    sdWebImageModel.completion = Jobs_getAssociatedObject(_completed);
    sdWebImageModel.progress = Jobs_getAssociatedObject(_progress);
    return sdWebImageModel;
}

-(jobsByVoidBlock _Nonnull)normalLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateNormal
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}

-(jobsByVoidBlock _Nonnull)highlightedlLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateHighlighted
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}

-(jobsByVoidBlock _Nonnull)disabledLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateDisabled
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}

-(jobsByVoidBlock _Nonnull)selectedLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateSelected
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}

-(jobsByVoidBlock _Nonnull)focusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateFocused
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}
/// additional flags available for application use
-(jobsByVoidBlock _Nonnull)applicationLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateApplication
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}

-(jobsByVoidBlock _Nonnull)reservedLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateReserved
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnButtonByURLBlock imageURL;
JobsKey(_imageURL)
@dynamic imageURL;
-(JobsReturnButtonByURLBlock _Nonnull)imageURL {
    return ^__kindof UIButton *_Nonnull(NSURL *imageURL) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_imageURL, imageURL)
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnButtonByImageBlock placeholderImage;
JobsKey(_placeholderImage)
@dynamic placeholderImage;
-(JobsReturnButtonByImageBlock _Nonnull)placeholderImage {
    return ^__kindof UIButton *_Nonnull(UIImage *placeholderImage) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderImage, placeholderImage)
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnButtonBySDWebImageOptionsBlock options;
JobsKey(_options)
@dynamic options;
-(JobsReturnButtonBySDWebImageOptionsBlock _Nonnull)options{
    return ^__kindof UIButton *_Nullable(SDWebImageOptions options) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_options, @(options));
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnButtonBySDExternalCompletionBlock completed;
JobsKey(_completed)
@dynamic completed;
- (JobsReturnButtonBySDExternalCompletionBlock _Nonnull)completed {
    return ^__kindof UIButton *_Nullable(SDExternalCompletionBlock completion) {
        Jobs_setAssociatedCOPY_NONATOMIC(_completed,completion);
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong,readonly,nonnull)JobsReturnButtonBySDImageLoaderProgressBlock progress;
JobsKey(_progress)
@dynamic progress;
- (JobsReturnButtonBySDImageLoaderProgressBlock _Nonnull)progress {
    return ^__kindof UIButton *_Nullable(SDImageLoaderProgressBlock progress) {
        Jobs_setAssociatedCOPY_NONATOMIC(_progress,progress);
        return self;
    };
}


@end
