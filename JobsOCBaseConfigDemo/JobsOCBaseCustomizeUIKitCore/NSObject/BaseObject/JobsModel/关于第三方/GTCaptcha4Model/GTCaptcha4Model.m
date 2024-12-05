//
//  GTCaptcha4Model.m
//  FM
//
//  Created by Admin on 29/10/2024.
//

#import "GTCaptcha4Model.h"

@implementation GTCaptcha4ResultModel

-(NSString *)pass_token{
    if (!_pass_token) {
        _pass_token = @"";
    }return _pass_token;
}

-(NSString *)gen_time{
    if(!_gen_time){
        _gen_time = @"";
    }return _gen_time;
}

-(NSString *)captcha_output{
    if(!_captcha_output){
        _captcha_output = @"";
    }return _captcha_output;
}

-(NSString *)captcha_id{
    if(!_captcha_id){
        _captcha_id = @"";
    }return _captcha_id;
}

-(NSString *)lot_number{
    if(!_lot_number){
        _lot_number = @"";
    }return _lot_number;
}

-(NSString *)challenge{
    if(!_challenge){
        _challenge = @"";
    }return _challenge;
}

-(NSString *)lotNumber{
    if(!_lotNumber){
        _lotNumber = @"";
    }return _lotNumber;
}

-(NSString *)captchaType{
    if(!_captchaType){
        _captchaType = @"";
    }return _captchaType;
}

-(NSString *)captchaId{
    if(!_captchaId){
        _captchaId = @"";
    }return _captchaId;
}

@end

@implementation GTCaptcha4Model

+(NSDictionary *)mj_objectClassInArray {
    return @{
        @"result" : GTCaptcha4ResultModel.class
    };
}

@end



