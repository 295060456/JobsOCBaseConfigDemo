//
//  RACModel.h
//  FM
//
//  Created by Admin on 24/12/2024.
//

#import <Foundation/Foundation.h>
#import "RACProtocol.h"
#import "JobsBlock.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 在 ReactiveObjC 中，RACDisposable 是用来管理订阅生命周期的，但 RACDisposable 本身不能提供对信号的直接访问
@interface RACModel : NSObject<RACProtocol>

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof RACModel *_Nonnull jobsMakeRACModel(jobsByRACModelBlock _Nonnull block){
    RACModel *data = RACModel.alloc.init;
    if (block) block(data);
    return data;
}
