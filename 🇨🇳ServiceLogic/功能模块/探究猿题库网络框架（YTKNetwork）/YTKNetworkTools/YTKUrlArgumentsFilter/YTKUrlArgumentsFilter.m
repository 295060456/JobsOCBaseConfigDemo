//
// Created by Chenyu Lan on 8/27/14.
// Copyright (c) 2014 Fenbi. All rights reserved.
//

#import "YTKUrlArgumentsFilter.h"

@implementation YTKUrlArgumentsFilter {
    NSDictionary *_arguments;
}

+(YTKUrlArgumentsFilter *)filterWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

-(instancetype _Nullable)initWithArguments:(NSDictionary *)arguments {
    if (self = [super init]) {
        _arguments = arguments;
    }return self;
}

-(NSString *)filterUrl:(NSString *)originUrl
           withRequest:(YTKBaseRequest *)request {
    return [self urlStringWithOriginUrlString:originUrl
                             appendParameters:_arguments];
}

-(NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString
                         appendParameters:(NSDictionary *)parameters {
    NSString *paraUrlString = AFQueryStringFromParameters(parameters);

    if (!(paraUrlString.length > 0)) {
        return originUrlString;
    }

    BOOL useDummyUrl = NO;
    static NSString *dummyUrl = nil;
    NSURLComponents *components = [NSURLComponents componentsWithString:originUrlString];
    if (!components) {
        useDummyUrl = YES;
        if (!dummyUrl) {
            dummyUrl = @"http://www.dummy.com";
        }
        components = [NSURLComponents componentsWithString:dummyUrl];
    }

    NSString *queryString = components.query ?: @"";
    NSString *newQueryString = [queryString stringByAppendingFormat:queryString.length > 0 ? @"&%@" : @"%@", paraUrlString];

    components.query = newQueryString;

    return useDummyUrl ? [components.URL.absoluteString substringFromIndex:dummyUrl.length - 1] : components.URL.absoluteString;
}

@end
