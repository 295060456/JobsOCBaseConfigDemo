//
//  ZFPlayerExtras.h
//  FM_Normal
//
//  Created by Jobs on 2025/4/18.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#import "ZFDouYinControlView.h"
#import "ZFCustomControlView.h"
#import "ZFIJKPlayerManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFPlayerExtras : NSObject

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof ZFAVPlayerManager *_Nonnull jobsMakeZFAVPlayerManager(jobsByZFAVPlayerManagerBlock _Nonnull block){
    ZFAVPlayerManager *data = ZFAVPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}

#if __has_include(<IJKMediaFramework/IJKMediaFramework.h>)
NS_INLINE __kindof ZFIJKPlayerManager *_Nonnull jobsMakeZFIJKPlayerManager(jobsByZFIJKPlayerManagerBlock _Nonnull block){
    ZFIJKPlayerManager *data = ZFIJKPlayerManager.alloc.init;
    if (block) block(data);
    return data;
}
#endif

NS_INLINE __kindof ZFDouYinControlView *_Nonnull jobsMakeZFDouYinControlView(jobsByZFDouYinControlViewBlock _Nonnull block){
    ZFDouYinControlView *data = ZFDouYinControlView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof ZFCustomControlView *_Nonnull jobsMakeZFCustomControlView(jobsByZFCustomControlViewBlock _Nonnull block){
    ZFCustomControlView *data = ZFCustomControlView.alloc.init;
    if (block) block(data);
    return data;
}
