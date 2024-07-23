//
//  JobsAppDoorInputViewBaseStyle_9.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/11.
//

#import "JobsAppDoorInputViewBaseStyle_9.h"

@interface JobsAppDoorInputViewBaseStyle_9 ()
/// UI
@property(nonatomic,strong)UIButton *countDownBtn;
@property(nonatomic,strong)ZYTextField *textField;
/// Data
@property(nonatomic,strong)NSString *titleStr_1;
@property(nonatomic,strong)NSString *titleStr_2;
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;
//@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richLabelDataStringsMutArr;

@end

@implementation JobsAppDoorInputViewBaseStyle_9

@synthesize thisViewSize = _thisViewSize;
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
        self.titleStr_1 = JobsInternationalization(@"点击");
        self.titleStr_2 = JobsInternationalization(@"发送验证码");
        [self layerBorderCor:JobsWhiteColor andBorderWidth:1];
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    /// 因为是子控件，所以要防止约束使用中间过程值，避免代码冗余，这里固定写死
    self.countDownBtn.width = self.countDownBtnWidth ? : JobsWidth(80);
    self.textField.width = self.textFieldWidth ? : JobsWidth(220);
}
#pragma mark —— 一些私有方法
-(void)configTextField{
    _textField.leftView = [UIImageView.alloc initWithImage:self.doorInputViewBaseStyleModel.leftViewIMG];
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
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
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39);
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(ZYTextField *)textField
       value:(NSString *)value{
    
    self.textFieldInputModel.resString = value;
    self.textFieldInputModel.PlaceHolder = self.doorInputViewBaseStyleModel.placeHolderStr;
    textField.requestParams = self.textFieldInputModel;
    
    if (self.objectBlock) self.objectBlock(textField);// 对外统一传出TF
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
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return inputSize();
}

-(void)richElementsInViewWithModel:(JobsAppDoorInputViewBaseStyleModel *_Nullable)doorInputViewBaseStyleModel{
    self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel;
    self.countDownBtn.alpha = 1;
    self.textField.alpha = 1;
    [self configTextField];
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)getTextFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(ButtonTimerConfigModel *)btnTimerConfigModel{
    if (!_btnTimerConfigModel) {
        _btnTimerConfigModel = ButtonTimerConfigModel.new;
        
        /// 一些通用的设置
        _btnTimerConfigModel.count = 50;
        _btnTimerConfigModel.showTimeType = ShowTimeType_SS;// 时间显示风格
        _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
        _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;//
        _btnTimerConfigModel.labelShowingType = UILabelShowingType_01;//【换行模式】
        
        /// 计时器未开始【静态值】
        _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 1;
        _btnTimerConfigModel.readyPlayValue.layerCornerRadius = JobsWidth(18);
        _btnTimerConfigModel.readyPlayValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.readyPlayValue.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
        _btnTimerConfigModel.readyPlayValue.text = Title9;
        _btnTimerConfigModel.readyPlayValue.font = [UIFont systemFontOfSize:JobsWidth(14)
                                                                               weight:UIFontWeightMedium];
        /// 计时器进行中【动态值】
        _btnTimerConfigModel.runningValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.runningValue.text = JobsInternationalization(Title12);
        _btnTimerConfigModel.runningValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.runningValue.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
        _btnTimerConfigModel.runningValue.font = [UIFont systemFontOfSize:JobsWidth(14)
                                                                               weight:UIFontWeightMedium];
    
        /// 计时器结束【静态值】
        _btnTimerConfigModel.endValue.bgCor = JobsClearColor;
        
    }return _btnTimerConfigModel;
}

-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel
                            longPressGestureEventBlock:nil
                                       clickEventBlock:nil];
        [_countDownBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            [x startTimer];//选择时机、触发启动
//            NSLog(@"SSSSS = 获取验证码");
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];

        [_countDownBtn actionObjectBlock:^(id data) {
//            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                TimerProcessModel *model = (TimerProcessModel *)data;
                NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
            }
        }];

        [self addSubview:_countDownBtn];
        [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-JobsWidth(120));
            make.top.equalTo(self).offset(JobsWidth(8));
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            make.width.mas_equalTo(self.countDownBtnWidth);
        }];
        
    }return _countDownBtn;
}

//-(NSMutableArray<RichTextConfig *> *)richLabelDataStringsMutArr{
//    if (!_richLabelDataStringsMutArr) {
//        _richLabelDataStringsMutArr = NSMutableArray.array;
//
//        RichTextConfig *config_01 = RichTextConfig.new;
//        config_01.font = [UIFont systemFontOfSize:JobsWidth(14) weight:UIFontWeightMedium];
//        config_01.cor = JobsBlueColor;
//        config_01.targetString = self.titleStr_1;
//
//        RichTextConfig *config_02 = RichTextConfig.new;
//        config_02.font = [UIFont systemFontOfSize:JobsWidth(12) weight:UIFontWeightMedium];
//        config_02.cor = JobsRedColor;
//        config_02.targetString = self.titleStr_2;
//
//        [_richLabelDataStringsMutArr addObject:config_01];
//        [_richLabelDataStringsMutArr addObject:config_02];
//
//    }return _richLabelDataStringsMutArr;
//}

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
            NSLog(@"MMM = %@",x);
            [self block:self->_textField
                  value:x];
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
//            make.right.equalTo(self.countDownBtn.mas_left);
        }];
    }return _textField;
}
@end
