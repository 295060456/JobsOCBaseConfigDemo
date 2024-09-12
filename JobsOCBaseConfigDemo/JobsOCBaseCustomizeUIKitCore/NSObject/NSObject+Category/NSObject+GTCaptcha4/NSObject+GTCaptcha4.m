//
//  NSObject+GTCaptcha4.m
//  FM
//
//  Created by User on 9/12/24.
//

#import "NSObject+GTCaptcha4.h"

@implementation NSObject (GTCaptcha4)
#pragma mark —— BaseProtocol
// 显示验证码
-(jobsByVoidBlock)show_verifyCode_GTCaptcha4{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.captchaSession verify];
    };
}
#pragma mark —— @property(nonatomic,strong)GTCaptcha4Session *captchaSession;
JobsKey(_captchaSession)
@dynamic captchaSession;
-(GTCaptcha4Session *)captchaSession{
    GTCaptcha4Session *gtCaptcha4Session = Jobs_getAssociatedObject(_captchaSession);
    if(!gtCaptcha4Session){
        gtCaptcha4Session = [GTCaptcha4Session sessionWithCaptchaID:极验验证码KEY];
        gtCaptcha4Session.delegate = self;
        /// 如需修改默认配置
        /// 可选择下⾯注释的⽅式创建实例
        // GTCaptcha4SessionConfiguration *config = GTCaptcha4SessionConfiguration.defaultConfiguration;
        // config.timeout = 8.0f;
        // gtCaptcha4Session = [GTCaptcha4Session sessionWithCaptchaID:极验验证码KEY configuration:config];
        Jobs_setAssociatedRETAIN_NONATOMIC(_captchaSession, gtCaptcha4Session);
    }return gtCaptcha4Session;
}

-(void)setCaptchaSession:(GTCaptcha4Session *)captchaSession{
    Jobs_setAssociatedRETAIN_NONATOMIC(_captchaSession, captchaSession)
}
#pragma mark —— GTCaptcha4SessionTaskDelegate
/// 回调验证会话的结果参数(Callback result parameters of captcha session)
/// @discussion 拿到验证结果的参数后，需要提交到业务服务端，
///             完成参数的校验
///             After getting the parameters of verification results,
///             they need to be submitted to the business server to
///             complete the verification of parameters.
/// @param captchaSession 验证会话(Captcha session)
/// @param status 状态码。@"0"/@"1": 未完成/完成。当 status 为 @"1"
///                     时，则为成功，需要对结果进行二次校验。
///               Status code. @ “0”/@ “1”: Not finished/finished.
///               When status is @ “1”, it is successful, and the
///               result needs to be secondary validated.
/// @param result 结果校验参数(Result verification parameters.)。示例(Example):
///               ```
///               {
///                 challenge = "19080ae5-fe79-4431-9c78-4ee8e0dec798";
///                 captcha_id = "c62d0f270240799b3113b0a5787ead55";
///               }
///               ```
- (void)gtCaptchaSession:(GTCaptcha4Session *)captchaSession
              didReceive:(NSString *)status
                  result:(nullable NSDictionary *)result{
    NSLog(@"");
}
/// 通知验证界面将要展现
/// @param captchaSession 验证会话
- (void)gtCaptchaSessionWillShow:(GTCaptcha4Session *)captchaSession{
    NSLog(@"");
}

@end
