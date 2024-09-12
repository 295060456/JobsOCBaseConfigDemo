//
//  JobsResponseModel.m
//  DouDong-II
//
//  Created by xxx on 2021/1/4.
//

#import "JobsResponseModel.h"

@implementation JobsResponseModel

-(void)setCode:(HTTPResponseCode)code{
    _code = code;
    if(code == HTTPResponseCodeTokenExpire){
        self.refreshUserToken();
        toast(@"Token 已经过期，请重新登录");
    }
}

@end
