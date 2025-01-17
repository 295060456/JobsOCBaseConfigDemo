//
//  UIViewController+TFPopupView.h
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/29.
//

#import <UIKit/UIKit.h>
#import "JobsBaseCustomizeUIKitCoreHeader.h"
#import "JobsBlock.h" // 自定义

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#import "JobsCustomView.h" // 自定义
#import "JobsFiltrationView.h" // 过滤

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TFPopupView)

@property(nonatomic,strong)JobsFiltrationView *filtrationView;/// 过滤
@property(nonatomic,strong)JobsCustomView *customView;/// 自定义
/// 弹出筛选视图
-(__kindof UIView *)popUpFiltrationView;
/// 弹出自定义视图
-(__kindof UIView *)popUpCustomView;
/// 关闭弹出的视图
-(jobsByViewBlock _Nonnull)hidePopupView;

@end

NS_ASSUME_NONNULL_END
/**
 
 调用示例：
 
 @property(nonatomic,strong)UIButton *filterBtn;
 @property(nonatomic,strong)UIButton *customBtn;
 @property(nonatomic,weak)UIView *popUpFiltrationView;
 @property(nonatomic,weak)UIView *popUpCustomView;
 @property(nonatomic,weak)NSNumber *currentIndex;
 @property(nonatomic,weak)BaiShaETProjAlreadySettledSubBaseVC *vc;
 @property(nonatomic,strong)NSMutableArray <__kindof UIViewController *>*childVCMutArr;
 
 -(NSMutableArray<UIViewController *> *)childVCMutArr{
     if (!_childVCMutArr) {
         _childVCMutArr = NSMutableArray.array;
         for (NSString *str in self.titleMutArr) {
             [_childVCMutArr addObject:BaiShaETProjAlreadySettledSubBaseVC.new];
         }
     }return _childVCMutArr;
 }
 
 -(UIButton *)filterBtn{
     if (!_filterBtn) {
         _filterBtn = UIButton.new;
         _filterBtn.jobsResetBtnTitle = JobsInternationalization(@"篩選");
         _filterBtn.jobsResetBtnImage = JobsIMG(@"向下的箭头");
         _filterBtn.titleFont = fontName(@"NotoSans-Bold", 12);
         _filterBtn.jobsResetBtnTitleCor = HEXCOLOR(0x3D4A58);
         [self.view addSubview:_filterBtn];
         [_filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.equalTo(self.view);
             make.top.bottom.equalTo(categoryView);
         }];
         _filterBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
         _filterBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTrailing,JobsWidth(6));

         BtnClickEvent(_filterBtn, {
             x.selected = !x.selected;
             // self.jobsToastMsg(JobsInternationalization(@"篩選"));
             [x changeAction:x.selected];
             self.currentIndex = [self->listContainerView valueForKey:@"currentIndex"];
             JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",self.currentIndex.intValue);
             self.vc = (BaiShaETProjAlreadySettledSubBaseVC *)self.childVCMutArr[self.currentIndex.intValue];
             self.popUpFiltrationView = self.vc.popUpFiltrationView;
             [self.vc hidePopupView:self.popUpCustomView];

             if (x.selected) {
                 self.customBtn.selected = NO;
                 self.popUpFiltrationView.popupDelegate = self;
             }else{
                 [self.vc hidePopupView:self.popUpFiltrationView];
             }
         });
     }return _filterBtn;
 }

 -(UIButton *)customBtn{
     if (!_customBtn) {
         _customBtn = UIButton.new;
         _customBtn.jobsResetBtnTitle = JobsInternationalization(@"自定义");
         _customBtn.titleFont = fontName(@"NotoSans-Bold", 12);
         _customBtn.jobsResetBtnTitleCor = HEXCOLOR(0x3D4A58);
         _customBtn.selectedStateTitleColorBy = HEXCOLOR(0xAE8330);
         [self.view addSubview:_customBtn];
         [_customBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.right.equalTo(self.filterBtn.mas_left).offset(JobsWidth(-8));
             make.top.bottom.equalTo(categoryView);
             make.left.equalTo(categoryView.mas_right);
         }];

         BtnClickEvent(_customBtn, {
             x.selected = !x.selected;
             /// self.jobsToastMsg(JobsInternationalization(@"自定义"));
             self.currentIndex = [self->listContainerView valueForKey:@"currentIndex"];
             JobsLog(@"滑动或者点击以后，改变控制器，得到的目前最新的index = %d",self.currentIndex.intValue);
             self.vc = (BaiShaETProjAlreadySettledSubBaseVC *)self.childVCMutArr[self.currentIndex.intValue];

             [self.vc hidePopupView:self.popUpFiltrationView];

             [self.filterBtn changeAction:self.filterBtn.selected];

             if (x.selected) {
                 self.filterBtn.selected = NO;
                 self.popUpCustomView = self.vc.popUpCustomView;
                 self.popUpCustomView.popupDelegate = self;
             }else{
                 [self.vc hidePopupView:self.popUpCustomView];
             }
         });
     }return _customBtn;
 }
 
 */
