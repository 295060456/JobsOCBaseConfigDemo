//
//  UIView+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import "UIView+DSL.h"

@implementation UIView (DSL)
#pragma mark —— Geometry
- (JobsRetViewByFrameBlock _Nonnull)byFrame {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGRect frame) {
        @jobs_strongify(self)
        
        self.frame = frame;
        return self;
    };
}

- (JobsRetViewByFrameBlock _Nonnull)byBounds {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGRect bounds) {
        @jobs_strongify(self)
        
        self.bounds = bounds;
        return self;
    };
}

- (JobsRetViewByCGPointBlock _Nonnull)byCenterPoint {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGPoint pt) {
        @jobs_strongify(self)
        
        self.center = pt;
        return self;
    };
}

- (JobsRetViewByCGAffineTransformBlock _Nonnull)byTransform {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGAffineTransform t) {
        @jobs_strongify(self)
        
        self.transform = t;
        return self;
    };
}

- (JobsRetViewByCATransform3DBlock _Nonnull)byTransform3D {
    @jobs_weakify(self)
    return ^__kindof UIView * (CATransform3D t3d) {
        @jobs_strongify(self)
        
        self.transform3D = t3d;
        return self;
    };
}

- (JobsRetViewByCGFloatBlock _Nonnull)byContentScaleFactor {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat scale) {
        @jobs_strongify(self)
        
        self.contentScaleFactor = scale;
        return self;
    };
}

- (JobsRetViewByCGPointBlock _Nonnull)byAnchorPoint {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGPoint pt) {
        @jobs_strongify(self)
        
        if (@available(iOS 16.0, *)) {
            self.anchorPoint = pt;
        }
        return self;
    };
}
#pragma mark —— Identity
- (JobsRetViewByNSIntegerBlock _Nonnull)byTag {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSInteger tag) {
        @jobs_strongify(self)
        
        self.tag = tag;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byUserInteractionEnabled {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL enabled) {
        @jobs_strongify(self)
        
        self.userInteractionEnabled = enabled;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byMultipleTouchEnabled {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        
        self.multipleTouchEnabled = on;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byExclusiveTouch {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        
        self.exclusiveTouch = on;
        return self;
    };
}
#pragma mark —— Rendering
- (JobsRetViewByCGFloatBlock _Nonnull)byCornerRadius {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat radius) {
        @jobs_strongify(self)
        self.layer.cornerRadius = radius;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byClipsToBounds {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        self.clipsToBounds = on;
        return self;
    };
}

- (JobsRetViewByCorBlock _Nonnull)byBgColor {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIColor * _Nullable color) {
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

- (JobsRetViewByCGFloatBlock _Nonnull)byAlpha {
    @jobs_weakify(self)
    return ^__kindof UIView * (CGFloat a) {
        @jobs_strongify(self)
        self.alpha = a;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byOpaque {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL opaque) {
        @jobs_strongify(self)
        self.opaque = opaque;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byClearsContextBeforeDrawing {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        self.clearsContextBeforeDrawing = on;
        return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byHidden {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL hidden) {
        @jobs_strongify(self)
        self.hidden = hidden;
        return self;
    };
}

- (JobsRetViewByNSIntegerBlock _Nonnull)byContentMode {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIViewContentMode mode) {
        @jobs_strongify(self)
        self.contentMode = mode;
        return self;
    };
}

- (JobsRetViewByViewBlock _Nonnull)byMaskView {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIView * _Nullable maskView) {
        @jobs_strongify(self)
        self.maskView = maskView;
        return self;
    };
}

- (JobsRetViewByCorBlock _Nonnull)byTintColor {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIColor * _Nullable color) {
        @jobs_strongify(self)
        self.tintColor = color;
        return self;
    };
}

- (JobsRetViewByNSIntegerBlock _Nonnull)byTintAdjustmentMode {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIViewTintAdjustmentMode mode) {
        @jobs_strongify(self)
        self.tintAdjustmentMode = mode;
        return self;
    };
}
#pragma mark —— Semantics / RTL
- (JobsRetViewByNSIntegerBlock _Nonnull)bySemanticContentAttribute {
    @jobs_weakify(self)
    return ^__kindof UIView * (UISemanticContentAttribute attr) {
        @jobs_strongify(self)
        self.semanticContentAttribute = attr;
        return self;
    };
}
#pragma mark —— Layout behaviors
- (JobsRetViewByBOOLBlock _Nonnull)byAutoresizesSubviews {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        self.autoresizesSubviews = on;
        return self;
    };
}

- (JobsRetViewByNSUIntegerBlock _Nonnull)byAutoresizingMask {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSUInteger mask) {
        @jobs_strongify(self)
        self.autoresizingMask = (UIViewAutoresizing)mask;
        return self;
    };
}

