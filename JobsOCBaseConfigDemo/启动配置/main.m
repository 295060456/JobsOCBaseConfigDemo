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
