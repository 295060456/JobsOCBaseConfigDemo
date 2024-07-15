//
//  OCDynamic.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/9.
//

#import "OCDynamic.h"


@implementation OCDynamic

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);;
}

- (instancetype)init{
    if (self = [super init]) {
        [self invokeIMP];
        [self InvokeIMP];

    }return self;
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(test)) {
        Method method = class_getInstanceMethod(self, @selector(instanceMethod));
        /**
         方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
         注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
         */
        class_addMethod(self,/// 第一个参数是在哪个类中添加方法
                        sel,/// 第二个参数是所添加方法的编号SEL
                        method_getImplementation(method),/// 第三个参数是所添加方法的函数实现的指针IMP
                        method_getTypeEncoding(method));/// 第四个参数是所添加方法的签名
        return YES;
    }return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(Test)) {
        Method method = class_getClassMethod(object_getClass(self.class), @selector(classMethod));
        /**
         方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
         注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
         */
        class_addMethod(object_getClass(self.class),/// 第一个参数是在哪个类中添加方法
                        sel,/// 第二个参数是所添加方法的编号SEL
                        method_getImplementation(method),/// 第三个参数是所添加方法的函数实现的指针IMP
                        method_getTypeEncoding(method));/// 第四个参数是所添加方法的签名
        return YES;
    }return [super resolveClassMethod:sel];
}

-(void)instanceMethod{
    NSLog(@"");
}

+(void)classMethod{
    NSLog(@"");
}
#pragma mark —— IMP调用实例方法
-(void)invokeIMP{
    SEL selector = NSSelectorFromString(@"test:");
//    IMP imp = [self methodForSelector:selector];
    IMP imp = [OCDynamic instanceMethodForSelector:selector];
    
    id (*func)(id, SEL, id) = (void *)imp;
    func(self, selector,@"Jobs");
}

-(void)test:(NSString *)testStr{
    NSLog(@"%@",testStr);
}
#pragma mark —— IMP调用类方法
-(void)InvokeIMP{
    SEL selector = NSSelectorFromString(@"Test:");
    IMP imp = [OCDynamic methodForSelector:selector];
    id (*func)(Class, SEL, id) = (void *)imp;
    func(OCDynamic.class, selector,@"Jobs");
}

+(void)Test:(NSString *)testStr{
    NSLog(@"%@",testStr);
}

+(void)Test{
    NSLog(@"");
}


@end
