//
//  NativeWebViewPlugin.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 15/7/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<Flutter/Flutter.h>)
#import <Flutter/Flutter.h>
#else
#import "Flutter.h"
#endif

#import "WebViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NativeWebViewPlugin : NSObject<FlutterPlugin>

@end

NS_ASSUME_NONNULL_END
