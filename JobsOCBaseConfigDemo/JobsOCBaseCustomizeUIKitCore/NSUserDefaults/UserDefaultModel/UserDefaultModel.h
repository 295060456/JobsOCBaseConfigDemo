//
//  UserDefaultModel.h
//  DouDong-II
//
//  Created by Jobs on 2020/12/19.
//

#import <Foundation/Foundation.h>
#import "NSObject+Class.h"

NS_ASSUME_NONNULL_BEGIN
/// 需要被归档的类，需要按照JobsObject的标准写法
@interface JobsObject : NSObject<NSCoding>

@end

@interface UserDefaultModel : NSObject
// 对象
@property(nonatomic,strong,nullable)__kindof NSObject <NSCoding>*obj;
// 基本数据类型
@property(nonatomic,assign)int intValue;
@property(nonatomic,assign)float floatValue;
@property(nonatomic,assign)BOOL booLValue;
@property(nonatomic,assign)NSInteger NSIntValue;
@property(nonatomic,assign)CGFloat CGfloatValue;
// key
@property(nonatomic,strong,nonnull)NSString *key;

@end

NS_ASSUME_NONNULL_END
