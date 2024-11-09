//
//  FMSignUpModel.m
//  FM
//
//  Created by Admin on 6/11/2024.
//

#import "FMDoorModel.h"

@implementation FMDoorModel
#pragma mark —— NSCoding
/// 解档
//- (nullable instancetype)initWithCoder:(NSCoder *)decoder {
////    _img = [coder decodeObjectOfClass:UIImage.class forKey:@"img"];
//    if (self = [super initWithCoder:decoder]) {
//        for (NSString *key in printPropertyListByClass(self.class)) {
//            if ([self respondsToSelector:NSSelectorFromString(key)]) {
//                @jobs_weakify(self)
//                id value = [decoder decodeObjectOfClasses:jobsMakeMutSet(^(__kindof NSMutableSet <Class>*_Nullable data) {
//                    @jobs_strongify(self)
//                    data.add(self.class);
//                    data.add(NSString.class);
//                    data.add(NSNumber.class);
//                    data.add(NSArray.class);
//                    data.add(NSDictionary.class);
//                    data.add(UIImage.class);
//                }) forKey:key];
//                if (value) self.jobsKVC(key,value);
//            }
//        }
//    }return self;
//}
- (nullable instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
#pragma mark —— 共用参数
        _accessToken = [decoder decodeObjectOfClass:NSString.class forKey:@"accessToken"];
        _mobile = [decoder decodeObjectOfClass:NSString.class forKey:@"mobile"];
        _userName = [decoder decodeObjectOfClass:NSString.class forKey:@"userName"];
#pragma mark —— 请求参数
        _captcha_id = [decoder decodeObjectOfClass:NSString.class forKey:@"captcha_id"];
        _captcha_key = [decoder decodeObjectOfClass:NSString.class forKey:@"captcha_key"];
        _captcha_output = [decoder decodeObjectOfClass:NSString.class forKey:@"captcha_output"];
        _countryCode = [decoder decodeObjectOfClass:NSString.class forKey:@"countryCode"];
        _domain = [decoder decodeObjectOfClass:NSString.class forKey:@"domain"];
        _gen_time = [decoder decodeObjectOfClass:NSString.class forKey:@"gen_time"];
        _inviteCode = [decoder decodeObjectOfClass:NSString.class forKey:@"inviteCode"];
        _lot_number = [decoder decodeObjectOfClass:NSString.class forKey:@"lot_number"];
        _pass_token = [decoder decodeObjectOfClass:NSString.class forKey:@"pass_token"];
        _password = [decoder decodeObjectOfClass:NSString.class forKey:@"password"];
        _referCode = [decoder decodeObjectOfClass:NSString.class forKey:@"referCode"];
        _smsCode = [decoder decodeObjectOfClass:NSString.class forKey:@"smsCode"];
        _actionType = [decoder decodeObjectOfClass:NSNumber.class forKey:@"actionType"];
        _businessSource = [decoder decodeObjectOfClass:NSNumber.class forKey:@"businessSource"];
        _callFlag = [decoder decodeObjectOfClass:NSString.class forKey:@"callFlag"];
        _mobileArea = [decoder decodeObjectOfClass:NSString.class forKey:@"mobileArea"];
#pragma mark —— 响应参数
        _expireTime = [decoder decodeObjectOfClass:NSString.class forKey:@"expireTime"];
        _regTime = [decoder decodeObjectOfClass:NSString.class forKey:@"regTime"];
        _birthday = [decoder decodeObjectOfClass:NSString.class forKey:@"birthday"];
        _nickName = [decoder decodeObjectOfClass:NSString.class forKey:@"nickName"];
        _status = [decoder decodeObjectOfClass:NSString.class forKey:@"status"];
        _financeTier = [decoder decodeIntegerForKey:@"financeTier"];
        _cryptoCount = [decoder decodeIntegerForKey:@"cryptoCount"];
        _sex = [decoder decodeObjectOfClass:NSString.class forKey:@"sex"];
        _realName = [decoder decodeObjectOfClass:NSString.class forKey:@"realName"];
        _passwordFlag = [decoder decodeBoolForKey:@"passwordFlag"];
        _regCurrency = [decoder decodeObjectOfClass:NSString.class forKey:@"regCurrency"];
        _identityCode = [decoder decodeObjectOfClass:NSString.class forKey:@"identityCode"];
        _ID = [decoder decodeIntegerForKey:@"ID"];
        _tenantId = [decoder decodeIntegerForKey:@"tenantId"];
        _email = [decoder decodeObjectOfClass:NSString.class forKey:@"email"];
        _nickNameStatus = [decoder decodeBoolForKey:@"nickNameStatus"];
        _regNationCode = [decoder decodeObjectOfClass:NSString.class forKey:@"regNationCode"];
        _regNation = [decoder decodeObjectOfClass:NSString.class forKey:@"regNation"];
        _avatar = [decoder decodeObjectOfClass:NSString.class forKey:@"avatar"];
        _role = [decoder decodeIntegerForKey:@"role"];
        _bankCardCount = [decoder decodeIntegerForKey:@"bankCardCount"];
        _regDay = [decoder decodeIntegerForKey:@"regDay"];
        _vipLevel = [decoder decodeIntegerForKey:@"vipLevel"];
        _regLang = [decoder decodeObjectOfClass:NSString.class forKey:@"regLang"];
#pragma mark —— 自建字段
        _tokenExpireTime = [decoder decodeObjectOfClass:NSString.class forKey:@"tokenExpireTime"];
        _userDefaultHeadImage = [decoder decodeObjectOfClass:UIImage.class forKey:@"userDefaultHeadImage"];
        // 解码更多属性（如有）
    }return self;
}
/// 归档
//- (void)encodeWithCoder:(NSCoder *)encoder {
//    [super encodeWithCoder:encoder];
//    // 获取对象的属性列表
//    NSLog(@"printPropertyListByClass = %@", printPropertyListByClass(self.class));
//    for (NSString *key in printPropertyListByClass(self.class)) {
//        NSLog(@"DDD = %@",key.removeColonMark);
//        // 拼接setter方法的名称
//        NSString *setterSelectorString = key.substringBeforeColon.capitalizeFirstLetterAndPrefixSet();
////        NSString *gg = key.substringBeforeColon;
//        // 检查是否实现了对应的 setter 方法
//        SEL setterSelector = NSSelectorFromString(setterSelectorString);
//        if ([self respondsToSelector:setterSelector]) {
//            id value = [self valueForKey:key.substringBeforeColon];
//            [encoder encodeObject:value forKey:key.substringBeforeColon];
//        } else {
//            NSLog(@"未找到 setter 方法: %@", setterSelectorString);
//        }
//    }
//}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [super encodeWithCoder:encoder];
#pragma mark —— 共用参数
    [encoder encodeObject:self.accessToken forKey:@"accessToken"];
    [encoder encodeObject:self.mobile forKey:@"mobile"];
    [encoder encodeObject:self.userName forKey:@"userName"];
