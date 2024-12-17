//
//  MacroDef_SysWarning.h
//  DouYin
//
//  Created by Jobs on 2021/3/12.
//  警告查询网址：http://ww1.fuckingclangwarnings.com/
/*
     拓展知识：
     在忽略警告的处理上
     你可以在项目运行的时候
     右键警告选择 reveal in log
     就可以在警告详情中发现 -Wobjc-protocol-method-implementation 这么一个格式的字段
     在-W后添加一个no-
     然后添加到 other warning flags 中
     就可以忽略你这些警告了
 */
// 封装处理系统宏忽略警告⚠️
#ifndef MacroDef_SysWarning_h
#define MacroDef_SysWarning_h

//#pragma clang diagnostic push /// 开始设置警告忽略，保存当前的警告状态
//#pragma clang diagnostic ignored "-Wobjc-designated-initializers" /// 忽略“指定初始化方法未实现”的警告
//#pragma clang diagnostic ignored "-Wundeclared-selector" /// 忽略“使用未声明的 selector”的警告
//#pragma clang diagnostic ignored "-Wincompatible-pointer-types" /// 忽略“指针类型不兼容”的警告
//#pragma clang diagnostic ignored "-Wincomplete-implementation" /// 忽略“类没有完全实现接口方法”的警告
//#pragma clang diagnostic ignored "-Wdeprecated-implementations" /// 忽略“使用过时的实现”的警告
//#pragma clang diagnostic ignored "-Wdeprecated-declarations" /// 忽略“使用已弃用方法或变量”的警告
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks" /// 忽略“performSelector 可能导致内存泄漏”的警告（ARC 环境下）
//#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation" /// 忽略“重写了协议方法”的警告
//#pragma clang diagnostic ignored "-Wunused-variable" /// 忽略“未使用变量”的警告
//#pragma clang diagnostic ignored "-Wunused-parameter" /// 忽略“未使用的参数”的警告
//#pragma clang diagnostic ignored "-Wunused-result" /// 忽略“函数返回值未使用”的警告
//#pragma clang diagnostic ignored "-Wcast-qual" /// 忽略“类型转换时丢失 const/volatile 修饰符”的警告
//#pragma clang diagnostic ignored "-Wunreachable-code" /// 忽略“代码不可达”的警告
//#pragma clang diagnostic ignored "-Wconversion" /// 忽略“隐式转换可能导致数据丢失”的警告
//#pragma clang diagnostic ignored "-Wformat" /// 忽略“格式字符串与参数类型不匹配”的警告
//#pragma clang diagnostic ignored "-Wextra-semi" /// 忽略“多余的分号”的警告
//#pragma clang diagnostic ignored "-Warc-repeated-use-of-weak" /// 忽略“在 ARC 中重复使用 weak 对象”的警告
//#pragma clang diagnostic ignored "-Wobjc-property-implementation" /// 忽略“属性实现与声明不匹配”的警告
//#pragma clang diagnostic ignored "-Wpointer-sign" /// 忽略“指针类型签名不匹配”的警告
//#pragma clang diagnostic ignored "-Wempty-body" /// 忽略“空代码块”的警告
//#pragma clang diagnostic ignored "-Wshadow" /// 忽略“变量名遮蔽（shadowing）其他变量”的警告
//#pragma clang diagnostic ignored "-Wshorten-64-to-32" /// 忽略“将 64 位类型转换为 32 位类型时数据丢失”的警告
//#pragma clang diagnostic pop /// 恢复之前保存的警告状态

/// ⚠️ 在category中重写了原类的方法
#ifndef SuppressWobjcProtocolMethodImplementationWarning
#define SuppressWobjcProtocolMethodImplementationWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wobjc-protocol-method-implementation\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWobjcProtocolMethodImplementationWarning */
/*
    用于NS_DESIGNATED_INITIALIZER,
    NS_DESIGNATED_INITIALIZER是一个宏,代替的是runtime中的一个东西
    作用：对于多个构造方法，它可以指定一个基础的构造方法；其它快捷的构造方法都必须通过它来实现类的初始化。代码规范的一种，可以避免不必要的bug，良好的编程习惯
    注意事项：指定构造方法需要先调用父类的指定构造方法，然后再对自身类的属性进行初始化。如果子类的指定构造t方法与父类不同，则该子类需要覆写父类的指定构造方法，并在该实现里面调用自身的指定构造方法。
 */
