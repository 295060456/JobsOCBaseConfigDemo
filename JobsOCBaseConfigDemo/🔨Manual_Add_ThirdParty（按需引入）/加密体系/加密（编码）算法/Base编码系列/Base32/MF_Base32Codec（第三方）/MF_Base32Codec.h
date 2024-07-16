//
//  MF_Base32Codec.h
//  JobsOCBaseConfig
//  see http://www.ietf.org/rfc/rfc4648.txt for more details
//
//  Created by Jobs on 2024/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MF_Base32Codec : NSObject
/// 将Base32编码的字符串转换为NSData对象
+(NSData *)dataFromBase32String:(NSString *)encoding;
/// 将NSData对象转换为Base32编码的字符串
+(NSString *)base32StringFromData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
