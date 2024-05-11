//
//  NSString+HexadecimalData.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2024/4/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HexadecimalData)
#pragma mark —— HexadecimalData <==> NSString
///【类方法】16进制字符串 转换成 普通的NSString对象
+(NSString *_Nullable)stringByHexString:(NSString *_Nonnull)hexString;
///【实例方法】16进制字符串 转换成 普通的NSString对象
-(NSString *_Nullable)stringByHexString;
///【类方法】普通的NSString对象 转换成 16进制字符串
+(NSString *_Nullable)hexStringByString:(NSString *_Nonnull)string;
///【实例方法】普通的NSString对象 转换成 16进制字符串
-(NSString *_Nullable)hexStringByString;
#pragma mark —— HexadecimalData ==> UIImage
///【类方法】16进制字符串 转换为 UIImage对象
+(UIImage *_Nullable)imageByHexString:(NSString *_Nonnull)hexString;
///【实例方法】16进制字符串 转换为 UIImage对象
-(UIImage *_Nullable)imageByHexString;
#pragma mark —— HexadecimalData ==> NSData
///【类方法】16进制字符串 转换为 NSData对象
+(NSData *_Nullable)dataByHexString:(NSString *_Nonnull)hexString;
///【实例方法】16进制字符串 转换为 NSData对象
-(NSData *_Nullable)dataByHexString;

@end

NS_ASSUME_NONNULL_END
