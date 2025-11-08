//
//  NSString+NSUserDefaults.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <Foundation/Foundation.h>
#import "JobsUserDefaultDefine.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// NSUserDefaults相关
@interface NSString (NSUserDefaults)
#pragma mark —— 存值
/// 保存 BOOL 值
-(jobsByBOOLBlock _Nonnull)userDefaultsByBOOL;
/// 保存 Object 值
-(jobsByIDBlock _Nonnull)userDefaultsByObj;
/// 保存 NSInteger 值
-(jobsByNSIntegerBlock _Nonnull)userDefaultsByInteger;
/// 保存 float 值
-(jobsByFloatBlock _Nonnull)userDefaultsByFloat;
/// 保存 double 值
-(jobsByDoubleBlock _Nonnull)userDefaultsByDouble;
/// 保存 NSURL 值
-(jobsByURLBlock _Nonnull)userDefaultsByURL;
#pragma mark —— 取值
/// 读取 BOOL 值
-(JobsRetBOOLByVoidBlock _Nonnull)boolBy;
/// 读取 NSInteger 值
-(JobsRetNSIntegerByVoidBlock _Nonnull)integerBy;
/// 读取 float 值
-(JobsRetFloatByVoidBlock _Nonnull)floatBy;
/// 读取 double 值
-(JobsRetDoubleByVoidBlock _Nonnull)doubleBy;
/// 读取 double 值
-(JobsRetURLByVoidBlock _Nonnull)urlBy;

@end

NS_ASSUME_NONNULL_END
