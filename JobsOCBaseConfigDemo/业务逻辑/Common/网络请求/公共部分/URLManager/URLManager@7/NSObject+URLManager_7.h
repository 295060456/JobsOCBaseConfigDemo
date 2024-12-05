//
//  NSObject+URLManager_7.h
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (URLManager_7)
#pragma mark —— 其他
/// 获取客服
-(URLManagerModel *)post_operation_advice_config_serviceLines;
/// kyc 身份证上传
-(URLManagerModel *)post_kyc_image_upload;

@end

NS_ASSUME_NONNULL_END
