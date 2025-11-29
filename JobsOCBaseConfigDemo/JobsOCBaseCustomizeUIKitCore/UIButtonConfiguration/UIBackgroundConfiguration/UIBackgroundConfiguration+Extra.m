//
//  UIBackgroundConfiguration+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 10/9/25.
//

#import "UIBackgroundConfiguration+Extra.h"

@implementation UIBackgroundConfiguration (Extra)

- (JobsRetBackgroundConfigByCorBlock _Nonnull)byBackgroundColor {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIColor *color) {
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

- (JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byCornerRadius {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(CGFloat radius) {
        @jobs_strongify(self)
        self.cornerRadius = radius;
        return self;
    };
}

- (JobsRetBackgroundConfigByInsetsBlock _Nonnull)byBackgroundInsets {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(NSDirectionalEdgeInsets insets) {
        @jobs_strongify(self)
        self.backgroundInsets = insets;
        return self;
    };
}

- (JobsRetBackgroundConfigByViewBlock _Nonnull)byCustomView {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIView *view) {
        @jobs_strongify(self)
        self.customView = view;
        return self;
    };
}

- (JobsRetBackgroundConfigByCorBlock _Nonnull)byStrokeColor {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIColor *color) {
        @jobs_strongify(self)
        self.strokeColor = color;
        return self;
    };
}

- (JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byStrokeWidth {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(CGFloat width) {
        @jobs_strongify(self)
        self.strokeWidth = width;
        return self;
    };
}

- (JobsRetBackgroundConfigByImageBlock _Nonnull)byImage {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIImage *image) {
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) {
            self.image = image;
        }return self;
    };
}

- (JobsRetBackgroundConfigByContentModeBlock _Nonnull)byImageContentMode {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIViewContentMode mode) {
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) {
            self.imageContentMode = mode;
        }return self;
    };
}

- (JobsRetBackgroundConfigByVisualEffectBlock _Nonnull)byVisualEffect {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIVisualEffect *effect) {
        @jobs_strongify(self)
        self.visualEffect = effect;
        return self;
    };
}

- (JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byShadowOpacity {
    @jobs_weakify(self)
    if (@available(iOS 18.0, *)) {
        return ^UIBackgroundConfiguration *(CGFloat opacity) {
            @jobs_strongify(self)
            self.shadowProperties.opacity = opacity;
            return self;
        };
    } else {
        return ^UIBackgroundConfiguration *(CGFloat opacity) {
            @jobs_strongify(self)
            return self;
        };
    }
}

- (JobsRetBackgroundConfigByRectEdgeBlock _Nonnull)byEdgesAddingLayoutMarginsToBackgroundInsets {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(NSDirectionalRectEdge edges) {
        @jobs_strongify(self)
        self.edgesAddingLayoutMarginsToBackgroundInsets = edges;
        return self;
    };
}

- (JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byStrokeOutset {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(CGFloat outset) {
        @jobs_strongify(self)
        self.strokeOutset = outset;
        return self;
    };
}

- (JobsRetBackgroundConfigByCorTransformerBlock _Nonnull)byBackgroundColorTransformer {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIConfigurationColorTransformer transformer) {
        @jobs_strongify(self)
        self.backgroundColorTransformer = transformer;
        return self;
    };
}

- (JobsRetBackgroundConfigByCorTransformerBlock _Nonnull)byStrokeColorTransformer {
    @jobs_weakify(self)
    return ^UIBackgroundConfiguration *(UIConfigurationColorTransformer transformer) {
        @jobs_strongify(self)
        self.strokeColorTransformer = transformer;
        return self;
    };
}

@end
