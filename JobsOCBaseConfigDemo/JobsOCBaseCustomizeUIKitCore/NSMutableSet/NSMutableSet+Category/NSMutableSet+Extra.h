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
-(JobsRetMutableSetByIDBlock _Nonnull)add;
-(JobsRetBOOLByIDBlock _Nonnull)containsObject;

@end

NS_ASSUME_NONNULL_END
