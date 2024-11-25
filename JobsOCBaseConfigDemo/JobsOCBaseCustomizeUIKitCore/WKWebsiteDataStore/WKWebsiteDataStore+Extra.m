//
//  WKWebsiteDataStore+Extra.m
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import "WKWebsiteDataStore+Extra.h"

@implementation WKWebsiteDataStore (Extra)

-(jobsByVoidBlock _Nonnull)clean{
    return ^(){
        [WKWebsiteDataStore.defaultDataStore removeDataOfTypes:jobsMakeMutSet(^(__kindof NSMutableSet * _Nullable data) {
            data.add(WKWebsiteDataTypeDiskCache);
            data.add(WKWebsiteDataTypeMemoryCache);
            data.add(WKWebsiteDataTypeCookies);
        })modifiedSince:NSDate.distantPast completionHandler:^{
            NSLog(@"清理完成");
        }];
    };
}

@end
