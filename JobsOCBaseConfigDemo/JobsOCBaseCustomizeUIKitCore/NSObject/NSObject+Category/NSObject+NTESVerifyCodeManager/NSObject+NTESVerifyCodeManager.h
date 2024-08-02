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

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (NTESVerifyCodeManager)<NTESVerifyCodeManagerDelegate>

@property(nonatomic,strong)NTESVerifyCodeManager *verifyCodeManager;
@property(nonatomic,strong)NTESVerifyCodeStyleConfig *verifyCodeStyleConfig;

-(void)verifyCode_simpleCall;

@end

NS_ASSUME_NONNULL_END
