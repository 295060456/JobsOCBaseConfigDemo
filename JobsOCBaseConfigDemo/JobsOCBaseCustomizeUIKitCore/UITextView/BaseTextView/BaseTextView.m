//
//  BaseTextView.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/27.
//

#import "BaseTextView.h"

@interface BaseTextView ()

@end

@implementation BaseTextView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIMenuController *menu = UIMenuController.sharedMenuController;
        @jobs_weakify(self)
        UIMenuItem *copyItem = [UIMenuItem.alloc initWithTitle:JobsInternationalization(@"相应事件")
                                                        action:[self selectorBlocks:^id _Nullable(id _Nullable weakSelf,
                                                                                                  id _Nullable arg) {
            @jobs_strongify(self)
            if (self.returnIDBySelectorBlock) self.returnIDBySelectorBlock(weakSelf,arg);
            return nil;
        } selectorName:nil target:self]];
        
        [menu setMenuItems:@[copyItem]];
        [menu update];
        
        if(@available(iOS 10.3, *)){
            [menu showMenuFromView:self rect:self.bounds];
        }else{
            SuppressWdeprecatedDeclarationsWarning([menu setTargetRect:self.bounds inView:self];
                                                   [menu setMenuVisible:YES animated:YES];);
        }
#pragma clang diagnostic pop
    }return self;
}

#pragma mark —— UIResponder
-(BOOL)canPerformAction:(SEL)action
              withSender:(id)sender{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if(!sender) return NO;
    if([sender isKindOfClass:UIMenuController.class] || [sender isKindOfClass:UIMenu.class]){// _UIImmutableKeyCommand
        if(action == @selector(cut:) ||/// 剪切
           action == @selector(copy:) ||/// 拷贝
           action == @selector(paste:) ||/// 粘贴
           action == @selector(delete:) ||/// 简 <==> 繁
           action == @selector(select:) ||///
           action == @selector(selectAll:) ||///
           action == @selector(_promptForReplace:) ||
           action == @selector(_transliterateChinese:) ||
           action == @selector(_insertDrawing:) ||
           action == @selector(captureTextFromCamera:) ||
           action == @selector(toggleBoldface:) ||
           action == @selector(toggleItalics:) ||
           action == @selector(toggleUnderline:) ||
           action == @selector(makeTextWritingDirectionRightToLeft:) ||
           action == @selector(makeTextWritingDirectionLeftToRight:) ||
           action == @selector(_findSelected:) ||
           action == @selector(_define:) ||
           action == @selector(_translate:) ||/// 翻译
           action == @selector(_addShortcut:) ||
           action == @selector(_accessibilitySpeak:) ||
           action == @selector(_accessibilitySpeakLanguageSelection:) ||
           action == @selector(_accessibilityPauseSpeaking:) ||
           action == @selector(_share:)){/// 共享
            return NO;
        }else if ([NSStringFromSelector(action) containsString:JobsInternationalization(@"")]){
            return YES;
        }else{
            return NO;
        }
    }else {
        return YES;
    }
#pragma clang diagnostic pop
}

@end
