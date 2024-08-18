//
//  JobsAppDoorInputViewBaseStyle_10.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/15.
//

#import "JobsAppDoorInputViewBaseStyle_10.h"

@interface JobsAppDoorInputViewBaseStyle_10 ()
//UI
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)UILabel *titleLab;
//Data
@property(nonatomic,strong)NSString *titleStr_1;
@property(nonatomic,strong)NSString *titleStr_2;
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;
//@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*richLabelDataStringsMutArr;

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
//        [self layerBorderCor:JobsWhiteColor andBorderWidth:1];
        
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
    _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr.nullString ? self.titleStr_1 : self.doorInputViewBaseStyleModel.placeHolderStr;
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.returnKeyType = self.doorInputViewBaseStyleModel.returnKeyType;
    _textField.keyboardAppearance = self.doorInputViewBaseStyleModel.keyboardAppearance;
    _textField.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.requestParams = self.textFieldInputModel;
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(0);
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(0);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(0);
}

-(void)block:(ZYTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
    textField.requestParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(303), JobsWidth(36));
}

-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        self.titleLab.alpha = 1;
        self.textField.alpha = 1;
        [self configTextField];
        self.userInteractionEnabled = YES;
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)getTextFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.returnBoolByIDBlock ? self.returnBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(id _Nullable x) {
            @jobs_strongify(self)
            [self block:self->_textField
                  value:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.bottom.equalTo(self);
            make.size.mas_equalTo(inputSize_02());
        }];
    }return _textField;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = self.doorInputViewBaseStyleModel.textModel.text.nullString ? self.titleStr_2 : self.doorInputViewBaseStyleModel.textModel.text;
        _titleLab.textColor = self.viewModel.textModel.textCor ? : HEXCOLOR(0xAE8330);
        _titleLab.font = self.viewModel.textModel.font ? : [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightMedium];
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.centerY.equalTo(self.textField);
        }];
        _titleLab.makeLabelByShowingType(UILabelShowingType_03);
    }return _titleLab;
}

@end
