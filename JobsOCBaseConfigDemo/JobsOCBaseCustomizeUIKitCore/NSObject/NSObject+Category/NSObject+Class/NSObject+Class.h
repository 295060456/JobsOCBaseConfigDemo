//
//  NSObject+Class.h
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#import "MacroDef_Log.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark —— 打印某个类：可以精确的打印具体的类，包括父类
// 返回并打印成员变量列表及其值
static inline NSMutableArray<NSString *> *printIvarListByClass(Class cls) {
    unsigned int count;
    NSMutableArray <NSString *>*tempDataMutArr = NSMutableArray.array;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    // 创建一个默认对象的实例
    id instance = [[cls alloc] init];
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        id value = object_getIvar(instance, myIvar); // 获取对应的值
        // 打印成员变量名和对应的值
        NSLog(@"ivar(%d) : %@ = %@", i, [NSString stringWithUTF8String:ivarName], value);
        [tempDataMutArr addObject:[NSString stringWithFormat:@"%s: %@", ivarName, value]];
    }
    free(ivarList);
    return tempDataMutArr;
}
// 返回并打印属性列表及其值
static inline NSMutableArray<NSString *> *printPropertyListByClass(Class cls) {
    unsigned int count;
    NSMutableArray <NSString *>*tempDataMutArr = NSMutableArray.array;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    // 创建一个默认对象的实例
    id instance = [[cls alloc] init];
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        id value = [instance valueForKey:[NSString stringWithUTF8String:propertyName]]; // 获取属性值
        // 打印属性名和对应的值
        NSLog(@"property(%d) : %@ = %@", i, [NSString stringWithUTF8String:propertyName], value);
        [tempDataMutArr addObject:[NSString stringWithFormat:@"%s: %@", propertyName, value]];
    }
    free(propertyList);
    return tempDataMutArr;
}
/// 返回并打印方法列表
static inline NSMutableArray <NSString *>*printMethodListByClass(Class cls){
    unsigned int count;
    NSMutableArray *tempDataMutArr = NSMutableArray.array;
    Method *methodList = class_copyMethodList([cls class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method(%d) : %@", i, NSStringFromSelector(method_getName(method)));
        [tempDataMutArr addObject:NSStringFromSelector(method_getName(method))];
    }free(methodList);
    return tempDataMutArr;
}
/// 返回并打印协议列表
static inline NSMutableArray <NSString *>*printProtocolListByClass(Class cls){
    unsigned int count;
    NSMutableArray *tempDataMutArr = NSMutableArray.array;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([cls class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol(%d) : %@", i, [NSString stringWithUTF8String:protocolName]);
        [tempDataMutArr addObject:[NSString stringWithUTF8String:protocolName]];
    }free(protocolList);
    return tempDataMutArr;
}
#pragma mark —— 打印某个实例:如果打印其父类，最终还是实际类
/// 返回并打印成员变量列表
static inline NSMutableArray <NSString *>*printIvarListByObj(id instanceObj){
    return printIvarListByClass([instanceObj class]);
}
/// 返回并打印属性列表
static inline NSMutableArray <NSString *>*printPropertyListByObj(id instanceObj){
    return printPropertyListByClass([instanceObj class]);
}
/// 返回并打印方法列表
static inline NSMutableArray <NSString *>*printMethodListByObj(id instanceObj){
    return printMethodListByClass([instanceObj class]);
}
/// 返回并打印协议列表
static inline NSMutableArray <NSString *>*printProtocolListByObj(id instanceObj){
    return printIvarListByClass([instanceObj class]);
}
#pragma mark —— 其他
/// 判断一个父类是否包含某个方法（包含私有方法）
static inline BOOL jobsClassisContainsSuperMethod(Class cls,NSString *methodName){
    unsigned int outCount = 0;
    Method *methods = class_copyMethodList(cls, &outCount);
    for (int i = 0; i < outCount; i ++) {
        Method method = methods[i];
        SEL methodNameSEL = method_getName(method);
        if ([methodName isEqualToString:NSStringFromSelector(methodNameSEL)]) {
            free(methods);
            return YES;
        }
    }free(methods);
    return NO;
}
@interface NSObject (Class)
#pragma mark —— 返回并打印成员变量列表
-(JobsReturnArrayByVoidBlock _Nonnull)printIvarList;
-(__kindof NSArray *)ivarList;
#pragma mark —— 返回并打印属性列表
-(JobsReturnArrayByVoidBlock _Nonnull)printPropertyList;
-(__kindof NSArray *)propertyList;
#pragma mark —— 返回并打印方法列表
-(JobsReturnArrayByVoidBlock _Nonnull)printMethodList;
-(__kindof NSArray *)methodList;
#pragma mark —— 返回并打印协议列表
-(JobsReturnArrayByVoidBlock _Nonnull)printProtocolList;
-(__kindof NSArray *)protocolList;
/// 1、字典是hash映射，是无序的，如果需要有序则需要避开字典，所以对模型进行操作是大前提
/// 2、字典和模型的差距在于序列化
/// 3、字典化的模型里面，依据有序的（从上至下）属性名字排列，去取值，映射到数组里面
/// 4、要成为字典的Key，只需要遵循NSCopying协议
-(JobsReturnArrayByVoidBlock _Nonnull)readModelPropertyValueByOrder;

@end

NS_ASSUME_NONNULL_END
