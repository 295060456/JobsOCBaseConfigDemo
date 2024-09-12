//
//  NSObject+GTCaptcha4.h
//  FM
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GTCaptcha4)<GTCaptcha4SessionTaskDelegate>

@property(nonatomic,strong)GTCaptcha4Session *captchaSession;

-(jobsByVoidBlock)show_verifyCode_GTCaptcha4;// 显示验证码

@end

NS_ASSUME_NONNULL_END
