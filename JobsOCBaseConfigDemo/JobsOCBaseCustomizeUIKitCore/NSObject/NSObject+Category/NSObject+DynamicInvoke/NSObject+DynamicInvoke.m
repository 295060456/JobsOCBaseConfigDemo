//
//  NSObject+DynamicInvoke.m
//  Casino
//
//  Created by Jobs on 2021/12/28.
//

#import "NSObject+DynamicInvoke.h"

@implementation NSObject (DynamicInvoke)
#pragma mark —— 参数 和 相关调用
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
/// @param targetObj 靶点，方法在哪里
/// @param methodName 不带参数的方法名
+(void)targetObj:(nonnull NSObject *)targetObj
callingMethodWithName:(nullable NSString *)methodName{
    if ([NSObject judgementObj:targetObj existMethodWithName:methodName]) {
        SuppressWarcPerformSelectorLeaksWarning([targetObj performSelector:NSSelectorFromString(methodName)]);
    }else{
        JobsLog(@"目标类：%@,不存在此方法：%@,请检查",targetObj.class,methodName);
    }
}
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
-(jobsByStringBlock _Nonnull)callingMethodWithName{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        @jobs_strongify(self)
        if ([NSObject judgementObj:self existMethodWithName:data]) {
            SuppressWarcPerformSelectorLeaksWarning([self performSelector:NSSelectorFromString(data)]);
        }else{
            JobsLog(@"目标类：%@,不存在此方法：%@,请检查",self.class,data);
        }
    };
}
/// 使用 dispatch_once 来执行只需运行一次的线程安全代码
-(jobsByStringBlock _Nonnull)dispatchOnceInvokingWithMethodName{
    @jobs_weakify(self)
    return ^(NSString *_Nullable data){
        static dispatch_once_t NSObjectDispatchOnce;
        dispatch_once(&NSObjectDispatchOnce, ^{
            @jobs_strongify(self)
            self.callingMethodWithName(data);/// 需要执行的方法的方法名（不带参数）
        });
    };
}
/// NSInvocation的使用，方法多参数传递
/// @param methodName 方法名
/// @param targetObj 靶点，方法在哪里
/// @param paramarrays 参数数组
+(id)methodName:(NSString *_Nonnull)methodName
      targetObj:(id _Nonnull)targetObj
    paramarrays:(NSArray *_Nullable)paramarrays{
    SEL selector = NSSelectorFromString(methodName);
    /*
     NSMethodSignature有两个常用的只读属性
     a. numberOfArguments:方法参数的个数
     b. methodReturnLength:方法返回值类型的长度，大于0表示有返回值
     **/
    NSMethodSignature *signature = [targetObj methodSignatureForSelector:selector];
    //或使用下面这种方式
    //NSMethodSignature *signature = [[target class] instanceMethodSignatureForSelector:selector];
    
    if (!signature) {
        // 处理方式一：
        {
            self.jobsToastErrMsg(JobsInternationalization(@"方法不存在,请检查参数"));
            return nil;
        }
        // 处理方式二：【经常崩溃损伤硬件】
//        {
//            //传入的方法不存在 就抛异常
//            NSString *info = toStringByID(self.class)
//                                .add(@":")
//                                .add(toStringByID(NSStringFromSelector(selector)))
//                                .add(JobsInternationalization(@"unrecognized selector sent to instance"));
//            @throw [NSException.alloc initWithName:JobsInternationalization(@"方法不存在")
//                                              reason:info
//                                            userInfo:nil];
//        }
    }
    
    /// 只能使用该方法来创建，不能使用alloc init
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = targetObj;
    invocation.selector = selector;
    /// 【防崩溃】如果传的不是数组，则封装成数组进行处理
    if (![paramarrays isKindOfClass:NSArray.class] && paramarrays) {
        paramarrays = @[paramarrays];
    }
    /*
     注意:
     1、下标从2开始，因为0、1已经被target与selector占用
     2、设置参数，必须传递参数的地址，不能直接传值
     **/
    for (int i = 2; i < paramarrays.count + 2; i++) {
        JobsLog(@"i = %d",i);
        id d = paramarrays[i - 2];
        [invocation setArgument:&d atIndex:i];
    }
    // 执行方法
    [invocation invoke];
    return [self getMethodReturnValueWithInv:invocation sig:signature];
}
/// 获取方法返回值
/// @param inv inv
/// @param sig 方法签名
+(id)getMethodReturnValueWithInv:(NSInvocation *)inv
                             sig:(NSMethodSignature *)sig{
    const char *returnType = sig.methodReturnType;
    __autoreleasing id returnValue = nil;
    if(strcmp(returnType, @encode(void)) == 0){
        returnValue = nil;
    }else if (strcmp(returnType, @encode(id)) == 0){
        [inv getReturnValue:&returnValue];
    }else{
        NSUInteger length = sig.methodReturnLength;
        void *buffer = (void *)malloc(length);
        [inv getReturnValue:buffer];

        if( !strcmp(returnType, @encode(BOOL)) ) {
            returnValue = [NSNumber numberWithBool:*((BOOL*)buffer)];
        }else if( !strcmp(returnType, @encode(NSInteger)) ){
            returnValue = [NSNumber numberWithInteger:*((NSInteger*)buffer)];
        }else if( !strcmp(returnType, @encode(char)) ){
            returnValue = [NSNumber numberWithChar:*((char*)buffer)];
        }else if( !strcmp(returnType, @encode(unsigned char)) ){
            returnValue = [NSNumber numberWithUnsignedChar:*((unsigned char*)buffer)];
        }else if( !strcmp(returnType, @encode(short)) ){
            returnValue = [NSNumber numberWithShort:*((short*)buffer)];
        }else if( !strcmp(returnType, @encode(unsigned short)) ){
            returnValue = [NSNumber numberWithUnsignedShort:*((unsigned short*)buffer)];
        }else if( !strcmp(returnType, @encode(int)) ){
            returnValue = [NSNumber numberWithInt:*((int*)buffer)];
        }else if( !strcmp(returnType, @encode(unsigned int)) ){
            returnValue = [NSNumber numberWithUnsignedInt:*((unsigned int*)buffer)];
        }else if( !strcmp(returnType, @encode(long)) ){
            returnValue = [NSNumber numberWithLong:*((long*)buffer)];
        }else if( !strcmp(returnType, @encode(unsigned long)) ){
            returnValue = [NSNumber numberWithUnsignedLong:*((unsigned long*)buffer)];
        }else if( !strcmp(returnType, @encode(long long)) ){
            returnValue = [NSNumber numberWithLongLong:*((long long*)buffer)];
        }else if( !strcmp(returnType, @encode(unsigned long long)) ){
            returnValue = [NSNumber numberWithUnsignedLongLong:*((unsigned long long*)buffer)];
        }else if( !strcmp(returnType, @encode(float)) ){
            returnValue = [NSNumber numberWithFloat:*((float*)buffer)];
        }else if( !strcmp(returnType, @encode(double)) ){
            returnValue = [NSNumber numberWithDouble:*((double*)buffer)];
        }else if( !strcmp(returnType, @encode(NSUInteger)) ){
            returnValue = [NSNumber numberWithUnsignedInteger:*((NSUInteger*)buffer)];
        }else returnValue = [NSValue valueWithBytes:buffer objCType:returnType];
    }return returnValue;
}
/// 判断本程序是否存在某个类
+(JobsReturnBOOLByStringBlock _Nonnull)judgementAppExistClassWithName{
    return ^BOOL(NSString *_Nullable data){
        return NSClassFromString(data);
    };
}
/// 判断某个实例对象是否存在某个【不带参数的方法】
+(BOOL)judgementObj:(nonnull NSObject *)obj
existMethodWithName:(nullable NSString *)methodName{
    if (!obj || isNull(methodName)) {
        return NO;
    }else{
        SEL sel = NSSelectorFromString(methodName);
        return [obj respondsToSelector:sel];
    }
}
/// 用block来代替selector
-(SEL _Nullable)jobsSelectorBlock:(JobsReturnIDBySelectorBlock)selectorBlock{
    return selectorBlocks(selectorBlock, nil, self);
}
/// 替代系统 @selector(selector) ,用Block的方式调用代码，使得代码逻辑和形式上不割裂
/// 类方法或全局函数，用于添加选择器
/// - Parameters:
///   - block: 最终的执行体
///   - selectorName: 实际调用的方法名（可不填），用于对外输出和定位调用实际使用的方法
///   - target: 执行目标
SEL _Nullable selectorBlocks(JobsReturnIDBySelectorBlock _Nullable block,
                             NSString *_Nullable selectorName,// MethodName(self)
                             NSObject *_Nonnull target) {
    if (!block) {
        toastErr(JobsInternationalization(@"方法不存在,请检查参数"));
        return NULL;
    }
    NSString *selName = @"selector"
        .add(@"_")
        .add(toStringByID(target.makeSnowflake))
        .add(@"_")
        .add(selectorName);
    JobsLog(@"selName = %@", selName);
    SEL sel = NSSelectorFromString(selName);
    /// 检查缓存
    static NSMutableDictionary *methodCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        methodCache = NSMutableDictionary.dictionary;
    });
    
    NSValue *cachedSelValue = methodCache[selName];
    if (cachedSelValue) {
        return cachedSelValue.pointerValue;
    }
    /**
     方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
     注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
     第一个参数是在哪个类中添加方法
     第二个参数是所添加方法的编号SEL
     第三个参数是所添加方法的函数实现的指针IMP
     第四个参数是所添加方法的签名
     */
    /// 检查目标类是否已有该方法
    if (class_getInstanceMethod([target class], sel)) {
        JobsLog(@"方法曾经已经被成功添加，再次添加会崩溃");
        return sel;
    } else {
        /// 动态添加方法
        if (class_addMethod([target class], sel, (IMP)selectorImp, "v@:@@")) {
            objc_setAssociatedObject(target, sel, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
            methodCache[selName] = NSValue.byPointer(sel);
        } else {
            [NSException raise:JobsInternationalization(@"添加方法失败")
                        format:@"%@ selectorBlock error", target];
        }
    }return sel;
}
/// 内部调用无需暴露
static void selectorImp(id target, SEL _cmd, id arg) {
    JobsReturnIDBySelectorBlock block = objc_getAssociatedObject(target, _cmd);
    if (block) block(target, arg);
}
/// 对 SEL和IMP的统一管理
#pragma mark —— @property(nonatomic,strong)JobsSEL_IMP *selImp;
JobsKey(_selImp)
@dynamic selImp;
-(JobsSEL_IMP *)selImp{
    JobsSEL_IMP *SelImp = Jobs_getAssociatedObject(_selImp);
    if (!SelImp) {
        SelImp = JobsSEL_IMP.new;
        Jobs_setAssociatedRETAIN_NONATOMIC(_selImp, SelImp)
    }return SelImp;
}

