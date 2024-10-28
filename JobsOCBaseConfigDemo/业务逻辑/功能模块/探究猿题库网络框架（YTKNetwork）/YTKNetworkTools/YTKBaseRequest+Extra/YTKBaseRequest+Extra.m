//
//  YTKBaseRequest+Extra.m
//  FM
//
//  Created by Admin on 28/10/2024.
//

#import "YTKBaseRequest+Extra.h"

@implementation YTKBaseRequest (Extra)

-(NSMutableURLRequest *)jobsMakeRequestByBlock:(jobsByMutableURLRequestBlock _Nullable)block{
    NSMutableURLRequest *request = self.requestUrl.jobsUrl.URLRequest;
    if (block) block(request);
    return request;
}

@end
