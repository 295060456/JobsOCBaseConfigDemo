//
//  NSMutableDictionary+Extra.m
//  FM
//
//  Created by User on 8/16/24.
//

#import "NSMutableDictionary+Extra.h"

@implementation NSMutableDictionary (Extra)

-(JobsRetMutableDicByKeyValueBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(id <NSCopying>_Nonnull key,id _Nonnull value) {
        @jobs_strongify(self)
        if(isValue(key) && value)[self setObject:value forKey:key];
        return self;
    };
}

-(JobsRetMutableDicByDicBlock _Nonnull)addByDic{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(__kindof NSDictionary *_Nullable dic){
        @jobs_strongify(self)
        [self addEntriesFromDictionary:dic];
        return self;
    };
}

-(JobsReturnMutableDicByKeyValueModelBlock _Nonnull)saveDataBy{
    @jobs_weakify(self)
    return ^NSMutableDictionary *_Nonnull(JobsKeyValueModel *_Nullable model){
        @jobs_strongify(self)
        if (isValue(model.key)) [self setObject:model.data forKey:model.key];
        return self;
    };
}
/// 打印的结果可以直接用于Postman
-(NSString *)jsonString{
    NSError *error;
    NSString *jsonString = @"";
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error) {
        JobsLog(@"JSON转换失败: %@", error.description);
    } else {
        jsonString = NSString.initByUTF8Data(jsonData);
        JobsLog(@"%@", jsonString);
    }return jsonString;
}

@end
