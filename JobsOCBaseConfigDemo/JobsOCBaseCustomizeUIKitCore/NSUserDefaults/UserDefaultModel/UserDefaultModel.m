//
//  UserDefaultModel.m
//  DouDong-II
//
//  Created by Jobs on 2020/12/19.
//

#import "UserDefaultModel.h"
/// 需要被归档的类，需要按照下列的标准写法，在这个类里面实现（完全的复制粘贴）
@implementation JobsObject
/**
 1、归档，即为将内存中的对象（一断电就没），写到硬盘数据（断电后还在）
 2、归档的时候，被归档的类需要实现NSCoding协议
 3、归档的时候，被归档的类需要实现一些NSCoding协议中所必要的方法，否则会崩溃
   3.1、取已经被归档的数据进类的时候，需要走：- (instancetype)initWithCoder:(NSCoder *)decoder
   3.2、归档数据，需要走：-(void)encodeWithCoder:(NSCoder *)encoder
 4、不确定一个类里面有多少的属性，需要用反射
 5、归档会扫描这个类里面所有声明的属性，但是没有实现这些属性的set/get方法会崩溃
   5.1、为了做上述兼容，需要判断set方法是否被响应，即：[self respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"set%@:", key.capitalizedString])]
 6、在较新的iOS版本中，要使用 NSKeyedUnarchiver 来解码对象，被解码的类必须采用 NSSecureCoding 协议，以确保数据的安全性。否则解码失败，报错：This decoder will only decode classes that adopt NSSecureCoding....
 */
#pragma mark —— NSCoding
- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        for (NSString *key in printPropertyListByObj(self)) {
            if ([self respondsToSelector:NSSelectorFromString(key)]) {
                NSString * value = [decoder decodeObjectForKey:key];
                if (value) [self setValue:value forKey:key];
            }
        }
    }return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    // 获取对象的属性列表
    NSArray *propertyKeys = printPropertyListByObj(self);
    for (NSString *key in propertyKeys) {
        // 检查是否实现了协议中的属性对应的setter方法
        NSLog(@"SSS = %@",[NSString stringWithFormat:@"set%@:", key.capitalizedString]);
        NSLog(@"AAA = %@",key);
        if ([self respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"set%@:", key.capitalizedString])]) {
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
}
#pragma mark —— NSSecureCoding
+ (BOOL)supportsSecureCoding {
    return YES;
}

@end

@implementation UserDefaultModel

@end
