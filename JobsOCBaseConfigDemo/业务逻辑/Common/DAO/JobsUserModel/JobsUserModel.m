//
//  JobsUserModel.m
//  DouDong-II
//
//  Created by xxx on 2021/1/10.
//

#import "JobsUserModel.h"

@implementation JobsUserModel
BaseProtocol_synthesize
#pragma mark —— MJKeyValue
- (id)mj_newValueFromOldValue:(id)oldValue
                     property:(MJProperty *)property{
    if (property.name.isEqualToString(@"headImage")) {
        return toStringByID(oldValue).jobsUrl;
    }return oldValue;
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_userModelOnceToken = 0;
    static_userModel = nil;
}
static JobsUserModel *static_userModel = nil;
static dispatch_once_t static_userModelOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_userModelOnceToken, ^{
        static_userModel = JobsUserModel.new;
    });return static_userModel;
}
#pragma mark —— NSCoding
/// 解档
- (nullable instancetype)initWithCoder:(NSCoder *)decoder {
//    _img = [coder decodeObjectOfClass:UIImage.class forKey:@"img"];
    if (self = [super initWithCoder:decoder]) {
        for (NSString *key in printPropertyListByClass(self.class)) {
            if ([self respondsToSelector:NSSelectorFromString(key)]) {
                @jobs_weakify(self)
                id value = [decoder decodeObjectOfClasses:jobsMakeMutSet(^(__kindof NSMutableSet <Class>*_Nullable data) {
                    @jobs_strongify(self)
                    data.add(self.class);
                    data.add(NSString.class);
                    data.add(NSNumber.class);
                    data.add(NSArray.class);
                    data.add(NSDictionary.class);
                    data.add(UIImage.class);
                }) forKey:key];
                if (value) self.jobsKVC(key,value);
            }
        }
    }return self;
}
/// 归档
-(void)encodeWithCoder:(NSCoder *)encoder{
    [super encodeWithCoder:encoder];
    // 获取对象的属性列表
    NSLog(@"printPropertyListByClass = %@",printPropertyListByClass(self.class));
    for (NSString *key in printPropertyListByClass(self.class)) {
        // 检查是否实现了协议中的属性对应的setter方法
        NSLog(@"key.jobsCapitalCaseString = %@",@"set".add(key.capitalizedString).add(@":"));
        NSLog(@"key = %@",key);
        if ([self respondsToSelector:NSSelectorFromString(@"set".add(key.capitalizedString).add(@":"))]) {
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
}

//- (nullable instancetype)initWithCoder:(NSCoder *)coder {
//    if (self = [super init]) {
//        _userName = coder.decodeStringBy(@"userName");
//        _userHeader = coder.decodeStringBy(@"userHeader");
//        _userHeaderIMG = coder.decodeImageBy(@"userHeaderIMG");
//        _userRacnkClass = coder.decodeStringBy(@"userRacnkClass");
//        _password = coder.decodeStringBy(@"password");
//        _token = coder.decodeStringBy(@"token");
//        _uid = coder.decodeStringBy(@"uid");
//        _deviceId = coder.decodeStringBy(@"deviceId");
//        _validate = coder.decodeStringBy(@"validate");
//        _resourcesAddress = coder.decodeStringBy(@"resourcesAddress");
//        _postDraftURLStr = coder.decodeStringBy(@"postDraftURLStr");
//        _account = coder.decodeStringBy(@"account");
//        _domain = coder.decodeStringBy(@"domain");
//        _email = coder.decodeStringBy(@"email");
//        _headImg = coder.decodeStringBy(@"headImg");
//        _inviteCode = coder.decodeStringBy(@"inviteCode");
//        _name = coder.decodeStringBy(@"name");
//        _phone = coder.decodeStringBy(@"phone");
//        _qq = coder.decodeStringBy(@"qq");
//        _realName = coder.decodeStringBy(@"realName");
//        _superiorAccount = coder.decodeStringBy(@"superiorAccount");
//        _userId = coder.decodeNumberBy(@"userId");
//        _webChat = coder.decodeStringBy(@"webChat");
//        // 解码更多属性...
//    }return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)coder {
//    [coder encodeObject:self.userName forKey:@"userName"];
//    [coder encodeObject:self.userHeader forKey:@"userHeader"];
//    [coder encodeObject:self.userHeaderIMG forKey:@"userHeaderIMG"];
//    [coder encodeObject:self.userRacnkClass forKey:@"userRacnkClass"];
//    [coder encodeObject:self.password forKey:@"password"];
//    [coder encodeObject:self.token forKey:@"token"];
//    [coder encodeObject:self.uid forKey:@"uid"];
//    [coder encodeObject:self.deviceId forKey:@"deviceId"];
//    [coder encodeObject:self.validate forKey:@"validate"];
//    [coder encodeObject:self.resourcesAddress forKey:@"resourcesAddress"];
//    [coder encodeObject:self.postDraftURLStr forKey:@"postDraftURLStr"];
//    [coder encodeObject:self.account forKey:@"account"];
//    [coder encodeObject:self.domain forKey:@"domain"];
//    [coder encodeObject:self.email forKey:@"email"];
//    [coder encodeObject:self.headImg forKey:@"headImg"];
//    [coder encodeObject:self.inviteCode forKey:@"inviteCode"];
//    [coder encodeObject:self.name forKey:@"name"];
//    [coder encodeObject:self.phone forKey:@"phone"];
//    [coder encodeObject:self.qq forKey:@"qq"];
//    [coder encodeObject:self.realName forKey:@"realName"];
//    [coder encodeObject:self.superiorAccount forKey:@"superiorAccount"];
//    [coder encodeObject:self.userId forKey:@"userId"];
//    [coder encodeObject:self.webChat forKey:@"webChat"];
//    // 编码更多属性
//}
#pragma mark —— NSSecureCoding
/**
 方法的目的是告诉系统该类是否支持安全编码（NSSecureCoding）。
 通常情况下，为了确保数据的安全性，特别是在跨应用程序或跨设备之间传输数据时，您应该将其设置为 YES。这样可以确保在归档和解档过程中，只有指定的类可以被解档，从而防止潜在的安全风险。
 */
+(BOOL)supportsSecureCoding{
    return YES;
}
#pragma mark —— 自动补全
-(void)setExpireTime:(NSString *)expireTime{
    _expireTime = expireTime;
    if(_expireTime) self.tokenExpireTime = _expireTime.chinaTime(nil);
    NSLog(@"Token 的过期时间是:%@-%@",expireTime,self.tokenExpireTime);
}
#pragma mark —— 默认值设置
-(NSString *)token{
    if (!_token) {
        _token = @"";
    }return _token;
}

-(NSString *)userName{
    if (!_userName) {
        _userName = @"";
    }return _userName;
}
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