/// ⚠️ 你使用了非指定初始化方法之外的方法。不影响正常使用
#ifndef SuppressDesignatedInitializersWarning
#define SuppressDesignatedInitializersWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wobjc-designated-initializers\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressDesignatedInitializersWarning */
/// ⚠️未声明的选择器
#ifndef SuppressWundeclaredSelectorWarning
#define SuppressWundeclaredSelectorWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wundeclared-selector\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWundeclaredSelectorWarning */
/// ⚠️用于指示在代码中存在不兼容的指针类型赋值或使用的情况（指针类型不匹配、函数指针类型不匹配、隐式类型转换）
#ifndef SuppressWincompatiblePointerTypesWarning
#define SuppressWincompatiblePointerTypesWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wincompatible-pointer-types\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWincompatiblePointerTypesWarning */
/// ⚠️方法定义未实现
#ifndef SuppressWincompleteImplementationWarning
#define SuppressWincompleteImplementationWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wincomplete-implementation\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWincompleteImplementationWarning */
/// ⚠️废弃声明 —— 实现
#ifndef SuppressWdeprecatedImplementationsWarning
#define SuppressWdeprecatedImplementationsWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-implementations\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWdeprecatedImplementationsWarning */
/// ⚠️废弃声明 —— 方法
#ifndef SuppressWdeprecatedDeclarationsWarning
#define SuppressWdeprecatedDeclarationsWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWdeprecatedDeclarationsWarning */
/// ⚠️编译器发现可能存在的内存泄漏问题
#ifndef SuppressWarcPerformSelectorLeaksWarning
#define SuppressWarcPerformSelectorLeaksWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWarcPerformSelectorLeaksWarning */
/// ⚠️抑制未使用变量的警告
#ifndef SuppressWunusedVariableWarning
#define SuppressWunusedVariableWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wunused-variable\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWunusedVariableWarning */
/// ⚠️抑制未使用参数的警告
#ifndef SuppressWunusedParameterWarning
#define SuppressWunusedParameterWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wunused-parameter\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWunusedParameterWarning */
/// ⚠️抑制未使用函数返回值的警告
#ifndef SuppressWunusedResultWarning
#define SuppressWunusedResultWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wunused-result\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWunusedResultWarning */
/// ⚠️抑制强制类型转换可能不安全的警告
#ifndef SuppressWcastQualWarning
#define SuppressWcastQualWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wcast-qual\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWcastQualWarning */
/// ⚠️抑制不可达代码警告
#ifndef SuppressWunreachableCodeWarning
#define SuppressWunreachableCodeWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wunreachable-code\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWunreachableCodeWarning */
/// ⚠️抑制隐式转换的警告
#ifndef SuppressWconversionWarning
#define SuppressWconversionWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wconversion\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWconversionWarning */
/// ⚠️抑制格式字符串不匹配的警告
#ifndef SuppressWformatWarning
#define SuppressWformatWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wformat\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWformatWarning */
/// ⚠️抑制多余分号的警告
#ifndef SuppressWextraSemiWarning
#define SuppressWextraSemiWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wextra-semi\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWextraSemiWarning */
/// ⚠️抑制多余分号的警告
#ifndef SuppressWarcRepeatedWeakWarning
#define SuppressWarcRepeatedWeakWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Warc-repeated-use-of-weak\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWarcRepeatedWeakWarning */
/// ⚠️抑制属性 getter/setter 方法重复定义
#ifndef SuppressWobjcPropertyImplementationWarning
#define SuppressWobjcPropertyImplementationWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wobjc-property-implementation\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWobjcPropertyImplementationWarning */
/// ⚠️抑制指针类型签名不兼容
#ifndef SuppressWpointerSignWarning
#define SuppressWpointerSignWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wpointer-sign\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWpointerSignWarning */
/// ⚠️抑制抑制空实现警告
#ifndef SuppressWemptyBodyWarning
#define SuppressWemptyBodyWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wempty-body\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWemptyBodyWarning */
/// ⚠️抑制变量覆盖父作用域变量的警告
#ifndef SuppressWshadowWarning
#define SuppressWshadowWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wshadow\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWshadowWarning */
/// ⚠️抑制强制类型转换导致的数据截断的警告
#ifndef SuppressWshorten64To32Warning
#define SuppressWshorten64To32Warning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wshorten-64-to-32\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWshorten64To32Warning */

#endif /* MacroDef_SysWarning_h */
