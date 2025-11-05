//
//  main.m
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/15/24.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "JobsSnowflake.h"
#import <objc/runtime.h>

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
//        NSMutableArray *g = [@[@"1",@"2",@"3"] mutableCopy];
//        id h = [g copy];          // 对可变数组 copy → 新的不可变 NSArray（浅拷贝：元素指针不变）
//
//        NSArray *d = @[@"1",@"2",@"3"];
//        id f = [d copy];          // 对不可变数组 copy → 同一实例（指针相同）
//
//        // 再验证 mutableCopy 行为（对不可变数组）
//        id m = [d mutableCopy];   // 新的可变数组
//
//
//        NSLog(@"g = %p",g); // 0x142455050
//        NSLog(@"h = %p",h); // 0x142455a10
//        NSLog(@"d = %p",d); // 0x142455a40
//        NSLog(@"f = %p",f); // 0x142455a40
//        NSLog(@"m = %p",m); // 0x142455aa0

        JobsLog(@"在此设备上的比例尺换算标准是 1 = %f",JobsWidth(1));
        // 获取应用的主 bundle 路径
        NSString *path = @"zh-Hans.lproj".pathForResourceWithFullName;
        // 创建一个新的 bundle，用于加载指定语言的资源
        NSBundle *zhHansBundle = [NSBundle bundleWithPath:path];
        // 使用指定语言的 bundle 加载本地化字符串
        NSString *localizedString = [zhHansBundle localizedStringForKey:@"跟随系统" value:nil table:nil];
        JobsLog(@"Localized String: %@", localizedString);
        
        appDelegateClassName = NSStringFromClass(AppDelegate.class);
        JobsSnowflake *snowflake = [JobsSnowflake.alloc initWithPublishMillisecond:1662278876498
                                                                             IDCID:1
                                                                         machineID:1];
        NSNumber *snowflakeID = snowflake.nextID;
        if (snowflakeID){
            JobsLog(@"Generated Snowflake ID: %@", snowflakeID);
        }else{
            JobsLog(@"Failed to generate Snowflake ID.");
        }
    }return UIApplicationMain(argc,
                              argv,
                              nil,
                              appDelegateClassName);
}
