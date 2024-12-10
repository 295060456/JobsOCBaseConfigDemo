//
//  NSObject+YTKRequest.m
//  FM
//
//  Created by Admin on 31/10/2024.
//

#import "NSObject+YTKRequest.h"

@implementation NSObject (YTKRequest)
#pragma mark —— YTKChainRequestDelegate
-(void)chainRequestFinished:(YTKChainRequest *)chainRequest{
    YTKBaseRequest *resultRequest = chainRequest.requestArray.lastObject;
    NSLog(@"all requests are done");
}

-(void)chainRequestFailed:(YTKChainRequest *)chainRequest
        failedBaseRequest:(YTKBaseRequest *)request{
    JobsResponseModel *responseModel = JobsResponseModel.byData(request.responseObject);
    self.jobsHandelNoSuccess(request);
    NSLog(@"请求失败");
}

@end
