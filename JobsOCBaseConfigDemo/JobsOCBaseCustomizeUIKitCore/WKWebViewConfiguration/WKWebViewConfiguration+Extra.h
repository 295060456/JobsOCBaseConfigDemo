//
//  WKWebViewConfiguration+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebViewConfiguration (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof WKWebViewConfiguration *_Nonnull jobsMakeWKWebViewConfiguration(jobsByWKWebViewConfigurationBlock _Nonnull block){
    WKWebViewConfiguration *data = WKWebViewConfiguration.alloc.init;
    if (block) block(data);
    return data;
}
