//
//  FSAppIconManager.m
//  DynamicAppIconDemo
//
//  Created by zhangpeng on 2018/7/10.
//  Copyright © 2018年 zhangpeng. All rights reserved.
//

#import "FSAppIconManager.h"

@implementation FSAppIconManager

+ (NSString *)getCurrentAppIconName {
    if (@available(iOS 10.3, *)) {
        return (UIApplication.sharedApplication.alternateIconName.length == 0) ? JobsInternationalization(@"") : UIApplication. sharedApplication.alternateIconName;
    } else {
        // Fallback on earlier versions
        return JobsInternationalization(@"");
    }
}

+ (BOOL)canChangeAppIcon {
    if (@available(iOS 10.3, *)) {
        return UIApplication.sharedApplication.supportsAlternateIcons;
    } else {
        // Fallback on earlier versions
        return NO;
    }
}

+ (void)changeAppIconWithIconName:(NSString *)iconName
                completionHandler:(void (^)(NSError * _Nullable))completionHandler {
    if (@available(iOS 10.3, *)) {
        [UIApplication.sharedApplication setAlternateIconName:iconName
                                            completionHandler:^(NSError * _Nullable error) {
            completionHandler(error);
        }];
    } else {
        // Fallback on earlier versions
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey: NSLocalizedString(@"AppIcon change failed", nil),
                                   NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The current system version does not support replacing the AppIcon.", nil),
                                   NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(JobsInternationalization(@""), nil)
                                   };
        NSError *error = [NSError errorWithDomain:JobsInternationalization(@"")
                                             code:34001
                                         userInfo:userInfo];
        completionHandler(error);
    }
}

@end
