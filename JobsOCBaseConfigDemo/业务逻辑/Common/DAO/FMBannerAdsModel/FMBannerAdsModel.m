//
//  FMBannerAdsModel.m
//  FM
//
//  Created by User on 9/17/24.
//

#import "FMBannerAdsModel.h"

@implementation FMBannerAdsModel
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return [super mj_replacedKeyFromPropertyName].mutableCopy;
}

-(NSString *)title{
    if(!_title){
        _title = @"";
    }return _title;
}

-(NSString *)content{
    if(!_content){
        _content = @"";
    }return _content;
}

@end
