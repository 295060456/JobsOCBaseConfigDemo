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
+(JobsReturnStringByStringBlock _Nonnull)getSuffixFileName{
    return ^__kindof NSString *_Nullable(NSString *_Nullable data){
        return data.getFullFileNameByFilePath.pathExtension;
    };
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
/// OC字符串路径拼接
-(JobsReturnStringByStringBlock _Nonnull)addPathComponent{
    @jobs_weakify(self)
    return ^NSMutableString *_Nullable(NSString *_Nonnull str) {
        @jobs_strongify(self)
        if(!str) str = @"";
        // 系统的stringByAppendingString方法在参数为nil的时候会崩溃
        return JobsMutableString([self stringByAppendingPathComponent:str]);/// 自动处理（加上"/"）
    };
}
/// 完整的文件名提取普通文件名和文件后缀名
-(JobsReturnFileNameModelByFileFullNameStringBlock _Nonnull)byFileFullName{
    return ^FileNameModel *_Nonnull(NSString *_Nullable fileFullName){
        FileNameModel *fileNameModel = FileNameModel.new;
        /// 使用"."分割文件名，获取文件名和文件类型
        NSArray<NSString *> *components = [fileFullName componentsSeparatedByString:@"."];
        if (components.count != 2) {
            NSLog(@"文件名格式错误: %@", fileFullName);
            return fileNameModel;
        }
        
        fileNameModel.name = components[0];
        fileNameModel.type = components[1];
        return fileNameModel;
    };
}

@end
