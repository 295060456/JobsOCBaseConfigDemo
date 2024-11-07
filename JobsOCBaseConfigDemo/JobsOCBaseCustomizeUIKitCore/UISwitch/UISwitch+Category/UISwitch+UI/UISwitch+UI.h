//
//  UISwitch+UI.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/24.
//

#import <UIKit/UIKit.h>
#import "MacroDef_Strong@Weak.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// iOS系统内置了UISwithch控件的size，所以通过代码调整UISwithch的大小无效。默认大小：宽51.0f 、高31.0f
@interface UISwitch (UI)

-(RACDisposable *)jobsSwitchClickEventBlock:(jobsByIDBlock)subscribeNextBlock;

@end

NS_ASSUME_NONNULL_END

/**
 /// UI
 @property(nonatomic,strong)UISwitch *switcher;
 /// Data
 @property(nonatomic,strong)UIColor *cor;
 
 -(UISwitch *)switcher{
     if (!_switcher) {
         @jobs_weakify(self)
         _switcher = jobsMakeSwitch(^(__kindof UISwitch * _Nullable Switch) {
             @jobs_strongify(self)
             [self.view addSubview:Switch];
             Switch.selected = NO;// 读取系统记录
             Switch.thumbTintColor = _switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0);
             Switch.tintColor = JobsWhiteColor;
             Switch.onTintColor = HEXCOLOR(0xFFFCF7);
             Switch.backgroundColor = JobsWhiteColor;
             Switch.cornerCutToCircleWithCornerRadius(31 / 2);
             [Switch mas_makeConstraints:^(MASConstraintMaker *make) {
     //            make.top.equalTo(self.titleLab);
                 make.right.equalTo(self.view).offset(JobsWidth(-16));
             }];
             Switch.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                 data.layerCor = Switch.selected ? self.cor : HEXCOLOR(0xB0B0B0)
                 data.jobsWidth = 1;
             }));
             [Switch jobsSwitchClickEventBlock:^(UISwitch *x) {
                 x.selected = !x.selected;
                 self.jobsToastMsg(x.selected ? JobsInternationalization(@"打开解锁"):JobsInternationalization(@"关闭解锁"));
                 x.thumbTintColor = x.selected ? self.cor : HEXCOLOR(0xB0B0B0);
                 x.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                     data.layerCor = Switch.selected ? self.cor : HEXCOLOR(0xB0B0B0)
                     data.jobsWidth = 1;
                 }));
             }];
         })
     }return _switcher;
 }

 -(UIColor *)cor{
     if (!_cor) {
         _cor = [UIColor gradientCorDataMutArr:[NSMutableArray arrayWithArray:@[HEXCOLOR(0xE9C65D),HEXCOLOR(0xDDAA3A)]]
                                    startPoint:CGPointZero
                                      endPoint:CGPointZero
                                        opaque:NO
                                targetViewRect:CGRectMake(0, 0, 51, 31)];
     }return _cor;
 }
 
 */
