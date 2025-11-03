//
//  UIView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import "UIView+DSL.h"

@implementation UIView (DSL)
#pragma mark —— Geometry
- (JobsReturnViewByFrameBlock _Nonnull)byFrame {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGRect frame) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.frame = frame;
        return self;
    };
}

- (JobsReturnViewByFrameBlock _Nonnull)byBounds {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGRect bounds) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.bounds = bounds;
        return self;
    };
}

- (JobsReturnViewByPointBlock _Nonnull)byCenterPoint {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGPoint pt) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.center = pt;
        return self;
    };
}

- (JobsReturnViewByCGAffineTransformBlock _Nonnull)byTransform {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGAffineTransform t) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.transform = t;
        return self;
    };
}

- (JobsReturnViewByCATransform3DBlock _Nonnull)byTransform3D {
    @jobs_weakify(self)
    return ^__kindof UIView * (CATransform3D t3d) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.transform3D = t3d;
        return self;
    };
}

- (JobsReturnViewByCGFloatBlock _Nonnull)byContentScaleFactor {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat scale) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentScaleFactor = scale;
        return self;
    };
}

- (JobsReturnViewByPointBlock _Nonnull)byAnchorPoint {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGPoint pt) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 16.0, *)) {
            self.anchorPoint = pt;
        }
        return self;
    };
}
#pragma mark —— Identity
- (JobsReturnViewByNSIntegerBlock _Nonnull)byTag {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger tag) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.tag = tag;
        return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byUserInteractionEnabled {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL enabled) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.userInteractionEnabled = enabled;
        return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byMultipleTouchEnabled {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.multipleTouchEnabled = on;
        return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byExclusiveTouch {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.exclusiveTouch = on;
        return self;
    };
}
#pragma mark —— Rendering
- (JobsReturnViewByBOOLBlock _Nonnull)byClipsToBounds {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.clipsToBounds = on;
        return self;
    };
}

- (JobsReturnViewByCorBlock _Nonnull)byBgColor {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIColor * _Nullable color) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.backgroundColor = color;
        return self;
    };
}

- (JobsReturnViewByCGFloatBlock _Nonnull)byAlpha {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat a) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.alpha = a;
        return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byOpaque {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL opaque) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.opaque = opaque;
        return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.clearsContextBeforeDrawing = on;
        return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byHidden {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL hidden) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.hidden = hidden;
        return self;
    };
}

- (JobsReturnViewByNSIntegerBlock _Nonnull)byContentMode {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIViewContentMode mode) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentMode = mode;
        return self;
    };
}

- (JobsReturnViewByViewBlock _Nonnull)byMaskView {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIView * _Nullable maskView) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.maskView = maskView;
        return self;
    };
}

- (JobsReturnViewByCorBlock _Nonnull)byTintColor {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIColor * _Nullable color) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.tintColor = color;
        return self;
    };
}

- (JobsReturnViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIViewTintAdjustmentMode mode) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.tintAdjustmentMode = mode;
        return self;
    };
}
#pragma mark —— Semantics / RTL
- (JobsReturnViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute {
    @jobs_weakify(self)
    return ^__kindof UIView * (UISemanticContentAttribute attr) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.semanticContentAttribute = attr;
        return self;
    };
}
#pragma mark —— Layout behaviors
- (JobsReturnViewByBOOLBlock _Nonnull)byAutoresizesSubviews {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.autoresizesSubviews = on;
        return self;
    };
}

- (JobsReturnViewByNSUIntegerBlock _Nonnull)byAutoresizingMask {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSUInteger mask) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.autoresizingMask = (UIViewAutoresizing)mask;
        return self;
    };
}

- (JobsReturnViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIEdgeInsets insets) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 8.0, *)) {
            self.layoutMargins = insets;
        }return self;
    };
}

- (JobsReturnViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSDirectionalEdgeInsets insets) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 11.0, *)) {
            self.directionalLayoutMargins = insets;
        }return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 8.0, *)) {
            self.preservesSuperviewLayoutMargins = on;
        }return self;
    };
}

- (JobsReturnViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 11.0, *)) {
            self.insetsLayoutMarginsFromSafeArea = on;
        }return self;
    };
}
#pragma mark —— UIUserInterfaceStyle
- (JobsReturnViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIUserInterfaceStyle style) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 13.0, *)) {
            self.overrideUserInterfaceStyle = style;
        }return self;
    };
}
#pragma mark —— Dynamic Type limits
- (JobsReturnViewByStringBlock _Nonnull)byMinimumContentSizeCategory {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable category) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 15.0, *)) {
            self.minimumContentSizeCategory = category;
        }return self;
    };
}

- (JobsReturnViewByStringBlock _Nonnull)byMaximumContentSizeCategory {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable category) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 15.0, *)) {
            self.maximumContentSizeCategory = category;
        }return self;
    };
}
#pragma mark —— Focus
- (JobsReturnViewByStringBlock _Nonnull)byFocusGroupIdentifier {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable ident) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)) {
            self.focusGroupIdentifier = ident;
        }return self;
    };
}

- (JobsReturnViewByNSIntegerBlock _Nonnull)byFocusGroupPriority {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIFocusGroupPriority p) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 15.0, *)) {
            self.focusGroupPriority = p;
        }return self;
    };
}

- (JobsReturnViewByIDBlock _Nonnull)byFocusEffect {
    @jobs_weakify(self)
    return ^__kindof UIView * (id _Nullable effect /* UIFocusEffect * */) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 15.0, *)) {
            self.focusEffect = (UIFocusEffect *)effect;
        }return self;
    };
}
#pragma mark —— iOS 26+ CornerConfiguration
- (JobsReturnViewByCornerConfigurationBlock _Nonnull)byCornerConfiguration {
    @jobs_weakify(self)
    return ^__kindof UIView * (UICornerConfiguration * _Nonnull cfg) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 26.0, tvOS 26.0, visionOS 1.0, *)) {
            self.cornerConfiguration = cfg;
        }return self;
    };
}

@end
