//
//  NSMutableSet+Extra.h
//  FM
//
//  Created by User on 8/6/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableSet (Extra)
/// 阻止向可变集合添加空元素
-(JobsReturnIDByIDBlock _Nonnull)jobsAddObject;

@end

NS_ASSUME_NONNULL_END
