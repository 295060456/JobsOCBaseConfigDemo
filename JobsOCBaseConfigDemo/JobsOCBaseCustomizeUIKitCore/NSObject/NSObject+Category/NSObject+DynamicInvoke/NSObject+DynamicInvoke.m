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
        NSLog(@"目标类：%@,不存在此方法：%@,请检查",targetObj.class,methodName);
    }
}
/// 如果某个实例对象存在某个【不带参数的方法】，则对其调用执行
/// @param methodName 不带参数的方法名
-(void)callingMethodWithName:(nullable NSString *)methodName{
    if ([NSObject judgementObj:self existMethodWithName:methodName]) {
        SuppressWarcPerformSelectorLeaksWarning([self performSelector:NSSelectorFromString(methodName)]);
    }else{
        NSLog(@"目标类：%@,不存在此方法：%@,请检查",self.class,methodName);
    }
}
/// 使用 dispatch_once 来执行只需运行一次的线程安全代码
/// @param methodName 需要执行的方法的方法名（不带参数）
-(void)dispatchOnceInvokingWithMethodName:(nullable NSString *)methodName{
    static dispatch_once_t NSObjectDispatchOnce;
    @jobs_weakify(self)
    dispatch_once(&NSObjectDispatchOnce, ^{
        [weak_self callingMethodWithName:methodName];
    });
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
        NSLog(@"i = %d",i);
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
+(BOOL)judgementAppExistClassWithName:(nullable NSString *)className{
    return NSClassFromString(className);
}
/// 判断某个实例对象是否存在某个【不带参数的方法】
+(BOOL)judgementObj:(nonnull NSObject *)obj
existMethodWithName:(nullable NSString *)methodName{
    if (!obj || [NSString isNullString:methodName]) {
        return NO;
    }else{
        SEL sel = NSSelectorFromString(methodName);
        return [obj respondsToSelector:sel];
    }
}
/// 用block来代替selector
-(SEL _Nullable)jobsSelectorBlock:(JobsReturnIDBySelectorBlock)selectorBlock{
    return selectorBlocks(selectorBlock,nil,self);
}
// 定义一个全局字典来缓存已经添加的方法
static NSMutableDictionary<NSString *, NSValue *> *methodCache;
/// 替代系统 @selector(selector) ,用Block的方式调用代码，使得代码逻辑和形式上不割裂
/// - Parameters:
///   - block: 最终的执行体
///   - selectorName: 实际调用的方法名（可不填），用于对外输出和定位调用实际使用的方法
///   - target: 执行目标
SEL _Nullable selectorBlocks(JobsReturnIDBySelectorBlock block,
                             NSString *_Nullable selectorName,
                             id _Nullable target){
    if (!block) {
        toastErr(JobsInternationalization(@"方法不存在,请检查参数"));
        /// 【经常崩溃损伤硬件】 [NSException raise:JobsInternationalization(@"block can not be nil") format:@"%@ selectorBlock error", target];
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        methodCache = NSMutableDictionary.dictionary;
    });
    /// 动态注册方法：对方法名进行拼接（加盐），以防止和当下的其他方法名引起冲突
    NSString *selName = @"selector".add(@"_").add(NSObject.currentUnixTimestampString).add(@"_").add(selectorName);
    NSLog(@"selName = %@",selName);
    SEL sel = NSSelectorFromString(selName);
    /// 检查缓存中是否已经存在该选择器
    NSValue *cachedSelValue = methodCache[selName];
    if (cachedSelValue) {
        sel = cachedSelValue.pointerValue;
        return sel;
    }
    /**
     方法签名由方法名称和一个参数列表（方法的参数的顺序和类型）组成
     注意：方法签名不包括方法的返回类型。不包括返回值和访问修饰符
     第一个参数是在哪个类中添加方法
     第二个参数是所添加方法的编号SEL
     第三个参数是所添加方法的函数实现的指针IMP
     第四个参数是所添加方法的签名
     */
    NSLog(@"%@",[NSString stringWithFormat:@"%d",random100__200()]);
    if(class_getInstanceMethod([target class], sel)){
        NSLog(@"方法曾经已经被成功添加，再次添加会崩溃");
        return nil;
//        abort();
    }else{
        /// class_addMethod这个方法的实现会覆盖父类的方法实现，但不会取代本类中已存在的实现，如果本类中包含一个同名的实现，则函数会返回NO
        if (class_addMethod([target class],
                            sel,
                            (IMP)selectorImp,
                            "v@:@")) {
            objc_setAssociatedObject(target,
                                     sel,
                                     block,
                                     OBJC_ASSOCIATION_COPY_NONATOMIC);
            // 缓存该选择器
            methodCache[selName] = [NSValue valueWithPointer:sel];
        }else{
            [NSException raise:JobsInternationalization(@"添加方法失败")
                        format:@"%@ selectorBlock error", target];
        }
    }return sel;
}
/// 内部调用无需暴露
static void selectorImp(id self,
                        SEL _cmd,
                        id arg) {
    JobsReturnIDBySelectorBlock block = objc_getAssociatedObject(self, _cmd);
    @jobs_weakify(self)
    if (block) block(weak_self, arg);
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

@end
