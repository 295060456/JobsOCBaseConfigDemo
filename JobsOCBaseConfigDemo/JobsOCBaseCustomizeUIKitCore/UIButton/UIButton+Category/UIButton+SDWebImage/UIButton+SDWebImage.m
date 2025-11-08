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
-(JobsRetBtnByControlStateBlock _Nonnull)baseLoadImageBy{
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
                    self.jobsResetBtnImage(image ? : self.makeSDWebImageModel.placeholder);
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
-(JobsRetBtnByControlStateBlock _Nonnull)baseLoadBgImageBy{
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
                    self.jobsResetBtnBgImage(image ? : self.makeSDWebImageModel.placeholder);
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
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)normalLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateNormal);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)highlightedlLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateHighlighted);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)disabledLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateDisabled);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)selectedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateSelected);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)focusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateFocused);
    };
}
/// additional flags available for application use
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)applicationLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateApplication);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)reservedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadImageBy(UIControlStateReserved);
    };
}
#pragma mark —— 设置背景图片的方法
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgNormalLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateNormal);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgHighlightedlLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateHighlighted);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgDisabledLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateDisabled);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgSelectedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateSelected);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgFocusedLoad API_AVAILABLE(ios(9.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateFocused);
    };
}
/// additional flags available for application use
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgApplicationLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateApplication);
    };
}
/// 如果用此方法进行图片赋值，则：jobsResetBtnBgImage失灵。必须还是用此方法，方可进行图片修改
-(JobsRetBtnByVoidBlock _Nonnull)bgReservedLoad{
    @jobs_weakify(self)
    return ^__kindof UIButton *_Nullable{
        @jobs_strongify(self)
        return self.baseLoadBgImageBy(UIControlStateReserved);
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsReturnButtonByURLBlock imageURL;
JobsKey(_imageURL)
@dynamic imageURL;
-(JobsRetBtnByURLBlock _Nonnull)imageURL {
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
#pragma mark —— Prop_copy(readonly,nonnull)JobsReturnButtonByImageBlock placeholderImage;
JobsKey(_placeholderImage)
@dynamic placeholderImage;
-(JobsRetBtnByImageBlock _Nonnull)placeholderImage {
    return ^__kindof UIButton *_Nonnull(UIImage *placeholderImage) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_placeholderImage, placeholderImage)
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsReturnButtonBySDWebImageOptionsBlocks options;
JobsKey(_options)
@dynamic options;
-(JobsReturnButtonBySDWebImageOptionsBlocks _Nonnull)options{
    return ^__kindof UIButton *_Nullable(SDWebImageOptions options) {
        Jobs_setAssociatedRETAIN_NONATOMIC(_options, @(options));
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsReturnButtonBySDExternalCompletionBlocks completed;
JobsKey(_completed)
@dynamic completed;
- (JobsReturnButtonBySDExternalCompletionBlocks _Nonnull)completed {
    return ^__kindof UIButton *_Nullable(SDExternalCompletionBlock completion) {
        Jobs_setAssociatedCOPY_NONATOMIC(_completed,completion);
        return self;
    };
}
#pragma mark —— Prop_copy(readonly,nonnull)JobsReturnButtonBySDImageLoaderProgressBlocks progress;
JobsKey(_progress)
@dynamic progress;
- (JobsReturnButtonBySDImageLoaderProgressBlocks _Nonnull)progress {
    return ^__kindof UIButton *_Nullable(SDImageLoaderProgressBlock progress) {
        Jobs_setAssociatedCOPY_NONATOMIC(_progress,progress);
        return self;
    };
}

@end
