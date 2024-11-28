//
//  AutoScrollLabel.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import "BaseLabel.h"

@interface BaseLabel ()

@end

@implementation BaseLabel
UILocationProtocol_UIViewModelSynthesize
-(instancetype)init{
    if (self = [super init]) {
        
    }return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        {/// 配置相关手势
            self.numberOfTouchesRequired = 1;
            self.numberOfTapsRequired = 1;/// ⚠️注意：如果要设置长按手势，此属性必须设置为0⚠️
            self.minimumPressDuration = 0.1;
            self.numberOfTouchesRequired = 1;
            self.allowableMovement = 1;
            self.target = self;
            self.userInteractionEnabled = YES;
            @jobs_weakify(self)
            self.longPressGR_SelImp.selector = selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                            id _Nullable arg) {
                @jobs_strongify(self)
                if (self.returnObjectByGestureRecognizerBlock) self.returnObjectByGestureRecognizerBlock(arg);
                return nil;
            }, MethodName(self), self);
            self.tapGR_SelImp.selector = selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                      id _Nullable arg) {
                @jobs_strongify(self)
                if (self.returnObjectByGestureRecognizerBlock) self.returnObjectByGestureRecognizerBlock(arg);
                return nil;
            }, MethodName(self), self);
        }
    }return self;
}
#pragma mark —— 一些私有方法

#pragma mark —— 一些公有方法
/// UILabel文字的复制
-(jobsByStringBlock _Nonnull)copyText{
    return ^(NSString *_Nullable text){
        text.pasteboard();
        NSLog(@"%@%@",JobsInternationalization(@"复制的文字："),text);
    };
}
/// 弹出系统菜单控件
-(jobsByStringBlock _Nonnull)makeMenuCtrl{
    @jobs_weakify(self)
    return ^(NSString *_Nullable text){
        @jobs_strongify(self)
        UIMenuController.sharedMenuController.menuItems = nil;
        UIMenuController *menu = UIMenuController.sharedMenuController;
        @jobs_weakify(self)
        UIMenuItem *copyItem = [UIMenuItem.alloc initWithTitle:JobsInternationalization(@"请复制")
                                                        action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                                            id _Nullable arg) {
            @jobs_strongify(self)
            if (self.returnIDBySelectorBlock) self.returnIDBySelectorBlock(weakSelf,arg);
            self.copyText(text);
            return nil;
        }, @"copyText", self)];
        menu.menuItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            data.add(copyItem);
        });
        [menu update];
        if(@available(iOS 10.3, *)){
            [menu showMenuFromView:self rect:self.bounds];
        }else{
            SuppressWdeprecatedDeclarationsWarning([menu setTargetRect:self.bounds inView:self];
                                                   [menu setMenuVisible:YES animated:YES];);
        }
    };
}
#pragma mark —— UIResponder
-(BOOL)canPerformAction:(SEL)action
              withSender:(id)sender{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if([sender isKindOfClass:UIMenuController.class]){
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
        }else if ([NSStringFromSelector(action) containsString:@"copyText"]){
            return YES;
        }else return NO;
    }else return YES;
#pragma clang diagnostic pop
}
#pragma mark —— UIGestureRecognizerDelegate
/// 解决 UITableViewCell和手势冲突 https://blog.csdn.net/FreeTourW/article/details/51911416
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch {
    return !NSStringFromClass(touch.view.class).isEqualToString(@"UITableViewCellContentView");
}
#pragma mark —— 复写相关父类方法
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}
/// 修改绘制文字的区域，edgeInsets增加bounds
- (CGRect)textRectForBounds:(CGRect)bounds
     limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, self.edgeInsets)
                    limitedToNumberOfLines:numberOfLines];
    rect.origin.x -= self.edgeInsets.left;
    rect.origin.y -= self.edgeInsets.top;
    rect.size.width += self.edgeInsets.left + self.edgeInsets.right;
    rect.size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return rect;
}
/// 绘制文字
- (void)drawTextInRect:(CGRect)rect {
    CGRect newRect = rect;
    newRect.origin.y += self.jobsOffsetX;
    newRect.origin.x += self.jobsOffsetY;
    
    if (self.text && ![self.text isEqualToString:JobsInternationalization(@"")]) {
        [super drawTextInRect:UIEdgeInsetsInsetRect(newRect, self.edgeInsets)];
        self.isVisible = YES;
    } else {
        [super drawTextInRect:UIEdgeInsetsInsetRect(newRect, UIEdgeInsetsZero)];
        self.isVisible = NO;
    }
}
#pragma mark —— LazyLoad

@end
