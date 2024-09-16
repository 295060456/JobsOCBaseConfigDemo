//
//  NSString+Path.m
//  Casino
//
//  Created by Jobs on 2021/12/1.
//

#import "NSString+Path.h"

@implementation NSString (Path)
#pragma mark —— iOS 获取文件的 文件名 和 后缀
/// 从路径中获得完整的文件名 （带后缀）
-(NSString *)getFullFileNameByFilePath{
    return self.lastPathComponent;
}
/// 从路径中获得完整的文件名 （不带后缀）
-(NSString *)getOnlyFileNameByFilePath{
    return self.getFullFileNameByFilePath.stringByDeletingPathExtension;
}
/// 从路径中获得文件完整的后缀名 （不带'.'）
+(NSString *)getSuffixFileName:(NSString *)filePath{
    return filePath.getFullFileNameByFilePath.pathExtension;
}
#pragma mark —— 目录获取
-(NSString *)pathForResourceWithFullName{
    // 拆分文件名和扩展名
    NSString *name = self.stringByDeletingPathExtension;
    NSString *extension = self.pathExtension;
    // 使用 NSBundle 获取文件路径
    NSString *filePath = [NSBundle.mainBundle pathForResource:name ofType:extension];
    return filePath;
}

-(NSString *)pathForResourceWithName{
    // 拆分文件名和扩展名
    NSString *name = self.stringByDeletingPathExtension;
    NSString *extension = self.pathExtension;
    // 使用 NSBundle 获取文件路径
    NSString *filePath = [NSBundle.mainBundle pathForResource:name ofType:nil];
    return filePath;
}

@end
