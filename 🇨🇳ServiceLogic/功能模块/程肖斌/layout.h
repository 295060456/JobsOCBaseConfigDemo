//
//  layout.h
//  Layout
//
//  Created by 上帝的宠儿 on 2022/6/8.
//

#ifndef layout_h
#define layout_h
#import <UIKit/UIKit.h>
//375*667，iphone6位基准。
static inline BOOL isX(void) {
    static BOOL v = NO;
    static dispatch_once_t once_t = 0;
    dispatch_once(&once_t, ^{
        UIApplication *app = UIApplication.sharedApplication;
        UIWindow *win = app.windows.firstObject;
        v = win.safeAreaInsets.top > 42;
    });
    return v;
}

static inline CGFloat hs(CGFloat v) {
    static CGFloat hv = 0;
    static dispatch_once_t once_t = 0;
    dispatch_once(&once_t, ^{
        CGRect rect = UIScreen.mainScreen.bounds;
        hv = rect.size.width / 375;
    });
    return hv * v;
}

static inline CGFloat vs(CGFloat v) {
    static CGFloat vv = 0;
    static dispatch_once_t once_t = 0;
    dispatch_once(&once_t, ^{
        CGRect rect = UIScreen.mainScreen.bounds;
        vv = rect.size.height / 667;
    });
    return vv * v;
}

static inline CGFloat naviH(void) {
    static CGFloat v = 0;
    static dispatch_once_t once_t = 0;
    dispatch_once(&once_t, ^{
        v = isX() ? 88 : 64;
    });
    return v;
}

static inline CGRect fitHor(CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
    return CGRectMake(hs(x), hs(y), hs(w), hs(h));
}

static inline CGRect fitVer(CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
    return CGRectMake(hs(x), vs(y), hs(w), hs(h));
}

static inline CGRect fitTop(CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
    CGFloat v = hs(y - 64) + naviH();
    return CGRectMake(hs(x), v, hs(w), hs(h));
}

static inline CGPoint fitOrigin(CGFloat x, CGFloat y) {
    CGFloat v = hs(y - 64) + naviH();
    return CGPointMake(hs(x), v);
}

#endif /* layout_h */
