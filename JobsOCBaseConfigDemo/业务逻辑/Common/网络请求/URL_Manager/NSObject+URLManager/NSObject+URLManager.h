//
//  NSObject+URLManager.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLManagerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLManager)

#pragma mark —— BaseURL
-(NSString *)BaseUrl;
-(NSString *)BaseUrl_H5;
-(NSString *)BaseUrl_Image;
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting;

@end

NS_ASSUME_NONNULL_END

