//
//  UITextView+Extend.h
//  DouDong-II
//
//  Created by Jobs on 2021/3/16.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "JobsBlock.h"
#import "JobsString.h"
#import "MacroDef_Font.h"
#import "DefineProperty.h"
#import "UITextView+IndicateWordLimit.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Extend)

Prop_copy()NSString *replacementText;
Prop_copy()NSString *resStr;
/// 从 iOS 16 起，UITextView 使用新的文本渲染系统，会使用 UITextLayoutFragmentView。
/// 它默认在某些情况下会将内容垂直居中，比如文本少、没有足够内容填满 UITextView 的高度时。
/// 所以一下操作就是在关闭这个新特性
-(void)switchs;
-(RACDisposable *)jobsTextViewSubscribeNextBlock:(jobsByIDBlock _Nullable)subscribeNextBlock;
-(RACDisposable *)jobsTextViewFilterBlock:(JobsReturnBOOLByIDBlock _Nullable)filterBlock
                       subscribeNextBlock:(jobsByIDBlock _Nullable)subscribeNextBlock;
-(JobsReturnTextViewByDelegateBlock _Nonnull)byDelegate;
-(JobsReturnTextViewByStringBlock _Nonnull)byText;
-(JobsReturnTextViewByCor _Nonnull)byTextCor;
-(JobsReturnTextViewByFontBlock _Nonnull)byFont;
-(JobsReturnTextViewByBOOLBlock _Nonnull)byUserInteractionEnabled;
-(JobsReturnTextViewByBOOLBlock _Nonnull)byEditable;
-(JobsReturnTextViewByDicBlock _Nonnull)byLinkTextAttributes;
-(JobsReturnTextViewByAttributedTextBlock _Nonnull)byAttributedText;
-(JobsReturnTextViewByTextAlignmentBlock _Nonnull)byTextAlignment;
-(JobsReturnTextViewByEdgeInsetsBlock _Nonnull)byTextContainerInset;
-(JobsReturnTextViewByEdgeInsetsBlock _Nonnull)byContentInset;
-(JobsReturnTextViewByPointBlock _Nonnull)byContentOffset;
-(JobsReturnTextViewByPointBlock _Nonnull)byContentOffsetWithAnimated;
/**
 IOS UITextView内容垂直居中方法 https://www.jianshu.com/p/5e4cf8488bfd
 原理：由于textView是继承自UIScrollview，所以会有ContentSize属性。
 所以可以通过文字内容的高度（也就是ContentSize）的高度和textView的高度之间的差值，设置内边距，就相当于把内容居中了。
 */
-(jobsByFontBlock _Nonnull)contentSizeToFitByFont;
/**
 如果执行的是删除动作，那么textView.text 去掉最后一个字符向外输出
 否则textView.text + replacementString进行输出
 */
-(JobsReturnStringByStringBlock _Nonnull)getCurrentTextViewValueByReplacementText;
/**
 一般用于终值部分，对应协议方法:textViewDidChange
 因为在- (void)textViewDidChange:(UITextView *)textView里面的textView.text = textView确定值 + 输入法拼音模式下的占位符值
 我们在某些业务场景下需要对此进行区分，也就是只锚点textView的确定值
 @param valueBlock 回调TextView的确定值，以表明占位符有值
 @param invalidBlock 回调占位符无值的状态
 */
-(void)markedTextValue:(jobsByIDBlock _Nullable)valueBlock
          invalidBlock:(jobsByVoidBlock _Nullable)invalidBlock;
/**
 一般用于- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
 对提行、删除【包含删除Emoji表情】、正向输入【包含汉字拼音输入法中的占位符】操作进行区分
 */
-(BOOL)replacementText:(NSString *)replacementText
     beginNewLineBlock:(jobsByIDBlock _Nullable)beginNewLineBlock
              delBlock:(jobsByIDBlock _Nullable)delBlock
      normalInputBlock:(jobsByIDBlock _Nullable)normalInputBlock;

@end

NS_ASSUME_NONNULL_END

/**
 
 测试用例：
 
 以下操作分别对应 正向 + 反向（删除）输入操作 + 输入空格的情况
 
 1、单纯输入数字✅
 2、单纯输入Emoji✅【某些新出Emoji不在判断范围内，希望Apple给一个Api来进行判断】
 3、单纯输入汉字
    3.1 、单纯汉字拼音有占位符的情况
    3.2、单纯输入汉字拼音占位符的时候就超过字数限制的情况【希望有截取】
 4、单纯输入英文✅
 5、以上操作相互混合输入✅
 6、超过输入限制进行截取。比如还有1个字符到顶，但这个时候输入一个一串字符，只保留到上限的字符
 
 【测试目标】
 1、右下角标注当前字符数是否正确
 2、向外界抛出的当前值打印是否正确

 */
