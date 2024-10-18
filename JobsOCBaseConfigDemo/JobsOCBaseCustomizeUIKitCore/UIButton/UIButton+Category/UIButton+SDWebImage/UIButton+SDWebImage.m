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
/// 设置普通图片的方法
-(JobsReturnButtonByControlStateBlock _Nonnull)baseLoadImageBy{
    return ^__kindof UIButton *_Nullable(UIControlState data){
        @jobs_weakify(self)
        if (@available(iOS 16.0, *)) {
            if(self.configuration){
                [self sd_setImageWithURL:self.makeSDWebImageModel.url
                                forState:data
                        placeholderImage:self.makeSDWebImageModel.placeholder
                                 options:self.makeSDWebImageModel.options
                                progress:self.makeSDWebImageModel.progress
                               completed:^(UIImage * _Nullable image,
                                           NSError * _Nullable error,
                                           SDImageCacheType cacheType,
                                           NSURL * _Nullable imageURL) {
                    @jobs_strongify(self)
                    if (self.makeSDWebImageModel.completion) self.makeSDWebImageModel.completion(image, error, cacheType, imageURL);
                }];
            }else{
                [self sd_setImageWithURL:self.makeSDWebImageModel.url
                                forState:UIControlStateNormal
                        placeholderImage:self.makeSDWebImageModel.placeholder];
            }
        }else{
            [self sd_setImageWithURL:self.makeSDWebImageModel.url
                            forState:UIControlStateNormal
                    placeholderImage:self.makeSDWebImageModel.placeholder];
        }return self;

    };
}
/// 设置背景图片的方法
-(JobsReturnButtonByControlStateBlock _Nonnull)baseLoadBgImageBy{
    return ^__kindof UIButton *_Nullable(UIControlState data){
        @jobs_weakify(self)
        if (@available(iOS 16.0, *)) {
            if(self.configuration){
                [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                          forState:data
                                  placeholderImage:self.makeSDWebImageModel.placeholder
                                           options:self.makeSDWebImageModel.options
                                          progress:self.makeSDWebImageModel.progress
                                         completed:^(UIImage * _Nullable image,
                                                     NSError * _Nullable error,
                                                     SDImageCacheType cacheType,
                                                     NSURL * _Nullable imageURL) {
                    @jobs_strongify(self)
                    if (self.makeSDWebImageModel.completion) self.makeSDWebImageModel.completion(image, error, cacheType, imageURL);
                }];
            }else{
                [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                          forState:data
                                  placeholderImage:self.makeSDWebImageModel.placeholder];
            }
        }else{
            [self sd_setBackgroundImageWithURL:self.makeSDWebImageModel.url
                                      forState:data
                              placeholderImage:self.makeSDWebImageModel.placeholder];
        }return self;
    };
}
#pragma mark —— 设置普通图片的方法
-(JobsReturnButtonByVoidBlock _Nonnull)normalLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateNormal);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)highlightedlLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateHighlighted);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)disabledLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateDisabled);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)selectedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateSelected);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)focusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateFocused);
    };
}
/// additional flags available for application use
-(JobsReturnButtonByVoidBlock _Nonnull)applicationLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateApplication);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)reservedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateReserved);
    };
}
#pragma mark —— 设置背景图片的方法
-(JobsReturnButtonByVoidBlock _Nonnull)bgNormalLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateNormal);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgHighlightedlLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateHighlighted);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgDisabledLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateDisabled);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgSelectedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateSelected);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgFocusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateFocused);
    };
}
/// additional flags available for application use
-(JobsReturnButtonByVoidBlock _Nonnull)bgApplicationLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateApplication);
    };
}

-(JobsReturnButtonByVoidBlock _Nonnull)bgReservedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateReserved);
    };
}
#pragma mark —— @property(nonatomic,strong,readonly)JobsReturnButtonByURLBlock imageURL;
JobsKey(_imageURL)
@dynamic imageURL;
-(JobsReturnButtonByURLBlock _Nonnull)imageURL {
    return ^__kindof UIButton *_Nonnull(NSURL *imageURL) {
        NSURL *url = nil;
        if([imageURL isKindOfClass:NSString.class]){
            NSString *imageURLString = (NSString *)imageURL;
            url = imageURLString.jobsUrl;
        }else if ([imageURL isKindOfClass:NSURL.class]){
            url = imageURL;
        }else{
            url = @"".jobsUrl;
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_imageURL, url)
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
