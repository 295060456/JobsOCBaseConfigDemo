//
//  JobsAppDoorInputViewBaseStyle_8.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle_8.h"

@interface JobsAppDoorInputViewBaseStyle_8 ()
/// UI
@property(nonatomic,strong)BaseButton *securityModelBtn;
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UILabel *titleLab;
/// Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_8

-(instancetype)init{
    if (self = [super init]) {

    }return self;
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.backgroundColor = JobsClearColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor4;
        }));
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    if (isValue(self.doorInputViewBaseStyleModel.inputStr)) {
        _textField.text = self.doorInputViewBaseStyleModel.inputStr;
    }
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.background = self.doorInputViewBaseStyleModel.background;
    _textField.backgroundColor = self.doorInputViewBaseStyleModel.backgroundColor;
    _textField.disabledBackground = self.doorInputViewBaseStyleModel.disabledBackground;
    _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.background = self.doorInputViewBaseStyleModel.background;
    _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.requestParams = self.textFieldInputModel;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(ZYTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;

    textField.requestParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(50));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        
        self.titleLab.alpha = 1;
        self.securityModelBtn.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)textFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModelBtn{
    if (!_securityModelBtn) {
        @jobs_weakify(self)
        _securityModelBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                x.selected = !x.selected;
                x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image);
                self.textField.secureTextEntry = x.selected;
                if (x.selected && !self.textField.isEditing) {
                    self.textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
                }
        }).onLongPressGesture(^(id data){
            NSLog(@"");
        });
        [self addSubview:_securityModelBtn];
        [_securityModelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(self);
            make.width.mas_equalTo(40);
            make.bottom.equalTo(self.titleLab.mas_top);
        }];
    }return _securityModelBtn;
}

-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.returnBoolByIDBlock ? self.returnBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(NSString *_Nullable x) {
            @jobs_strongify(self)
            NSLog(@"输入的字符为 = %@",x);
            self.securityModelBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
            if (x.isContainsSpecialSymbolsString(nil)) {
                self.jobsToastMsg(JobsInternationalization(@"Do not enter special characters"));
            }else{
                NSLog(@"输入的字符为 = %@",x);
                [self block:self->_textField
                      value:x];
            }
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }return _textField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.font = UIFontWeightRegularSize(JobsWidth(11));
            label.text = self.doorInputViewBaseStyleModel.textModel.text;
            label.textColor = self.doorInputViewBaseStyleModel.textModel.textCor;
            self.addSubview(label);
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.bottom.equalTo(self);
                make.top.equalTo(self.textField.mas_bottom);
            }];
        });
    }return _titleLab;
}

@end
