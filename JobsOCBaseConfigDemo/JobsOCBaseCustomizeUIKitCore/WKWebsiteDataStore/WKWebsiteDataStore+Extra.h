//
//  WKWebsiteDataStore+Extra.h
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebsiteDataStore (Extra)

-(jobsByVoidBlock _Nonnull)clean;

@end

NS_ASSUME_NONNULL_END
