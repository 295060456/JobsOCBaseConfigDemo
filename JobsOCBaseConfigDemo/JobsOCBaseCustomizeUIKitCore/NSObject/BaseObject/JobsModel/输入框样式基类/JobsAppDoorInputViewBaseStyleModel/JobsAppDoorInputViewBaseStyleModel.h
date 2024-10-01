//
//  JobsAppDoorInputViewBaseStyleModel.h
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+RichText.h"
#import "UIViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyleModel : UIViewModel
/// 关于左右的标识图
@property(nullable,nonatomic,strong)UIImage *leftViewIMG;
@property(nullable,nonatomic,strong)UIImage *selectedSecurityBtnIMG;
@property(nullable,nonatomic,strong)UIImage *unSelectedSecurityBtnIMG;
@property(nonatomic,assign)BOOL isShowDelBtn;/// 是否显示删除按钮,默认不显示
@property(nonatomic,assign)BOOL isShowSecurityBtn;/// 是否显示安全按钮（眼睛）,默认不显示
@property(nonatomic,assign)BOOL useCustomClearButton;/// 是否使用自定义的删除按钮 ,默认不使用
/// 关于 placeHolder
@property(nullable,nonatomic,strong)NSString *placeHolderStr;
@property(nonatomic,strong)UIColor *placeholderCor;
@property(nonatomic,strong)UIFont *placeholderFont;
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*defaultAttributedDataForPlaceHolderMutArr;
/// 关于输入的文本字符
@property(nullable,nonatomic,strong)NSString *nickNamePlaceHolderStr;
@property(nullable,nonatomic,strong)NSString *titleLabStr;
@property(nullable,nonatomic,strong)UIFont *titleStrFont;
@property(nullable,nonatomic,strong)UIColor *titleStrCor;
@property(nullable,nonatomic,strong)NSString *inputStr;/// 输入框里面的实时内容
@property(nonatomic,assign)NSInteger inputCharacterRestriction;/// 输入字符限制
/// 关于键盘⌨️配置
@property(nonatomic,assign)UIReturnKeyType returnKeyType;
@property(nonatomic,assign)UIKeyboardAppearance keyboardAppearance;
@property(nonatomic,assign)UITextFieldViewMode leftViewMode;
@property(nonatomic,assign)UIKeyboardType keyboardType;
@property(nonatomic,assign)BOOL keyboardEnable;
/// 关于TextField
@property(nullable,nonatomic,strong)UIColor *backgroundColor UI_APPEARANCE_SELECTOR;
@property(nullable,nonatomic,strong)UIImage *disabledBackground;
@property(nullable,nonatomic,strong)UIImage *background;
@property(nonatomic,assign)CGSize tfSize;
/// 关于 ZYTextField
@property(nonatomic,assign)CGFloat TFRiseHeight;/// 键盘在此手机上的最高弹起，区别于全面屏结合非全面屏，有一个安全区域34
@property(nonatomic,assign)CGFloat placeHolderOffset;/// 左/右/居中 对齐的时候placeHolder的偏移量【传正值】
@property(nonatomic,assign)CGFloat fieldEditorOffset; /// 因为设置了leftView后fieldEditor所需的偏移量
@property(nonatomic,assign)NSTextAlignment placeHolderAlignment;/// PlaceHolder的位置（左/中/右）
@property(nonatomic,assign)CGFloat offset;/// 光标的起始距离距离控件最左边(不包括leftView)的差值
@property(nonatomic,assign)CGFloat leftViewOffsetX;/// leftView 距离控件最左边的差值
@property(nonatomic,assign)CGFloat rightViewOffsetX;/// TextField的删除按钮距离控件最右边的差值
@property(nonatomic,assign)BOOL ZYTextFieldMasksToBounds;
@property(nonatomic,assign)UIColor *ZYTextFieldBorderColor;
@property(nonatomic,strong)UIColor *ZYtextColor;/// 文本颜色
@property(nonatomic,strong)UIColor *ZYtintColor;/// 光标颜色
@property(nonatomic,strong)UIFont *ZYtextFont;/// 字体大小
@property(nonatomic,assign)CGFloat ZYTextFieldCornerRadius;
@property(nonatomic,assign)CGFloat ZYTextFieldBorderWidth;
/// 关于 JobsMagicTextField
@property(nonatomic,assign,getter=isPlaceholdAnimationable)BOOL placeholdAnimationable;// 是否开启动画
@property(nonatomic,strong)UIColor *animationColor;/// 动画最终字颜色
@property(nonatomic,strong)UIFont *animationFont;/// 动画最终字体
@property(nonatomic,assign)CGFloat moveDistance;///  移动距离,默认为field高度的一半,设置0无效（关闭动画请使用isPlaceholdAnimationable）

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull jobsMakeAppDoorInputViewBaseStyleModel(jobsByAppDoorInputViewBaseStyleModelBlock _Nonnull block){
    JobsAppDoorInputViewBaseStyleModel *data = JobsAppDoorInputViewBaseStyleModel.alloc.init;
    if (block) block(data);
    return data;
}
