//
//  FMBannerAdsModel.m
//  FM
//
//  Created by User on 9/17/24.
//

#import "FMBannerAdsModel.h"

@implementation FMBannerAdsModel
UIViewModelProtocol_synthesize
+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}

@end
