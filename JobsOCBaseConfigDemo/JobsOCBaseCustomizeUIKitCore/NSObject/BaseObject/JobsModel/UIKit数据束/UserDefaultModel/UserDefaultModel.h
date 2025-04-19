//
//  UserDefaultModel.h
//  DouDong-II
//
//  Created by Jobs on 2020/12/19.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "BaseModel.h"
#import "NSObject+Class.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultModel : BaseModel
// 对象
@property(nonatomic,strong,nullable)__kindof NSObject <NSCoding>*obj;
// 基本数据类型
Prop_assign()int intValue;
Prop_assign()float floatValue;
Prop_assign()BOOL booLValue;
Prop_assign()NSInteger NSIntValue;
Prop_assign()CGFloat CGfloatValue;
// key
@property(nonatomic,copy,nonnull)NSString *key;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UserDefaultModel *_Nonnull jobsMakeUserDefaultModel(jobsByUserDefaultModelBlock _Nonnull block){
    UserDefaultModel *data = UserDefaultModel.alloc.init;
    if (block) block(data);
    return data;
}
