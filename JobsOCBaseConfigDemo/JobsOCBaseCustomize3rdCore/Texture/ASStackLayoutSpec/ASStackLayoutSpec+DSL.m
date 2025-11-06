//
//  ASStackLayoutSpec+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import "ASStackLayoutSpec+DSL.h"

@implementation ASStackLayoutSpec (DSL)
#pragma mark —— 方向 / 间距
-(JobsRetStackLayoutSpecByDirectionBlock _Nonnull)byDirection {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASStackLayoutDirection dir) {
        @jobs_strongify(self)
        self.direction = dir;
        return self;
    };
}

-(JobsRetStackLayoutSpecBySpacingBlock _Nonnull)bySpacing {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (CGFloat spacing) {
        @jobs_strongify(self)
        self.spacing = spacing;
        return self;
    };
}
#pragma mark —— 语义对齐（推荐优先用这两个）
-(JobsRetStackLayoutSpecByHorizontalAlignmentBlock _Nonnull)byHorizontalAlignment {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASHorizontalAlignment align) {
        @jobs_strongify(self)
        self.horizontalAlignment = align; // 触发内部 resolve
        return self;
    };
}

-(JobsRetStackLayoutSpecByVerticalAlignmentBlock _Nonnull)byVerticalAlignment {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASVerticalAlignment align) {
        @jobs_strongify(self)
        self.verticalAlignment = align; // 触发内部 resolve
        return self;
    };
}
#pragma mark —— Flex 对齐（底层等价字段）
-(JobsRetStackLayoutSpecByJustifyContentBlock _Nonnull)byJustifyContent {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASStackLayoutJustifyContent jc) {
        @jobs_strongify(self)
        self.justifyContent = jc;
        return self;
    };
}

-(JobsRetStackLayoutSpecByAlignItemsBlock _Nonnull)byAlignItems {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASStackLayoutAlignItems ai) {
        @jobs_strongify(self)
        self.alignItems = ai;
        return self;
    };
}

-(JobsRetStackLayoutSpecByFlexWrapBlock _Nonnull)byFlexWrap {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASStackLayoutFlexWrap wrap) {
        @jobs_strongify(self)
        self.flexWrap = wrap;
        return self;
    };
}

-(JobsRetStackLayoutSpecByAlignContentBlock _Nonnull)byAlignContent {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (ASStackLayoutAlignContent ac) {
        @jobs_strongify(self)
        self.alignContent = ac;
        return self;
    };
}

-(JobsRetStackLayoutSpecByLineSpacingBlock _Nonnull)byLineSpacing {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (CGFloat lineSpacing) {
        @jobs_strongify(self)
        self.lineSpacing = lineSpacing;
        return self;
    };
}
#pragma mark —— 并发布局开关
-(JobsRetStackLayoutSpecByConcurrentBlock _Nonnull)byConcurrent {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (BOOL concurrent) {
        @jobs_strongify(self)
        self.concurrent = concurrent;
        return self;
    };
}
#pragma mark —— children 管理
-(JobsRetStackLayoutSpecByChildrenBlock _Nonnull)byChildren {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (NSArray<id<ASLayoutElement>> *children) {
        @jobs_strongify(self)
        self.children = children ?: @[];
        return self;
    };
}

-(JobsRetStackLayoutSpecByAppendChildrenBlock _Nonnull)byAppendChildren {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (NSArray<id<ASLayoutElement>> *children) {
        @jobs_strongify(self)
        NSArray *old = self.children ?: @[];
        self.children = [old arrayByAddingObjectsFromArray:(children ?: @[])];
        return self;
    };
}

-(JobsRetStackLayoutSpecByAddChildBlock _Nonnull)byAdd {
    @jobs_weakify(self)
    return ^ASStackLayoutSpec* (id<ASLayoutElement> child) {
        @jobs_strongify(self)
        if (!child) return self;
        NSArray *old = self.children ?: @[];
        self.children = [old arrayByAddingObject:child];
        return self;
    };
}

@end
