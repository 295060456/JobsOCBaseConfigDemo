//
//  GTCaptcha4Model.h
//  FM
//
//  Created by Admin on 29/10/2024.
//

#import "BaseModel.h"
#import "JobsBlock.h"

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4ResultModel : NSObject
/// 成功
Prop_copy()NSString *pass_token;
Prop_copy()NSString *gen_time;
Prop_copy()NSString *captcha_output;
Prop_copy()NSString *captcha_id;
Prop_copy()NSString *lot_number;
/// 失败
Prop_copy()NSString *challenge;
Prop_assign()NSInteger failCount;
Prop_copy()NSString *lotNumber;
Prop_copy()NSString *captchaType;
Prop_copy()NSString *captchaId;

@end

@interface GTCaptcha4Model : BaseModel

Prop_strong()GTCaptcha4Session *captcha4Session;
Prop_strong()GTCaptcha4ResultModel *result;
Prop_copy()NSString *status;
Prop_strong()GTC4Error *error;
@property(nonatomic,weak)__kindof UIView *targetView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof GTCaptcha4Model *_Nonnull jobsMakeGTCaptcha4Model(jobsByGTCaptcha4ModelBlock _Nonnull block){
    GTCaptcha4Model *data = GTCaptcha4Model.alloc.init;
    if (block) block(data);
    return data;
}
