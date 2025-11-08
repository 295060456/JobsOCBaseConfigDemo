//
//  NSSet+Extra.h
//  FM
//
//  Created by Admin on 16/12/2024.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSSet (Extra)
/// 对系统方法 setWithArray 的二次封装
+(JobsRetSetByArrBlock _Nonnull)initByArr;

@end

NS_ASSUME_NONNULL_END
