//
//  UITabBar+TLAnimation.m
//  TabBar
//
//  Created by 故乡的云 on 2019/7/19.
//  Copyright © 2019 故乡的云. All rights reserved.
//

#import "UITabBar+TLAnimation.h"

@implementation UITabBar (TLAnimation)

+(void)load {
    @synchronized(self){
        MethodSwizzle(UITabBar.class,
                      @selector(setSelectedItem:),
                      @selector(tl_setSelectedItem:));
    }
}

- (void)didAddSubview:(UIView *)subview {//这里的UIView *subview，其实就是UITabBarButton *，只不过UITabBarButton *是内部类未暴露
    if ([self isMemberOfClass:UITabBar.class]) {
        if ([subview isMemberOfClass:NSClassFromString(UITabBarButton)] ||// 原生
            [subview isMemberOfClass:NSClassFromString(@"UIButton")]){// 自定义Button
            self.btns.add(subview);
        }
    }
    
    // 使用方法交换时出现错误，用此方法替代
    SEL sel = NSSelectorFromString(@"tl_didAddSubview:");
    if([self respondsToSelector:sel]) {
        [self performSelector:sel
                   withObject:subview
                   afterDelay:0];
    }
}
/// UITabBarItem选中监听
- (void)tl_setSelectedItem:(UITabBarItem *)selectedItem {
    NSUInteger index = [self.items indexOfObject:selectedItem];
    NSUInteger previousIndex = self.selectedIndex;
    if (previousIndex != index && self.btns.count > index) {
        // 撤销选中动画
        id <TLAnimationProtocol> deselectAnimation = self.items[previousIndex].animation;
        SEL sel = @selector(playDeselectAnimationWhitTabBarButton:buttonImageView:buttonTextLabel:);
        if (deselectAnimation && [deselectAnimation respondsToSelector:sel]) {
            if ([deselectAnimation respondsToSelector:@selector(setToRight:)]) {
                deselectAnimation.toRight = previousIndex < index;
            }
            [deselectAnimation playDeselectAnimationWhitTabBarButton:self.btns[previousIndex]
                                                     buttonImageView:imageView(self.btns[previousIndex])
                                                     buttonTextLabel:textLabel(self.btns[previousIndex])];
        }
        
        // 选中动画
        id <TLAnimationProtocol> selectAnimation = self.items[index].animation;
        if (selectAnimation) {
            if ([deselectAnimation respondsToSelector:@selector(setFromLeft:)]) {
                deselectAnimation.fromLeft = previousIndex < index;
            }
            [selectAnimation playSelectAnimationWhitTabBarButton:self.btns[index]
                                                 buttonImageView:imageView(self.btns[index])
                                                 buttonTextLabel:textLabel(self.btns[index])];
        }
        self.selectedIndex = index;
    }
    [self tl_setSelectedItem:selectedItem];
}
#pragma mark —— 一些私有方法
UILabel *textLabel(UIView *btn) {
    if ([btn isMemberOfClass:NSClassFromString(UITabBarButton)]) {
        if (@available(iOS 13.0, *)) {
            for (UIView *subView in btn.subviews) {
                if ([subView isKindOfClass:NSClassFromString(UITabBarButtonLabel)]) {
                    return (UILabel *)subView;
                }
            }return nil;
        }return [btn valueForKeyPath:@"_label"];
    }else if([btn isKindOfClass:NSClassFromString(@"UIButton")]) {
        return [(UIButton *)btn titleLabel];
    }return nil;
}

UIImageView *imageView(UIView *btn) {
    if ([btn isMemberOfClass:NSClassFromString(UITabBarButton)]) {
        if (@available(iOS 13.0, *)) {
            for (UIView *subView in btn.subviews) {
                if ([subView isKindOfClass:NSClassFromString(UITabBarSwappableImageView)]) {
                    return (UIImageView *)subView;
                }
            }return nil;
        }return [btn valueForKeyPath:@"_info"];
    }else if([btn isKindOfClass:NSClassFromString(@"UIButton")]) {
        return [(UIButton *)btn imageView];
    }return nil;
}
#pragma mark —— @property(nonatomic,copy,readonly)NSMutableArray *btns;
JobsKey(_btns)
@dynamic btns;
-(void)setBtns:(NSMutableArray *)btns{
    Jobs_setAssociatedRETAIN_NONATOMIC(_btns, btns);
}

-(NSMutableArray *)btns{
    NSMutableArray *Btns = Jobs_getAssociatedObject(_btns);
    if (!Btns) {
        Btns = NSMutableArray.array;
        self.selectedIndex = 0;
        Jobs_setAssociatedRETAIN_NONATOMIC(_btns, Btns);
    }return Btns;
}
#pragma mark —— @property(nonatomic,assign,readonly)NSUInteger selectedIndex;
JobsKey(_selectedIndex)
@dynamic selectedIndex;
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    Jobs_setAssociatedRETAIN_NONATOMIC(_selectedIndex, @(selectedIndex));
}

-(NSUInteger)selectedIndex{
    return [Jobs_getAssociatedObject(_selectedIndex) unsignedIntegerValue];
}

@end




