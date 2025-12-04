//
//  YTKBatchRequest+Extra.m
//  FM
//
//  Created by Admin on 29/10/2024.
//

#import "YTKBatchRequest+Extra.h"

@implementation YTKBatchRequest (Extra)

+(JobsReturnBatchRequestByArrBlock _Nonnull)initByRequestArray{
    return ^__kindof YTKBatchRequest *_Nullable(__kindof NSArray <YTKRequest *>*_Nullable data){
        return [YTKBatchRequest.alloc initWithRequestArray:data];
    };
}

@end
