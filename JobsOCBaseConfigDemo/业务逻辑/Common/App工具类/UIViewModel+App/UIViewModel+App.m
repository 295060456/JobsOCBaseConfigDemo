//
//  UIViewModel+App.m
//  FMNormal
//
//  Created by Jobs on 2025/5/7.
//

#import "UIViewModel+App.h"

@implementation UIViewModel (App)
#pragma mark —— Prop_assign()DataSourceType dataSourceType;
JobsKey(_dataSourceType)
@dynamic dataSourceType;
-(DataSourceType)dataSourceType{
    return [Jobs_getAssociatedObject(_dataSourceType) unsignedIntegerValue];
}
-(void)setDataSourceType:(DataSourceType)dataSourceType{
    Jobs_setAssociatedRETAIN_NONATOMIC(_dataSourceType, @(dataSourceType))
}
#pragma mark —— Prop_assign()KYCStatus kycStatus;
JobsKey(_kycStatus)
@dynamic kycStatus;
-(KYCStatus)kycStatus{
    return [Jobs_getAssociatedObject(_kycStatus) unsignedIntegerValue];
}

-(void)setKycStatus:(KYCStatus)kycStatus{
    Jobs_setAssociatedRETAIN_NONATOMIC(_kycStatus, @(kycStatus))
}

@end
