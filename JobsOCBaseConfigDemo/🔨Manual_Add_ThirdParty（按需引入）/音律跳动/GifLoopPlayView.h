//
//  GifLoopPlayView.h
//  TFRememberHistoryInputContentWithDropList
//
//  Created by Jobs on 2020/9/30.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 一个 gif 动画显示组件，允许在指定时间内播放动画序列，无限循环，支持停止、播放
@interface GifLoopPlayView : UIView

@property(nonatomic,assign)BOOL stopped;// YES: 没有播放，NO：正在播放
@property(nonatomic,assign)CGFloat duration;// 动图执行周期
@property(nonatomic,copy)NSMutableArray<UIImage *> *gifMutArr;// 要播放的动画序列
@property(nonatomic,strong)UIImage *pauseImage;// 暂停时显示的图片

@end

NS_ASSUME_NONNULL_END

/**
 * 使用方法：
 
 // 开始播动画
 self.gifLoopPlayView.stopped = NO;//YES - 停止；NO - 播放
 
 
 -(GifLoopPlayView *)gifLoopPlayView{
     if (!_gifLoopPlayView) {
         _gifLoopPlayView = GifLoopPlayView.new;
         _gifLoopPlayView.frame = CGRectMake(100, 200, 104, 11);
         [self.view addSubview:_gifLoopPlayView];
         for (int t = 1; t <= 10; t++) {
             [_gifLoopPlayView.gifMutArr addObject:JobsBuddleIMG(nil,@"音律跳动",  nil,[NSString stringWithFormat:@"%d",t])];
         }
         // 设置动画时长
         _gifLoopPlayView.duration = 0.85;
     }return _gifLoopPlayView;
 }
 * 
 */
