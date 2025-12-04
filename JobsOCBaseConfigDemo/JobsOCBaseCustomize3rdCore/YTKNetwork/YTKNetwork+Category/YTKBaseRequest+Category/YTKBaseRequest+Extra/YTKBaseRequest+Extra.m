//
//  YTKBaseRequest+Extra.m
//  FM
//
//  Created by Admin on 28/10/2024.
//

#import "YTKBaseRequest+Extra.h"

@implementation YTKBaseRequest (Extra)
YTKCustomBaseRequestProtocol_dynamic
-(NSMutableURLRequest *)jobsMakeRequestByBlock:(jobsByMutableURLRequestBlock _Nullable)block{
    NSMutableURLRequest *request = self.requestUrl.jobsUrl.URLRequest;
    if (block) block(request);
    return request;
}
#pragma mark —— Prop_strong()JobsResponseModel *responseModel;
JobsKey(_responseModel)
@dynamic responseModel;
-(JobsResponseModel *)responseModel{
    JobsResponseModel *ResponseModel = Jobs_getAssociatedObject(_responseModel);
    if(!ResponseModel){
        if(self.responseObject){
            ResponseModel = JobsResponseModel.byData(self.responseObject);
            Jobs_setAssociatedRETAIN_NONATOMIC(_responseModel, ResponseModel);
        }
    }return ResponseModel;
}

-(void)setResponseModel:(JobsResponseModel *)responseModel{
    Jobs_setAssociatedRETAIN_NONATOMIC(_responseModel, responseModel)
}

@end
