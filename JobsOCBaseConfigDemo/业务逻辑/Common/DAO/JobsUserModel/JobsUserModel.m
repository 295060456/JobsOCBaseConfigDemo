//
//  JobsUserModel.m
//  DouDong-II
//
//  Created by xxx on 2021/1/10.
//

#import "JobsUserModel.h"

@implementation JobsUserModel
BaseProtocol_synthesize
RACProtocol_synthesize
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
                    data.add(self.class)
                    .add(NSString.class)
                    .add(NSNumber.class)
                    .add(NSArray.class)
                    .add(NSDictionary.class)
                    .add(UIImage.class);
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
    JobsLog(@"printPropertyListByClass = %@",printPropertyListByClass(self.class));
    for (NSString *key in printPropertyListByClass(self.class)) {
        // 检查是否实现了协议中的属性对应的setter方法
        JobsLog(@"key.jobsCapitalCaseString = %@",@"set".add(key.capitalizedString).add(@":"));
        JobsLog(@"key = %@",key);
        if ([self respondsToSelector:NSSelectorFromString(@"set".add(key.capitalizedString).add(@":"))]) {
            id value = [self valueForKey:key];
            [encoder encodeObject:value forKey:key];
        }
    }
}

//- (nullable instancetype)initWithCoder:(NSCoder *)decoder {
//    if (self = [super initWithCoder:decoder]) {
//        _userName = decoder.decodeStringBy(@"userName");
//        _userHeader = decoder.decodeStringBy(@"userHeader");
//        _userHeaderIMG = decoder.decodeImageBy(@"userHeaderIMG");
//        _userRacnkClass = decoder.decodeStringBy(@"userRacnkClass");
//        _password = decoder.decodeStringBy(@"password");
//        _token = decoder.decodeStringBy(@"token");
//        _uid = decoder.decodeStringBy(@"uid");
//        _deviceId = decoder.decodeStringBy(@"deviceId");
//        _validate = decoder.decodeStringBy(@"validate");
//        _resourcesAddress = decoder.decodeStringBy(@"resourcesAddress");
//        _postDraftURLStr = decoder.decodeStringBy(@"postDraftURLStr");
//        _account = decoder.decodeStringBy(@"account");
//        _domain = decoder.decodeStringBy(@"domain");
//        _email = decoder.decodeStringBy(@"email");
//        _headImg = decoder.decodeStringBy(@"headImg");
//        _inviteCode = decoder.decodeStringBy(@"inviteCode");
//        _name = decoder.decodeStringBy(@"name");
//        _phone = decoder.decodeStringBy(@"phone");
//        _qq = decoder.decodeStringBy(@"qq");
//        _realName = decoder.decodeStringBy(@"realName");
//        _superiorAccount = decoder.decodeStringBy(@"superiorAccount");
//        _userId = decoder.decodeNumberBy(@"userId");
//        _webChat = decoder.decodeStringBy(@"webChat");
//        // 解码更多属性...
//    }return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)encoder {
//    [super encodeWithCoder:encoder];
//    [encoder encodeObject:self.userName forKey:@"userName"];
//    [encoder encodeObject:self.userHeader forKey:@"userHeader"];
//    [encoder encodeObject:self.userHeaderIMG forKey:@"userHeaderIMG"];
//    [encoder encodeObject:self.userRacnkClass forKey:@"userRacnkClass"];
//    [encoder encodeObject:self.password forKey:@"password"];
//    [encoder encodeObject:self.token forKey:@"token"];
//    [encoder encodeObject:self.uid forKey:@"uid"];
//    [encoder encodeObject:self.deviceId forKey:@"deviceId"];
//    [encoder encodeObject:self.validate forKey:@"validate"];
//    [encoder encodeObject:self.resourcesAddress forKey:@"resourcesAddress"];
//    [encoder encodeObject:self.postDraftURLStr forKey:@"postDraftURLStr"];
//    [encoder encodeObject:self.account forKey:@"account"];
//    [encoder encodeObject:self.domain forKey:@"domain"];
//    [encoder encodeObject:self.email forKey:@"email"];
//    [encoder encodeObject:self.headImg forKey:@"headImg"];
//    [encoder encodeObject:self.inviteCode forKey:@"inviteCode"];
//    [encoder encodeObject:self.name forKey:@"name"];
//    [encoder encodeObject:self.phone forKey:@"phone"];
//    [encoder encodeObject:self.qq forKey:@"qq"];
//    [encoder encodeObject:self.realName forKey:@"realName"];
//    [encoder encodeObject:self.superiorAccount forKey:@"superiorAccount"];
//    [encoder encodeObject:self.userId forKey:@"userId"];
//    [encoder encodeObject:self.webChat forKey:@"webChat"];
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
    JobsLog(@"Token 的过期时间是:%@-%@",expireTime,self.tokenExpireTime);
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
