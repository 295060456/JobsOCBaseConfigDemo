//
//  BaseModel.m
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "BaseModel.h"

@implementation BaseModel
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
        // 如果是使用 MJExtension 解析，跳过 NSCoding 解析
        if(decoder.allowsKeyedCoding){
            for (NSString *key in printPropertyListByObj(self)) {
                if ([self respondsToSelector:NSSelectorFromString(key)]) {
                    NSString * value = [decoder decodeObjectForKey:key];
                    if (value) [self setValue:value forKey:key];
                }
            }
        }
    }return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder{
    // 获取对象的属性列表
    NSArray *propertyKeys = printPropertyListByObj(self);
    for (NSString *key in propertyKeys) {
        // 检查是否实现了协议中的属性对应的setter方法
        NSLog(@"SSS = %@",(@"set".add(key.capitalizedString).add(@":")));
        NSLog(@"AAA = %@",key);
        if ([self respondsToSelector:NSSelectorFromString(@"set".add(key.capitalizedString).add(@":"))]) {
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
}
#pragma mark —— NSSecureCoding
+ (BOOL)supportsSecureCoding {
    return YES;
}
#pragma mark —— MJExtension
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id"
    };
}
//+(NSDictionary *)mj_replacedKeyFromPropertyName {
//    return [super mj_replacedKeyFromPropertyName].mutableCopy;
//}
#pragma mark —— YYModel
+(NSDictionary *)modelCustomPropertyMapper{
    return @{
        @"ID" : @"id"
    };
}

// 告诉 MJExtension "gameList" 是一个 FMGameListModel 数组
//+ (NSDictionary *)mj_objectClassInArray {
//    return @{
//        @"gameList" : FMGameListModel.class
//    };
//}
//@property(nonatomic,strong)NSString *headImage;
//@property(nonatomic,strong)NSURL *headImage;
//- (id)mj_newValueFromOldValue:(id)oldValue
//                     property:(MJProperty *)property{
//    if ([property.name isEqualToString:@"headImage"]) {
//        return [NSURL URLWithString:oldValue];
//    }return oldValue;
//}
/// 需要优化。目的是打印的时候，能完全看到属性及其值
//- (NSString *)description {
//    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: %p>\n", self.class, self];
//    unsigned int count;
//    Ivar *ivars = class_copyIvarList(self.class, &count);
//    for (unsigned int i = 0; i < count; i++) {
//        Ivar ivar = ivars[i];
//        const char *name = ivar_getName(ivar);
//        @try {
//            // 获取 ivar 的值
//            id value = object_getIvar(self, ivar);
//            if (value == nil) {
//                value = @"(null)";
//            } else if ([value isKindOfClass:NSString.class]) {
//                value = [NSString stringWithFormat:@"\"%@\"", value];
//            } else if ([value isKindOfClass:[NSNumber class]]) {
//                value = [value stringValue];
//            } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSDictionary class]]) {
//                value = [value description];
//            }
//            // 添加 ivar 名称和对应的值
//            [description appendFormat:@"\t%@: %@\n", StringWithUTF8String(name), value];
//        }
//        @catch (NSException *exception) {
//            NSLog(@"Exception when accessing ivar %@: %@", StringWithUTF8String(name), exception);
//            [description appendFormat:@"\t%@ : <Error accessing ivar>\n", StringWithUTF8String(name)];
//        }
//    }
//    free(ivars);
//    return description;
//}

@end
