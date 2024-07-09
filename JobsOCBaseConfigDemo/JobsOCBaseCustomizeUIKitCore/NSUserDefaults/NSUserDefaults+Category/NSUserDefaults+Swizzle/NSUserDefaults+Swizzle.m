//
//  NSUserDefaults+Swizzle.m
//  Casino
//
//  Created by Jobs on 2021/12/11.
//

#import "NSUserDefaults+Swizzle.h"

@implementation NSUserDefaults (Swizzle)

+(void)load{
    {// Object
        {// 存
            Method originalMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(setObject:forKey:));
            Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(swizzleSetObject:forKey:));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        {// 取
            Method originalMethod = class_getInstanceMethod(NSUserDefaults.class, @selector(objectForKey:));
            Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class, @selector(swizzleObjectForKey:));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    
    {// Value
        {// 存
            Method originalMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(setValue:forKey:));
            Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(swizzleSetValue:forKey:));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        {// 取
            Method originalMethod = class_getInstanceMethod(NSUserDefaults.class, @selector(valueForKey:));
            Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class, @selector(swizzleValueForKey:));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    
    {// Bool
        {// 存
            Method originalMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(setBool:forKey:));
            Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(swizzleSetBool:forKey:));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        {// 取
            Method originalMethod = class_getInstanceMethod(NSUserDefaults.class, @selector(boolForKey:));
            Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class, @selector(swizzleBoolForKey:));
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    
    {// Remove
        Method originalMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(removeObjectForKey:));
        Method swizzledMethod = class_getInstanceMethod(NSUserDefaults.class,@selector(swizzleRemoveObjectForKey:));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
#pragma mark —— Object
-(void)swizzleSetObject:(id _Nonnull)object
                 forKey:(NSString *_Nonnull)key{
    // TODO 可以接入加解密的模块
    [self swizzleSetObject:object
                    forKey:key];
    JobsUserDefaultSynchronize;// 强制让它存了立即写磁盘
}

-(nullable id)swizzleObjectForKey:(NSString *_Nonnull)key{
    // TODO 可以接入加解密的模块
    return [self swizzleObjectForKey:key];
}
#pragma mark —— Value
-(void)swizzleSetValue:(id _Nonnull)value
                forKey:(NSString *_Nonnull)key{
    // TODO 可以接入加解密的模块
    [self swizzleSetValue:value
                   forKey:key];
    JobsUserDefaultSynchronize;// 强制让它存了立即写磁盘
}

-(nullable id)swizzleValueForKey:(NSString *_Nonnull)key{
    // TODO 可以接入加解密的模块
    return [self swizzleValueForKey:key];
}
#pragma mark —— Bool
-(void)swizzleSetBool:(BOOL)boolValue
               forKey:(NSString *_Nonnull)key{
    // TODO 可以接入加解密的模块
    [self swizzleSetBool:boolValue
                  forKey:key];
    JobsUserDefaultSynchronize;// 强制让它存了立即写磁盘
}

-(BOOL)swizzleBoolForKey:(NSString *_Nonnull)key{
    // TODO 可以接入加解密的模块
    return [self swizzleBoolForKey:key];
}
#pragma mark —— removeObject
-(void)swizzleRemoveObjectForKey:(NSString *_Nonnull)key{
    [self swizzleRemoveObjectForKey:key];
    JobsUserDefaultSynchronize;// 强制让它存了立即写磁盘
}

@end
