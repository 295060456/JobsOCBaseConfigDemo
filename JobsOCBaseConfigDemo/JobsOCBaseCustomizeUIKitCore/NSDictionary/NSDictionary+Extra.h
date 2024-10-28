//
//  NSDictionary+Extra.h
//  FM
//
//  Created by User on 9/21/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "NSString+Check.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Extra)

-(JobsReturnIDByIDBlock _Nonnull)objectForKey;
/// 转成可变字典
-(JobsReturnMutableDicByVoidBlock _Nonnull)mutableDic;

@end

NS_ASSUME_NONNULL_END
