//
//  JobsAppDoorInputViewBaseStyle_3.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle_3.h"

@interface JobsAppDoorInputViewBaseStyle_3 ()
/// UI
Prop_strong()UIButton *securityModeBtn;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_3
@synthesize thisViewSize = _thisViewSize;
- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor3;
        }));
    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor3;
        }));
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
        self.magicTextField.text = self.doorInputViewBaseStyleModel.inputStr;
    }
    self.magicTextField.background = self.doorInputViewBaseStyleModel.background;
    self.magicTextField.backgroundColor = self.doorInputViewBaseStyleModel.backgroundColor;
    self.magicTextField.disabledBackground = self.doorInputViewBaseStyleModel.disabledBackground;
    self.magicTextField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    self.magicTextField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    self.magicTextField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    self.magicTextField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    self.magicTextField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    self.magicTextField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    self.magicTextField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    self.magicTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.magicTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.magicTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.magicTextField.text_offset = self.doorInputViewBaseStyleModel.offset;
    self.magicTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.magicTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.magicTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    self.magicTextField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    self.magicTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.magicTextField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    self.magicTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    self.magicTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
    
    self.textFieldInputModel.PlaceHolder = self.magicTextField.placeholder;
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{

    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;

    textField.requestParams = self.textFieldInputModel;
    
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(30));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable data) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = data ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;/// ❎
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

-(UIButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— UITextFieldDelegate
/// 获得焦点成为第一响应者，此时 textField.isEditing == YES
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
#pragma mark —— lazyLoad
-(UIButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = UIButton.jobsInit()
        .selectedStateImageBy(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image)
        .jobsResetBtnImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            self.textField.secureTextEntry = !x.selected;
            if (x.selected && !self.textField.isEditing) {
                self.textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
            }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        [self.addSubview(_securityModeBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(JobsWidth(40));
        }];
    }return _securityModeBtn;
}
@synthesize magicTextField = _magicTextField;
-(JobsMagicTextField *)magicTextField{
    if (!_magicTextField) {
        @jobs_weakify(self)
        _magicTextField = jobsMakeMagicTextField(^(__kindof JobsMagicTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.delegate = self;
            textField.secureTextEntry = self.doorInputViewBaseStyleModel.isShowSecurityBtn;
            [textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
                JobsLog(@"SSS = %@",self.textFieldInputModel.PlaceHolder);
                @jobs_strongify(self)
                return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
            } subscribeNextBlock:^(NSString *_Nullable x) {
                @jobs_strongify(self)
                JobsLog(@"输入的字符为 = %@",x);
                self.securityModeBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
                if (x.isContainsSpecialSymbolsString(nil)) {
                    self.jobsToastMsg(JobsInternationalization(@"Do not enter special characters"));
                }else{
                    [self block:textField value:x];
                }
            }];
            [self.addSubview(textField) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.bottom.equalTo(self);
                if (self.doorInputViewBaseStyleModel.isShowSecurityBtn) {
                    make.right.equalTo(self.securityModeBtn.mas_left);
                }else{
                    make.right.equalTo(self);
                }
            }];
        });
    }return _magicTextField;
}

@end
