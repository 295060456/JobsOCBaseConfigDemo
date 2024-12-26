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
/// 对系统方法 initWithContentsOfFile 的二次封装
+(JobsReturnDicByStringBlock _Nonnull)initByContentsOfFile;
/// 对系统方法 initWithContentsOfURL 的二次封装
+(JobsReturnDicByURLBlock _Nonnull)initByContentsOfURL;
/// 转成可变字典
-(JobsReturnMutableDicByVoidBlock _Nonnull)mutableDic;
/// 对系统方法 objectForKey 的二次封装
-(JobsReturnIDByIDBlock _Nonnull)objectForKey;

@end

NS_ASSUME_NONNULL_END
