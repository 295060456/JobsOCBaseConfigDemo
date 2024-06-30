//
//  NSObject+CurrentDevice.h
//  Casino
//
//  Created by Jobs on 2021/12/20.
//

#import <Foundation/Foundation.h>
#import "NSObject+ID.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CurrentDevice)
/// App发布的版本号
-(NSString *)appVersion;
/// BUILD 版本号
-(NSString *)appBuildVersion;
/// App名字
-(NSString *)appDisplayName;
/// 当前语言
-(NSString *)localLanguage;
/// 当前国家
-(NSString *)localCountry;
/// 设备名称
-(NSString *)deviceName;
/// 设备类型
-(NSString *)deviceModel;
/// 本地化模式
-(NSString *)deviceLocalizedModel;
/// 系统名字
-(NSString *)deviceSystemName;
/// 系统版本
-(NSString *)deviceSystemVersion;

-(NSString *)deviceIdentity;

-(NSString *)uuid;

-(NSString *)idfv;
/// 设备朝向
-(UIDeviceOrientation )deviceOrientation;
/// 是否是Retina显示屏
-(BOOL)isRetina;

-(BOOL)isPhone;

-(BOOL)isPad;

-(BOOL)isPod;

@end

NS_ASSUME_NONNULL_END
