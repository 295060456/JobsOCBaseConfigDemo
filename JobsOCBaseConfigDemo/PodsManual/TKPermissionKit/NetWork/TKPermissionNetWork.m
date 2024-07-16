//
//  TKPermissionNetWork.m
//  TKPermissionKitDemo
//
//  Created by mac on 2019/10/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "TKPermissionNetWork.h"

@implementation TKPermissionNetWork
///   APP中的"无线数据"中选择关闭，系统会强制弹出一个面板进行网络设置
///   注意：⚠️⚠️⚠️这个和第一次启动APP出现的授权管理不同，APP网络授权需要另想他法
///   ⚠️⚠️⚠️completion:也不会有回调,只是用来做一个执行函数，即isAlert与completion没有作用
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(nullable void(^)(BOOL isAuth))completion{
    if (@available(iOS 9.0, *)) {
        CTCellularData *cellularData = CTCellularData.new;
        cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state){
            /// 获取联网状态
            switch (state){
                case kCTCellularDataRestricted: NSLog(@"TKPermission:蜂窝移动网络权限：Restricrted"); break;
                case kCTCellularDataNotRestricted: NSLog(@"TKPermission:蜂窝移动网络权限：Not Restricted"); break;
                case kCTCellularDataRestrictedStateUnknown: NSLog(@"TKPermission:蜂窝移动网络权限：Unknown"); break; /// 未知，第一次请求
                default: break;
            };
        };
    }
}

@end
