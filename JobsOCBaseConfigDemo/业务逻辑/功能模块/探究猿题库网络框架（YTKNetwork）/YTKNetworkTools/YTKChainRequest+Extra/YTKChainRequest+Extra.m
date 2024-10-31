//
//  YTKChainRequest+Extra.m
//  FM
//
//  Created by Admin on 31/10/2024.
//

#import "YTKChainRequest+Extra.h"

@implementation YTKChainRequest (Extra)
/// 开始网络请求
-(jobsByVoidBlock _Nonnull)go{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self start];
    };
}

@end
