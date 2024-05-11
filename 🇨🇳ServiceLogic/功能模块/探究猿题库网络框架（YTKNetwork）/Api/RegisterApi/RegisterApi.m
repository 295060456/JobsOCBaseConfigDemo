//
//  RegisterApi.m
//  Solar
//
//  Created by TangQiao on 11/8/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import "RegisterApi.h"

@implementation RegisterApi {
    NSDictionary *_Nullable _parameters;
}

-(instancetype _Nullable)initWithParameters:(NSDictionary *_Nullable)parameters{
    if (self = [super init]) {
        _parameters = parameters;
    }return self;
}

-(NSString *_Nonnull)requestUrl {
    return self.goldenFMaintenanceGameListGET.url;
}

-(YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

-(id)requestArgument {
    return nil;
}

-(id)jsonValidator {
    return nil;
}
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)userId{
    return [[self.responseJSONObject objectForKey:@"userId"] stringValue] ? : @"";
}

@end
