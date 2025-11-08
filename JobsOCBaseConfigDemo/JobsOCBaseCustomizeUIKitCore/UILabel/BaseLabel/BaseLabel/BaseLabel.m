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
UILocationProtocol_synthesize
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
            self.weak_target = self;
            self.userInteractionEnabled = YES;
            @jobs_weakify(self)
            self.longPressGR_SelImp.selector = selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                            id _Nullable arg) {
                @jobs_strongify(self)
                if (self.retIDByGestureRecognizerBlock) self.retIDByGestureRecognizerBlock(arg);
                return nil;
            }, MethodName(self), self);
            self.tapGR_SelImp.selector = selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                      id _Nullable arg) {
                @jobs_strongify(self)
                if (self.retIDByGestureRecognizerBlock) self.retIDByGestureRecognizerBlock(arg);
                return nil;
            }, MethodName(self), self);
        }
    }return self;
}
#pragma mark —— 一些公有方法
/// UILabel文字的复制
-(jobsByStrBlock _Nonnull)copyText{
    return ^(NSString *_Nullable text){
        text.pasteboard();
        JobsLog(@"%@%@",JobsInternationalization(@"复制的文字："),text);
    };
}
/// 弹出系统菜单控件
-(jobsByStrBlock _Nonnull)makeMenuCtrl{
    @jobs_weakify(self)
    return ^(NSString *_Nullable text) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            // 使用 UIEditMenuInteraction
            UIEditMenuInteraction *menuInteraction = UIEditMenuInteraction.initBy(self);
            [self addInteraction:menuInteraction];
            // 定义菜单项
            UIMenu *menu = [UIMenu menuWithTitle:@""
                                        children:@[
                [UIAction actionWithTitle:JobsInternationalization(@"请复制")
                                   image:nil
                              identifier:nil
                                 handler:^(__kindof UIAction * _Nonnull action) {
                    @jobs_strongify(self)
                    if (self.retIDBySelectorBlock) self.retIDBySelectorBlock(self, text);
                    self.copyText(text);
                }]
            ]];
            // 创建配置
            CGPoint sourcePoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
            UIEditMenuConfiguration *configuration = [UIEditMenuConfiguration configurationWithIdentifier:@"customMenu"
                                                                                               sourcePoint:sourcePoint];
            // 展示菜单
            [menuInteraction presentEditMenuWithConfiguration:configuration];
        } else {
            // 使用 UIMenuController（适配 iOS 16 以下版本）
            UIMenuController.sharedMenuController.menuItems = nil;
            UIMenuController *menu = jobsMakeMenuController(^(__kindof UIMenuController * _Nullable menu) {
                menu.menuItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                    data.add(JobsInternationalization(@"请复制").initMenuItemBy(selectorBlocks(^id _Nullable(id _Nullable weakSelf,
                                                                                                          id _Nullable arg) {
                        @jobs_strongify(self)
                        if (self.retIDBySelectorBlock) self.retIDBySelectorBlock(weakSelf, arg);
                        self.copyText(text);
                        return nil;
                    }, @"copyText", self)));
                });
            });
            [menu update];
            if (@available(iOS 10.3, *)) {
                [menu showMenuFromView:self rect:self.bounds];
            } else {
                #pragma clang diagnostic push
                #pragma clang diagnostic ignored "-Wdeprecated-declarations"
                [menu setTargetRect:self.bounds inView:self];
                [menu setMenuVisible:YES animated:YES];
                #pragma clang diagnostic pop
            }
        }
    };
}
#pragma mark —— UIEditMenuInteractionDelegate
#pragma mark —— UIResponder
-(BOOL)canPerformAction:(SEL)action
              withSender:(id)sender{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    if([sender isKindOfClass:UIMenuController.class]){
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
            action == @selector(_translate:) || /// 翻译
            action == @selector(_addShortcut:) || /// 添加快捷方式
            action == @selector(_accessibilitySpeak:) || /// 辅助语音
            action == @selector(_accessibilitySpeakLanguageSelection:) || /// 辅助语音语言选择
            action == @selector(_accessibilityPauseSpeaking:) || /// 暂停语音
            action == @selector(_share:)) {/// 共享
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
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}
/// 修改绘制文字的区域，edgeInsets增加bounds
-(CGRect)textRectForBounds:(CGRect)bounds
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
-(void)drawTextInRect:(CGRect)rect{
    CGRect newRect = rect;
    newRect.origin.y += self.jobsOffsetX;
    newRect.origin.x += self.jobsOffsetY;
    if (isValue(self.text)) {
        [super drawTextInRect:UIEdgeInsetsInsetRect(newRect, self.edgeInsets)];
        self.isVisible = YES;
    } else {
        [super drawTextInRect:UIEdgeInsetsInsetRect(newRect, UIEdgeInsetsZero)];
        self.isVisible = NO;
    }
}
#pragma mark —— LazyLoad

@end
