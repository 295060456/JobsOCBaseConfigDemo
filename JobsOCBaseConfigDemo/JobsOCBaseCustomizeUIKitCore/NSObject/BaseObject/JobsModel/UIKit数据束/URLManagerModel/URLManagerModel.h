//
//  URLManagerModel.h
//  MonkeyKingVideo
//
//  Created by Jobs on 2020/12/10.
//  Copyright © 2020 MonkeyKingVideo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN
/// 建立此类的目的：防止外层调用funcName的时候因为手滑出错不易检查，导致崩溃
@interface URLManagerModel : NSObject

@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *funcName;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof URLManagerModel *_Nonnull jobsMakeURLManagerModel(jobsByURLManagerModelBlock _Nonnull block){
    URLManagerModel *data = URLManagerModel.alloc.init;
    if (block) block(data);
    return data;
}
