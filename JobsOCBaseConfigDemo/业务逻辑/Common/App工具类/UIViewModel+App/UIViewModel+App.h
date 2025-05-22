//
//  UIViewModel+App.h
//  FMNormal
//
//  Created by Jobs on 2025/5/7.
//

#import "UIViewModel.h"
#import "JobsDefineAllEnumHeader.h" /// 此文件用来存储记录全局的一些枚举

NS_ASSUME_NONNULL_BEGIN

@interface UIViewModel (App)

Prop_assign()DataSourceType dataSourceType;
Prop_assign()KYCStatus kycStatus;

@end

NS_ASSUME_NONNULL_END
