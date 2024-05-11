//
//  JobsUserModel.m
//  DouDong-II
//
//  Created by xxx on 2021/1/10.
//

#import "JobsUserModel.h"

@implementation JobsUserModel
#pragma mark —— MJKeyValue
- (id)mj_newValueFromOldValue:(id)oldValue
                     property:(MJProperty *)property{
    if ([property.name isEqualToString:@"headImage"]) {
        return [NSURL URLWithString:oldValue];
    }return oldValue;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id"
    };
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_userModelOnceToken = 0;
    static_userModel = nil;
}

static JobsUserModel *static_userModel = nil;
static dispatch_once_t static_userModelOnceToken;
+(instancetype)sharedInstance{
    dispatch_once(&static_userModelOnceToken, ^{
        static_userModel = JobsUserModel.new;
    });return static_userModel;
}
#pragma mark —— NSCoding
/// 解档
- (instancetype)initWithCoder:(NSCoder *)decoder {
    
//    _img = [coder decodeObjectOfClass:UIImage.class forKey:@"img"];
    if (self = [super initWithCoder:decoder]) {
        for (NSString *key in printPropertyListByClass(JobsUserModel.class)) {
            if ([self respondsToSelector:NSSelectorFromString(key)]) {

                id d = [decoder decodeObjectOfClass:UIImage.class forKey:key];
                id e = [decoder decodeObjectOfClass:NSString.class forKey:key];
                if(d){
                    [self setValue:d forKey:key];
                }
                
                if (e) {
                    [self setValue:e forKey:key];
                }
            }
        }
    }return self;
}
/// 归档
-(void)encodeWithCoder:(NSCoder *)encoder{
    [super encodeWithCoder:encoder];
    // 获取对象的属性列表
    NSLog(@"printPropertyListByClass = %@",printPropertyListByClass(JobsUserModel.class));
    for (NSString *key in printPropertyListByClass(JobsUserModel.class)) {
        // 检查是否实现了协议中的属性对应的setter方法
        NSLog(@"key.jobsCapitalCaseString = %@",[NSString stringWithFormat:@"set%@:", key.jobsCapitalCaseString]);
        NSLog(@"key = %@",key);
        if ([self respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"set%@:", key.jobsCapitalCaseString])]) {
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
}

//-(void)encodeWithCoder:(NSCoder *)encoder {
//    [encoder encodeObject:self.userName forKey:@"userName"];
//    // 继续为其他属性编码
//}

//-(instancetype)initWithCoder:(NSCoder *)decoder {
//    if (self = [super init]) {
//        self.userName = [decoder decodeObjectForKey:@"userName"];
//        // 继续为其他属性解码
//    }return self;
//}
#pragma mark —— NSSecureCoding
/**
 方法的目的是告诉系统该类是否支持安全编码（NSSecureCoding）。
 通常情况下，为了确保数据的安全性，特别是在跨应用程序或跨设备之间传输数据时，您应该将其设置为 YES。这样可以确保在归档和解档过程中，只有指定的类可以被解档，从而防止潜在的安全风险。
 */
+ (BOOL)supportsSecureCoding {
    return YES;
}
#pragma mark —— 默认值设置
//-(NSString *)userName{
//    if (!_userName) {
//        _userName = @"暂时没有值.张山";
//    }return _userName;
//}
//
//-(NSString *)token{
//    if (!_token) {
//        _token = @"暂时没有值";
//    }return _token;
//}
//
//-(NSString *)uid{
//    if (!_uid) {
//        _uid = @"暂时没有值";
//    }return _uid;
//}
//
//-(UIImage *)userHeaderIMG{
//    if (!_userHeaderIMG) {
//        _userHeaderIMG = JobsIMG(@"用户默认头像");
//    }return _userHeaderIMG;
//}

@end
