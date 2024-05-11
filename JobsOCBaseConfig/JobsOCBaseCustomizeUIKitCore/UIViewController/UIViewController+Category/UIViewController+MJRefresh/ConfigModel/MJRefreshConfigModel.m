//
//  MJRefreshConfig.m
//  DouYin
//
//  Created by Jobs on 2020/12/11.
//

#import "MJRefreshConfigModel.h"

@implementation MJRefreshConfigModel

#pragma mark —— lazyLoad 默认配置
/// Font
-(UIFont *)font{
    if (!_font) {
        _font = UIFontWeightThinSize(17);
    }return _font;
}
/// TextColor
-(UIColor *)textColor{
    if (!_textColor) {
        _textColor = JobsLightGrayColor;
    }return _textColor;
}
/// duration
-(CGFloat)stateIdleDuration{
    if (!_stateIdleDuration) {
        _stateIdleDuration = 0.1f;
    }return _stateIdleDuration;
}

-(CGFloat)pullingDuration{
    if (!_pullingDuration) {
        _pullingDuration = 0.1f;
    }return _pullingDuration;
}

-(CGFloat)refreshingDuration{
    if (!_refreshingDuration) {
        _refreshingDuration = 0.7f;
    }return _refreshingDuration;
}

-(CGFloat)willRefreshDuration{
    if (!_willRefreshDuration) {
        _willRefreshDuration = 0.1f;
    }return _willRefreshDuration;
}

-(CGFloat)noMoreDataDuration{
    if (!_noMoreDataDuration) {
        _noMoreDataDuration = 0.5;
    }return _noMoreDataDuration;
}
/// title
-(NSString *)stateIdleTitle{
    if (!_stateIdleTitle) {
        _stateIdleTitle = Internationalization(@"普通闲置状态");
    }return _stateIdleTitle;
}

-(NSString *)pullingTitle{
    if (!_pullingTitle) {
        _pullingTitle = Internationalization(@"松开就可以进行刷新的状态");
    }return _pullingTitle;
}

-(NSString *)refreshingTitle{
    if (!_refreshingTitle) {
        _refreshingTitle = Internationalization(@"正在刷新中的状态");
    }return _refreshingTitle;
}

-(NSString *)willRefreshTitle{
    if (!_willRefreshTitle) {
        _willRefreshTitle = Internationalization(@"即将刷新的状态");
    }return _willRefreshTitle;
}

-(NSString *)noMoreDataTitle{
    if (!_noMoreDataTitle) {
        _noMoreDataTitle = Internationalization(@"所有数据加载完毕，没有更多的数据了");
    }return _noMoreDataTitle;
}
/// 静态图内部拼接出的动效，而非Gif
-(NSMutableArray<UIImage *> *)stateIdlePicsMutArr{
    if (!_stateIdlePicsMutArr) {
        _stateIdlePicsMutArr = NSMutableArray.array;
        [_stateIdlePicsMutArr addObject:JobsBuddleIMG(@"bundle",
                                                   @"刷新",
                                                   nil,
                                                   @"header.png")];
    }return _stateIdlePicsMutArr;
}

-(NSMutableArray<UIImage *> *)pullingPicsMutArr{
    if (!_pullingPicsMutArr) {
        _pullingPicsMutArr = NSMutableArray.array;
        [_pullingPicsMutArr addObject:JobsBuddleIMG(@"bundle",
                                                 @"刷新",
                                                 nil,
                                                 @"Indeterminate Spinner - Small.png")];
    }return _pullingPicsMutArr;
}

-(NSMutableArray<UIImage *> *)refreshingPicsMutArr{
    if (!_refreshingPicsMutArr) {
        _refreshingPicsMutArr = NSMutableArray.array;
        
        for (int i = 1; i <= 55; i++) {
            NSString *str = [NSString stringWithFormat:@"gif_header_%d",i];
            str = [str stringByAppendingString:@".png"];
            [_refreshingPicsMutArr addObject:JobsBuddleIMG(@"bundle",
                                                        @"刷新",
                                                        @"刷新图片 166 * 166 @3x 100 * 100 @2x",
                                                        str)];
        }
        
    }return _refreshingPicsMutArr;
}

-(NSMutableArray<UIImage *> *)willRefreshPicsMutArr{
    if (!_willRefreshPicsMutArr) {
        _willRefreshPicsMutArr = NSMutableArray.array;
        
        for (int i = 1; i <= 55; i++) {
            NSString *str = [NSString stringWithFormat:@"gif_header_%d",i];
            str = [str stringByAppendingString:@".png"];
            [_willRefreshPicsMutArr addObject:JobsBuddleIMG(@"bundle",
                                                         @"刷新",
                                                         @"刷新图片 166 * 166 @3x 100 * 100 @2x",
                                                         str)];
        }
        
    }return _willRefreshPicsMutArr;
}

-(NSMutableArray<UIImage *> *)noMoreDataPicsMutArr{
    if (!_noMoreDataPicsMutArr) {
        _noMoreDataPicsMutArr = NSMutableArray.array;
        
        for (int i = 1; i <= 55; i++) {
            NSString *str = [NSString stringWithFormat:@"gif_header_%d",i];
            str = [str stringByAppendingString:@".png"];
            [_noMoreDataPicsMutArr addObject:JobsBuddleIMG(@"bundle",
                                                        @"刷新",
                                                        @"刷新图片 166 * 166 @3x 100 * 100 @2x",
                                                        str)];
        }
        
    }return _noMoreDataPicsMutArr;
}
/// Lottie配置
-(NSString *)jsonLottiefilePaths{
    if (!_jsonLottiefilePaths) {
        _jsonLottiefilePaths = JobsPathForBuddleIMG(nil,
                                                @"JsonRes",
                                                nil,
                                                @"下拉刷新.json");
    }return _jsonLottiefilePaths;
}

@end
