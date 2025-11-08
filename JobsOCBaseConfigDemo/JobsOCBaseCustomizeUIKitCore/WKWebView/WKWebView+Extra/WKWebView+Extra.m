//
//  WKWebView+Extra.m
//  FM
//
//  Created by Admin on 8/11/2024.
//

#import "WKWebView+Extra.h"

@implementation WKWebView (Extra)

+(JobsRetWKWebViewByConfigurationBlock _Nonnull)initBy{
    return ^__kindof WKWebView *_Nullable(WKWebViewConfiguration *_Nullable config){
        return [WKWebView.alloc initWithFrame:CGRectZero configuration:config];
    };
}

-(JobsRetWKWebViewByURLRequestBlock _Nonnull)loadRequest{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(__kindof NSURLRequest *_Nullable request){
        @jobs_strongify(self)
        [self loadRequest:request];
        return self;
    };
}

-(JobsRetWKWebViewByURLBlock _Nonnull)loadFileURL{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(__kindof NSURL *_Nullable url){
        @jobs_strongify(self)
        [self loadFileURL:url allowingReadAccessToURL:url];
        return self;
    };
}

-(JobsRetCollectionViewByNavDelegateBlock _Nonnull)byNavDelegate{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(id <WKNavigationDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.navigationDelegate = delegate;
        return self;
    };
}

-(JobsRetCollectionViewByUIDelegateBlock _Nonnull)byUIDelegate{
    @jobs_weakify(self)
    return ^__kindof WKWebView *_Nullable(id <WKUIDelegate>_Nullable delegate){
        @jobs_strongify(self)
        self.UIDelegate = delegate;
        return self;
    };
}
#pragma mark —— Prop_copy(nullable)NSMutableArray <NSURL *>*urls;
JobsKey(_urls)
@dynamic urls;
-(NSMutableArray<NSURL *> *)urls{
    NSMutableArray *arr = Jobs_getAssociatedObject(_urls);
    if (!arr) {
        arr = NSMutableArray.array;
        Jobs_setAssociatedRETAIN_NONATOMIC(_urls, arr)
    }return arr;
}

-(void)setUrls:(NSMutableArray<NSURL *> *)urls{
    Jobs_setAssociatedRETAIN_NONATOMIC(_urls, urls)
}
#pragma mark —— Prop_strong(nullable)NSURL *url;
JobsKey(_url)
@dynamic url;
-(NSURL *)url{
    return Jobs_getAssociatedObject(_url);
}

-(void)setUrl:(NSURL *)url{
    Jobs_setAssociatedRETAIN_NONATOMIC(_url, url)
}

@end
