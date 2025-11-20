//
//  UIButtonConfiguration+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/9/25.
//

#import "UIButtonConfiguration+Extra.h"

@implementation UIButtonConfiguration (Extra)

- (JobsRetBtnConfigByBtnConfigBlock _Nonnull)byButtonConfiguration API_AVAILABLE(ios(16.0)){
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfiguration *cfg) {
        @jobs_strongify(self)
        if (!cfg) return self;
        // 基础与通用（iOS16 起你已做可用性标注，保持一致）
        self.byBackground(cfg.background)                                   // UIBackgroundConfiguration
            .byCornerStyle(cfg.cornerStyle)                                  // UIButtonConfigurationCornerStyle
            .byButtonSize(cfg.buttonSize)                                    // UIButtonConfigurationSize
            .byMacIdiomStyle(cfg.macIdiomStyle)                              // Mac idiom style
            .byBaseForegroundColor(cfg.baseForegroundColor)                  // 前景基色
            .byBaseBackgroundColor(cfg.baseBackgroundColor)                  // 背景基色
            .byImage(cfg.image)                                              // 图片
            .byImageColorTransformer(cfg.imageColorTransformer)              // 图片色变
            .byPreferredSymbolConfigurationForImage(cfg.preferredSymbolConfigurationForImage) // 符号配置
            .byShowsActivityIndicator(cfg.showsActivityIndicator)            // 菊花
            .byActivityIndicatorColorTransformer(cfg.activityIndicatorColorTransformer)       // 菊花色变
            .byTitle(cfg.title)                                              // 标题
            .byAttributedTitle(cfg.attributedTitle)                          // 富文本标题
            .byTitleTextAttributesTransformer(cfg.titleTextAttributesTransformer) // 标题属性变换
            .byTitleLineBreakMode(cfg.titleLineBreakMode)                    // 标题换行
            .bySubtitle(cfg.subtitle)                                        // 副标题
            .byAttributedSubtitle(cfg.attributedSubtitle)                    // 富文本副标题
            .bySubtitleTextAttributesTransformer(cfg.subtitleTextAttributesTransformer) // 副标题属性变换
            .bySubtitleLineBreakMode(cfg.subtitleLineBreakMode)              // 副标题换行
            .byContentInsets(cfg.contentInsets)                              // 内容内边距
            .byImagePlacement(cfg.imagePlacement)                            // 图片位置
            .byImagePadding(cfg.imagePadding)                                // 图文间距
            .byTitlePadding(cfg.titlePadding)                                // 主/副标题间距
            .byTitleAlignment(cfg.titleAlignment)                            // 标题/副标题相对布局
            .byAutomaticallyUpdateForSelection(cfg.automaticallyUpdateForSelection); // 选中自动刷新

        // iOS16+ 指示器（你的 typedef 已做 API_AVAILABLE 标注，这里再兜底一层）
        if (@available(iOS 16.0, *)) {
            self.byIndicator(cfg.indicator)
                .byIndicatorColorTransformer(cfg.indicatorColorTransformer);
        }

        // 如需 iOS26+ 的 symbolContentTransition，可在你完成 typedef 后追加：
        // if (@available(iOS 26.0, *)) {
        //     self.bySymbolContentTransition(cfg.symbolContentTransition);
        // }

        return self;
    };
}
#pragma mark - Background
- (JobsRetBtnConfigByBackgroundBlock _Nonnull)byBackground {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIBackgroundConfiguration *bg) {
        @jobs_strongify(self)
        self.background = bg;
        return self;
    };
}
#pragma mark - Style / Size / Idiom
- (JobsRetBtnConfigByCornerStyleBlock _Nonnull)byCornerStyle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationCornerStyle style) {
        @jobs_strongify(self)
        self.cornerStyle = style;
        return self;
    };
}

- (JobsRetBtnConfigBySizeBlock _Nonnull)byButtonSize {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationSize size) {
        @jobs_strongify(self)
        self.buttonSize = size;
        return self;
    };
}

- (JobsRetBtnConfigByMacIdiomStyleBlock _Nonnull)byMacIdiomStyle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationMacIdiomStyle style) {
        @jobs_strongify(self)
        self.macIdiomStyle = style;
        return self;
    };
}
#pragma mark - Base colors
- (JobsReBtnConfigByBaseForegroundCorBlock _Nonnull)byBaseForegroundColor {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *color) {
        @jobs_strongify(self)
        self.baseForegroundColor = color;
        return self;
    };
}

- (JobsRetBtnConfigByBaseBackgroundCorBlock _Nonnull)byBaseBackgroundColor {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *color) {
        @jobs_strongify(self)
        self.baseBackgroundColor = color;
        return self;
    };
}
#pragma mark - Image & transformers
- (JobsRetBtnConfigByImageBlock _Nonnull)byImage {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImage *img) {
        @jobs_strongify(self)
        self.image = img;
        return self;
    };
}

