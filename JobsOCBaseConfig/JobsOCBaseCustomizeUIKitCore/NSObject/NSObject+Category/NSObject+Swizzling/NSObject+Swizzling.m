//
//  NSObject+Swizzling.m
//  OrderedMutableDictionary
//
//  Created by Locke on 2017/3/17.
//  Copyright © 2017年 lainkai. All rights reserved.
//

#import "NSObject+Swizzling.h"

@implementation NSObject (Swizzling)

-(void)swizzlingInstanceMethod:(SEL _Nonnull)originalSelector
              swizzledSelector:(SEL _Nonnull)swizzledSelector {
    Class class = self.class;
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    /**
        1、注意class_addMethod会覆盖父类方法的实现，但是不会替换父类已经存在的方法实现。
        2、如果要改变已经存在的方法实现，使用method_setImplementation。
        3、这里只是尝试覆盖父类方法的实现，如果父类没有对应方法的实现，则覆盖成功，否则覆盖失败。
     */
    if (class_addMethod(class,
                        originalSelector,
                        method_getImplementation(originalMethod),
                        method_getTypeEncoding(originalMethod))) {
        /**
         1、如果要替换的方法存在，它调用的是class_addMethod。
         2、如果要替换的方法不存在，它调用的是method_setImplementation。
         3、这里在覆盖父类方法成功的情况下，尝试用父类原有的方法的实现替换新增方法的实现。
         */
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(swizzledMethod),
                            method_getTypeEncoding(swizzledMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
/// 不同类的方法交换
void TYFFSwizzleMethod(Class _Nonnull originalCls,
                       SEL _Nonnull originalSelector,
                       Class _Nonnull swizzledCls,
                       SEL _Nonnull swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(originalCls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(swizzledCls, swizzledSelector);
    /**
        1、注意class_addMethod会覆盖父类方法的实现，但是不会替换父类已经存在的方法实现。
        2、如果要改变已经存在的方法实现，使用method_setImplementation。
        3、这里只是尝试覆盖父类方法的实现，如果父类没有对应方法的实现，则覆盖成功，否则覆盖失败。
     */
    if (class_addMethod(originalCls,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod))) {
        /**
         1、如果要替换的方法存在，它调用的是class_addMethod。
         2、如果要替换的方法不存在，它调用的是method_setImplementation。
         3、这里在覆盖父类方法成功的情况下，尝试用父类原有的方法的实现替换新增方法的实现。
         */
        class_replaceMethod(originalCls,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
/// 同一个类的方法交换
void MethodSwizzle(Class _Nonnull c,
                   SEL _Nonnull _orig,
                   SEL _Nonnull _new) {
    Method origMethod = class_getInstanceMethod(c, _orig);
    Method newMethod = class_getInstanceMethod(c, _new);
    /**
        1、注意class_addMethod会覆盖父类方法的实现，但是不会替换父类已经存在的方法实现。
        2、如果要改变已经存在的方法实现，使用method_setImplementation。
        3、这里只是尝试覆盖父类方法的实现，如果父类没有对应方法的实现，则覆盖成功，否则覆盖失败。
     */
    if (class_addMethod(c,
                        _orig,
                        method_getImplementation(newMethod),
                        method_getTypeEncoding(newMethod))) {
        /**
         1、如果要替换的方法存在，它调用的是class_addMethod。
         2、如果要替换的方法不存在，它调用的是method_setImplementation。
         3、这里在覆盖父类方法成功的情况下，尝试用父类原有的方法的实现替换新增方法的实现。
         */
        class_replaceMethod(c,
                            _new,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        /// 这里在覆盖父类方法失败的情况下，交换两个两个方法的实现。
        method_exchangeImplementations(origMethod, newMethod);
    }
}
/**
 * 对应系统的 objc_setAssociatedObject方法，在此基础上动态创建类，以及加dealloc方法
 * ⚠️关于dealloc方法，此前的验证是没有被释放需要手动添加，但是后来验证又不需要，这里需要反复多次验证
 */
void objc_setAssociatedObject_weak(id _Nonnull object,
                                   const void * _Nonnull key,
                                   id _Nullable value,
                                   objc_AssociationPolicy associationPolicy) {
    /// 子类的名字
    NSString *name = [NSString stringWithFormat:@"AssociationWeak_%@", NSStringFromClass([value class])];
    Class class = objc_getClass(name.UTF8String);
    /// 如果子类不存在，动态创建子类
    if (!class) {
        class = objc_allocateClassPair([value class], name.UTF8String, 0);
        objc_registerClassPair(class);
    }
    
    SEL deallocSEL = NSSelectorFromString(@"dealloc");
    Method deallocMethod = class_getInstanceMethod([value class], deallocSEL);
    const char *types = method_getTypeEncoding(deallocMethod);
    /// 在子类dealloc方法中将object的指针置为nil
    IMP imp = imp_implementationWithBlock(^(id _s, int k) {
        objc_setAssociatedObject(object,
                                 key,
                                 nil,
                                 associationPolicy);
    });
    /// 添加子类的dealloc方法
    class_addMethod(class,
                    deallocSEL,
                    imp,
                    types);
    /// 将value的isa指向动态创建的子类
    object_setClass(value,
                    class);
    
    objc_setAssociatedObject(object,
                             key,
                             value,
                             associationPolicy);
}
