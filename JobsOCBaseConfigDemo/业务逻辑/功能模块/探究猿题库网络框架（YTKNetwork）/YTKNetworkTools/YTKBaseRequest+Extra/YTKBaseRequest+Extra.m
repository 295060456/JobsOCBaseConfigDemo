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
#pragma mark —— 加URL参数
+(JobsReturnYTKRequestByIDBlock _Nonnull)ByURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        YTKBaseRequest *instance = self.class.new;
        if ([instance respondsToSelector:@selector(byURLParameters)]) {
            instance.byURLParameters(data);
        }return instance;
    };
}

-(JobsReturnYTKRequestByIDBlock _Nonnull)byURLParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(id _Nullable data){
        @jobs_strongify(self)
        self.urlParameters = data;
        return self;
    };
}
#pragma mark —— 加Body参数
+(JobsReturnYTKRequestByIDBlock _Nonnull)ByBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        YTKBaseRequest *instance = self.class.new;
        if ([instance respondsToSelector:@selector(byBodyParameters)]) {
            instance.byBodyParameters(data);
        }return instance;
    };
}

-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byBodyParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nonnull data){
        @jobs_strongify(self)
        if(data) self.parameters = data.mutableDic();
        return self;
    };
}
#pragma mark —— 加请求头参数
+(JobsReturnYTKRequestByIDBlock _Nonnull)ByHeaderParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        YTKBaseRequest *instance = self.class.new;
        if ([instance respondsToSelector:@selector(byHeaderParameters)]) {
            instance.byHeaderParameters(data);
        }return instance;
    };
}

-(JobsReturnYTKRequestByDictionaryBlock _Nonnull)byHeaderParameters{
    @jobs_weakify(self)
    return ^__kindof YTKBaseRequest *_Nonnull(NSDictionary *_Nullable data){
        @jobs_strongify(self)
        [self.customHTTPHeader addEntriesFromDictionary:data];
        NSLog(@"请求头: %@", self.requestHeaderFieldValueDictionary);
        return self;
    };
}
#pragma mark —— @property(nonatomic,strong)JobsResponseModel *responseModel;
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

#pragma mark —— @property(nonatomic,strong,nullable)id urlParameters;
JobsKey(_urlParameters)
@dynamic urlParameters;
-(id)urlParameters{
    return Jobs_getAssociatedObject(_urlParameters);
}

-(void)setUrlParameters:(id)urlParameters{
    Jobs_setAssociatedRETAIN_NONATOMIC(_urlParameters, urlParameters)
}
#pragma mark —— @property(nonatomic,strong,nullable)NSMutableDictionary *parameters;
JobsKey(_parameters)
@dynamic parameters;
-(NSMutableDictionary *)parameters{
    return Jobs_getAssociatedObject(_parameters);
}

-(void)setParameters:(NSMutableDictionary *)parameters{
    Jobs_setAssociatedRETAIN_NONATOMIC(_parameters, parameters)
}

#pragma mark —— @property(nonatomic,strong,nullable)NSMutableDictionary *customHTTPHeader;
JobsKey(_customHTTPHeader)
@dynamic customHTTPHeader;
-(NSMutableDictionary *)customHTTPHeader{
    return Jobs_getAssociatedObject(_customHTTPHeader);
}

-(void)setCustomHTTPHeader:(NSMutableDictionary *)customHTTPHeader{
    Jobs_setAssociatedRETAIN_NONATOMIC(_customHTTPHeader, customHTTPHeader)
}

@end
