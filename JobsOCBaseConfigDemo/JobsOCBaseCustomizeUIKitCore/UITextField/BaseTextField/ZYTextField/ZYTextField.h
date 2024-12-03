//
//  ZYTextField.h
//  BHBMagicFieldDemo
//
//  Created by Jobs on 2020/12/6.
//  Copyright © 2020 bihongbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "JobsBlock.h"
#import "UITextFieldProtocol.h"
#import "MacroDef_Size.h"
#import "MacroDef_Cor.h"
#import "JobsLoadingImage.h"

#import "NSObject+CurrentDevice.h"
#import "NSObject+RichText.h"
#import "UITextField+Extend.h"
#import "UITextField+Placeholder.h" /// 修改UITextField.Placeholder

@interface ZYTextField : UITextField <UITextFieldProtocol>

//@property(nonatomic,strong)UIColor *placeholderColor;
//@property(nonatomic,strong)UIFont *placeholderFont;

@property(nonatomic,assign)CGFloat ZYTextFieldCornerRadius;
@property(nonatomic,assign)CGFloat ZYTextFieldBorderWidth;
@property(nonatomic,assign,nullable)UIColor *ZYTextFieldBorderColor;
@property(nonatomic,assign)BOOL ZYTextFieldMasksToBounds;

@end

NS_INLINE __kindof ZYTextField *_Nonnull jobsMakeZYTextField(jobsByZYTextFieldBlock _Nonnull block){
    ZYTextField *data = ZYTextField.alloc.init;
    if (block) block(data);
    return data;
}
/**
 过滤字符请结合RAC，是目前的最优解
 
 @jobs_weakify(self)
 [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
//            @jobs_strongify(self)
     return YES;
 } subscribeNextBlock:^(NSString * _Nullable x) {
     @jobs_strongify(self)
     self.textField.text = x;
     [self textFieldBlock:self.textField
           textFieldValue:x];
 }];
*/

/** rightView
 -(ZYTextField *)textField{
     if (!_textField) {
         _textField = ZYTextField.new;
         _textField.delegate = self;
         _textField.textColor = JobsBlackColor;
         _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
         _textField.returnKeyType = UIReturnKeyDefault;
         _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
         _textField.keyboardType = UIKeyboardTypeDefault;
         _textField.rightView = self.titleLab;
         _textField.rightViewMode = UITextFieldViewModeAlways;
         _textField.placeholder = JobsInternationalization(@"打赏的Mata值");
         _textField.placeholderColor = JobsCor(@"#333333");
         _textField.placeholderFont = UIFontWeightRegularSize(12);

         _textField.drawPlaceholderInRect = CGRectMake(0, 0, JobsWidth(255 - 20 - 40 - 5), JobsWidth(32));
         _textField.rightViewRectForBounds = CGRectMake(JobsWidth(255 - 20 - 40), JobsWidth(10), JobsWidth(40), JobsWidth(12));
         _textField.placeholderRectForBounds = CGRectMake(JobsWidth(10), JobsWidth(10), JobsWidth(255 - 20 - 40 - 5), JobsWidth(12));
         _textField.textRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);
         _textField.editingRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);

         @jobs_weakify(self)
         [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
 //            @jobs_strongify(self)
             return YES;
         } subscribeNextBlock:^(NSString * _Nullable x) {
             @jobs_strongify(self)
             self.textField.text = x;
             [self textFieldBlock:self.textField
                   textFieldValue:x];
         }];
         _textField.cornerCutToCircleWithCornerRadius(JobsWidth(8));
         [self addSubview:_textField];
         [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(255), JobsWidth(32)));
             make.centerX.equalTo(self);
             make.top.equalTo(self.titleView.mas_bottom).offset(JobsWidth(10));
         }];
     }return _textField;
 }
 */

