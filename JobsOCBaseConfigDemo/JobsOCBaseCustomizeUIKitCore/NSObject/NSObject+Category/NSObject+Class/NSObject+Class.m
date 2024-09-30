//
//  NSObject+Class.m
//  Casino
//
//  Created by Jobs on 2021/12/3.
//

#import "NSObject+Class.h"

@implementation NSObject (Class)
#pragma mark —— 返回并打印成员变量列表
-(JobsReturnArrayByVoidBlock _Nonnull)printIvarList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printIvarListByObj(self);
    };
}

-(__kindof NSArray *)ivarList{
    return printIvarListByObj(self);
}
#pragma mark —— 返回并打印属性列表
-(JobsReturnArrayByVoidBlock _Nonnull)printPropertyList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printPropertyListByObj(self);
    };
}
-(__kindof NSArray *)propertyList{
    return printPropertyListByObj(self);
}
#pragma mark —— 返回并打印方法列表
-(JobsReturnArrayByVoidBlock _Nonnull)printMethodList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printMethodListByObj(self);
    };
}
-(__kindof NSArray *)methodList{
    return printMethodListByObj(self);
}
#pragma mark —— 返回并打印协议列表
-(JobsReturnArrayByVoidBlock _Nonnull)printProtocolList{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(){
        @jobs_strongify(self)
        return printProtocolListByObj(self);
    };
}

-(__kindof NSArray *)protocolList{
    return printProtocolListByObj(self);
}
/// 1、字典是hash映射，是无序的，如果需要有序则需要避开字典，所以对模型进行操作是大前提
/// 2、字典和模型的差距在于序列化
/// 3、字典化的模型里面，依据有序的（从上至下）属性名字排列，去取值，映射到数组里面
/// 4、要成为字典的Key，只需要遵循NSCopying协议
-(JobsReturnArrayByVoidBlock _Nonnull)readModelPropertyValueByOrder{
    @jobs_weakify(self)
    return ^__kindof NSMutableArray <__kindof NSDictionary *>*_Nullable(){
        @jobs_strongify(self)
        NSMutableArray <NSString *>*propertyListMutArr = (NSMutableArray *)self.propertyList;//有序的，从上至下
        NSMutableDictionary *mutDic = self.mj_keyValues;// 实际上需要操作的字典
        //对外返的数组
        return jobsMakeMutArr(^(__kindof NSMutableArray <__kindof NSDictionary *>*_Nullable data) {
            for (NSString *property in propertyListMutArr) {
                if (mutDic[property] && [mutDic[property] isKindOfClass:NSObject.class]) {// 防崩溃:必须取到值，且值不能是数据类型
                    data.add(mutDic[property]);
                }
            }
        });
    };
}




@end
