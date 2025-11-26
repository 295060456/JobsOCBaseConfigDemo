//
//  UIControl+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 11/26/25.
//

#import "UIControl+DSL.h"
/// 内部闭包包装器
@interface _JobsClosureWrapper : NSObject
Prop_copy()JobsControlHandler handler;
-(instancetype)initWithHandler:(JobsControlHandler)handler;
-(void)invoke:(UIControl *)sender;
@end

@implementation _JobsClosureWrapper

- (instancetype)initWithHandler:(JobsControlHandler)handler {
    if ( self = [super init]) {
        _handler = [handler copy];
    }return self;
}

- (void)invoke:(UIControl *)sender {
    if (self.handler) {
        self.handler(sender);
    }
}

@end
/// 辅助函数：注册事件 + Block
static void JobsAddClosureAction(UIControl *control,
                                 UIControlEvents events,
                                 JobsControlHandler handler) {
    if (!control || !handler) return;
    _JobsClosureWrapper *wrapper = [_JobsClosureWrapper.alloc initWithHandler:handler];
    NSString *key = [NSString stringWithFormat:@"[[jobs_event_%lu]]",(unsigned long)events];
    objc_setAssociatedObject(control,
                             (__bridge const void *)(key),
                             wrapper,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [control addTarget:wrapper
                action:@selector(invoke:)
      forControlEvents:events];
}

@implementation UIControl (DSL)

-(JobsRetControlByHandlerBlock)onJobsTap {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (JobsControlHandler handler) {
        @jobs_strongify(self)
        if (!handler) return self;
        JobsAddClosureAction(self, UIControlEventTouchUpInside, handler);
        return self;
    };
}

-(JobsRetControlByHandlerBlock)onJobsChange {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (JobsControlHandler handler) {
        @jobs_strongify(self)
        if (!handler) return self;
        JobsAddClosureAction(self, UIControlEventValueChanged, handler);
        return self;
    };
}

-(JobsRetControlByEventsHandlerBlock)onJobsEvent {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events,
                                            JobsControlHandler handler) {
        @jobs_strongify(self)
        if (!handler) return self;
        JobsAddClosureAction(self, events, handler);
        return self;
    };
}

#pragma mark - 基础状态

- (JobsRetControlByBOOLBlock)byEnabled {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.enabled = value;
        return self;
    };
}

- (JobsRetControlByBOOLBlock)bySelected {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.selected = value;
        return self;
    };
}

- (JobsRetControlByBOOLBlock)byHighlighted {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.highlighted = value;
        return self;
    };
}

#pragma mark - 内容对齐

- (JobsRetControlByAlignBlock)byContentAlignment {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlContentHorizontalAlignment horizontal,
                                            UIControlContentVerticalAlignment vertical) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentHorizontalAlignment = horizontal;
        self.contentVerticalAlignment   = vertical;
        return self;
    };
}

- (JobsRetControlByHorizontalAlignBlock)byContentHorizontalAlignment {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlContentHorizontalAlignment horizontal) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentHorizontalAlignment = horizontal;
        return self;
    };
}

- (JobsRetControlByVerticalAlignBlock)byContentVerticalAlignment {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlContentVerticalAlignment vertical) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentVerticalAlignment = vertical;
        return self;
    };
}

-(JobsRetControlByTargetActionEventsBlock)byAddTarget {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (__kindof id target,
                                            SEL action,
                                            UIControlEvents events) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self addTarget:target action:action forControlEvents:events];
        return self;
    };
}

-(JobsRetControlByTargetActionEventsBlock)byRemoveTarget {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (__kindof id target,
                                            SEL action,
                                            UIControlEvents events) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self removeTarget:target action:action forControlEvents:events];
        return self;
    };
}

-(JobsRetControlByEventsBlock)bySendActions {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events) {
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendActionsForControlEvents:events];
        return self;
    };
}

-(JobsRetControlByActionEventsBlock)byAddAction API_AVAILABLE(ios(14.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIAction *action,
                                            UIControlEvents events) {
        @jobs_strongify(self)
        if (!self) return nil;

        if (@available(iOS 14.0, *)) {
            if (action) {
                [self addAction:action forControlEvents:events];
            }
        }return self;
    };
}

-(JobsRetControlByActionEventsBlock)byRemoveAction API_AVAILABLE(ios(14.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIAction *action,
                                            UIControlEvents events) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)) {
            if (action) [self removeAction:action forControlEvents:events];
        }return self;
    };
}

-(JobsRetControlByIdentifierEventsBlock)byRemoveActionByIdentifier API_AVAILABLE(ios(14.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIActionIdentifier identifier,
                                            UIControlEvents events) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)) {
            [self removeActionForIdentifier:identifier forControlEvents:events];
        }return self;
    };
}

-(JobsRetControlByEventsIdentifierActionHandlerBlock)byOn API_AVAILABLE(ios(14.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (UIControlEvents events,
                                            UIActionIdentifier _Nullable identifier,
                                            void(^handler)(UIAction *action)) {
        @jobs_strongify(self)
        if (!handler) return self;
        if (@available(iOS 14.0, *)) {
            UIAction *action = nil;
            if (identifier.length > 0) {
                action = [UIAction actionWithTitle:@""
                                             image:nil
                                        identifier:identifier
                                          handler:handler];
            } else {
                action = [UIAction actionWithHandler:handler];
            }[self addAction:action forControlEvents:events];
        }return self;
    };
}

-(JobsRetControlByVoidBlock)byPerformPrimaryAction API_AVAILABLE(ios(17.4)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (void) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 17.4, *)) {
            [self performPrimaryAction];
        }return self;
    };
}

-(JobsRetControlByBOOLBlock)byShowsMenuAsPrimaryAction API_AVAILABLE(ios(14.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)) {
            self.showsMenuAsPrimaryAction = value;
        }return self;
    };
}

-(JobsRetControlByBOOLBlock)byContextMenuEnabled API_AVAILABLE(ios(14.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 14.0, *)) {
            self.contextMenuInteractionEnabled = value;
        }return self;
    };
}

-(JobsRetControlByStringBlock)byToolTip API_AVAILABLE(ios(15.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (NSString * _Nullable text) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 15.0, *)) {
            self.toolTip = text;
        }return self;
    };
}

-(JobsRetControlByBOOLBlock)bySymbolAnimationEnabled API_AVAILABLE(ios(17.0)) {
    @jobs_weakify(self)
    return ^__kindof UIControl * _Nullable (BOOL value) {
        @jobs_strongify(self)
        if (!self) return nil;
        if (@available(iOS 17.0, *)) {
            self.symbolAnimationEnabled = value;
        }return self;
    };
}

@end
