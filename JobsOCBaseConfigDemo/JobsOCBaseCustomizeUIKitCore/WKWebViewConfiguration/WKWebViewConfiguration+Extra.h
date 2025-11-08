//
//  WKWebViewConfiguration+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <WebKit/WebKit.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface WKWebViewConfiguration (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof WKWebViewConfiguration *_Nonnull jobsMakeWKWebViewConfiguration(jobsByWKWebViewConfigBlock _Nonnull block){
    WKWebViewConfiguration *data = WKWebViewConfiguration.alloc.init;
    if (block) block(data);
    return data;
}
