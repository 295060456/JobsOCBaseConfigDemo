//
//  NSObject+RunrtimeGet.h
//  Casino
//
//  Created by Jobs on 2022/1/6.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN
/// runtime方式获取对象的一些属性
@interface NSObject (RunrtimeGet)

-(Ivar _Nullable)classGetInstanceVariableWithClass:(Class _Nullable)cls
                              instanceVariableName:(NSString *_Nonnull)instanceVariableName;

-(id _Nullable)object:(NSObject *)object
              getIvar:(Ivar)ivar;

@end

NS_ASSUME_NONNULL_END
