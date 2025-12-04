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
    @jobs_weakify(self)
    [self jobsHandelHTTPResponseCode:code
                         actionBlock:^(HTTPResponseCode data) {
        @jobs_strongify(self)
        if(data == HTTPResponseCodeNoOK) toastBy(self.msg);
    }];
}

@end
