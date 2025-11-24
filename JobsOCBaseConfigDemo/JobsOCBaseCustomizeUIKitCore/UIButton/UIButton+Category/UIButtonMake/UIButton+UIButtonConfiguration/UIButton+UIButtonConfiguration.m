//
//  UIButton+UIButtonConfiguration.m
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import "UIButton+UIButtonConfiguration.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
@implementation UIButton (UIButtonConfiguration)

-(jobsByVoidBlock _Nonnull)updateConfigBy{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self setNeedsUpdateConfiguration];
        [self updateConfiguration];
    };
}
/// UIButtonConfiguration 创建的UIbutton修改字体以及颜色的方法
/// 注意⚠️因为UIConfigurationTextAttributesTransformer是没有办法直接获取到里面的字体的，只能从外面生成以后直接赋值，也就是每次修改需要给一个完整的UIConfigurationTextAttributesTransformer对象进UIButtonConfiguration
-(void)jobsSetBtnTitleFont:(UIFont *_Nullable)titleFont
               btnTitleCor:(UIColor *_Nullable)titleCor{
    self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:titleFont
                                                                                             btnTitleCor:titleCor]);
}

-(void)jobsSetBtnSubTitleFont:(UIFont *_Nullable)subTitleFont
               btnSubTitleCor:(UIColor *_Nullable)subTitleCor{
    self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:subTitleFont
                                                                                                btnTitleCor:subTitleCor]);
}
/// 重设UIButtonConfiguration并使之生效  JobsReturnButtonConfigurationByButtonConfigurationBlock
-(__kindof UIButton *)jobsUpdateButtonConfiguration:(jobsByBtnConfigBlock _Nullable)configurationBlock {
    if (@available(iOS 16.0, *)) {
        UIButtonConfiguration *config = nil;
        if(self.configuration){
            config = self.configuration.copy;
        }else{
            config = jobsMakePlainBtnConfig(^(__kindof UIButtonConfiguration * _Nullable config) {

            });
        }
        if (configurationBlock) configurationBlock(config);
        self.configuration = config;
        self.updateConfigBy();
    } return self;
}

-(UIButtonConfiguration *)JobsUpdateButtonConfiguration:(jobsByBtnConfigBlock _Nullable)configurationBlock{
    [self jobsUpdateButtonConfiguration:configurationBlock];
    self.updateConfigBy();
    return self.configuration;
}
///【最新的Api】修改主标题的对齐方式
-(JobsRetBtnByTextAlignmentBlock _Nonnull)_jobsResetTitleTextAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSTextAlignment data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            @jobs_strongify(self)
            if(config.subtitle){
                config.attributedSubtitle = JobsAttributedStringByAttributes(config.subtitle,jobsMakeMutDic(^(__kindof NSMutableDictionary * _Nullable data1) {
                    @jobs_strongify(self)
                    data1.add(NSForegroundColorAttributeName,self.getTitleColorByTransformer(config.titleTextAttributesTransformer));
                    data1.add(NSFontAttributeName,self.getTitleFontByTransformer(config.titleTextAttributesTransformer));
                    data1.add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment(data));
                }));
            }
        }];
    };
}
///【最新的Api】修改副标题的对齐方式
-(JobsRetBtnByTextAlignmentBlock _Nonnull)jobsResetSubTitleTextAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSTextAlignment data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            @jobs_strongify(self)
            config.attributedSubtitle = JobsAttributedStringByAttributes(config.subtitle, jobsMakeMutDic(^(__kindof NSMutableDictionary <NSAttributedStringKey, id>*_Nullable data1) {
                @jobs_strongify(self)
                data1.add(NSForegroundColorAttributeName,self.getTitleColorByTransformer(config.subtitleTextAttributesTransformer));
                data1.add(NSFontAttributeName,self.getTitleFontByTransformer(config.subtitleTextAttributesTransformer));
                data1.add(NSParagraphStyleAttributeName,self.jobsparagraphStyleByTextAlignment(data));
            }));
        }];
    };
}
///【最新的Api】重设Btn的图文相对位置
-(JobsRetBtnByImagePlacementBlock _Nonnull)jobsResetImagePlacement API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(NSDirectionalRectEdge data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.imagePlacement = data;
        }];
    };
}
///【最新的Api】重设Btn的图文间距
-(JobsRetBtnByCGFloatBlock _Nonnull)jobsResetImagePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(CGFloat data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.imagePadding = data;
        }];
    };
}
///【最新的Api】重设Btn主标题与副标题之间的距离
-(JobsRetBtnByCGFloatBlock _Nonnull)jobsResetTitlePadding API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(CGFloat data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.titlePadding = data;
        }];
    };
}
/**
 1、一一对应UIButtonConfiguration.h文件里面的属性
 2、只有通过UIButtonConfiguration创建的UIButton，这个UIbutton的configuration属性才不为空
 3、要修改通过UIButtonConfiguration创建的UIButton的各属性值，只有通过下列方式方可以
 */
