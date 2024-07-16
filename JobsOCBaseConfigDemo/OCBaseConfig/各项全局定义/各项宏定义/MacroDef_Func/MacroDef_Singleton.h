//
//  MacroDef_Singleton.h
//  Casino
//
//  Created by Jobs on 2021/12/4.
//

#ifndef SingletonMacro_h
#define SingletonMacro_h

// 基于 dispatch_once 的单例宏
#define DEFINE_SHARED_INSTANCE_USING_DISPATCH_ONCE \
    + (instancetype)sharedManager { \
        static dispatch_once_t onceToken; \
        static id sharedInstance = nil; \
        dispatch_once(&onceToken, ^{ \
            sharedInstance = [[self alloc] init]; \
        }); \
        return sharedInstance; \
    } \
    + (void)destroyInstance { \
        sharedInstance = nil; \
        onceToken = 0; \
    } \
    + (instancetype)allocWithZone:(struct _NSZone *)zone { \
        return [self sharedManager]; \
    } \
    - (instancetype)copyWithZone:(NSZone *)zone { \
        return self; \
    } \
    - (instancetype)mutableCopyWithZone:(NSZone *)zone { \
        return self; \
    }

#define DECLARE_SHARED_INSTANCE \
    + (instancetype)sharedManager; \
    + (void)destroyInstance;

#define IMPLEMENT_SHARED_INSTANCE_USING_DISPATCH_ONCE(CLASSNAME) \
    @implementation CLASSNAME \
    DEFINE_SHARED_INSTANCE_USING_DISPATCH_ONCE \
    @end

// 基于 @synchronized 的单例宏
#define DEFINE_SHARED_INSTANCE_USING_SYNCHRONIZED \
    + (instancetype)sharedManager { \
        @synchronized (self) { \
            if (sharedInstance == nil) { \
                sharedInstance = [[self alloc] init]; \
            } \
        } \
        return sharedInstance; \
    } \
    + (void)destroyInstance { \
        @synchronized (self) { \
            sharedInstance = nil; \
        } \
    } \
    + (instancetype)allocWithZone:(struct _NSZone *)zone { \
        return [self sharedManager]; \
    } \
    - (instancetype)copyWithZone:(NSZone *)zone { \
        return self; \
    } \
    - (instancetype)mutableCopyWithZone:(NSZone *)zone { \
        return self; \
    }

#define IMPLEMENT_SHARED_INSTANCE_USING_SYNCHRONIZED(CLASSNAME) \
    static CLASSNAME *sharedInstance = nil; \
    @implementation CLASSNAME \
    DEFINE_SHARED_INSTANCE_USING_SYNCHRONIZED \
    @end

#endif /* SingletonMacro_h */
