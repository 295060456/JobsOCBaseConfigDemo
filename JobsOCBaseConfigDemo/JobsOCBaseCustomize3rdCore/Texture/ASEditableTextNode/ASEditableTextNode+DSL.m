//
//  ASEditableTextNode+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Mac on 11/6/25.
//

#import "ASEditableTextNode+DSL.h"

static const void *kJobsETNBeginTokenKey     = &kJobsETNBeginTokenKey;
static const void *kJobsETNChangeTokenKey    = &kJobsETNChangeTokenKey;
static const void *kJobsETNEndTokenKey       = &kJobsETNEndTokenKey;
static const void *kJobsETNBeginBlockKey     = &kJobsETNBeginBlockKey;
static const void *kJobsETNChangeBlockKey    = &kJobsETNChangeBlockKey;
static const void *kJobsETNEndBlockKey       = &kJobsETNEndBlockKey;

@implementation ASEditableTextNode (DSL)

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byScrollEnabled {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (BOOL flag) {
        @jobs_strongify(self)
        self.scrollEnabled = flag;
        return self;
    };
}

-(JobsRetEditableTextNodeByDictBlock _Nonnull)byTypingAttributes {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSDictionary<NSString*, id> *attrs) {
        @jobs_strongify(self)
        self.typingAttributes = attrs;
        return self;
    };
}

-(JobsRetEditableTextNodeByRangeBlock _Nonnull)bySelectedRange {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSRange range) {
        @jobs_strongify(self)
        self.selectedRange = range;
        return self;
    };
}

-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byPlaceholder {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSAttributedString *text) {
        @jobs_strongify(self)
        self.attributedPlaceholderText = text;
        return self;
    };
}

-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byText {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSAttributedString *text) {
        @jobs_strongify(self)
        self.attributedText = text;
        return self;
    };
}

-(JobsRetEditableTextNodeByInsetsBlock _Nonnull)byTextContainerInset {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIEdgeInsets insets) {
        @jobs_strongify(self)
        self.textContainerInset = insets;
        return self;
    };
}

-(JobsRetEditableTextNodeByUIntBlock _Nonnull)byMaximumLinesToDisplay {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (NSUInteger value) {
        @jobs_strongify(self)
        self.maximumLinesToDisplay = value;
        return self;
    };
}

-(JobsRetEditableTextNodByeAutocapBlock _Nonnull)byAutocapitalizationType {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UITextAutocapitalizationType t) {
        @jobs_strongify(self)
        self.autocapitalizationType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByAutocorrBlock _Nonnull)byAutocorrectionType {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UITextAutocorrectionType t) {
        @jobs_strongify(self)
        self.autocorrectionType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeBySpellBlock _Nonnull)bySpellCheckingType {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UITextSpellCheckingType t) {
        @jobs_strongify(self)
        self.spellCheckingType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByKeyboardTypeBlock _Nonnull)byKeyboardType {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIKeyboardType t) {
        @jobs_strongify(self)
        self.keyboardType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIKeyboardAppearance t) {
        @jobs_strongify(self)
        self.keyboardAppearance = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByReturnKeyBlock _Nonnull)byReturnKeyType {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (UIReturnKeyType t) {
        @jobs_strongify(self)
        self.returnKeyType = t;
        return self;
    };
}

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byEnablesReturnKeyAutomatically {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (BOOL flag) {
        @jobs_strongify(self)
        self.enablesReturnKeyAutomatically = flag;
        return self;
    };
}

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)bySecureTextEntry {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (BOOL flag) {
        @jobs_strongify(self)
        self.secureTextEntry = flag;
        return self;
    };
}

-(JobsRetEditableTextNodeByTextViewBlock _Nonnull)byTextView {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (jobsByTextViewBlock cfg) {
        @jobs_strongify(self)
        if (cfg) {
            cfg(self.textView);// 触发 view 加载，拿到内部 UITextView
        }return self;
    };
}
/// 事件（Begin / Change / End）
-(JobsRetEditableTextNodeByOnBeginBlock _Nonnull)onBeginEditingBy {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler) {
        @jobs_strongify(self)
        objc_setAssociatedObject(self,
                                 kJobsETNBeginBlockKey,
                                 handler,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);

        id token = objc_getAssociatedObject(self, kJobsETNBeginTokenKey);
        if (token) {
            [NSNotificationCenter.defaultCenter removeObserver:token];
            objc_setAssociatedObject(self,
                                     kJobsETNBeginTokenKey,
                                     nil,
                                     OBJC_ASSOCIATION_ASSIGN);
        }
        UITextView *tv = self.textView; // 触发 view
        if (handler && tv) {
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidBeginEditingNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note) {
                JobsEditableTextEventBlock blk = objc_getAssociatedObject(self, kJobsETNBeginBlockKey);
                if (blk) blk(self, tv);
            }];
            objc_setAssociatedObject(self,
                                     kJobsETNBeginTokenKey,
                                     newToken,
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }return self;
    };
}

-(JobsRetEditableTextNodeByOnChangeBlock _Nonnull)onTextChangeBy {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler) {
        @jobs_strongify(self)
        objc_setAssociatedObject(self,
                                 kJobsETNChangeBlockKey,
                                 handler,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);

        id token = objc_getAssociatedObject(self, kJobsETNChangeTokenKey);
        if (token) {
            [[NSNotificationCenter defaultCenter] removeObserver:token];
            objc_setAssociatedObject(self,
                                     kJobsETNChangeTokenKey,
                                     nil,
                                     OBJC_ASSOCIATION_ASSIGN);
        }
        UITextView *tv = self.textView;
        if (handler && tv) {
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidChangeNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note) {
                JobsEditableTextEventBlock blk = objc_getAssociatedObject(self, kJobsETNChangeBlockKey);
                if (blk) blk(self, tv);
            }];
            objc_setAssociatedObject(self,
                                     kJobsETNChangeTokenKey,
                                     newToken,
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return self;
    };
}

-(JobsRetEditableTextNodeByOnEndBlock _Nonnull)onEndEditingBy {
    @jobs_weakify(self)
    return ^ASEditableTextNode* (JobsEditableTextEventBlock handler) {
        @jobs_strongify(self)
        objc_setAssociatedObject(self,
                                 kJobsETNEndBlockKey,
                                 handler,
                                 OBJC_ASSOCIATION_COPY_NONATOMIC);

        id token = objc_getAssociatedObject(self, kJobsETNEndTokenKey);
        if (token) {
            [[NSNotificationCenter defaultCenter] removeObserver:token];
            objc_setAssociatedObject(self,
                                     kJobsETNEndTokenKey,
                                     nil,
                                     OBJC_ASSOCIATION_ASSIGN);
        }
        UITextView *tv = self.textView;
        if (handler && tv) {
            id newToken = [NSNotificationCenter.defaultCenter
                           addObserverForName:UITextViewTextDidEndEditingNotification
                           object:tv
                           queue:NSOperationQueue.mainQueue
                           usingBlock:^(__unused NSNotification * _Nonnull note) {
                JobsEditableTextEventBlock blk = objc_getAssociatedObject(self, kJobsETNEndBlockKey);
                if (blk) blk(self, tv);
            }];
            objc_setAssociatedObject(self,
                                     kJobsETNEndTokenKey,
                                     newToken,
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }return self;
    };
}

@end
