//
//  main.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2021/12/11.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/// open -a Simulator
/// main 函数
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        /// ASCII 图形 https://zh.rakko.tools/tools/68/
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        printf("温馨提示：iOS模拟器需要先垂直摆正以后，再点击按钮切换横屏！！！\n");
        printf("温馨提示：在AppDelegate里面设置了强制固定横屏！！！\n");
        printf("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n");
        printf("┃░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░┃\n");
        printf("┃  8 8888     ,o888888o.     8 888888888o      d888888o.             ┃\n");
        printf("┃  8 8888  . 8888     `88.   8 8888    `88.  .`8888:' `88.           ┃\n");
        printf("┃  8 8888 ,8 8888       `8b  8 8888     `88  8.`8888.   Y8           ┃\n");
        printf("┃  8 8888 88 8888        `8b 8 8888     ,88  `8.`8888.               ┃\n");
        printf("┃  8 8888 88 8888         88 8 8888.   ,88'   `8.`8888.              ┃\n");
        printf("┃  8 8888 88 8888         88 8 8888888888      `8.`8888.             ┃\n");
        printf("┃ 88.     8 8888 88 8888        ,8P 8 8888    `88.     `8.`8888.     ┃\n");
        printf("┃ `88.    8 888' `8 8888       ,8P  8 8888      88 8b   `8.`8888.    ┃\n");
        printf("┃   `88o. 8 88'   ` 8888     ,88'   8 8888    ,88' `8b.  ;8.`8888    ┃\n");
        printf("┃     `Y888888 '        `8888888P'     8 888888888P    `Y8888P ,88P' ┃\n");
        printf("┃░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░┃\n");
        printf("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n");
    }return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
