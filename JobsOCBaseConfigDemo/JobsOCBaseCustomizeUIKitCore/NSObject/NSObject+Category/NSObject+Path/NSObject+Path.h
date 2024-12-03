//
//  NSObject+Path.h
//  FM
//
//  Created by Admin on 3/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Path)
/// 获取bundle路径
-(NSString *_Nonnull)bundlePath;
/// 获取沙盒的主目录路径：
-(NSString *_Nonnull)homeDir;
/// Documents目录（这个目录通常用于存储应用程序中的用户数据或需要持久保存的数据。用户可以通过 iTunes 文件共享或 iCloud 访问该目录中的内容）下，用户主目录下，返回完整路径
-(NSArray <NSString *>*_Nonnull)documentsPaths;
/// Library目录（这个目录是每个 iOS 或 macOS 应用程序特有的目录，通常存储应用程序的支持文件、配置文件以及不能直接由用户访问的文件）下，用户主目录下，返回完整路径
-(NSArray <NSString *>*_Nonnull)libraryPaths;
/// 缓存目录下，用户主目录下，返回完整路径
-(NSArray <NSString *>*_Nonnull)cachesPaths;
/// 获取真机沙盒中Documents的目录路径：
-(NSString *_Nonnull)documentsDir;
/// 获取沙盒中Library的目录路径：
-(NSString *_Nonnull)libraryDir;
/// 获取沙盒中NSUserDefaults的保存位置
-(NSString *_Nonnull)userDefaultsDir;
/// 获取沙盒中Library/Caches的目录路径：
-(NSString *_Nonnull)cachesDir;
/// 获取沙盒中Libarary/Preferences的目录路径：
-(NSString *_Nonnull)preferencesDir;
/// 获取沙盒中tmp的目录路径：供系统使用，程序员不要使用，因为随时会被销毁
-(NSString *_Nonnull)tmpDir;

@end

NS_ASSUME_NONNULL_END
