//
//  NSObject+GTCaptcha4.h
//  FM
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>
#import "APIKey.h"
#import "JobsBlock.h"
#import "GTCaptcha4Model.h"

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GTCaptcha4)<GTCaptcha4SessionTaskDelegate>
/// Data
@property(nonatomic,strong)GTCaptcha4Model *captcha4Model;
@property(nonatomic,strong)GTCaptcha4Session *captchaSession;
/// 显示验证码
-(jobsByVoidBlock _Nonnull)show_verifyCode_GTCaptcha4;

@end

NS_ASSUME_NONNULL_END
