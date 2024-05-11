
#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

typedef NS_ENUM(NSInteger,TouchID_Style_Details) {
    /// 系统取消授权，如其他APP切入
    TouchIDStyle_1 = 0,
    /// 用户取消验证Touch ID
    TouchIDStyle_2 = 1 << 0,
    /// 授权失败
    TouchIDStyle_3 = 1 << 1,
    /// 系统未设置密码
    TouchIDStyle_4 = 1 << 2,
    /// 设备Touch ID不可用、例如未打开
    TouchIDStyle_5 = 1 << 3,
    /// 设备Touch ID不可用、用户未录入
    TouchIDStyle_6 = 1 << 4,
    /// 用户选择输入密码、切换主线程处理
    TouchIDStyle_7 = 1 << 5,
    /// 其他情况、切换主线程处理
    TouchIDStyle_8 = 1 << 6,
    /// TouchID is not enrolled
    TouchIDStyle_9 = 1 << 7,
    /// A passcode has not been set
    TouchIDStyle_10 = 1 << 8,
    /// TouchID not available
    TouchIDStyle_11 = 1 << 9,
};

typedef NS_ENUM(NSInteger,TouchID_Success_Or_Error) {
    /// 验证成功，主线程处理UI  ****
    TouchID_Success = 0,
    /// 不支持指纹识别
    TouchID_Error = 1 << 0,
};

NS_ASSUME_NONNULL_BEGIN

@interface TouchID : NSObject

@property(nonatomic,copy)void(^MyBlock_TouchID_Style_Details)(TouchID_Style_Details);
@property(nonatomic,copy)void(^MyBlock_TouchID_Success_Or_Error)(TouchID_Success_Or_Error);

+(instancetype)Touch_ID;

@end

NS_ASSUME_NONNULL_END
