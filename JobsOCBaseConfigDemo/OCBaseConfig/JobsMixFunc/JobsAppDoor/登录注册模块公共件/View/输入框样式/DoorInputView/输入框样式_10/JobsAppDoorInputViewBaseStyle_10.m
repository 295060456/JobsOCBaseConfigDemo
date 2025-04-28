//
//  JobsAppDoorInputViewBaseStyle_10.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "JobsAppDoorInputViewBaseStyle_10.h"

@interface JobsAppDoorInputViewBaseStyle_10 ()
/// UI
Prop_strong()UILabel *titleLab;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
Prop_strong()ButtonTimerConfigModel *btnTimerConfigModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_10
@synthesize thisViewSize = _thisViewSize;
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
        self.titleStr_1 = JobsInternationalization(@"請輸入金額");
        self.titleStr_2 = JobsInternationalization(@"全部金額");
        
    }return self;
}

-(instancetype)init{
    if (self = [super init]) {
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.viewModel = (UIViewModel *)self.requestParams;
        }
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self setBorderWithColor:HEXCOLOR(0xEAEBED)
                 borderWidth:JobsWidth(2)
                  borderType:UIBorderSideTypeBottom];
    /// 因为是子控件，所以要防止约束使用中间过程值，避免代码冗余，这里固定写死
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    self.zyTextField.leftView = UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG);
    self.zyTextField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    self.zyTextField.placeholder = isNull(self.doorInputViewBaseStyleModel.placeholder) ? self.titleStr_1 : self.doorInputViewBaseStyleModel.placeholder;
    self.zyTextField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    self.zyTextField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    self.zyTextField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    self.zyTextField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    self.zyTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.zyTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.zyTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.zyTextField.requestParams = self.textFieldInputModel;
    self.zyTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.zyTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.zyTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(0);
    self.zyTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.zyTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(0);
    self.zyTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(0);
}

-(void)block:(ZYTextField *)textField value:(NSString *)value{
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
        return CGSizeMake(JobsWidth(303), JobsWidth(36));
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.userInteractionEnabled = YES;
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.titleLab.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return self.zyTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.zyTextField.text;
}
#pragma mark —— lazyLoad
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = ZYTextField.new;
        _zyTextField.delegate = self;
        @jobs_weakify(self)
        [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(id _Nullable x) {
            @jobs_strongify(self)
            [self block:self->_zyTextField value:x];
        }];
        [self.addSubview(_zyTextField) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.bottom.equalTo(self);
            make.size.mas_equalTo(inputSize_02());
        }];
    }return _zyTextField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = isNull(self.doorInputViewBaseStyleModel.textModel.text) ? self.titleStr_2 : self.doorInputViewBaseStyleModel.textModel.text;
            label.textColor = self.viewModel.textModel.textCor ? : HEXCOLOR(0xAE8330);
            label.font = self.viewModel.textModel.font ? : JobsFontMedium(JobsWidth(12));
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self);
                make.centerY.equalTo(self.textField);
            }];label.makeLabelByShowingType(UILabelShowingType_03);
        });
    }return _titleLab;
}

@end
