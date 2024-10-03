//
//  JobsUserModel.h
//  DouDong-II
//
//  Created by xxx on 2021/1/10.
//

#import <Foundation/Foundation.h>
#import "JobsDefineAllEnumHeader.h"
#import "BaseProtocol.h"
#import "JobsObject.h"
#import "BaseModel.h"
#import "NSObject+Class.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserModel : BaseModel
<
NSCoding,/// 编码
NSSecureCoding,/// 解码
BaseProtocol
>

@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *userHeader;/// 用户头像URL
@property(nonatomic,strong)UIImage *userHeaderIMG;/// 用户头像图像 ⚠️ 直接归档存不进去，要做特殊的处理
@property(nonatomic,copy)NSString *userRacnkClass;/// 用户等级
@property(nonatomic,copy)NSString *password;
@property(nonatomic,copy)NSString *token;
@property(nonatomic,copy)NSString *expireTime;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *deviceId;/// 设备ID
@property(nonatomic,copy)NSString *validate;/// 网易云盾
@property(nonatomic,copy)NSString *resourcesAddress;/// 文件服务器地址
@property(nonatomic,copy)NSString *postDraftURLStr;/// 保存用户编辑中的文字

@property(nonatomic,copy)NSString *account;
@property(nonatomic,copy)NSString *domain;// 域名配置
@property(nonatomic,copy)NSString *email;// 邮箱
@property(nonatomic,copy)NSString *headImg;
@property(nonatomic,copy)NSString *inviteCode;// 邀请码
@property(nonatomic,copy)NSString *name;// 名称
@property(nonatomic,copy)NSString *phone;// 手机号
@property(nonatomic,copy)NSString *qq;
@property(nonatomic,copy)NSString *realName;// 真实姓名
@property(nonatomic,copy)NSString *superiorAccount;// 上级账号
@property(nonatomic,strong)NSNumber *userId;
@property(nonatomic,copy)NSString *webChat;

@property(nonatomic,copy)NSString *tokenExpireTime;/// 手动添加的

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsUserModel *_Nonnull jobsMakeUserModel(jobsByUserModelBlock _Nonnull block){
    JobsUserModel *data = JobsUserModel.alloc.init;
    if (block) block(data);
    return data;
}
