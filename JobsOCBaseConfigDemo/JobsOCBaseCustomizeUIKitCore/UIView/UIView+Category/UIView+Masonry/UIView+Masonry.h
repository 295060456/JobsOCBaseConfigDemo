//
//  UIView+Masonry.h
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/18.
//

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Masonry)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
/// 实现 masonryBlock 链式方法
-(JobsReturnViewByMasonryConstraintsBlock _Nonnull)setMasonryBy;
/// 执行约束
-(JobsReturnViewByVoidBlock _Nonnull)on;
/// 添加约束并执行
-(JobsReturnViewByMasonryConstraintsBlock _Nonnull)masonryBy;
/// 卸载当前view上的某个方向的约束
-(jobsByLayoutAttributeBlock _Nonnull)uninstall;
/// 卸载当前view上的全部约束
-(jobsByVoidBlock _Nonnull)uninstallAllLayoutAttribute;
/// Masonry约束动画
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
                                               .jobsResetBtnTitleCor(JobsCor(@"#FF0000"))
                                               .jobsResetBtnTitleFont(pingFangHKRegular(JobsWidth(13)))
                                               .jobsResetBtnTitle(JobsInternationalization(@"Forgot Password?"))
                                               .onClickBy(^(UIButton *x){
                                                   @jobs_strongify(self)
                                                   self.getCurrentViewController.comingToPushVC(FMForgotPwdVC.new);
                                               }).onLongPressGestureBy(^(id data){
                                                   JobsLog(@"");
                                               })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                                                   make.top.equalTo(self.textField_code.mas_bottom).offset(JobsWidth(5));
                                                   make.right.equalTo(self.textField_code);
                                                   make.size.mas_equalTo(CGSizeMake(JobsWidth(130), JobsWidth(15)));
                                               }).on();
     }return _forgotten_code_btn;
 }
 
 */
