//
//  UILabel+Scroll.h
//  FM
//
//  Created by Admin on 28/11/2024.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "NSString+Others.h"
#import "NSMutableDictionary+Extra.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Scroll)
#pragma mark ——
/// 不管是否文字超过UILabel的frame.width都是滚动的
-(RACDisposable *)startRACTimerWithDuration:(NSTimeInterval)duration
                                    byBlock:(jobsByVoidBlock _Nonnull)doBlock;
#pragma mark ——
/// 手动停止滚动
-(jobsByVoidBlock _Nonnull)stopScrolling;
/// 开始滚动动画，返回一个 RACDisposable 以便手动停止
-(JobsReturnRACDisposableByTimeIntervalBlock _Nonnull)startScrollingIfNeededWithInterval;

@end

NS_ASSUME_NONNULL_END

/**
 -(jobsByVoidBlock _Nonnull)method1{
     @jobs_weakify(self)
     return ^(){
         // 启动滚动，设置每隔 0.1 秒滚动一次
         @jobs_strongify(self)
         self.timerDisposable = [jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
             @jobs_strongify(self)
             label.text = JobsInternationalization(@"-这是测试数据-");
             label.textColor = JobsRandomCor(1);
             label.backgroundColor = JobsCyanColor;
             self.view.addSubview(label);
             [label mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.center.equalTo(self.view);
                 make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
             }];
         }) startRACTimerWithDuration:0.1 byBlock:^{
             // 可以在这里添加每次触发时需要执行的操作
             NSLog(@"Text has been scrolled.");
         }];
         // 当需要取消定时器时调用
         // [self.timerDisposable dispose];
     };
 }

 -(jobsByVoidBlock _Nonnull)method2{
     @jobs_weakify(self)
     return ^(){
         @jobs_strongify(self)
         jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
             @jobs_strongify(self)
             label.text = JobsInternationalization(@"-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据-这是测试数据");
             label.textColor = JobsRandomCor(1);
             label.backgroundColor = JobsCyanColor;
             self.view.addSubview(label);
             [label mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.center.equalTo(self.view);
                 make.size.mas_equalTo(CGSizeMake(JobsWidth(200), JobsWidth(20)));
             }];self.view.refresh();
         }).startScrollingIfNeededWithInterval(0.02f);
     };
 }
 
 */
