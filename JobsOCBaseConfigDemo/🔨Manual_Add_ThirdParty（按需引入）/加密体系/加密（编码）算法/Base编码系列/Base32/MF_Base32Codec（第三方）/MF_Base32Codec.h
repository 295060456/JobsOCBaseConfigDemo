//
//  MF_Base32Codec.h
//  JobsOCBaseConfig
//  see http://www.ietf.org/rfc/rfc4648.txt for more details
//
//  Created by Jobs on 2024/4/25.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface MF_Base32Codec : NSObject
/// 将Base32编码的字符串转换为NSData对象
+(JobsReturnDataByStringBlock _Nonnull)dataFromBase32String;
/// 将NSData对象转换为Base32编码的字符串
+(JobsReturnStringByDataBlock _Nonnull)base32StringFromData;

@end

NS_ASSUME_NONNULL_END
