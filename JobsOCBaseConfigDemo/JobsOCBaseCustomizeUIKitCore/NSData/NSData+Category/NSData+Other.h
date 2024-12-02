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
-(JobsReturnDataByDataBlock _Nonnull)initWithData;

+(JobsReturnDataByDataBlock _Nonnull)initByData;
+(JobsReturnDataByURLBlock _Nonnull)initByURL;
+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile;
+(JobsReturnDataByStringBlock _Nonnull)initByBase64EncodedString;
+(JobsReturnDataByDataBlock _Nonnull)initByBase64EncodedData;
+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile_ReadingMappedIfSafe;
+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile_NSDataReadingUncached;
+(JobsReturnDataByStringBlock _Nonnull)dataByContentsOfFile_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
+(JobsReturnDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedIfSafe;
+(JobsReturnDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingUncached;
+(JobsReturnDataByURLBlock _Nonnull)dataByContentsOfURL_NSDataReadingMappedAlways API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
#pragma mark —— 一些功能性的
/// 解压缩字符串
-(NSString *)decompressToStr;
-(NSString *)stringByUTF8Encoding;

@end

NS_ASSUME_NONNULL_END