- (JobsRetViewByUIEdgeInsetBlock _Nonnull)byLayoutMargins {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIEdgeInsets insets) {
        @jobs_strongify(self)
        if (@available(iOS 8.0, *)) {
            self.layoutMargins = insets;
        }return self;
    };
}

- (JobsRetViewByNSDirectionalEdgeInsetsBlock _Nonnull)byDirectionalLayoutMargins {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSDirectionalEdgeInsets insets) {
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.directionalLayoutMargins = insets;
        }return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byPreservesSuperviewLayoutMargins {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (@available(iOS 8.0, *)) {
            self.preservesSuperviewLayoutMargins = on;
        }return self;
    };
}

- (JobsRetViewByBOOLBlock _Nonnull)byInsetsLayoutMarginsFromSafeArea {
    @jobs_weakify(self)
    return ^__kindof UIView * (BOOL on) {
        @jobs_strongify(self)
        if (@available(iOS 11.0, *)) {
            self.insetsLayoutMarginsFromSafeArea = on;
        }return self;
    };
}
#pragma mark —— UIUserInterfaceStyle
- (JobsRetViewByUIUserInterfaceStyleBlock _Nonnull)byOverrideUserInterfaceStyle {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIUserInterfaceStyle style) {
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)) {
            self.overrideUserInterfaceStyle = style;
        }return self;
    };
}
#pragma mark —— Dynamic Type limits
- (JobsRetViewByStringBlock _Nonnull)byMinimumContentSizeCategory {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable category) {
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) {
            self.minimumContentSizeCategory = category;
        }return self;
    };
}

- (JobsRetViewByStringBlock _Nonnull)byMaximumContentSizeCategory {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable category) {
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) {
            self.maximumContentSizeCategory = category;
        }return self;
    };
}
#pragma mark —— Focus
- (JobsRetViewByStringBlock _Nonnull)byFocusGroupIdentifier {
    @jobs_weakify(self)
    return ^__kindof UIView * (NSString * _Nullable ident) {
        @jobs_strongify(self)
        if (@available(iOS 14.0, *)) {
            self.focusGroupIdentifier = ident;
        }return self;
    };
}

- (JobsRetViewByNSIntegerBlock _Nonnull)byFocusGroupPriority {
    @jobs_weakify(self)
    return ^__kindof UIView * (UIFocusGroupPriority p) {
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) {
            self.focusGroupPriority = p;
        }return self;
    };
}

- (JobsRetViewByIDBlock _Nonnull)byFocusEffect {
    @jobs_weakify(self)
    return ^__kindof UIView * (id _Nullable effect /* UIFocusEffect * */) {
        @jobs_strongify(self)
        if (@available(iOS 15.0, *)) {
            self.focusEffect = (UIFocusEffect *)effect;
        }return self;
    };
}
#pragma mark —— iOS 26+ CornerConfiguration
- (JobsRetViewByCornerConfigBlock _Nonnull)byCornerConfiguration {
    @jobs_weakify(self)
    return ^__kindof UIView * (UICornerConfiguration * _Nonnull cfg) {
        @jobs_strongify(self)
        if (@available(iOS 26.0, tvOS 26.0, visionOS 1.0, *)) {
            self.cornerConfiguration = cfg;
        }return self;
    };
}

@end
