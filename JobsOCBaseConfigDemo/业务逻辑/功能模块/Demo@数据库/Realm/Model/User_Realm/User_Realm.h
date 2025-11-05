//
//  User_Realm.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#if __has_include(<Realm/Realm.h>)
#import <Realm/Realm.h>
#else
#import "Realm.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface User_Realm : RLMObject

@property NSString *name;
@property NSInteger age;

@end
// 需要为 Realm 模型类定义一个 RLMArray 类型的属性时，使用宏定义来简化声明
RLM_COLLECTION_TYPE(User)

NS_ASSUME_NONNULL_END
