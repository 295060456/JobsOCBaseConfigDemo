//
//  UIViewController+JPImageresizerView.m
//  UBallLive
//
//  Created by Jobs on 2020/10/12.
//

#import "UIViewController+JPImageresizerView.h"

@implementation UIViewController (JPImageresizerView)
#pragma mark —— @property(nonatomic,strong)JPImageresizerConfigure *configure;
JobsKey(_configure)
@dynamic configure;
-(JPImageresizerConfigure *)configure{
    JPImageresizerConfigure *Configure = Jobs_getAssociatedObject(_configure);
    if (!Configure) {
        @jobs_weakify(self)
        switch (self.configureType) {
            case JPImageresizerConfigureType_1:{//默认配置裁剪图片/GIF（UIImage）
                Configure = [JPImageresizerConfigure defaultConfigureWithImage:self.JPImageresizerView_img
                                                                          make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_2:{//默认配置裁剪图片/GIF（NSData）
                Configure = [JPImageresizerConfigure defaultConfigureWithImageData:self.JPImageresizerView_data
                                                                              make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_3:{//默认配置裁剪视频（NSURL）
                Configure = [JPImageresizerConfigure defaultConfigureWithVideoURL:self.JPImageresizerView_url
                                                                             make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                    fixErrorBlock:^(NSURL *cacheURL, 
                                                                                    JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                    fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                 fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                 fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_4:{//默认配置裁剪视频（AVURLAsset）
                Configure = [JPImageresizerConfigure defaultConfigureWithVideoAsset:self.JPImageresizerView_avURLAsset
                                                                               make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                      fixErrorBlock:^(NSURL *cacheURL, 
                                                                                      JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                      fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                   fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                   fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_5:{//浅色毛玻璃配置裁剪图片/GIF（UIImage）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithImage:self.JPImageresizerView_img
                                                                                    make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_6:{//浅色毛玻璃配置裁剪图片/GIF（NSData）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithImageData:self.JPImageresizerView_data
                                                                                        make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_7:{//浅色毛玻璃配置裁剪视频（NSURL）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithVideoURL:self.JPImageresizerView_url
                                                                                       make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                              fixErrorBlock:^(NSURL *cacheURL, 
                                                                                              JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                              fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                           fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                           fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_8:{//浅色毛玻璃配置裁剪视频（AVURLAsset）
                Configure = [JPImageresizerConfigure lightBlurMaskTypeConfigureWithVideoAsset:self.JPImageresizerView_avURLAsset
                                                                                         make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                                fixErrorBlock:^(NSURL *cacheURL,
                                                                                                JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                                fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                             fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                             fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_9:{//深色毛玻璃配置裁剪图片/GIF（UIImage）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithImage:self.JPImageresizerView_img
                                                                                   make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_10:{//深色毛玻璃配置裁剪图片/GIF（NSData）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithImageData:self.JPImageresizerView_data
                                                                                       make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_11:{//深色毛玻璃配置裁剪视频（NSURL）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithVideoURL:self.JPImageresizerView_url
                                                                                      make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                             fixErrorBlock:^(NSURL *cacheURL, 
                                                                                             JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                             fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                          fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                          fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            case JPImageresizerConfigureType_12:{//深色毛玻璃配置裁剪视频（AVURLAsset）
                Configure = [JPImageresizerConfigure darkBlurMaskTypeConfigureWithVideoAsset:self.JPImageresizerView_avURLAsset
                                                                                        make:^(JPImageresizerConfigure *configure) {
                    @jobs_strongify(self)
                    if (self.makeBlock) self.makeBlock(@1);
                }
                                                                               fixErrorBlock:^(NSURL *cacheURL, 
                                                                                               JPImageresizerErrorReason reason) {
                    @jobs_strongify(self)
                    if (self.fixErrorBlock) self.fixErrorBlock(@1);
                }
                                                                               fixStartBlock:^{
                    @jobs_strongify(self)
                    if (self.fixStartBlock) self.fixStartBlock(@1);
                }
                                                                            fixProgressBlock:^(float progress) {
                    @jobs_strongify(self)
                    if (self.fixProgressBlock) self.fixProgressBlock(@1);
                }
                                                                            fixCompleteBlock:^(NSURL *cacheURL) {
                    @jobs_strongify(self)
                    if (self.fixCompleteBlock) self.fixCompleteBlock(@1);
                }];
            } break;
            default:
                NSAssert(Configure,@"alertController 创建出现错误");
                break;
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(_configure, Configure)
    }return Configure;
}

-(void)setConfigure:(JPImageresizerConfigure *)configure{
    Jobs_setAssociatedRETAIN_NONATOMIC(_configure, configure)
}
#pragma mark —— @property(nonatomic,strong)JPImageresizerView *imageresizerView;
JobsKey(_imageresizerView)
@dynamic imageresizerView;
-(JPImageresizerView *)imageresizerView{
    JPImageresizerView *ImageresizerView = Jobs_getAssociatedObject(_imageresizerView);
    if (!ImageresizerView) {
//        @jobs_weakify(self)
        ImageresizerView = [JPImageresizerView imageresizerViewWithConfigure:self.configure
                                                   imageresizerIsCanRecovery:^(BOOL isCanRecovery) {
//            @jobs_strongify(self)
        } imageresizerIsPrepareToScale:^(BOOL isPrepareToScale) {
//            @jobs_strongify(self)
        }];
    }
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageresizerView, ImageresizerView)
    return ImageresizerView;
}

-(void)setImageresizerView:(JPImageresizerView *)imageresizerView{
    Jobs_setAssociatedRETAIN_NONATOMIC(_imageresizerView, imageresizerView)
}
#pragma mark —— @property(nonatomic,assign)JPImageresizerConfigureType *configureType;
JobsKey(_configureType)
@dynamic configureType;
-(JPImageresizerConfigureType)configureType{
    return [Jobs_getAssociatedObject(_configureType) integerValue];;
}

-(void)setConfigureType:(JPImageresizerConfigureType)configureType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_configureType, @(configureType))
}
#pragma mark —— @property(nonatomic,strong)NSData *JPImageresizerView_data;
JobsKey(_JPImageresizerView_data)
@dynamic JPImageresizerView_data;
-(NSData *)JPImageresizerView_data{
    return Jobs_getAssociatedObject(_JPImageresizerView_data);
}

-(void)setJPImageresizerView_data:(NSData *)JPImageresizerView_data{
    Jobs_setAssociatedRETAIN_NONATOMIC(_JPImageresizerView_data, JPImageresizerView_data)
}
#pragma mark ——@property(nonatomic,strong)UIImage *JPImageresizerView_img; BaseVC_JPImageresizerView_JPImageresizerView_img
JobsKey(_JPImageresizerView_img)
@dynamic JPImageresizerView_img;
-(UIImage *)JPImageresizerView_img{
    return Jobs_getAssociatedObject(_JPImageresizerView_img);
}

-(void)setJPImageresizerView_img:(UIImage *)JPImageresizerView_img{
    Jobs_setAssociatedRETAIN_NONATOMIC(_JPImageresizerView_img, JPImageresizerView_img)
}
#pragma mark —— @property(nonatomic,strong)NSURL *JPImageresizerView_url; BaseVC_JPImageresizerView_JPImageresizerView_url
JobsKey(_JPImageresizerView_url)
@dynamic JPImageresizerView_url;
-(NSURL *)JPImageresizerView_url{
    return Jobs_getAssociatedObject(_JPImageresizerView_url);
}

-(void)setJPImageresizerView_url:(NSURL *)JPImageresizerView_url{
    Jobs_setAssociatedRETAIN_NONATOMIC(_JPImageresizerView_url, JPImageresizerView_url)
}
#pragma mark —— @property(nonatomic,strong)AVURLAsset *JPImageresizerView_avURLAsset; BaseVC_JPImageresizerView_JPImageresizerView_avURLAsset
JobsKey(_JPImageresizerView_avURLAsset)
@dynamic JPImageresizerView_avURLAsset;
-(AVURLAsset *)JPImageresizerView_avURLAsset{
    return Jobs_getAssociatedObject(_JPImageresizerView_avURLAsset);
}

-(void)setJPImageresizerView_avURLAsset:(AVURLAsset *)JPImageresizerView_avURLAsset{
    Jobs_setAssociatedRETAIN_NONATOMIC(_JPImageresizerView_avURLAsset, JPImageresizerView_avURLAsset)
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock makeBlock;
JobsKey(_makeBlock)
@dynamic makeBlock;
-(jobsByIDBlock _Nonnull)makeBlock{
    return Jobs_getAssociatedObject(_makeBlock);
}

-(void)setMakeBlock:(jobsByIDBlock)makeBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_makeBlock, makeBlock)
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixErrorBlock;
JobsKey(_fixErrorBlock)
@dynamic fixErrorBlock;
-(jobsByIDBlock _Nonnull)fixErrorBlock{
    return Jobs_getAssociatedObject(_fixErrorBlock);
}

-(void)setFixErrorBlock:(jobsByIDBlock)fixErrorBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_fixErrorBlock, fixErrorBlock)
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixStartBlock;
JobsKey(_fixStartBlock)
@dynamic fixStartBlock;
-(jobsByIDBlock _Nonnull)fixStartBlock{
    return Jobs_getAssociatedObject(_fixStartBlock);
}

-(void)setFixStartBlock:(jobsByIDBlock)fixStartBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_fixStartBlock, fixStartBlock)
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixProgressBlock;
JobsKey(_fixProgressBlock)
@dynamic fixProgressBlock;
-(jobsByIDBlock _Nonnull)fixProgressBlock{
    return Jobs_getAssociatedObject(_fixProgressBlock);
}

-(void)setFixProgressBlock:(jobsByIDBlock)fixProgressBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_fixProgressBlock, fixProgressBlock)
}
#pragma mark —— @property(nonatomic,copy)jobsByIDBlock fixCompleteBlock;
JobsKey(_fixCompleteBlock)
@dynamic fixCompleteBlock;
-(jobsByIDBlock _Nonnull)fixCompleteBlock{
    return Jobs_getAssociatedObject(_fixCompleteBlock);
}

-(void)setFixCompleteBlock:(jobsByIDBlock)fixCompleteBlock{
    Jobs_setAssociatedCOPY_NONATOMIC(_fixCompleteBlock, fixCompleteBlock)
}

@end
