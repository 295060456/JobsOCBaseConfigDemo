//
//  UploadImageApi.h
//  Solar
//
//  Created by tangqiao on 8/7/14.
//  Copyright (c) 2014 fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsBaseApi.h"

@interface UploadImageApi : JobsBaseApi

+(JobsReturnIDByImageBlock)initByImage;
-(instancetype)initWithImage:(UIImage *)image;
-(NSString *)responseImageId;

@end
