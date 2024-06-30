//
//  UIDevice+XMUtils.h
//  AwesomeTips
//
//  Created by kangzubin on 2018/9/20.
//  Copyright © 2018 KANGZUBIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sys/sysctl.h>
/**
 https://kangzubin.com/ios-device-model/
 https://gist.github.com/kangzubin/5b4f989d6b1113bfbe43c5772f3ba1fd
 */
@interface UIDevice (XMUtils)
/**
 获取硬件平台名称，叫 device model 或者 machine name
 @return 硬件平台名称，如 iPhone3,1、iPad7,4 等
 */
+(NSString * _Nullable)platform;
/**
 根据传入的定位标识符 Identifier，判定是什么机型
 @param string 定位标识符 Identifier
 
 最近一次更新日期：2023.09.10
 数据来源：https://www.theiphonewiki.com/wiki/Models 定位标识符 Identifier
 ⚠️标识处：在数据来源处并未罗列
 */
+(NSString * _Nullable)platform:(NSString * _Nullable)string;
///  获取设备型号名称（可以区分iOS模拟器）
+(NSString * _Nullable)platformNameStr;
/// 获取当前设备标识符Identifier（不区分iOS模拟器：把IOS模拟器当真机对待）
+(NSString * _Nullable)platformIDStr;
/// 判断当前机型是否是iphone6 及其以上机型,过滤掉对ipad的判断
+(BOOL)judgementUpperIphone6;
/// 判断当前机型是否为非刘海屏：是刘海屏return YES，不是刘海屏return NO
+(BOOL)isFullScreen;
/// 判断当前是否是iOS模拟器
+(BOOL)isSimulator;
/// 判断当前iOS机型
+(NSString * _Nullable)machineName;
/// 判定当前设备是否为iPhone
+(BOOL)isiPhone;
/// 判断当前iOS模拟器所模拟的机型
+(NSString * _Nullable)simulatorModel;
/**
 获取设备型号名称
 @return 设备型号名称，与 platformString 一致，只查询一次然后缓存
 */
+(NSString * _Nullable)deviceName;

@end
/**
 第一代iPhone - 2007年6月29日
 iPhone 3G - 2008年7月11日
 iPhone 3GS - 2009年6月19日
 iPhone 4 - 2010年6月24日
 iPhone 4s - 2011年10月14日
 iPhone 5 - 2012年9月21日
 iPhone 5s 和 iPhone 5c - 2013年9月20日
 iPhone 6 和 iPhone 6 Plus - 2014年9月19日
 iPhone 6s 和 iPhone 6s Plus - 2015年9月25日
 iPhone SE (第一代) - 2016年3月31日
 iPhone 7 和 iPhone 7 Plus - 2016年9月16日
 iPhone 8 和 iPhone 8 Plus - 2017年9月22日
 iPhone X - 2017年11月3日
 iPhone XS 和 iPhone XS Max - 2018年9月21日
 iPhone XR - 2018年10月26日
 iPhone 11, iPhone 11 Pro 和 iPhone 11 Pro Max - 2019年9月20日
 iPhone SE (第二代) - 2020年4月24日
 iPhone 12 和 iPhone 12 Pro - 2020年10月23日
 iPhone 12 mini 和 iPhone 12 Pro Max - 2020年11月13日
 */
