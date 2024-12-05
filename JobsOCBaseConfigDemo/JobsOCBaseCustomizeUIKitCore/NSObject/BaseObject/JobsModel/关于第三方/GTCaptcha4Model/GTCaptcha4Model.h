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
@property(nonatomic,copy)NSString *pass_token;
@property(nonatomic,copy)NSString *gen_time;
@property(nonatomic,copy)NSString *captcha_output;
@property(nonatomic,copy)NSString *captcha_id;
@property(nonatomic,copy)NSString *lot_number;
/// 失败
@property(nonatomic,copy)NSString *challenge;
@property(nonatomic,assign)NSInteger failCount;
@property(nonatomic,copy)NSString *lotNumber;
@property(nonatomic,copy)NSString *captchaType;
@property(nonatomic,copy)NSString *captchaId;

@end

@interface GTCaptcha4Model : BaseModel

@property(nonatomic,strong)GTCaptcha4Session *captcha4Session;
@property(nonatomic,strong)GTCaptcha4ResultModel *result;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,strong)GTC4Error *error;
@property(nonatomic,weak)__kindof UIView *targetView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof GTCaptcha4Model *_Nonnull jobsMakeGTCaptcha4Model(jobsByGTCaptcha4ModelBlock _Nonnull block){
    GTCaptcha4Model *data = GTCaptcha4Model.alloc.init;
    if (block) block(data);
    return data;
}
