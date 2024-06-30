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
         _switcher = UISwitch.new;
         [self.view addSubview:_switcher];
         _switcher.selected = NO;// 读取系统记录
         _switcher.thumbTintColor = _switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0);
         _switcher.tintColor = UIColor.whiteColor;
         _switcher.onTintColor = HEXCOLOR(0xFFFCF7);
         _switcher.backgroundColor = UIColor.whiteColor;
         [_switcher cornerCutToCircleWithCornerRadius:31 / 2];
         [_switcher mas_makeConstraints:^(MASConstraintMaker *make) {
 //            make.top.equalTo(self.titleLab);
             make.right.equalTo(self.view).offset(JobsWidth(-16));
         }];
         [_switcher layerBorderCor:_switcher.selected ? self.cor : HEXCOLOR(0xB0B0B0) andBorderWidth:JobsWidth(1)];
         [_switcher jobsSwitchClickEventBlock:^(UISwitch *x) {
             x.selected = !x.selected;
             [WHToast jobsToastMsg:x.selected ? JobsInternationalization(@"打开解锁"):JobsInternationalization(@"关闭解锁")];
             x.thumbTintColor = x.selected ? self.cor : HEXCOLOR(0xB0B0B0);
             [x layerBorderCor:x.selected ? self.cor : HEXCOLOR(0xB0B0B0) andBorderWidth:JobsWidth(1)];
         }];
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
