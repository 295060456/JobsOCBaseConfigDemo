//
//  JobsScale.m
//  FM
//
//  Created by Mac on 9/22/25.
//

#import "JobsScale.h"

@interface JobsScale : NSObject

Prop_assign()CGFloat designW;
Prop_assign()CGFloat designH;
Prop_assign()BOOL useSafeArea;
Prop_assign(readonly)CGFloat scaleX;
Prop_assign(readonly)CGFloat scaleY;

@end

@implementation JobsScale

- (CGFloat)screenWidth {
    if (@available(iOS 13.0, *)) {
        // 优先取当前活动窗口的尺寸
        for (UIWindowScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *win in scene.windows) {
                    if (win.isKeyWindow) {
                        if (self.useSafeArea) {
                            UIEdgeInsets insets = win.safeAreaInsets;
                            return MAX(0, win.bounds.size.width - (insets.left + insets.right));
                        }
                        return win.bounds.size.width;
                    }
                }
            }
        }
    }
    CGSize size = UIScreen.mainScreen.bounds.size;
    if (self.useSafeArea) {
        UIEdgeInsets insets = UIApplication.sharedApplication.keyWindow.safeAreaInsets;
        return MAX(0, size.width - (insets.left + insets.right));
    }
    return size.width;
}

- (CGFloat)screenHeight {
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *win in scene.windows) {
                    if (win.isKeyWindow) {
                        if (self.useSafeArea) {
                            UIEdgeInsets insets = win.safeAreaInsets;
                            return MAX(0, win.bounds.size.height - (insets.top + insets.bottom));
                        }
                        return win.bounds.size.height;
                    }
                }
            }
        }
    }
    CGSize size = UIScreen.mainScreen.bounds.size;
    if (self.useSafeArea) {
        UIEdgeInsets insets = UIApplication.sharedApplication.keyWindow.safeAreaInsets;
        return MAX(0, size.height - (insets.top + insets.bottom));
    }
    return size.height;
}

- (CGFloat)scaleX {
    if (self.designW <= 0) return 1.0;
    return [self screenWidth] / self.designW;
}

- (CGFloat)scaleY {
    if (self.designH <= 0) return 1.0;
    return [self screenHeight] / self.designH;
}

@end

/// 单例容器
static JobsScale *_box = nil;

/// 入口配置
void JXScaleSetup(CGFloat designWidth, CGFloat designHeight) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _box = [JobsScale new];
    });
    _box.designW = designWidth > 0 ? designWidth : 375.0;
    _box.designH = designHeight > 0 ? designHeight : 812.0;
    _box.useSafeArea = NO;
}

void JXScaleSetupUsingSafeArea(CGFloat designWidth, CGFloat designHeight) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _box = [JobsScale new];
    });
    _box.designW = designWidth > 0 ? designWidth : 375.0;
    _box.designH = designHeight > 0 ? designHeight : 812.0;
    _box.useSafeArea = YES;
}

/// 如果忘记配置，给个兜底，且打印一次警告
static inline void _ensureSetup(void) {
    if (_box == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSLog(@"[JXScale] WARNING: 未在入口调用 JXScaleSetup，使用默认 375x812（全屏）");
        });
        JXScaleSetup(375.0, 812.0);
    }
}

CGFloat w(CGFloat value) {
    _ensureSetup();
    return value * _box.scaleX;
}

CGFloat h(CGFloat value) {
    _ensureSetup();
    return value * _box.scaleY;
}

CGFloat fz(CGFloat fontPointSize) {
    _ensureSetup();
    // 你也可以改为 MIN(scaleX, scaleY) 或者跟随 Y 方向，看项目需求
    return fontPointSize * _box.scaleX;
}

CGFloat JXScaleX(void) {
    _ensureSetup();
    return _box.scaleX;
}

CGFloat JXScaleY(void) {
    _ensureSetup();
    return _box.scaleY;
}

