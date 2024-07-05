//
//  TKPermissionPublic.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionPublic.h"

@implementation TKPermissionPublic
#pragma mark —— 一些公有方法
+(instancetype)shared{
    static id obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [self.class.alloc init];
    });return  obj;
}
/// 包装UIAlertController, 具有两个按钮
/// @param title  标题
/// @param msg  内容
/// @param leftTitle 左边按钮文字
/// @param rightTitle 右边按钮文字
+(void)alertTitle:(NSString *)title
              msg:(NSString *)msg
        leftTitle:(NSString *)leftTitle
       rightTitle:(NSString *)rightTitle{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (TKPermissionPublic.shared.blockCustomMsg) {
            TKPermissionPublic.shared.blockCustomMsg(title, msg, leftTitle, rightTitle);
            return;
        }
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleAlert];
        @jobs_weakify(self)
        [alert addAction:[UIAlertAction actionWithTitle:leftTitle
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {
            @jobs_strongify(self)
            [self jobsOpenURL:UIApplicationOpenSettingsURLString
successCompletionHandlerBlock:^(id data) {
                
            } failCompletionHandlerBlock:^(id data) {
                
            }];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:rightTitle
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {

        }]];
        [self.jobsGetCurrentViewController presentViewController:alert animated:YES completion:nil];
    });
}
/// 包装UIAlertController,只有一个按钮
/// @param title 标题
/// @param msg 内容
/// @param actionTitle  按钮文字
+(void)alertActionTitle:(NSString *)title
                    msg:(NSString *)msg
            actionTitle:(NSString *)actionTitle;{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (TKPermissionPublic.shared.blockCustomMsg) {
            TKPermissionPublic.shared.blockCustomMsg(title, msg, actionTitle, nil);
            return;
        }
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:msg
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:actionTitle
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction * _Nonnull action) {

        }]];
        [self.jobsGetCurrentViewController presentViewController:alert animated:YES completion:nil];
    });
}
/// 简单弹窗，没有action事件
+(void)alertTips:(NSString *)msg{
    [self alertActionTitle:JobsInternationalization(@"提示")
                       msg:msg
               actionTitle:JobsInternationalization(@"知道了")];
}
/// 权限提示alert
+(void)alertPromptTips:(NSString *)msg{
    [self alertTitle:JobsInternationalization(@"权限提示") msg:msg
           leftTitle:JobsInternationalization(@"设置")
          rightTitle:JobsInternationalization(@"取消")];
}
#pragma mark —— 一些私有方法
/// TKPermissionKit Bundle Path
-(NSString *)bundlePath{
    NSString *path = [[NSBundle bundleForClass:TKPermissionPublic.class] pathForResource:@"TKPermissionKit" ofType:@"bundle"];
    return path;
}
/// TKPermissionKit Bundle
-(NSBundle *)bundle{
    NSBundle *bundle = [NSBundle bundleWithPath:self.bundlePath];
    return bundle;
}
/// 配置.lproj文件
-(NSString *)selectedLanguage{
    NSString *selectedLanguage = @"zh-Hans";
    NSString *systemLanguage = NSLocale.preferredLanguages.firstObject.lowercaseString;
    NSString *path = self.bundlePath;
    NSArray *subPaths = [NSFileManager.defaultManager contentsOfDirectoryAtPath:path error:nil];
    subPaths = [subPaths filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject,
                                                                                           NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject hasSuffix:@".lproj"];
    }]];
    for (NSString *dirName in subPaths) {
        NSString *name = [dirName stringByReplacingOccurrencesOfString:@".lproj" withString:JobsInternationalization(@"")];
        NSString *lowerName = [name lowercaseString];
        if ([lowerName containsString:systemLanguage] || [systemLanguage containsString:lowerName]) {
            selectedLanguage = name;
            break;
        }
    }
    for (NSString *dirName in subPaths) {
        NSString *name = [dirName stringByReplacingOccurrencesOfString:@".lproj" withString:JobsInternationalization(@"")];
        NSString *lowerName = [name lowercaseString];
        if ([lowerName isEqualToString:systemLanguage]) {
            selectedLanguage = name;
            break;
        }
    }return selectedLanguage;
}
/// 获取当前语言lproj文件对应的bundle 方式一
-(NSBundle *)lprojBundle{
    NSBundle *bundle = [NSBundle bundleWithPath:[self.bundle pathForResource:self.selectedLanguage ofType:@"lproj"]];
    return bundle;
}
/// 获取当前语言lproj文件对应的bundle 方式二
+(NSBundle *)TKPermissionBundle{
    //这种方式获取NSBundle不会因为二进制文件，bundle文件是否处于framework中而受到影响
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:TKPermissionPublic.class] pathForResource:@"TKPermissionKit" ofType:@"bundle"]];
    return bundle;
}

+(NSBundle *)lprojBundle{
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
      dispatch_once(&onceToken, ^{
          NSMutableArray *lproj = @[].mutableCopy;
          NSString *path = self.TKPermissionBundle.resourcePath;
          NSArray *ary = [NSFileManager.defaultManager contentsOfDirectoryAtPath:path error:nil];
          for (NSString *dirName in ary) {
              if ([dirName hasSuffix:@"lproj"]) {
                  [lproj addObject:[dirName stringByReplacingOccurrencesOfString:@".lproj" withString:JobsInternationalization(@"")]];
              }
          }
          NSString *language = NSLocale.preferredLanguages.firstObject;
          //如果当前系统语言与lproj文件不对应，则进行手动适配
          if (![lproj containsObject:language]) {
              if ([language hasPrefix:@"en"]) {
                  language = @"en";
              } else if ([language hasPrefix:@"zh"]) {
                  if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                      language = @"zh-Hans"; // 简体中文
                  } else { // zh-Hant\zh-HK\zh-TW
                      language = @"zh-Hant"; // 繁體中文
                  }
              } else if ([language hasPrefix:@"ko"]) {//韩语
                  language = @"ko";
              } else if ([language hasPrefix:@"ru"]) {//俄语
                  language = @"ru";
              } else if ([language hasPrefix:@"uk"]) {//乌克兰
                  language = @"uk";
              } else if ([language hasPrefix:@"ja"]) {//日语
                  language = @"ja";
              } else {
                  language = @"zh-Hans";
              }
          }
          bundle = [NSBundle bundleWithPath:[self.TKPermissionBundle pathForResource:language ofType:@"lproj"]];
      });return bundle;
}

@end
