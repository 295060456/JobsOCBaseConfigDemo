//
//  JobsVPN.h
//  FM
//
//  Created by Admin on 20/12/2024.
//

#import <Foundation/Foundation.h>
#import <NetworkExtension/NetworkExtension.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVPN : NSObject

-(void)configureVPN;
-(void)startVPN;
-(void)stopVPN;

@end

NS_ASSUME_NONNULL_END

/**
 
 要使用 NetworkExtension 框架，你需要启用特定权限。

 2.1 在 Apple Developer 网站启用权限
 登录 Apple Developer 账户。
 在 Certificates, Identifiers & Profiles 中找到你的 App Identifier。
 编辑 App Identifier，勾选 Network Extensions 权限。
 保存更改并重新生成描述文件。
 2.2 添加 App Capability
 打开 Xcode，选择你的项目的目标（Target）。
 转到 Signing & Capabilities。
 点击 + Capability，搜索并添加 Network Extensions。

 Info.plist
 <key>NetworkExtensions</key>
 <array>
     <string>com.apple.developer.networking.vpn.configuration</string>
 </array>
 
 */
