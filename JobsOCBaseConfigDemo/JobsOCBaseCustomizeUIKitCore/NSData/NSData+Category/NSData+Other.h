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
#pragma mark —— 对系统初始化方法的封装
-(JobsRetDataByDataBlock _Nonnull)initWithData;

+(JobsRetDataByNSUIntegerBlock _Nonnull)initByCapacity;
+(JobsRetDataByDataBlock _Nonnull)initByData;
+(JobsRetDataByURLBlock _Nonnull)initByURL;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile;
+(JobsRetDataByStrBlock _Nonnull)initByBase64EncodedString;
+(JobsRetDataByDataBlock _Nonnull)initByBase64EncodedData;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile_ReadingMappedIfSafe;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile_NSDataReadingUncached;
+(JobsRetDataByStrBlock _Nonnull)dataByContentsOfFile_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
+(JobsRetDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedIfSafe;
+(JobsRetDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingUncached;
+(JobsRetDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
#pragma mark —— 一些功能性的
/// 解压缩字符串
-(NSString *)decompressToStr;
-(NSString *)stringByUTF8Encoding;

@end

NS_ASSUME_NONNULL_END
