//
//  NSMutableParagraphStyle+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/3/25.
//

#import "NSMutableParagraphStyle+DSL.h"

@implementation NSMutableParagraphStyle (DSL)
#pragma mark —— CGFloat
-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byLineSpacing {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.lineSpacing = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byParagraphSpacing {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.paragraphSpacing = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byFirstLineHeadIndent {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.firstLineHeadIndent = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byHeadIndent {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.headIndent = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byTailIndent {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.tailIndent = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byMinimumLineHeight {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.minimumLineHeight = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byMaximumLineHeight {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.maximumLineHeight = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byLineHeightMultiple {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.lineHeightMultiple = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byParagraphSpacingBefore {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        self.paragraphSpacingBefore = v;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByCGFloatBlock _Nonnull)byDefaultTabInterval {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (CGFloat v) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            self.defaultTabInterval = v;
        }
        return self;
    };
}
#pragma mark —— float
-(JobsRetMutableParagraphStyleByFloatBlock _Nonnull)byHyphenationFactor {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (float v) {
        @jobs_strongify(self) 
        self.hyphenationFactor = v;
        return self;
    };
}
#pragma mark —— BOOL
-(JobsRetMutableParagraphStyleByBOOLBlock _Nonnull)byAllowsDefaultTighteningForTruncation {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 9.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            self.allowsDefaultTighteningForTruncation = on;
        }
        return self;
    };
}

-(JobsRetMutableParagraphStyleByBOOLBlock _Nonnull)byUsesDefaultHyphenation {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (BOOL on) {
        @jobs_strongify(self) 
        if (@available(iOS 15.0, tvOS 15.0, watchOS 8.0, visionOS 1.0, *)) {
            self.usesDefaultHyphenation = on;
        }
        return self;
    };
}
#pragma mark —— Enums
-(JobsRetMutableParagraphStyleByNSIntegerBlock _Nonnull)byLineBreakMode {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSLineBreakMode mode) {
        @jobs_strongify(self) 
        self.lineBreakMode = mode;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByNSIntegerBlock _Nonnull)byBaseWritingDirection {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSWritingDirection dir) {
        @jobs_strongify(self) 
        self.baseWritingDirection = dir;
        return self;
    };
}

-(JobsRetMutableParagraphStyleByNSUIntegerBlock _Nonnull)byLineBreakStrategy {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSLineBreakStrategy strategy) {
        @jobs_strongify(self) 
        if (@available(iOS 9.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            self.lineBreakStrategy = strategy;
        }
        return self;
    };
}
#pragma mark —— Arrays
-(JobsRetMutableParagraphStyleByArrBlock _Nonnull)byTabStops {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSArray<NSTextTab *> * _Nullable stops) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            self.tabStops = stops;
        }return self;
    };
}

-(JobsRetMutableParagraphStyleByArrBlock _Nonnull)byTextLists {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSArray<NSTextList *> * _Nullable lists) {
        @jobs_strongify(self) 
        if (@available(iOS 7.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            self.textLists = lists;
        }return self;
    };
}
#pragma mark —— Single object operations
-(JobsRetMutableParagraphStyleByNSTextTabBlock _Nonnull)byAddTabStop {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSTextTab * _Nullable tab) {
        @jobs_strongify(self) 
        if (!tab) return self;
        if (@available(iOS 9.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            [self addTabStop:tab];
        }return self;
    };
}

-(JobsRetMutableParagraphStyleByNSTextTabBlock _Nonnull)byRemoveTabStop {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSTextTab * _Nullable tab) {
        @jobs_strongify(self) 
        if (!tab) return self;
        if (@available(iOS 9.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            [self removeTabStop:tab];
        }return self;
    };
}

-(JobsRetMutableParagraphStyleByNSParagraphStyleBlock _Nonnull)bySetParagraphStyle {
    @jobs_weakify(self)
    return ^__kindof NSMutableParagraphStyle * (NSParagraphStyle * _Nullable style) {
        @jobs_strongify(self) 
        if (!style) return self;
        if (@available(iOS 9.0, tvOS 9.0, watchOS 2.0, visionOS 1.0, *)) {
            [self setParagraphStyle:style];
        }return self;
    };
}

@end