/**
 只有 leftView，右边什么也没有
 -(ZYTextField *)textField{
     if (!_textField) {
         _textField = ZYTextField.new;
         _textField.delegate = self;
         _textField.textColor = JobsBlackColor;
         _textField.backgroundColor = JobsCor(@"#F9F9F9");
         _textField.returnKeyType = UIReturnKeyDefault;
         _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
         _textField.keyboardType = UIKeyboardTypeDefault;
         _textField.leftView = [UIImageView.alloc initWithImage:self.viewModel.image];
         _textField.leftViewMode = UITextFieldViewModeAlways;
         _textField.placeholder = self.viewModel.textModel.text;
         _textField.font = UIFontWeightRegularSize(14);
         _textField.placeholderFont = _textField.font;
         _textField.placeholderColor = JobsGrayColor;
         CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
         CGFloat placeholderY = (JobsWidth(28) - placeholderHeight) / 2;
         _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(52), placeholderY, MSInputStyle1View.viewSizeByModel(nil).width - JobsWidth(32), JobsWidth(28));// OK
         _textField.editingRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle1View.viewSizeByModel(nil).width - JobsWidth(32 + 12), JobsWidth(28));
         _textField.textRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), 100);
         @jobs_weakify(self)
         [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
 //            @jobs_strongify(self)
             return YES;
         } subscribeNextBlock:^(NSString * _Nullable x) {
             @jobs_strongify(self)
             [self textFieldBlock:self->_textField
                   textFieldValue:x];
         }];
         [self addSubview:_textField];
         [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(MSInputStyle1View.viewSizeByModel(nil).width - JobsWidth(32 + 12), JobsWidth(28)));
             make.centerY.equalTo(self);
             make.left.equalTo(self).offset(JobsWidth(12));
         }];
     }return _textField;
 }
只有leftView，右边有个获取验证码
 -(ZYTextField *)textField{
     if (!_textField) {
         _textField = ZYTextField.new;
         _textField.delegate = self;
         _textField.textColor = JobsBlackColor;
         _textField.backgroundColor = JobsCor(@"#F9F9F9");
         _textField.returnKeyType = UIReturnKeyDefault;
         _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
         _textField.keyboardType = UIKeyboardTypeDefault;
         _textField.leftView = [UIImageView.alloc initWithImage:self.viewModel.image];
         _textField.leftViewMode = UITextFieldViewModeAlways;
         _textField.placeholder = self.viewModel.textModel.text;
         _textField.font = UIFontWeightRegularSize(14);
         _textField.placeholderFont = _textField.font;
         _textField.placeholderColor = JobsGrayColor;
         CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
         CGFloat placeholderY = (JobsWidth(28) - placeholderHeight) / 2;
         _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(52), placeholderY, MSInputStyle3ViewviewSizeByModel(nil).width - JobsWidth(32 + 100), JobsWidth(28));// OK
         _textField.editingRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), JobsWidth(28));
         _textField.textRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), 100);
         @jobs_weakify(self)
         [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
 //            @jobs_strongify(self)
             return YES;
         } subscribeNextBlock:^(NSString * _Nullable x) {
             @jobs_strongify(self)
             [self textFieldBlock:self->_textField
                   textFieldValue:x];
         }];
         [self addSubview:_textField];
         [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), JobsWidth(28)));
             make.centerY.equalTo(self);
             make.left.equalTo(self).offset(JobsWidth(12));
         }];
     }return _textField;
 }
 /// 搜索框，leftView 和 rightView都存在
 _searchBtn.size = CGSizeMake(JobsWidth(60), JobsWidth(32));

 -(ZYTextField *)textField{
     if (!_textField) {
         _textField = ZYTextField.new;
         _textField.delegate = self;
         _textField.backgroundColor = RGBA_COLOR(245, 245, 245, 1);
         _textField.returnKeyType = UIReturnKeyDefault;
         _textField.keyboardAppearance = UIKeyboardAppearanceDefault;
         _textField.keyboardType = UIKeyboardTypeDefault;
         _textField.leftView = [UIImageView.alloc initWithImage:JobsIMG(@"新首页的搜索放大镜")];
         _textField.leftViewMode = UITextFieldViewModeAlways;
         _textField.rightView = self.searchBtn;
         _textField.rightViewMode = UITextFieldViewModeAlways;
         _textField.placeholder = JobsInternationalization(@"搜索关键词");
         _textField.placeholderFont = UIFontWeightRegularSize(14);
         _textField.placeholderColor = JobsGrayColor;
         _textField.size = CGSizeMake(JobsWidth(220 - 80 - 12), JobsWidth(28));
         
         CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
         CGFloat placeholderY = (_textField.size.height - placeholderHeight) / 2;
         CGFloat rightViewY = (_textField.size.height - self.searchBtn.size.height) / 2;
         
         _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(32),// leftView的宽
                                                       placeholderY,// 垂直居中
                                                       MSSearchView.viewSizeByModel(nil).width - JobsWidth(32 + 52),// 52是self.searchBtn的宽
                                                       JobsWidth(28));//
         _textField.editingRectForBounds = CGRectMake(JobsWidth(32),
                                                      0,
                                                      MSSearchView viewSizeByModel(nil).width - JobsWidth(32 + 22 + 5) - self.searchBtn.size.width,// 5 是右边与self.searchBtn的距离
                                                      JobsWidth(28));
         _textField.textRectForBounds = CGRectMake(JobsWidth(32),
                                                   0,
                                                   MSSearchView.viewSizeByModel(nil).width - JobsWidth(32 + 22 + 5),// 5 是右边与self.searchBtn的距离
                                                   100);// 100 这个值写死，不用管
         _textField.rightViewRectForBounds = CGRectMake(JobsWidth(MSSearchView.viewSizeByModel(nil).width - self.searchBtn.size.width),
                                                        rightViewY,
                                                        self.searchBtn.size.width,
                                                        self.searchBtn.size.height);
         @jobs_weakify(self)
         [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
 //            @jobs_strongify(self)
             return YES;
         } subscribeNextBlock:^(NSString * _Nullable x) {
             @jobs_strongify(self)
             [self textFieldBlock:self->_textField
                   textFieldValue:x];
         }];
         [self addSubview:_textField];
         [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(_textField.size);
             make.right.equalTo(self).offset(JobsWidth(-12));
             make.centerY.equalTo(self);
             make.left.equalTo(self).offset(JobsWidth(12));
         }];
     }return _textField;
 }
 */
