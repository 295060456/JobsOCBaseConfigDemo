//
//  NSObject+ChangeAppicon.m
//  Casino
//
//  Created by Jobs on 2021/12/14.
//

#import "NSObject+ChangeAppicon.h"

@implementation NSObject (ChangeAppicon)
/// 测试App更改图标
-(void)testChangeAppicon{
    NSArray <NSString *>*weathers = @[@"晴", @"多云", @"大雨", @"雪"];
    NSString *weather = weathers[arc4random() % (weathers.count)];
    [self setAppIconWithName:weather];
}
/// App更改图标核心代码
-(void)setAppIconWithName:(NSString *_Nullable)iconName{
    if (JobsAvailableSysVersion(10.3)) {
        if (UIApplication.sharedApplication.supportsAlternateIcons) {
            [UIApplication.sharedApplication setAlternateIconName:iconName
                                                completionHandler:^(NSError * _Nullable error) {
                if (error) {
                    [WHToast jobsToastErrMsg:[@"更换app图标发生错误了 ：" stringByAppendingString:error.description]];
                    NSLog(@"更换app图标发生错误了 ： %@",error);
                }
            }];
        }
    }else{
        [WHToast jobsToastErrMsg:@"请升级系统到10.3以上版本,方可支持切换App图标"];
    }
}

@end