#pragma mark —— 请求参数
    [encoder encodeObject:self.captcha_id forKey:@"captcha_id"];
    [encoder encodeObject:self.captcha_key forKey:@"captcha_key"];
    [encoder encodeObject:self.captcha_output forKey:@"captcha_output"];
    [encoder encodeObject:self.countryCode forKey:@"countryCode"];
    [encoder encodeObject:self.domain forKey:@"domain"];
    [encoder encodeObject:self.gen_time forKey:@"gen_time"];
    [encoder encodeObject:self.inviteCode forKey:@"inviteCode"];
    [encoder encodeObject:self.lot_number forKey:@"lot_number"];
    [encoder encodeObject:self.pass_token forKey:@"pass_token"];
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.referCode forKey:@"referCode"];
    [encoder encodeObject:self.smsCode forKey:@"smsCode"];
    [encoder encodeObject:self.actionType forKey:@"actionType"];
    [encoder encodeObject:self.businessSource forKey:@"businessSource"];
    [encoder encodeObject:self.callFlag forKey:@"callFlag"];
    [encoder encodeObject:self.mobileArea forKey:@"mobileArea"];
#pragma mark —— 响应参数
    [encoder encodeObject:self.expireTime forKey:@"expireTime"];
    [encoder encodeObject:self.regTime forKey:@"regTime"];
    [encoder encodeObject:self.birthday forKey:@"birthday"];
    [encoder encodeObject:self.nickName forKey:@"nickName"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeInteger:self.financeTier forKey:@"financeTier"];
    [encoder encodeInteger:self.cryptoCount forKey:@"cryptoCount"];
    [encoder encodeObject:self.sex forKey:@"sex"];
    [encoder encodeObject:self.realName forKey:@"realName"];
    [encoder encodeBool:self.passwordFlag forKey:@"passwordFlag"];
    [encoder encodeObject:self.regCurrency forKey:@"regCurrency"];
    [encoder encodeObject:self.identityCode forKey:@"identityCode"];
    [encoder encodeInteger:self.ID forKey:@"ID"];
    [encoder encodeInteger:self.tenantId forKey:@"tenantId"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeBool:self.nickNameStatus forKey:@"nickNameStatus"];
    [encoder encodeObject:self.regNationCode forKey:@"regNationCode"];
    [encoder encodeObject:self.regNation forKey:@"regNation"];
    [encoder encodeObject:self.avatar forKey:@"avatar"];
    [encoder encodeInteger:self.role forKey:@"role"];
    [encoder encodeInteger:self.bankCardCount forKey:@"bankCardCount"];
    [encoder encodeInteger:self.regDay forKey:@"regDay"];
    [encoder encodeInteger:self.vipLevel forKey:@"vipLevel"];
    [encoder encodeObject:self.regLang forKey:@"regLang"];
