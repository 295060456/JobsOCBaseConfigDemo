//
//  ASButtonNode+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import "ASButtonNode+DSL.h"

static const void *kJobsButtonTapBlockKey      = &kJobsButtonTapBlockKey;
static const void *kJobsButtonLongPressBlockKey= &kJobsButtonLongPressBlockKey;
static const void *kJobsButtonLongPressGRKey   = &kJobsButtonLongPressGRKey;
@implementation ASButtonNode (DSL)

-(JobsRetButtonNodeByTitleConfigBlock _Nonnull)byTitle {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(NSString *_Nonnull title,
                                            UIFont *_Nullable font,
                                            UIColor *_Nullable color,
                                            UIControlState state){
        @jobs_strongify(self)
        NSMutableDictionary<NSAttributedStringKey, id> *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = font ?: [UIFont systemFontOfSize:[UIFont buttonFontSize]];
        if (color) attrs[NSForegroundColorAttributeName] = color;
        NSAttributedString *attr = [[NSAttributedString alloc] initWithString:title ?: @"" attributes:attrs];
        [self setAttributedTitle:attr forState:state];
        return self;
    };
}

-(JobsRetButtonNodeImageByConfigBlock _Nonnull)byImage {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIImage *_Nonnull image, UIControlState state){
        @jobs_strongify(self)
        if (image) [self setImage:image forState:state];
        return self;
    };
}

-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byContentEdgeInsets {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIEdgeInsets insets){
        @jobs_strongify(self)
        self.contentEdgeInsets = insets;
        return self;
    };
}

-(JobsRetButtonNodeByBackgroundColorsBlock _Nonnull)byBackgroundColor {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

-(JobsRetButtonNodeByCornerRadiusBlock _Nonnull)byCornerRadius {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(CGFloat radius){
        @jobs_strongify(self)
        self.cornerRadius = radius;
        return self;
    };
}

-(JobsRetButtonNodeByHitTestSlopBlock _Nonnull)byHitTestSlop {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(UIEdgeInsets slop){
        @jobs_strongify(self)
        self.hitTestSlop = slop;
        return self;
    };
}
/// 短按（点击）封装
-(JobsRetButtonNodeByOnClickBlock _Nonnull)onClickBy {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(jobsByButtonNodeBlock _Nullable handler){
        @jobs_strongify(self)
        // 存 Handler
        objc_setAssociatedObject(self, kJobsButtonTapBlockKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
        // 先移除后绑定，避免重复
        [self removeTarget:self action:@selector(_jobs_handleTap:) forControlEvents:ASControlNodeEventTouchUpInside];
        [self addTarget:self action:@selector(_jobs_handleTap:) forControlEvents:ASControlNodeEventTouchUpInside];
        return self;
    };
}

-(void)_jobs_handleTap:(__unused ASButtonNode *)sender {
    jobsByButtonNodeBlock block = objc_getAssociatedObject(self, kJobsButtonTapBlockKey);
    if (block) block(self);
}
/// 长按封装（默认 & 自定义）
-(JobsRetButtonNodeByOnLongPressBlock _Nonnull)onLongPressGestureBy {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(jobsByButtonNodeLongPressBlock _Nullable handler){
        @jobs_strongify(self)
        return self.onLongPressGestureWith(0.5, 10.0, handler); // 默认参数
    };
}

-(JobsRetButtonNodeByOnLongPressWithTimeBlock _Nonnull)onLongPressGestureWith {
    @jobs_weakify(self)
    return ^__kindof ASButtonNode *_Nonnull(NSTimeInterval minDuration,
             CGFloat allowableMovement,
             jobsByButtonNodeLongPressBlock _Nullable handler){
        @jobs_strongify(self)
        // 存 Handler
        objc_setAssociatedObject(self, kJobsButtonLongPressBlockKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
        // 取/建 GR（只加一次）
        UILongPressGestureRecognizer *gr = objc_getAssociatedObject(self, kJobsButtonLongPressGRKey);
        if (!gr) {
            gr = [UILongPressGestureRecognizer.alloc initWithTarget:self action:@selector(_jobs_handleLongPress:)];
            objc_setAssociatedObject(self, kJobsButtonLongPressGRKey, gr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            // ⚠️ 需要 view，直接访问会触发 loadView：在 DSL 场景可接受
            [self.view addGestureRecognizer:gr];
        }
        gr.minimumPressDuration = MAX(0.0, minDuration);
        gr.allowableMovement   = MAX(0.0, allowableMovement);

        return self;
    };
}

-(void)_jobs_handleLongPress:(UILongPressGestureRecognizer *)gr {
    if (gr.state != UIGestureRecognizerStateBegan) return;
    jobsByButtonNodeLongPressBlock block = objc_getAssociatedObject(self, kJobsButtonLongPressBlockKey);
    if (block) block(self, gr);
}

@end
