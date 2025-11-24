//
//  JobsAppDoorInputViewBaseStyle_1.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle_1.h"

@interface JobsAppDoorInputViewBaseStyle_1 ()
/// UI
Prop_strong()UIButton <TimerProtocol>*countDownBtn;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_1
@synthesize thisViewSize = _thisViewSize;
- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setting();
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
        self.setting();
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.countDownBtn.width = self.countDownBtnWidth ? : JobsWidth(80);
    self.textField.width = self.textFieldWidth ? : JobsWidth(180);
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)setting{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.titleStr_1 = JobsInternationalization(@"点击");
        self.titleStr_2 = JobsInternationalization(@"发送验证码");
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.layerCor = JobsWhiteColor;
            data.jobsWidth = 1;
        }));
    };
}

-(void)configTextField{
    _magicTextField.leftView = UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG);
    _magicTextField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _magicTextField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    _magicTextField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _magicTextField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _magicTextField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _magicTextField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _magicTextField.requestParams = self.textFieldInputModel;
    _magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _magicTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? :  JobsWidth(17);
    _magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    _magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _magicTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39);
    _magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    _magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;
    textField.requestParams = self.textFieldInputModel;
    
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
/// 倒计时按钮（需要销毁定时器）
-(UIButton *)getCountDownBtn{
    return self.countDownBtn;
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(30));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel;
        self.countDownBtn.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    self.magicTextField.animationColor = toRegisterBtnSelected ? Cor3 : Cor3;
}

-(JobsMagicTextField *_Nullable)getTextField{
    return self.magicTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.magicTextField.text;
}
#pragma mark —— lazyLoad
-(UIButton<TimerProtocol> *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = (UIButton<TimerProtocol> *)UIButton.jobsInit()
            .onClickBy(^(__kindof UIButton *x){
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(x);
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        }).byOnTick(^(CGFloat time) {
            // 每 tick 一次
            NSLog(@"剩余: %.0f", time);
        })
        .byOnFinish(^ (JobsTimer * _Nullable timer) {
            // 倒计时完成
            NSLog(@"倒计时结束");
        });
        [self.addSubview(_countDownBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-JobsWidth(120));
            make.top.equalTo(self).offset(JobsWidth(8));
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            make.width.mas_equalTo(JobsWidth(80));
        }];
    }return _countDownBtn;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.delegate = self;
            [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(id _Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"MMM = %@",x);
                [self block:textField value:x];
            }];
            [self.addSubview(textField) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.bottom.equalTo(self);
    //            make.right.equalTo(self.countDownBtn.mas_left);
            }];
        });
    }return _magicTextField;
}

@end
