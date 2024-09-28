//
//  JobsAppDoorInputViewBaseStyle_7.h
//  Casino
//
//  Created by Jobs on 2021/11/24.
//

#import "BaseViewProtocol.h"
#import "JobsDoorInputViewProtocol.h"
#import "JobsAppDoorInputViewBaseStyleModel.h"
#import "JobsAppDoorInputViewBaseStyle.h"
#import "JobsMagicTextField.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_7 : JobsAppDoorInputViewBaseStyle
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 
 */
@end

NS_ASSUME_NONNULL_END
/**
 调用示例：
 -(JobsAppDoorInputViewBaseStyle_7 *)选择区号并输入手机号{
     if (!_选择区号并输入手机号) {
         _选择区号并输入手机号 = JobsAppDoorInputViewBaseStyle_7.new;
         [self.view addSubview:_选择区号并输入手机号];
         @jobs_weakify(self)
         [_选择区号并输入手机号 actionObjectBlock:^(JobsAppDoorInputViewTFModel *data) {
             @jobs_strongify(self)
 //            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
 //                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
 //                self.newsWithdrawPassword = model.resString;
 //            }
         }];
         
         [self.view addSubview:_选择区号并输入手机号];
         [_选择区号并输入手机号 mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerX.equalTo(self.view);
             make.size.mas_equalTo(inputSize());
             make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(72));
         }];
         
         _选择区号并输入手机号.layer.cornerRadius = JobsWidth(52 / 2);
         _选择区号并输入手机号.layer.borderColor = HEXCOLOR(0xEEE2C8).CGColor;
         _选择区号并输入手机号.jobsRichViewByModel(self.配置选择区号并输入手机号);
     }return _选择区号并输入手机号;
 }
 
 -(JobsAppDoorInputViewBaseStyleModel *)配置选择区号并输入手机号{
     if (!_配置选择区号并输入手机号) {
         _配置选择区号并输入手机号 = JobsAppDoorInputViewBaseStyleModel.new;
         _配置选择区号并输入手机号.leftViewIMG = JobsIMG(@"小手机图标");
         _配置选择区号并输入手机号.placeHolderStr = JobsInternationalization(@"请输入您的手机号");
 //        配置选择区号并输入手机号.placeholderColor = HEXCOLOR(0xC4C4C4);
         _配置选择区号并输入手机号.placeholderFont = UIFontWeightRegularSize(JobsWidth(16));
         _配置选择区号并输入手机号.isShowDelBtn = YES;
         _配置选择区号并输入手机号.isShowSecurityBtn = NO;
         _配置选择区号并输入手机号.returnKeyType = UIReturnKeyDone;
         _配置选择区号并输入手机号.keyboardAppearance = UIKeyboardAppearanceAlert;
         _配置选择区号并输入手机号.leftViewMode = UITextFieldViewModeAlways;
         _配置选择区号并输入手机号.moveDistance = JobsWidth(60);
         _配置选择区号并输入手机号.titleStrCor = _配置选择区号并输入手机号.placeholderColor = HEXCOLOR_ALPHA(0xC4C4C4,1.f);
 //        配置选择区号并输入手机号.background = JobsIMG(@"设置弹出框输入框背景图");
     }return _配置选择区号并输入手机号;
 }

 
 */
