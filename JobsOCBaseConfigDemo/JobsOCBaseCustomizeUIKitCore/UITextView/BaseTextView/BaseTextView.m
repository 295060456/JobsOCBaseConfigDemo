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
@synthesize becomeFirstResponder = _becomeFirstResponder;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        @jobs_weakify(self)
        UIMenuController *menu = jobsMakeMenuController(^(__kindof UIMenuController * _Nullable menu) {
            menu.menuItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data.add(JobsInternationalization(@"响应事件").initMenuItemBy(selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                                                       id _Nullable arg) {
                    @jobs_strongify(self)
                    if (self.retIDBySelectorBlock) self.retIDBySelectorBlock(weakSelf,arg);
                    return nil;
                }, MethodName(self), self)));
            });
        });
        [menu update];
        if(@available(iOS 10.3, *)){
            [menu showMenuFromView:self rect:self.bounds];
        }else{
            [menu setTargetRect:self.bounds inView:self];
            [menu setMenuVisible:YES animated:YES];
        }
#pragma clang diagnostic pop
    }return self;
}
#pragma mark —— UIResponder
-(BOOL)canBecomeFirstResponder {
    return self.becomeFirstResponder; /// NO:禁止成为第一响应者，彻底禁用菜单
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if(!sender) return NO;
    if([sender isKindOfClass:UIMenuController.class] || [sender isKindOfClass:UIMenu.class]){// _UIImmutableKeyCommand
        if (action == @selector(cut:) || /// 剪切
            action == @selector(copy:) || /// 拷贝
            action == @selector(paste:) || /// 粘贴
            action == @selector(delete:) || /// 删除
            action == @selector(select:) || /// 选择
            action == @selector(selectAll:) || /// 全选
            action == @selector(_promptForReplace:) || /// 替换
            action == @selector(_transliterateChinese:) || /// 中文简繁转换
            action == @selector(_insertDrawing:) || /// 插入绘图
            action == @selector(captureTextFromCamera:) || /// 从相机捕获文本
            action == @selector(toggleBoldface:) || /// 加粗
            action == @selector(toggleItalics:) || /// 斜体
            action == @selector(toggleUnderline:) || /// 下划线
            action == @selector(makeTextWritingDirectionRightToLeft:) || /// 从右到左
            action == @selector(makeTextWritingDirectionLeftToRight:) || /// 从左到右
            action == @selector(_findSelected:) || /// 查找
            action == @selector(_define:) || /// 定义
            action == @selector(_translate:) || // 翻译
            action == @selector(_addShortcut:) || /// 添加快捷方式
            action == @selector(_accessibilitySpeak:) || // 辅助语音
            action == @selector(_accessibilitySpeakLanguageSelection:) || /// 辅助语音语言选择
            action == @selector(_accessibilityPauseSpeaking:) || /// 暂停语音
            action == @selector(_share:)) {/// 共享
            return NO;
        }else if ([NSStringFromSelector(action) containsString:JobsInternationalization(@"")]){
            return YES;
        }else return NO;
    }else return YES;
#pragma clang diagnostic pop
}

@end
