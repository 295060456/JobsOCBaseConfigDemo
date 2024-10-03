//
//  NSString+Path.h
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Path)
#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(NSString *)getFullFileNameByFilePath;
/// 从路径中获得完整的文件名 （不带后缀）
-(NSString *)getOnlyFileNameByFilePath;
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(JobsReturnStringByStringBlock _Nonnull)getSuffixFileName;
#pragma mark —— 目录获取
-(NSString *)pathForResourceWithFullName;
-(NSString *)pathForResourceWithName;
/// OC字符串路径拼接
-(JobsReturnStringByStringBlock _Nonnull)addPathComponent;
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsReturnFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName;

@end

NS_ASSUME_NONNULL_END
