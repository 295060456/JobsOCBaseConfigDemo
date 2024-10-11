//
//  NSObject+URLManager_Base.h
//  FM
//
//  Created by User on 10/11/24.
//

#import <Foundation/Foundation.h>
#import "NSObject+Extras.h"
#import "URLManagerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLManager_Base)
#pragma mark —— BaseURL
-(NSString *)BaseUrl;
-(NSString *)BaseUrl_H5;
-(NSString *)BaseUrl_Image;
#pragma mark —— App接口示例
-(URLManagerModel *)appInterfaceTesting;

@end

NS_ASSUME_NONNULL_END
