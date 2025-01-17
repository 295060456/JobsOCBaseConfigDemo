//
//  JobsLoadingImage.h
//  TFRememberHistoryInputContentWithDropList
//
//  Created by Jobs on 2020/9/29.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsString.h"
#import "NSString+Others.h"
#import "UIImage+YBGIF.h"
/// 直接拖图片在项目文件夹，没用Bundle进行管理，也没有用Assets.xcassets
/// @param imgName 文件可以不强制要求带后缀名，系统会自动识别png文件
NS_INLINE UIImage *__nullable JobsIMG(NSString *__nonnull imgName){
    UIImage *image = [UIImage imageNamed:imgName];
    if(!image && isValue(imgName)){
        JobsLog(@"文件名为%@的图片获取失败，请检查",imgName);
    }return image;
}

NS_INLINE UIImage *__nullable JobsGifIMG(NSString *__nonnull imgName){
    UIImage *image = [UIImage animatedGIFNamed:imgName];
    if(!image && isValue(imgName)){
        JobsLog(@"文件名为%@的图片获取失败，请检查",imgName);
    }return image;
}
/// 根据参数输出系统需要的文件路径
/// @param blueFolderName 如果资源存在于【蓝色文件夹】下则blueFolderName是蓝色文件夹的名字，如果资源位于【黄色文件夹】下则不填（亦可以传@""）
/// @param pathForResource 自定义 Bundle 的名字（不能带.bundle后缀）
/// @param bundle_folderName 如果在此自定义Bundle下还存在文件夹，不管几级都在此写，属于中间路径，函数内部是进行字符串拼接；如果不存在可以传nil 或者JobsInternationalization(@"")
/// @param ofType 文件类型（后缀名）
NS_INLINE NSString *__nonnull JobsPathForResource(NSString *__nullable blueFolderName,
                                                  NSString *__nullable pathForResource,
                                                  NSString *__nullable bundle_folderName,
                                                  NSString *__nullable ofType){
    NSString *filePath = nil;
    /// 最外层是蓝色文件夹
    if (isNull(blueFolderName)) {
        filePath = [NSBundle.mainBundle pathForResource:pathForResource
                                                 ofType:ofType
                                            inDirectory:blueFolderName];//蓝色文件夹下是bundle
        /// 蓝色文件夹下是蓝色文件夹
        if (isNull(filePath)) {
            filePath = blueFolderName;
        }
    }else{/// 最外层是黄色文件夹
        filePath = pathForResource.add(@".").add(ofType).pathForResourceWithFullName;
    }
    if (isValue(bundle_folderName)) {
        filePath = filePath.addPathComponent(bundle_folderName);
    }
    if(!filePath) filePath = @"";
    return filePath;
}
/// 读取自定义Bundle文件里面的图片 输出 NSString *
/// @param blueFolderName 如果资源存在于【蓝色文件夹】下则blueFolderName是蓝色文件夹的名字，如果资源位于【黄色文件夹】下则不填（亦可以传@""）
/// @param pathForResource 自定义 Bundle 的名字（不能带.bundle后缀）
/// @param bundle_folderName 如果在此自定义Bundle下还存在文件夹，不管几级都在此写，属于中间路径，函数内部是进行字符串拼接；如果不存在可以传nil 或者JobsInternationalization(@"")
/// @param fileFullNameWithSuffix 目标图片的名字。如果不带后缀名，则默认@".png" 后缀；如果是其他格式资源请自带后缀名
NS_INLINE NSString *__nullable JobsPathForBuddleIMG(NSString *__nullable blueFolderName,
                                                    NSString *__nullable pathForResource,
                                                    NSString *__nullable bundle_folderName,
                                                    NSString *__nonnull fileFullNameWithSuffix){
    NSString *filePath = JobsPathForResource(blueFolderName,
                                             pathForResource,
                                             bundle_folderName,
                                             @"bundle");
    /// 容错处理
    if (![fileFullNameWithSuffix containsString:@"."]) {//如果是其他格式资源请自带后缀名
        fileFullNameWithSuffix = fileFullNameWithSuffix.add(@".png");
    }filePath = filePath.addPathComponent(fileFullNameWithSuffix);
    return filePath;
}
/// 读取自定义Bundle文件里面的图片 输出 UIImage *
/// @param blueFolderName 如果资源存在于【蓝色文件夹】下则blueFolderName是蓝色文件夹的名字，如果资源位于【黄色文件夹】下则不填（亦可以传@""）
/// @param pathForResource 自定义 Bundle 的名字（不能带.bundle后缀）
/// @param bundle_folderName 如果在此自定义Bundle下还存在文件夹，不管几级都在此写，属于中间路径，函数内部是进行字符串拼接；如果不存在可以传nil 或者JobsInternationalization(@"")
/// @param fileFullNameWithSuffix 目标图片的名字。如果不带后缀名，则默认@".png" 后缀；如果是其他格式资源请自带后缀名
NS_INLINE UIImage *__nullable JobsBuddleIMG(NSString *__nullable blueFolderName,
                                            NSString *__nullable pathForResource,
                                            NSString *__nullable bundle_folderName,
                                            NSString *__nonnull fileFullNameWithSuffix){
    NSString *filePath = JobsPathForBuddleIMG(blueFolderName,
                                              pathForResource,
                                              bundle_folderName,
                                              fileFullNameWithSuffix);
    return [UIImage imageWithContentsOfFile:filePath];
}
/// 读取自定义Bundle文件里面的图片 输出 NSData *
/// @param blueFolderName 如果资源存在于【蓝色文件夹】下则blueFolderName是蓝色文件夹的名字，如果资源位于【黄色文件夹】下则不填（亦可以传@""）
/// @param pathForResource 自定义 Bundle 的名字（不能带.bundle后缀）
/// @param bundle_folderName 如果在此自定义Bundle下还存在文件夹，不管几级都在此写，属于中间路径，函数内部是进行字符串拼接；如果不存在可以传nil 或者JobsInternationalization(@"")
/// @param fileFullNameWithSuffix 目标图片的名字。如果不带后缀名，则默认@".png" 后缀；如果是其他格式资源请自带后缀名
NS_INLINE NSData *__nullable JobsDataByBuddleIMG(NSString *__nullable blueFolderName,
                                                 NSString *__nonnull pathForResource,
                                                 NSString *__nullable bundle_folderName,
                                                 NSString *__nonnull fileFullNameWithSuffix){
    NSString *filePath = JobsPathForBuddleIMG(blueFolderName,
                                              pathForResource,
                                              bundle_folderName,
                                              fileFullNameWithSuffix);
    return [NSData dataWithContentsOfFile:filePath];
}
/// 获取Bundle下的图片
/// @param blueFolderName 如果资源存在于【蓝色文件夹】下则blueFolderName是蓝色文件夹的名字，如果资源位于【黄色文件夹】下则不填（亦可以传@""）
/// @param pathForResource 自定义 Bundle 的名字（不能带.bundle后缀）
/// @param bundle_folderName 如果在此自定义Bundle下还存在文件夹，不管几级都在此写，属于中间路径，函数内部是进行字符串拼接；如果不存在可以传nil 或者JobsInternationalization(@"")
/// @param fileFullNameWithSuffix 目标图片的名字。如果不带后缀名，则默认@".png" 后缀；如果是其他格式资源请自带后缀名
NS_INLINE UIImage *__nullable JobsIMGByDataFromBuddleIMG(NSString *__nullable blueFolderName,
                                                         NSString *__nonnull pathForResource,
                                                         NSString *__nullable bundle_folderName,
                                                         NSString *__nonnull fileFullNameWithSuffix){
    return [UIImage imageWithData:JobsDataByBuddleIMG(blueFolderName,
                                                      pathForResource,
                                                      bundle_folderName,
                                                      fileFullNameWithSuffix)];
}
/**
 1、imageNamed,其参数为图片的名字。
    这个方法用一个指定的名字在系统缓存中查找并返回一个图片对象如果它存在的话。
    如果缓存中没有找到相应的图片，这个方法从指定的文档中加载然后缓存并返回这个对象。
    因此imageNamed的优点是当加载时会缓存图片。
    所以当图片会频繁的使用时，那么用imageNamed的方法会比较好。
    例如：你需要在 一个TableView里的TableViewCell里都加载同样一个图标，那么用imageNamed加载图像效率很高。
    系统会把那个图标Cache到内存，在TableViewCell里每次利用那个图 像的时候，只会把图片指针指向同一块内存。
    正是因此使用imageNamed会缓存图片，即将图片的数据放在内存中，iOS的内存非常珍贵并且在内存消耗过大时，会强制释放内存，即会遇到 memory warnings。
    而在iOS系统里面释放图像的内存是一件比较麻烦的事情，有可能会造成内存泄漏。
    例如：当一个UIView对象的animationImages是一个装有UIImage对象动态数组NSMutableArray，并进行逐帧动画。
    当使用imageNamed的方式加载图像到一个动态数组NSMutableArray，这将会很有可能造成内存泄露。
    原因很显然的。
 
 2、imageWithContentsOfFile，其参数也是图片文件的路径。
    仅加载图片，图像数据不会缓存。
    因此对于较大的图片以及使用情况较少时，那就可以用该方法，降低内存消耗。
 */
