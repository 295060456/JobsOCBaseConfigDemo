//
//  NSMutableDictionary+Extra.m
//  FM
//
//  Created by User on 8/16/24.
//

#import "NSMutableDictionary+Extra.h"

@implementation NSMutableDictionary (Extra)

-(jobsKeyValueBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^(id <NSCopying>_Nonnull key,id _Nonnull value) {
        @jobs_strongify(self)
        if(isNull(key)) return;
        if(!value) return;
        if(key && value) [self setObject:value forKey:key];
    };
}

-(jobsByIDBlock _Nonnull)saveDataBy{
    @jobs_weakify(self)
    return ^(JobsKeyValueModel *_Nullable model){
        @jobs_strongify(self)
        if (isValue(model.key)) {
            [self setObject:model.data forKey:model.key];
        }
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
        NSLog(@"JSON转换失败: %@", error);
    } else {
        jsonString = NSString.initByUTF8Data(jsonData);
        NSLog(@"%@", jsonString);
    }return jsonString;
}

@end
