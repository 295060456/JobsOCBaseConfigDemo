//
//  NSObject+URLManager_7.m
//  FM
//
//  Created by Admin on 23/11/2024.
//

#import "NSObject+URLManager_7.h"

@implementation NSObject (URLManager_7)
#pragma mark —— 其他
/// 获取客服
-(URLManagerModel *)post_operation_advice_config_serviceLines{
    return JobsURL(@"/api/operation/advice/config/serviceLines");
}
/// kyc 身份证上传
-(URLManagerModel *)post_kyc_image_upload{
    return JobsURL(@"/api/file/kyc/image/upload");
}

@end
