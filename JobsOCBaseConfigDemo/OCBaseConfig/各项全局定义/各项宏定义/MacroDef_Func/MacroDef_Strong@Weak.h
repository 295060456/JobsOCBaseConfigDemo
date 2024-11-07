//
//  MacroDef_Strong@Weak.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#ifndef MacroDef_Strong_Weak_h
#define MacroDef_Strong_Weak_h

/** 强弱引用
    Uses
    UIView *view;
    UIButton *btn;
     
    @jobs_weakify(view)
    weak_view.size;
    @jobs_weakify(btn)
    weak_btn.frame
 
 # 能用@符号进行调用的根本原因：来自GPT-3.5的回答
    在如下的宏定义中：
    @符号可以用于调用的原因是因为宏内部实际上不包含Objective-C代码块，而是包含了一个函数调用，
    这个函数调用是Objective-C代码中的一个有效表达式。
 */
#ifndef jobs_weakify
#if DEBUG
#if __has_feature(objc_arc)
#define jobs_weakify(self) autoreleasepool{} __weak __typeof__(self) weak##_##self = self;
#else
#define jobs_weakify(self) autoreleasepool{} __block __typeof__(self) block##_##self = self;
#endif
#else
#if __has_feature(objc_arc)
#define jobs_weakify(self) try{} @finally{} {} __weak __typeof__(self) weak##_##self = self;
#else
#define jobs_weakify(self) try{} @finally{} {} __block __typeof__(self) block##_##self = self;
#endif
#endif
#endif

#ifndef jobs_strongify
#if DEBUG
#if __has_feature(objc_arc)
#define jobs_strongify(self) autoreleasepool{} __typeof__(self) self = weak##_##self;
#else
#define jobs_strongify(self) autoreleasepool{} __typeof__(self) self = block##_##self;
#endif
#else
#if __has_feature(objc_arc)
#define jobs_strongify(self) try{} @finally{} __typeof__(self) self = weak##_##self;
#else
#define jobs_strongify(self) try{} @finally{} __typeof__(self) self = block##_##self;
#endif
#endif
#endif

#endif /* MacroDef_Strong_Weak_h */
