//
//  UIButtonConfiguration+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/9/25.
//

#import "UIButtonConfiguration+Extra.h"

@implementation UIButtonConfiguration (Extra)

- (JobsReturnButtonConfigurationByButtonConfigurationBlock _Nonnull)byButtonConfiguration {
    return ^UIButtonConfiguration *(UIButtonConfiguration *cfg) {
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
- (JobsReturnButtonConfigurationByBackgroundBlock _Nonnull)byBackground {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIBackgroundConfiguration *bg) {
        @jobs_strongify(self)
        self.background = bg;
        return self;
    };
}
#pragma mark - Style / Size / Idiom
- (JobsReturnButtonConfigurationByCornerStyleBlock _Nonnull)byCornerStyle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationCornerStyle style) {
        @jobs_strongify(self)
        self.cornerStyle = style;
        return self;
    };
}

- (JobsReturnButtonConfigurationBySizeBlock _Nonnull)byButtonSize {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationSize size) {
        self.buttonSize = size;
        return self;
    };
}

- (JobsReturnButtonConfigurationByMacIdiomStyleBlock _Nonnull)byMacIdiomStyle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationMacIdiomStyle style) {
        self.macIdiomStyle = style;
        return self;
    };
}
#pragma mark - Base colors
- (JobsReturnButtonConfigurationByBaseForegroundColorBlock _Nonnull)byBaseForegroundColor {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *color) {
        @jobs_strongify(self)
        self.baseForegroundColor = color;
        return self;
    };
}

- (JobsReturnButtonConfigurationByBaseBackgroundColorBlock _Nonnull)byBaseBackgroundColor {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIColor *color) {
        self.baseBackgroundColor = color;
        return self;
    };
}
#pragma mark - Image & transformers
- (JobsReturnButtonConfigurationByImageBlock _Nonnull)byImage {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImage *img) {
        self.image = img;
        return self;
    };
}

- (JobsReturnButtonConfigurationByImageColorTransformerBlock _Nonnull)byImageColorTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer transformer) {
        self.imageColorTransformer = transformer;
        return self;
    };
}

- (JobsReturnButtonConfigurationByPreferredSymbolConfigurationForImageBlock _Nonnull)byPreferredSymbolConfigurationForImage {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIImageSymbolConfiguration *sym) {
        self.preferredSymbolConfigurationForImage = sym;
        return self;
    };
}
#pragma mark - Activity indicator
- (JobsReturnButtonConfigurationByShowsActivityIndicatorBlock _Nonnull)byShowsActivityIndicator {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(BOOL on) {
        self.showsActivityIndicator = on;
        return self;
    };
}

- (JobsReturnButtonConfigurationByActivityIndicatorColorTransformerBlock _Nonnull)byActivityIndicatorColorTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer transformer) {
        self.activityIndicatorColorTransformer = transformer;
        return self;
    };
}
#pragma mark - Title / Subtitle
- (JobsReturnButtonConfigurationByTitleBlock _Nonnull)byTitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *text) {
        self.title = text;
        return self;
    };
}

- (JobsReturnButtonConfigurationByAttributedTitleBlock _Nonnull)byAttributedTitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *attr) {
        self.attributedTitle = attr;
        return self;
    };
}

- (JobsReturnButtonConfigurationByTitleTextAttributesTransformerBlock _Nonnull)byTitleTextAttributesTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer transformer) {
        self.titleTextAttributesTransformer = transformer;
        return self;
    };
}

- (JobsReturnButtonConfigurationByTitleLineBreakModeBlock _Nonnull)byTitleLineBreakMode {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode mode) {
        self.titleLineBreakMode = mode;
        return self;
    };
}

- (JobsReturnButtonConfigurationBySubtitleBlock _Nonnull)bySubtitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSString *text) {
        self.subtitle = text;
        return self;
    };
}

- (JobsReturnButtonConfigurationByAttributedSubtitleBlock _Nonnull)byAttributedSubtitle {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSAttributedString *attr) {
        self.attributedSubtitle = attr;
        return self;
    };
}

- (JobsReturnButtonConfigurationBySubtitleTextAttributesTransformerBlock _Nonnull)bySubtitleTextAttributesTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationTextAttributesTransformer transformer) {
        self.subtitleTextAttributesTransformer = transformer;
        return self;
    };
}

- (JobsReturnButtonConfigurationBySubtitleLineBreakModeBlock _Nonnull)bySubtitleLineBreakMode {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSLineBreakMode mode) {
        self.subtitleLineBreakMode = mode;
        return self;
    };
}
#pragma mark - Indicator (iOS 16+)
- (JobsReturnButtonConfigurationByIndicatorBlock _Nonnull)byIndicator {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIButtonConfigurationIndicator ind) {
        self.indicator = ind;
        return self;
    };
}

- (JobsReturnButtonConfigurationByIndicatorColorTransformerBlock _Nonnull)byIndicatorColorTransformer {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(UIConfigurationColorTransformer transformer) {
        self.indicatorColorTransformer = transformer;
        return self;
    };
}
#pragma mark - Layout
- (JobsReturnButtonConfigurationByContentInsetsBlock _Nonnull)byContentInsets {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSDirectionalEdgeInsets insets) {
        self.contentInsets = insets;
        return self;
    };
}

- (JobsReturnButtonConfigurationByImagePlacementBlock _Nonnull)byImagePlacement {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(NSDirectionalRectEdge edge) {
        self.imagePlacement = edge;
        return self;
    };
}

- (JobsReturnButtonConfigurationByImagePaddingBlock _Nonnull)byImagePadding {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(CGFloat v) {
        self.imagePadding = v;
        return self;
    };
}

- (JobsReturnButtonConfigurationByTitlePaddingBlock _Nonnull)byTitlePadding {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(CGFloat v) {
        self.titlePadding = v;
        return self;
    };
}

- (JobsReturnButtonConfigurationByTitleAlignmentBlock _Nonnull)byTitleAlignment {
    return ^UIButtonConfiguration *(UIButtonConfigurationTitleAlignment a) {
        self.titleAlignment = a;
        return self;
    };
}
#pragma mark - Auto update for selection
- (JobsReturnButtonConfigurationByAutomaticallyUpdateForSelectionBlock _Nonnull)byAutomaticallyUpdateForSelection {
    @jobs_weakify(self)
    return ^UIButtonConfiguration *(BOOL on) {
        self.automaticallyUpdateForSelection = on;
        return self;
    };
}

@end
