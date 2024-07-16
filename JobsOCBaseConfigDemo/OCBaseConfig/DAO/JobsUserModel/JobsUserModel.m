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
///// 解档
//- (nullable instancetype)initWithCoder:(NSCoder *)decoder {
////    _img = [coder decodeObjectOfClass:UIImage.class forKey:@"img"];
//    if (self = [super initWithCoder:decoder]) {
//        for (NSString *key in printPropertyListByClass(JobsUserModel.class)) {
//            if ([self respondsToSelector:NSSelectorFromString(key)]) {
//                id value = [decoder decodeObjectOfClasses:[NSSet setWithArray:@[JobsUserModel.class,
//                                                                                NSString.class,
//                                                                                NSNumber.class,
//                                                                                NSArray.class,
//                                                                                NSDictionary.class,
//                                                                                UIImage.class
//                                                                              ]] forKey:key];
//                if (value) {
//                    [self setValue:value forKey:key];
//                }
//            }
//        }
//    }return self;
//}
///// 归档
//-(void)encodeWithCoder:(NSCoder *)encoder{
//    [super encodeWithCoder:encoder];
//    // 获取对象的属性列表
//    NSLog(@"printPropertyListByClass = %@",printPropertyListByClass(JobsUserModel.class));
//    for (NSString *key in printPropertyListByClass(JobsUserModel.class)) {
//        // 检查是否实现了协议中的属性对应的setter方法
//        NSLog(@"key.jobsCapitalCaseString = %@",[NSString stringWithFormat:@"set%@:", key.jobsCapitalCaseString]);
//        NSLog(@"key = %@",key);
//        if ([self respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"set%@:", key.jobsCapitalCaseString])]) {
//            id value = [self valueForKey:key];
//            [encoder encodeObject:value forKey:key];
//        }
//    }
//}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super init]) {
        _userName = [coder decodeObjectOfClass:[NSString class] forKey:@"userName"];
        _userHeader = [coder decodeObjectOfClass:[NSString class] forKey:@"userHeader"];
        _userHeaderIMG = [coder decodeObjectOfClass:[UIImage class] forKey:@"userHeaderIMG"];
        _userRacnkClass = [coder decodeObjectOfClass:[NSString class] forKey:@"userRacnkClass"];
        _password = [coder decodeObjectOfClass:[NSString class] forKey:@"password"];
        _token = [coder decodeObjectOfClass:[NSString class] forKey:@"token"];
        _uid = [coder decodeObjectOfClass:[NSString class] forKey:@"uid"];
        _deviceId = [coder decodeObjectOfClass:[NSString class] forKey:@"deviceId"];
        _validate = [coder decodeObjectOfClass:[NSString class] forKey:@"validate"];
        _resourcesAddress = [coder decodeObjectOfClass:[NSString class] forKey:@"resourcesAddress"];
        _postDraftURLStr = [coder decodeObjectOfClass:[NSString class] forKey:@"postDraftURLStr"];
        _account = [coder decodeObjectOfClass:[NSString class] forKey:@"account"];
        _domain = [coder decodeObjectOfClass:[NSString class] forKey:@"domain"];
        _email = [coder decodeObjectOfClass:[NSString class] forKey:@"email"];
        _headImg = [coder decodeObjectOfClass:[NSString class] forKey:@"headImg"];
        _inviteCode = [coder decodeObjectOfClass:[NSString class] forKey:@"inviteCode"];
        _name = [coder decodeObjectOfClass:[NSString class] forKey:@"name"];
        _phone = [coder decodeObjectOfClass:[NSString class] forKey:@"phone"];
        _qq = [coder decodeObjectOfClass:[NSString class] forKey:@"qq"];
        _realName = [coder decodeObjectOfClass:[NSString class] forKey:@"realName"];
        _superiorAccount = [coder decodeObjectOfClass:[NSString class] forKey:@"superiorAccount"];
        _userId = [coder decodeObjectOfClass:[NSNumber class] forKey:@"userId"];
        _webChat = [coder decodeObjectOfClass:[NSString class] forKey:@"webChat"];
        // 解码更多属性
    }return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.userName forKey:@"userName"];
    [coder encodeObject:self.userHeader forKey:@"userHeader"];
    [coder encodeObject:self.userHeaderIMG forKey:@"userHeaderIMG"];
    [coder encodeObject:self.userRacnkClass forKey:@"userRacnkClass"];
    [coder encodeObject:self.password forKey:@"password"];
    [coder encodeObject:self.token forKey:@"token"];
    [coder encodeObject:self.uid forKey:@"uid"];
    [coder encodeObject:self.deviceId forKey:@"deviceId"];
    [coder encodeObject:self.validate forKey:@"validate"];
    [coder encodeObject:self.resourcesAddress forKey:@"resourcesAddress"];
    [coder encodeObject:self.postDraftURLStr forKey:@"postDraftURLStr"];
    [coder encodeObject:self.account forKey:@"account"];
    [coder encodeObject:self.domain forKey:@"domain"];
    [coder encodeObject:self.email forKey:@"email"];
    [coder encodeObject:self.headImg forKey:@"headImg"];
    [coder encodeObject:self.inviteCode forKey:@"inviteCode"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.phone forKey:@"phone"];
    [coder encodeObject:self.qq forKey:@"qq"];
    [coder encodeObject:self.realName forKey:@"realName"];
    [coder encodeObject:self.superiorAccount forKey:@"superiorAccount"];
    [coder encodeObject:self.userId forKey:@"userId"];
    [coder encodeObject:self.webChat forKey:@"webChat"];
    // 编码更多属性
}
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
