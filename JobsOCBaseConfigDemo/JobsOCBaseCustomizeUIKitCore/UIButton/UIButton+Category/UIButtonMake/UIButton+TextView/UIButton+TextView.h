//
//  UIButton+TextView.h
//  FM
//
//  Created by Admin on 10/12/2024.
//

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "BaseTextView.h"
#import "DefineConstString.h" /// 常量字符串的定义
#import "NSObject+Extras.h"
#import "JobsKeyValueModel.h"

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// UIButton.titleLabel 是 UILabel，无法处理富文本的点击事件。
/// 此分类对 UIButton.titleLabel 和 UIButton.subtitleLabel 进行覆盖屏蔽（非KVC替换）
/// 以期望可以响应富文本的点击事件
@interface UIButton (TextView)<UITextViewDelegate>

@property(nonatomic,strong)BaseTextView *titleTextView;
@property(nonatomic,strong)BaseTextView *subtitleTextView;

@end

NS_ASSUME_NONNULL_END
/**
 /// 用 UITextView 替换 UIButton.titleLabel
 -(JobsReturnButtonByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedTitle{
     @jobs_weakify(self)
     return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
         @jobs_strongify(self)
         if(title){
             self.jobsResetBtnNormalAttributedTitle(title.changeTextColorBy(JobsClearColor).removeHyperlinks);
             self.titleTextView.frame = self.titleLabel.frame;
             self.titleTextView.attributedText = title;
             self.jobsResetBtnNormalAttributedTitle(nil);
         }return self;
     };
 }
 /// 用 UITextView 替换 UIButton.subtitleLabel
 -(JobsReturnButtonByAttributedStringBlock _Nonnull)jobsResetBtnTextViewNormalAttributedSubTitle{
     @jobs_weakify(self)
     return ^__kindof UIButton *(NSAttributedString *_Nonnull title) {
         @jobs_strongify(self)
         if(title){
             self.jobsResetBtnNormalAttributedSubTitle(title.changeTextColorBy(JobsClearColor));
             self.subtitleTextView.frame = self.subtitleLabel.frame;
             self.subtitleTextView.attributedText = title;
             self.jobsResetBtnNormalAttributedSubTitle(nil);
         }return self;
     };
 }
 */
