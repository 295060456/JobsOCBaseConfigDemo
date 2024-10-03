//
//  CasinoCustomerContactModel.m
//  Casino
//
//  Created by Jobs on 2021/12/10.
//

#import "CasinoCustomerContactModel.h"

@implementation CasinoCustomerContactElementModel

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}

@end

@implementation CasinoCustomerContactModel

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"customerList" : CasinoCustomerContactElementModel.class
    };
}

@end