-(void)setSelImp:(JobsSEL_IMP *)selImp{
    Jobs_setAssociatedRETAIN_NONATOMIC(_selImp, selImp)
}
#pragma mark —— @property(nonatomic,strong)NSMutableDictionary *methodCache;
JobsKey(_methodCache)
@dynamic methodCache;
-(NSMutableDictionary<NSString *,NSValue *> *)methodCache{
    NSMutableDictionary *MethodCache = Jobs_getAssociatedObject(_methodCache);
    if (!MethodCache) {
        MethodCache = NSMutableDictionary.dictionary;
        Jobs_setAssociatedRETAIN_NONATOMIC(_methodCache, MethodCache)
    }return MethodCache;
}

-(void)setMethodCache:(NSMutableDictionary<NSString *,NSValue *> *)methodCache{
    Jobs_setAssociatedRETAIN_NONATOMIC(_methodCache, methodCache)
}
/// 是否存在这样的属性，有则返回
-(JobsReturnIDByStringBlock _Nonnull)property {
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        SEL selector = NSSelectorFromString(data);
        // 检查是否响应选择器
        if ([self respondsToSelector:selector]) {
            NSMethodSignature *signature = [self methodSignatureForSelector:selector];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setSelector:selector];
            [invocation setTarget:self];
            // 调用选择器
            [invocation invoke];
            // 获取返回值
            if (signature.methodReturnLength) {
                id __unsafe_unretained returnValue = nil; // 使用 unsafe_unretained 避免内存泄漏
                [invocation getReturnValue:&returnValue];
                return returnValue; // 返回调用的结果
            }
        }return nil; // 如果对象不响应该属性，返回 nil
    };
}
/// 是否遵从这样的协议？
-(JobsReturnBOOLByStringBlock _Nonnull)protocol{
    @jobs_weakify(self)
    return ^BOOL(NSString *_Nullable data){
        @jobs_strongify(self)
        Protocol *protocol = NSProtocolFromString(data);
        return [self conformsToProtocol:protocol];
    };
}

@end
