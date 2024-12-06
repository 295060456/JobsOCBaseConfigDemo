//
//  NSString+HexadecimalData.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>
#import "UIImage+Extras.h"
#import "JobsBlock.h"
#import "NSString+Replace.h"
#import "NSString+Conversion.h"
#import "JobsMakes.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HexadecimalData)
#pragma mark —— HexadecimalData <==> NSString
///【类方法】16进制字符串 转换成 普通的NSString对象
+(JobsReturnStringByStringBlock _Nonnull)stringByHexString;
///【实例方法】16进制字符串 转换成 普通的NSString对象
-(NSString *_Nullable)stringByHexString;
///【类方法】普通的NSString对象 转换成 16进制字符串
+(JobsReturnStringByStringBlock _Nonnull)hexStringByString;
///【实例方法】普通的NSString对象 转换成 16进制字符串
-(NSString *_Nullable)hexStringByString;
#pragma mark —— HexadecimalData ==> UIImage
///【类方法】16进制字符串 转换为 UIImage对象
+(JobsReturnImageByStringBlock _Nonnull)imageByHexString;
///【实例方法】16进制字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByHexString;
#pragma mark —— HexadecimalData ==> NSData
///【类方法】16进制字符串 转换为 NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataByHexString;
///【实例方法】16进制字符串 转换为 NSData对象
-(NSData *_Nullable)dataByHexString;

@end

NS_ASSUME_NONNULL_END