#pragma mark —— 【最新的Api】UIButton.configuration的各项属性值的修改
-(JobsRetBtnByTitleAlignmentBlock _Nonnull)jobsResetTitleAlignment API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(UIButtonConfigurationTitleAlignment data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.titleAlignment = data;
        }];
    };
}

-(JobsRetBtnByBOOLBlock _Nonnull)jobsResetAutomaticallyUpdateForSelection API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButton *(BOOL data) {
        @jobs_strongify(self)
        return [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.automaticallyUpdateForSelection = data;
        }];
    };
}

-(JobsRetBtnConfigByBackgroundBlock _Nonnull)jobsResetBackground API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIBackgroundConfiguration *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.background = data;
        }];
    };
}

-(JobsRetBtnConfigByImageBlock _Nonnull)jobsResetBackgroundImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImage *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.background.image = data;
        }];
    };
}

-(JobsRetBtnConfigByCornerStyleBlock _Nonnull)jobsResetCornerStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationCornerStyle data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.cornerStyle = data;
        }];
    };
}

-(JobsRetBtnConfigBySizeBlock _Nonnull)jobsResetButtonSize API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationSize data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.buttonSize = data;
        }];
    };
}

-(JobsRetBtnConfigByMacIdiomStyleBlock _Nonnull)jobsResetMacIdiomStyle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationMacIdiomStyle data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.macIdiomStyle = data;
        }];
    };
}

-(JobsRetBtnConfigByBaseBackgroundCorBlock _Nonnull)jobsResetBaseBackgroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            UIBackgroundConfiguration *bgConfig = config.background.copy;
            config.baseBackgroundColor = data;
            bgConfig.backgroundColor = data;
            config.background = bgConfig;
        }];
    };
}

-(JobsRetBtnConfigByImageBlock _Nonnull)jobsResetImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImage *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.image = data;
        }];
    };
}

-(JobsRetBtnConfigByImageCorTransformerBlock _Nonnull)jobsResetImageColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.imageColorTransformer = data;
        }];
    };
}

-(JobsRetBtnConfigByPreferredSymbolConfigForImageBlock _Nonnull)jobsResetPreferredSymbolConfigurationForImage API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImageSymbolConfiguration *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.preferredSymbolConfigurationForImage = data;
        }];
    };
}

-(JobsRetBtnConfigByShowsActivityIndicatorBlock _Nonnull)jobsResetShowsActivityIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(BOOL data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.showsActivityIndicator = data;
        }];
    };
}

-(JobsRetBtnConfigByActivityIndicatorCorTransformerBlock _Nonnull)jobsResetActivityIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.activityIndicatorColorTransformer = data;
        }];
    };
}

-(JobsRetBtnConfigByStrBlock _Nonnull)jobsResetTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.title = data;
        }];
    };
}

-(JobsRetBtnConfigByStrBlock _Nonnull)jobsResetSubTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitle = data;
        }];
    };
}

-(JobsRetBtnConfigByAttributedStrBlock _Nonnull)jobsResetAttributedTitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.attributedTitle = data;
        }];
    };
}

-(JobsRetBtnConfigByTitleTextAttributesTransformerBlock _Nonnull)jobsResetTitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.titleTextAttributesTransformer = data;
        }];
    };
}

