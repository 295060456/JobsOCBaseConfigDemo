//
//  UploadImageApi.h
//  Solar
//
//  Created by tangqiao on 8/7/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTKNetworkToolsHeader.h"

#if __has_include(<YTKNetwork/YTKRequest.h>)
#import <YTKNetwork/YTKRequest.h>
#else
#import "YTKRequest.h"
#endif

#if __has_include(<AFNetworking/AFURLRequestSerialization.h>)
#import <AFNetworking/AFURLRequestSerialization.h>
#else
#import "AFURLRequestSerialization.h"
#endif

@interface UploadImageApi : BaseRequest

-(id)initWithImage:(UIImage *)image;
-(NSString *)responseImageId;

@end
