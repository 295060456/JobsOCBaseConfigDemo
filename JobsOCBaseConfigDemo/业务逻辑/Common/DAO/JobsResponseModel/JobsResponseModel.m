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
    [self jobsHandelHTTPResponseCode:code
                         actionBlock:^(HTTPResponseCode data) {
        if(data == HTTPResponseCodeNoOK) toast(self.msg);
    }];
}

@end
