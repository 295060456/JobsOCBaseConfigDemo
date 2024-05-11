//
//  CasinoCustomerContactModel.m
//  Casino
//
//  Created by Jobs on 2021/12/10.
//

#import "CasinoCustomerContactModel.h"

@implementation CasinoCustomerContactElementModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
        @"ID" : @"id",
    };
}

@end

@implementation CasinoCustomerContactModel

+(NSDictionary *)mj_objectClassInArray{
    return @{
        @"customerList" : CasinoCustomerContactElementModel.class
    };
}

@end
