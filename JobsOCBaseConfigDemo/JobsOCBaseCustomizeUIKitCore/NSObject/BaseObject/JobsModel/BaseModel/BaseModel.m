//
//  BaseModel.m
//  DouYin
//
//  Created by Jobs on 2020/9/24.
//

#import "BaseModel.h"

@implementation BaseModel

//+(NSDictionary *)mj_replacedKeyFromPropertyName{
//    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
//    return @{
//        @"ID" : @"id",
//        @"childMutArr":@"child"
//    };
//}
//
//+(NSDictionary *)mj_objectClassInArray{
//    return @{
//        @"childMutArr" : MKChildCommentModel.class
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