#pragma mark —— 自建字段
    [encoder encodeObject:self.tokenExpireTime forKey:@"tokenExpireTime"];
    [encoder encodeObject:self.userDefaultHeadImage forKey:@"userDefaultHeadImage"];
    // 编码更多属性（如有）
}
#pragma mark —— NSSecureCoding
/**
 方法的目的是告诉系统该类是否支持安全编码（NSSecureCoding）。
 通常情况下，为了确保数据的安全性，特别是在跨应用程序或跨设备之间传输数据时，您应该将其设置为 YES。这样可以确保在归档和解档过程中，只有指定的类可以被解档，从而防止潜在的安全风险。
 */
+(BOOL)supportsSecureCoding{
    return YES;
}
/// MJExtension 默认支持基本数据类型和 NSString 等常见对象，但对于 UIImage 这样的非 JSON 序列化类型，不直接支持。
/// 因此，当 MJExtension 尝试将 UIImage 对象转换为 NSDictionary 时会出现崩溃
+(NSArray *)mj_ignoredPropertyNames{
    return @[@"userDefaultHeadImage"];
}

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}

-(void)setExpireTime:(NSString *)expireTime{
    _expireTime = expireTime;
    if(_expireTime) self.tokenExpireTime = _expireTime.jobsTime();
    NSLog(@"Token 的过期时间是:%@-%@",expireTime,self.tokenExpireTime);
}
#pragma mark —— 一些公有方法
-(JobsDoorModelBlock _Nonnull)updateBy{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(__kindof FMDoorModel *_Nullable doorModel){
        @jobs_strongify(self)
        NSMutableDictionary *bp = doorModel.mj_keyValues;
        for (NSString *key in bp) {
            if ([key isEqualToString:@"id"]) continue;
            if(bp[key]) {
                if([bp[key] isKindOfClass:NSString.class]){
                    NSString *str = bp[key];
                    if(isValue(str)){
                        [self setValue:str forKey:key];
                    }
                }else{
                    [self setValue:bp[key] forKey:key];
                }
            }
        }return self;
    };
}
#pragma mark —— 默认值
-(NSString *)userName{
    if(!_userName){
        _userName = @"";
    }return _userName;
}

-(NSString *)accessToken{
    if(!_accessToken){
        _accessToken = @"";
    }return _accessToken;
}

-(UIImage *)userDefaultHeadImage{
    if(!_userDefaultHeadImage){
        _userDefaultHeadImage = JobsIMG(@"小狮子");
    }return _userDefaultHeadImage;
}

-(NSString *)tokenExpireTime{
    if(!_tokenExpireTime){
        _tokenExpireTime = @"";
    }return _tokenExpireTime;
}

@end
