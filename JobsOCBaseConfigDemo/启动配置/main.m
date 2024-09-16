//
//  main.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/15/24.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "JobsSnowflake.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // 获取应用的主 bundle 路径
        NSString *path = @"zh-Hans.lproj".pathForResourceWithFullName;
        // 创建一个新的 bundle，用于加载指定语言的资源
        NSBundle *zhHansBundle = [NSBundle bundleWithPath:path];
        // 使用指定语言的 bundle 加载本地化字符串
        NSString *localizedString = [zhHansBundle localizedStringForKey:@"跟随系统" value:nil table:nil];
        NSLog(@"Localized String: %@", localizedString);
        
        appDelegateClassName = NSStringFromClass(AppDelegate.class);
        JobsSnowflake *snowflake = [JobsSnowflake.alloc initWithPublishMillisecond:1662278876498
                                                                             IDCID:1
                                                                         machineID:1];
        NSNumber *snowflakeID = snowflake.nextID;
        if (snowflakeID){
            NSLog(@"Generated Snowflake ID: %@", snowflakeID);
        }else{
            NSLog(@"Failed to generate Snowflake ID.");
        }
    }return UIApplicationMain(argc,
                              argv,
                              nil,
                              appDelegateClassName);
}
