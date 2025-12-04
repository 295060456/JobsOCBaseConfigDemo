//
//  YTKChainRequest+Extra.h
//  FM
//
//  Created by Admin on 31/10/2024.
//

#if __has_include(<YTKNetwork/YTKNetwork.h>)
#import <YTKNetwork/YTKNetwork.h>
#else
#import "YTKNetwork.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTKChainRequest (Extra)
/// 开始网络请求
-(jobsByVoidBlock _Nonnull)go;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof YTKChainRequest *_Nonnull jobsMakeYTKChainRequest(jobsByYTKChainRequestBlock _Nonnull block){
    YTKChainRequest *data = YTKChainRequest.alloc.init;
    if (block) block(data);
    return data;
}
