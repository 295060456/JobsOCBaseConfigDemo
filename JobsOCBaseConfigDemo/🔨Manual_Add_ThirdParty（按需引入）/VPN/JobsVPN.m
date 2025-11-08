//
//  JobsVPN.m
//  FM
//
//  Created by Admin on 20/12/2024.
//

#import "JobsVPN.h"

@implementation JobsVPN
#pragma mark —— 一些私有方法
-(JobsRetDataByStringBlock _Nonnull)getKeychainPassword{
    // 从 Keychain 获取密码
    return ^__kindof NSData *_Nullable(__kindof NSString *_Nullable data){
        /// TODO
        return nil; // 根据实际情况实现
    };
}
#pragma mark —— 一些公共方法
-(void)configureVPN{
    @jobs_weakify(self)
    jobsMakeVPNManager(^(__kindof NEVPNManager * _Nullable VPNManager) {
        @jobs_strongify(self)
        [VPNManager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"加载 VPN 配置失败: %@", error.localizedDescription);
                return;
            }
            VPNManager.onDemandEnabled = NO; // 按需连接设置
            VPNManager.localizedDescription = @"My VPN"; // 显示的 VPN 名称
            VPNManager.enabled = YES;
            VPNManager.protocolConfiguration = jobsMakeNEVPNProtocolIKEv2(^(__kindof NEVPNProtocolIKEv2 * _Nullable VPNProtocolIKEv2) {
                @jobs_strongify(self)
                VPNProtocolIKEv2.serverAddress = @"vpn.example.com"; // VPN 服务器地址
                VPNProtocolIKEv2.remoteIdentifier = @"vpn.example.com"; // 远程标识符
                VPNProtocolIKEv2.localIdentifier = nil; // 本地标识符（可选）
                VPNProtocolIKEv2.username = @"your_username"; // 用户名
                VPNProtocolIKEv2.passwordReference = self.getKeychainPassword(@"vpn_password"); // 密码存储在 Keychain
                VPNProtocolIKEv2.authenticationMethod = NEVPNIKEAuthenticationMethodNone; // 身份验证方式
                VPNProtocolIKEv2.useExtendedAuthentication = YES;
                VPNProtocolIKEv2.disconnectOnSleep = NO; // 是否在睡眠时断开连接
            });
            [VPNManager saveToPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
                if (error) {
                    NSLog(@"保存 VPN 配置失败: %@", error.localizedDescription);
                } else {
                    NSLog(@"VPN 配置已保存");
                }
            }];
        }];
    });
}

-(void)startVPN{
    NSError *startError = nil;
    [NEVPNManager.sharedManager.connection startVPNTunnelAndReturnError:&startError];
    if (startError) {
        NSLog(@"启动 VPN 失败: %@", startError.localizedDescription);
    } else {
        NSLog(@"VPN 已启动");
    }
}

-(void)stopVPN{
    [NEVPNManager.sharedManager.connection stopVPNTunnel];
    NSLog(@"VPN 已停止");
}

@end
