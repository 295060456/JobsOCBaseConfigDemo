//
//  NSData+Other.h
//  JobsOCBaseConfig
//
//  Created by admin on 6/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Other)
/// 解压缩字符串
-(NSString *)decompressToStr;
-(NSString *)stringByUTF8Encoding;

@end

NS_ASSUME_NONNULL_END
