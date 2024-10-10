//
//  FM_GetKYCInfo_api.h
//  FM
//
//  Created by User on 10/10/24.
//

#import "JobsBaseApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface FM_GetKYCInfo_api : JobsBaseApi
/// 在链式请求中，下一个请求的参数来源于上一个请求的结果
-(NSString *_Nonnull)kyc;

@end

NS_ASSUME_NONNULL_END
