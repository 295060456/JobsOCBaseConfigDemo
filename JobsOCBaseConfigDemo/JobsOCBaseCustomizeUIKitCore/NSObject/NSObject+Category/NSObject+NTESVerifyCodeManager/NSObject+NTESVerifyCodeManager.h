//
//  NSObject+NTESVerifyCodeManager.h
//  FM
//
//  Created by User on 8/2/24.
//

#import <Foundation/Foundation.h>

#if __has_include(<VerifyCode/NTESVerifyCodeManager.h>)
#import <VerifyCode/NTESVerifyCodeManager.h>
#else
#import "NTESVerifyCodeManager.h"
#endif

#import "JobsLanguageManager.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NTESVerifyCodeManager)<NTESVerifyCodeManagerDelegate>

@property(nonatomic,strong)NTESVerifyCodeManager *verifyCodeManager;
@property(nonatomic,strong)NTESVerifyCodeStyleConfig *verifyCodeStyleConfig;

-(jobsByVoidBlock)show_verifyCode_NTES;

@end

NS_ASSUME_NONNULL_END
