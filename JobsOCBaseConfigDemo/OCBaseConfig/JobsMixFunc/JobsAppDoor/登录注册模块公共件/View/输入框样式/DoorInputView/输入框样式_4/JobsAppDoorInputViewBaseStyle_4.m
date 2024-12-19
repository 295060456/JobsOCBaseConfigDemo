//
//  JobsAppDoorInputViewBaseStyle_4.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/4.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorInputViewBaseStyle_4.h"

@interface JobsAppDoorInputViewBaseStyle_4 ()
/// UI
@property(nonatomic,strong)ImageCodeView *imageCodeView;
@property(nonatomic,strong)JobsMagicTextField *textField;
/// Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_4
@synthesize thisViewSize = _thisViewSize;
- (instancetype)init{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = JobsWhiteColor;
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
            data.layerCor = JobsWhiteColor;
        }));
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.requestParams = self.textFieldInputModel;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    _textField.animationColor = self.doorInputViewBaseStyleModel.animationColor ? : Cor3;
    _textField.moveDistance = self.doorInputViewBaseStyleModel.moveDistance ? : JobsWidth(35);
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(20);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(JobsMagicTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeholder;

    textField.requestParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(345), JobsWidth(30));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable data) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = data;
        self.imageCodeView.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(void)changeTextFieldAnimationColor:(BOOL)toRegisterBtnSelected{
    self.textField.animationColor = toRegisterBtnSelected ? Cor3 : Cor3;
}

-(JobsMagicTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)textFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(ImageCodeView *)imageCodeView{
    if (!_imageCodeView) {
        _imageCodeView = ImageCodeView.new;
        _imageCodeView.font = JobsFontRegular(16);
        _imageCodeView.alpha = 0.7;
        _imageCodeView.bgColor = JobsWhiteColor;
        [self addSubview:_imageCodeView];
        [_imageCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(JobsWidth(5));
            make.bottom.equalTo(self).offset(-JobsWidth(5));
            make.right.equalTo(self).offset(-JobsWidth(10));
            make.width.mas_equalTo(80);
        }];
        [self layoutIfNeeded];
        _imageCodeView.cornerCutToCircleWithCornerRadius(JobsWidth(20));
    }return _imageCodeView;
}

-(JobsMagicTextField *)textField{
    if (!_textField) {
        _textField = JobsMagicTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.returnBoolByIDBlock ? self.returnBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(id _Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"MMM = %@",x);
            [self block:self->_textField
                  value:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.right.equalTo(self.imageCodeView.mas_left);
        }];
    }return _textField;
}

@end
