//
//  NSData+Other.h
//  JobsOCBaseConfig
//
//  Created by admin on 6/5/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Other)
/// 解压缩字符串
-(NSString *)decompressToStr;
-(NSString *)stringByUTF8Encoding;
+(JobsReturnDataByURLBlock _Nonnull)byURL;

@end

NS_ASSUME_NONNULL_END
