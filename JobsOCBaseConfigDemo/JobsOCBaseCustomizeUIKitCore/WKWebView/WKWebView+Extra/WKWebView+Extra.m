//
//  WKWebView+Extra.m
//  FM
//
//  Created by Admin on 8/11/2024.
//

#import "WKWebView+Extra.h"

@implementation WKWebView (Extra)

+(JobsReturnWKWebViewByConfigurationBlock _Nonnull)initBy{
    return ^__kindof WKWebView *_Nullable(WKWebViewConfiguration *_Nullable config){
        return [WKWebView.alloc initWithFrame:CGRectZero configuration:config];
    };
}

-(jobsByURLRequestBlock _Nonnull)loadRequest{
    @jobs_weakify(self)
    return ^(__kindof NSURLRequest *_Nullable request){
        @jobs_strongify(self)
        [self loadRequest:request];
    };
}

@end