- (JobsRetBtnConfigByImageCorTransformerBlock _Nonnull)byImageColorTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer transformer) {
        @jobs_strongify(self)
        self.imageColorTransformer = transformer;
        return self;
    };
}

- (JobsRetBtnConfigByPreferredSymbolConfigForImageBlock _Nonnull)byPreferredSymbolConfigurationForImage {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImageSymbolConfiguration *sym) {
        @jobs_strongify(self)
        self.preferredSymbolConfigurationForImage = sym;
        return self;
    };
}
#pragma mark - Activity indicator
- (JobsRetBtnConfigByShowsActivityIndicatorBlock _Nonnull)byShowsActivityIndicator {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(BOOL on) {
        @jobs_strongify(self)
        self.showsActivityIndicator = on;
        return self;
    };
}

- (JobsRetBtnConfigByActivityIndicatorCorTransformerBlock _Nonnull)byActivityIndicatorColorTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer transformer) {
        @jobs_strongify(self)
        self.activityIndicatorColorTransformer = transformer;
        return self;
    };
}
#pragma mark - Title / Subtitle
- (JobsRetBtnConfigByStrBlock _Nonnull)byTitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *text) {
        @jobs_strongify(self)
        self.title = text;
        return self;
    };
}

- (JobsRetBtnConfigByAttributedStrBlock _Nonnull)byAttributedTitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *attr) {
        @jobs_strongify(self)
        self.attributedTitle = attr;
        return self;
    };
}

- (JobsRetBtnConfigByTitleTextAttributesTransformerBlock _Nonnull)byTitleTextAttributesTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer transformer) {
        @jobs_strongify(self)
        self.titleTextAttributesTransformer = transformer;
        return self;
    };
}

- (JobsRetBtnConfigByTitleLineBreakModeBlock _Nonnull)byTitleLineBreakMode {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode mode) {
        @jobs_strongify(self)
        self.titleLineBreakMode = mode;
        return self;
    };
}

- (JobsRetBtnConfigBySubtitleBlock _Nonnull)bySubtitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *text) {
        @jobs_strongify(self)
        self.subtitle = text;
        return self;
    };
}

- (JobsRetBtnConfigByAttributedSubtitleBlock _Nonnull)byAttributedSubtitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *attr) {
        @jobs_strongify(self)
        self.attributedSubtitle = attr;
        return self;
    };
}

- (JobsRetBtnConfigBySubtitleTextAttributesTransformerBlock _Nonnull)bySubtitleTextAttributesTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer transformer) {
        @jobs_strongify(self)
        self.subtitleTextAttributesTransformer = transformer;
        return self;
    };
}

- (JobsRetBtnConfigBySubtitleLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode mode) {
        @jobs_strongify(self)
        self.subtitleLineBreakMode = mode;
        return self;
    };
}
#pragma mark - Indicator (iOS 16+)
- (JobsRetBtnConfigByIndicatorBlock _Nonnull)byIndicator {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationIndicator ind) {
        @jobs_strongify(self)
        self.indicator = ind;
        return self;
    };
}

- (JobsRetBtnConfigByIndicatorColorTransformerBlock _Nonnull)byIndicatorColorTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer transformer) {
        @jobs_strongify(self)
        self.indicatorColorTransformer = transformer;
        return self;
    };
}
#pragma mark - Layout
- (JobsRetBtnConfigByContentInsetsBlock _Nonnull)byContentInsets {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSDirectionalEdgeInsets insets) {
        @jobs_strongify(self)
        self.contentInsets = insets;
        return self;
    };
}

- (JobsRetBtnConfigByImagePlacementBlock _Nonnull)byImagePlacement {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSDirectionalRectEdge edge) {
        @jobs_strongify(self)
        self.imagePlacement = edge;
        return self;
    };
}

- (JobsRetBtnConfigByImagePaddingBlock _Nonnull)byImagePadding {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(CGFloat v) {
        @jobs_strongify(self)
        self.imagePadding = v;
        return self;
    };
}

- (JobsRetBtnConfigByTitlePaddingBlock _Nonnull)byTitlePadding {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(CGFloat v) {
        @jobs_strongify(self)
        self.titlePadding = v;
        return self;
    };
}

- (JobsRetBtnConfigByTitleAlignmentBlock _Nonnull)byTitleAlignment {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationTitleAlignment a) {
        @jobs_strongify(self)
        self.titleAlignment = a;
        return self;
    };
}
#pragma mark - Auto update for selection
- (JobsRetBtnConfigByAutomaticallyUpdateForSelectionBlock _Nonnull)byAutomaticallyUpdateForSelection {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(BOOL on) {
        @jobs_strongify(self)
        self.automaticallyUpdateForSelection = on;
        return self;
    };
}

@end
