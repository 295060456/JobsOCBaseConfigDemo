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
    return jobsMakeSDWebImageModel(^(__kindof SDWebImageModel * _Nullable data) {
        data.url = Jobs_getAssociatedObject(_imageURL);
        data.placeholder = Jobs_getAssociatedObject(_placeholderImage);
        data.options = [Jobs_getAssociatedObject(_options) integerValue];
        data.completion = Jobs_getAssociatedObject(_completed);
        data.progress = Jobs_getAssociatedObject(_progress);
    });
}
#pragma mark —— 设置普通图片的方法
-(JobsReturnButtonByVoidBlock _Nonnull)normalLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateNormal
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)highlightedlLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateHighlighted
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)disabledLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateDisabled
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)selectedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateSelected
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)focusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateFocused
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}
/// additional flags available for application use
-(JobsReturnButtonByVoidBlock _Nonnull)applicationLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateApplication
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)reservedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setImageWithURL:self.makeSDWebImageModel.url
                        forState:UIControlStateReserved
                placeholderImage:self.makeSDWebImageModel.placeholder
                         options:self.makeSDWebImageModel.options
                        progress:self.makeSDWebImageModel.progress
                       completed:self.makeSDWebImageModel.completion];
        return self;
    };
}
#pragma mark —— 设置背景图片的方法
-(JobsReturnButtonByVoidBlock _Nonnull)bgNormalLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateNormal
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgHighlightedlLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateHighlighted
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgDisabledLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateDisabled
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgSelectedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateSelected
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgFocusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateFocused
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
    };
}
/// additional flags available for application use
-(JobsReturnButtonByVoidBlock _Nonnull)bgApplicationLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateApplication
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgReservedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                  forState:UIControlStateReserved
                          placeholderImage:self.makeSDWebImageModel.placeholder
                                   options:self.makeSDWebImageModel.options
                                  progress:self.makeSDWebImageModel.progress
                                 completed:self.makeSDWebImageModel.completion];
        return self;
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
