//
//  UIView+Masonry.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "DefineProperty.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Masonry)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
#pragma mark —— 一些Masonry算法
/// 制作一个带有n*m小矩形内容的大矩形（二次封装）
-(jobsByViewArrayRowsColumnsBlock _Nonnull)gridLayoutBy;
/// 制作一个带有n*m小矩形内容的大矩形（核心算法）
-(void)setupGridWithRows:(NSInteger)rows
                 columns:(NSInteger)columns
               itemViews:(NSArray<__kindof UIView *> *)views
                  margin:(CGFloat)margin
                 spacing:(CGFloat)spacing;
#pragma mark —— 实现 masonryBlock 链式方法
-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)setMasonryBy;
#pragma mark —— 执行约束
/// 含义：添加新的约束
/// 适用场景：第一次为视图添加约束
/// 行为：不会影响已有约束；不会自动删除或更新已存在的约束
-(JobsRetViewByVoidBlock _Nonnull)on;
/// 含义：更新已有的约束
/// 适用场景：已经添加过约束，需要修改某些数值
/// 行为：只会更新匹配的已有约束；不会新建或移除不相关的约束
-(JobsRetViewByVoidBlock _Nonnull)upgrade;
/// 含义：先移除旧的所有约束，再添加新的
/// 适用场景：布局逻辑发生了变化，原有约束不再适用
/// 行为：会移除视图上所有 Masonry 创建的约束，再应用 block 中的新约束
-(JobsRetViewByVoidBlock _Nonnull)remake;
#pragma mark —— 添加约束并执行
-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byAdd;
-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byUpgrade;
-(JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byRemake;
#pragma mark —— 卸载约束
/// 卸载当前view上的某个方向的约束
-(jobsByLayoutAttributeBlock _Nonnull)uninstall;
/// 卸载当前view上的全部约束
-(jobsByVoidBlock _Nonnull)uninstallAllLayoutAttribute;
#pragma mark —— Masonry约束动画
/// 是一个用于执行 两个阶段动画布局切换 的自定义封装，常用于需要分两次改变布局的 UI 动效
/// - Parameters:
///   - masonryBeforeBlock: 最初的约束
///   - masonryAfterBlock: 希望变到的最后的约束
-(void)jobsMasonryBeforeBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryBeforeBlock
            masonryAfterBlock:(jobsByMASConstraintMakerBlock _Nonnull)masonryAfterBlock;

@end

NS_ASSUME_NONNULL_END
/**
 
 -(BaseButton *)forgotten_code_btn{
     if(!_forgotten_code_btn){
         @jobs_weakify(self)
         _forgotten_code_btn = self.addSubview(BaseButton.jobsInit()
                                               .bgColorBy(JobsClearColor)
                                               .jobsResetBtnTitleCor(@"#FF0000".cor)
                                               .jobsResetBtnTitleFont(pingFangHKRegular(JobsWidth(13)))
                                               .jobsResetBtnTitle(@"Forgot Password?".tr)
                                               .onClickBy(^(UIButton *x){
                                                   @jobs_strongify(self)
                                                   self.getCurrentViewController.comingToPushVC(FMForgotPwdVC.new);
                                               }).onLongPressGestureBy(^(id data){
                                                   JobsLog(@"");
                                               })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                                                   @jobs_strongify(self)
                                                   make.top.equalTo(self.textField_code.mas_bottom).offset(JobsWidth(5));
                                                   make.right.equalTo(self.textField_code);
                                                   make.size.mas_equalTo(CGSizeMake(JobsWidth(130), JobsWidth(15)));
                                               }).on();
     }return _forgotten_code_btn;
 }
 
 */

/**
 /// 2 * 3 的矩形
 self.gridLayoutBy(jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
     arr.add(BaseButton.jobsInit()
             .bgColorBy(JobsClearColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(@"Betslip".img))
             .jobsResetBtnTitleCor(@"#666666".cor)
             .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
             .jobsResetBtnTitle(@"Betslip".tr)
             .onClickBy(^(UIButton *x){
                 toastBy(@"Betslip");
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             }))
     .add(BaseButton.jobsInit()
         .bgColorBy(JobsClearColor)
         .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
         .jobsResetImagePadding(1)
         .jobsResetBtnImage(@"Statement".img))
         .jobsResetBtnTitleCor(@"#666666".cor)
         .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
         .jobsResetBtnTitle(@"Statement".tr)
         .onClickBy(^(UIButton *x){
             toastBy(@"Statement");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }))
     .add(BaseButton.jobsInit()
         .bgColorBy(JobsClearColor)
         .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
         .jobsResetImagePadding(1)
         .jobsResetBtnImage(@"Promo".img))
         .jobsResetBtnTitleCor(@"#666666".cor)
         .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
         .jobsResetBtnTitle(@"Promo".tr)
         .onClickBy(^(UIButton *x){
             toastBy(@"Promo");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }))
     .add(BaseButton.jobsInit()
         .bgColorBy(JobsClearColor)
         .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
         .jobsResetImagePadding(1)
         .jobsResetBtnImage(@"Security".img))
         .jobsResetBtnTitleCor(@"#666666".cor)
         .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
         .jobsResetBtnTitle(@"Security".tr)
         .onClickBy(^(UIButton *x){
             toastBy(@"Security");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }))
     .add(BaseButton.jobsInit()
         .bgColorBy(JobsClearColor)
         .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
         .jobsResetImagePadding(1)
         .jobsResetBtnImage(@"Help Center".img))
         .jobsResetBtnTitleCor(@"#666666".cor)
         .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
         .jobsResetBtnTitle(@"Help Center".tr)
         .onClickBy(^(UIButton *x){
             toastBy(@"Help Center");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }))
     .add(BaseButton.jobsInit()
         .bgColorBy(JobsClearColor)
         .jobsResetImagePlacement(NSDirectionalRectEdgeTop)
         .jobsResetImagePadding(1)
         .jobsResetBtnImage(@"Feedback".img))
         .jobsResetBtnTitleCor(@"#666666".cor)
         .jobsResetBtnTitleFont(pingFangHKLight(JobsWidth(12)))
         .jobsResetBtnTitle(@"Feedback".tr)
         .onClickBy(^(UIButton *x){
             toastBy(@"Feedback");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }));
 }),2,3);
 
 */