-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)jobsResetTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.titleLineBreakMode = data;
        }];
    };
}

-(JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)jobsResetSubTitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitleLineBreakMode = data;
        }];
    };
}

-(JobsRetBtnConfigBySubtitleBlock _Nonnull)jobsResetSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitle = data;
        }];
    };
}

-(JobsRetBtnConfigByAttributedSubtitleBlock _Nonnull)jobsResetAttributedSubtitle API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.attributedSubtitle = data;
        }];
    };
}

-(JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock _Nonnull)jobsResetSubtitleTextAttributesTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitleTextAttributesTransformer = data;
        }];
    };
}

-(JobsRetBtnConfigBySubtitleLineBreakModeBlock _Nonnull)jobsResetSubtitleLineBreakMode API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.subtitleLineBreakMode = data;
        }];
    };
}

-(JobsRetBtnConfigByIndicatorBlock _Nonnull)jobsResetIndicator API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationIndicator data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration * _Nullable config) {
            config.indicator = data;
        }];
    };
}

-(JobsRetBtnConfigByIndicatorColorTransformerBlock _Nonnull)jobsResetIndicatorColorTransformer API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.indicatorColorTransformer = data;
        }];
    };
}

-(JobsRetBtnConfigByContentInsetsBlock _Nonnull)jobsResetContentInsets API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSDirectionalEdgeInsets data) {
        @jobs_strongify(self)
        return [self JobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            config.contentInsets = data;
        }];
    };
}

-(JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)jobsResetTitleBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *data) {
        @jobs_strongify(self)
        /// 更新 baseForegroundColor 颜色
        [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            @jobs_strongify(self)
            config.baseForegroundColor = data;
            self.configuration = config;
        }];
        /// 获取当前的 titleTextAttributesTransformer 字体
        UIConfigurationTextAttributesTransformer currentTransformer = self.configuration.titleTextAttributesTransformer;
        UIFont *currentFont = nil;
        if (currentTransformer) {
            NSDictionary<NSAttributedStringKey, id> *attributes = currentTransformer(@{});
            currentFont = attributes[NSFontAttributeName];
        }
        /// 应用新颜色，同时保持字体
        self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:currentFont btnTitleCor:data]);
        /// 应用更新后的配置
        self.updateConfigBy();
        return self.configuration;
    };
}
/// UIButtonConfiguration 没有对subTitle字体颜色的描述
-(JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)jobsResetSubTitleBaseForegroundColor API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *data) {
        @jobs_strongify(self)
        /// 更新 baseForegroundColor，或用于其他需要的配置
        [self jobsUpdateButtonConfiguration:^(UIButtonConfiguration *_Nullable config) {
            @jobs_strongify(self)
            self.configuration = config;
        }];
        /// 获取当前的 subtitleTextAttributesTransformer 字体，保持字体不变，仅更新颜色
        UIConfigurationTextAttributesTransformer currentSubtitleTransformer = self.configuration.subtitleTextAttributesTransformer;
        UIFont *currentSubtitleFont = nil;
        if (currentSubtitleTransformer) {
            NSDictionary<NSAttributedStringKey, id> *attributes = currentSubtitleTransformer(@{});
            currentSubtitleFont = attributes[NSFontAttributeName];
        }
        /// 使用 subtitleTextAttributesTransformer 设置新颜色，保持现有字体
        self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:currentSubtitleFont btnTitleCor:data]);
        /// 应用更新后的配置
        self.updateConfigBy();
        return self.configuration;
    };
}

-(JobsRetBtnConfigByFontBlock _Nonnull)jobsResetTitleFont API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButtonConfiguration *(UIFont *data) {
        @jobs_strongify(self)
        return self.jobsResetTitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:data btnTitleCor:nil]);
    };
}

-(JobsRetBtnConfigByFontBlock _Nonnull)jobsResetSubTitleFont API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^__kindof UIButtonConfiguration *(UIFont *data) {
        @jobs_strongify(self)
        return self.jobsResetSubtitleTextAttributesTransformer([self jobsSetConfigTextAttributesTransformerByTitleFont:data btnTitleCor:nil]);
    };
}

@end
#pragma clang diagnostic pop
