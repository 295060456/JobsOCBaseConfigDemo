//
//  Douyin_ZFPlayerVC@2.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "BaseViewController.h"
#import "MacroDef_Func.h"

#import "ZFCustomControlView.h"
#import "ZFDouYinControlView.h"
#import "JobsVideoTBVCell.h"

#if __has_include(<KTVHTTPCache/KTVHTTPCache.h>)
#import <KTVHTTPCache/KTVHTTPCache.h>
#else
#import "KTVHTTPCache.h"
#endif

#import "VideoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Douyin_ZFPlayerVC_2 : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource,
ZFDouYinCellDelegate
>
/// 指定到某一行播放
-(void)playTheIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
