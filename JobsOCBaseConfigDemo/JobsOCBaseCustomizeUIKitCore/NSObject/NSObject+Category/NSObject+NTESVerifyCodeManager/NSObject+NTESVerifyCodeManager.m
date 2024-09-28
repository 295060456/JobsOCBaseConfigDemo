//
//  NSObject+NTESVerifyCodeManager.m
//  FM
//
//  Created by User on 8/2/24.
//

#import "NSObject+NTESVerifyCodeManager.h"

@implementation NSObject (NTESVerifyCodeManager)
#pragma mark —— BaseProtocol
// 显示验证码
-(jobsByVoidBlock)show_verifyCode_NTES{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.verifyCodeManager openVerifyCodeView:nil];
    };
}
#pragma mark —— NTESVerifyCodeManagerDelegate
/// 验证码组件初始化完成
- (void)verifyCodeInitFinish{
    NSLog(@"收到初始化完成的回调");
}
/// 验证码组件初始化出错
- (void)verifyCodeInitFailed:(NSArray *)error {
    NSLog(@"收到初始化失败的回调:%@",error);
}
/// 完成验证之后的回调
/// - Parameters:
///   - result: 验证结果 BOOL:YES/NO
///   - validate: 二次校验数据，如果验证结果为false，validate返回空
///   - message: 结果描述信息
- (void)verifyCodeValidateFinish:(BOOL)result
                        validate:(NSString *)validate
                         message:(NSString *)message{
    NSLog(@"收到验证结果的回调:(%d,%@,%@)", result, validate, message);
}
/// 关闭验证码窗口后的回调
- (void)verifyCodeCloseWindow{
    //用户关闭验证后执行的方法
    NSLog(@"收到关闭验证码视图的回调");
}

- (void)verifyCodeCloseWindow:(NTESVerifyCodeClose)close {
    
}
#pragma mark —— @property(nonatomic,strong)NTESVerifyCodeManager *verifyCodeManager;
JobsKey(_verifyCodeManager)
@dynamic verifyCodeManager;
-(NTESVerifyCodeManager *)verifyCodeManager{
    NTESVerifyCodeManager *VerifyCodeManager = Jobs_getAssociatedObject(_verifyCodeManager);
    if(!VerifyCodeManager){
        /// 获取验证码管理对象
        VerifyCodeManager = NTESVerifyCodeManager.getInstance;
        VerifyCodeManager.delegate = self;
        
        [VerifyCodeManager configureVerifyCode:网易易盾KEY 
                                       timeout:7.0
                                   styleConfig:self.verifyCodeStyleConfig];
        /**
         NTESVerifyCodeLangCN = 1, // 中文
         NTESVerifyCodeLangENUS,   // 美式英文
         NTESVerifyCodeLangENGB,   // 英式英文
         NTESVerifyCodeLangTW,     // 台湾繁体
         NTESVerifyCodeLangHK,     // 香港繁体
         NTESVerifyCodeLangFIL,    // 菲律宾语
         */
        // 设置语言
        switch (JobsLanguageManager.language) {
            case AppLanguageChineseSimplified:{
                VerifyCodeManager.lang = NTESVerifyCodeLangCN;
            } break;
            case AppLanguageChineseTraditional:{
                VerifyCodeManager.lang = NTESVerifyCodeLangTW;
            } break;
            case AppLanguageEnglish:{
                VerifyCodeManager.lang = NTESVerifyCodeLangENUS;
            } break;
            case AppLanguageTagalog:{
                VerifyCodeManager.lang = NTESVerifyCodeLangFIL;
            } break;
                
            default:
                break;
        }
        // 设置透明度
        VerifyCodeManager.alpha = 0.3;
        VerifyCodeManager.userInterfaceStyle = NTESUserInterfaceStyleDark;
        // 设置颜色
        VerifyCodeManager.color = JobsBlackColor;
        // 设置frame
        VerifyCodeManager.frame = CGRectNull;
        // 私有化协议类型
        VerifyCodeManager.protocol = NTESVerifyCodeProtocolHttps;
        // 是否开启降级方案
        VerifyCodeManager.openFallBack = YES;
        VerifyCodeManager.fallBackCount = 3;
        // 是否隐藏关闭按钮
        VerifyCodeManager.closeButtonHidden = NO;
        
        Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeManager, VerifyCodeManager)
    }return VerifyCodeManager;
}

-(void)setVerifyCodeManager:(NTESVerifyCodeManager *)verifyCodeManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeManager, verifyCodeManager)
}
#pragma mark —— @property(nonatomic,strong)NTESVerifyCodeStyleConfig *verifyCodeStyleConfig;
JobsKey(_verifyCodeStyleConfig)
@dynamic verifyCodeStyleConfig;
-(NTESVerifyCodeStyleConfig *)verifyCodeStyleConfig{
    NTESVerifyCodeStyleConfig *VerifyCodeStyleConfig = Jobs_getAssociatedObject(_verifyCodeStyleConfig);
    if(!VerifyCodeStyleConfig){
        VerifyCodeStyleConfig = NTESVerifyCodeStyleConfig.new;
        VerifyCodeStyleConfig.capBarTextAlign = NTESCapBarTextAlignCenter;
        VerifyCodeStyleConfig.capBarTextColor = @"#25D4D0";
        VerifyCodeStyleConfig.capBarTextSize = 18;
        VerifyCodeStyleConfig.capBarTextWeight = @"bold";
        VerifyCodeStyleConfig.borderColor = @"#25D4D0";
        VerifyCodeStyleConfig.radius = 10;
        VerifyCodeStyleConfig.borderRadius = 10;
        VerifyCodeStyleConfig.backgroundMoving = @"#DC143C";
        VerifyCodeStyleConfig.executeBorderRadius = 10;
        VerifyCodeStyleConfig.executeBackground = @"#DC143C";
        Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeStyleConfig, VerifyCodeStyleConfig)
    }return VerifyCodeStyleConfig;
}

-(void)setVerifyCodeStyleConfig:(NTESVerifyCodeStyleConfig *)verifyCodeStyleConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeStyleConfig, verifyCodeStyleConfig)
}

@end
