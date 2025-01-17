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
@property(nonatomic,copy)NSString *titleStr_1;
@property(nonatomic,copy)NSString *titleStr_2;
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

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
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.layerCor = JobsWhiteColor;
            data.cornerRadiusValue = 1;
        }));
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
    _textField.leftView = UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG);
    _textField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
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
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return inputSize();
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
-(ZYTextField *_Nullable)getTextField{
    return _textField;
}

-(NSString *_Nullable)textFieldValue{
    return _textField.text;
}
#pragma mark —— lazyLoad
-(UIButton *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = UIButton.initByConfig(jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
            /// 一些通用的设置
            data.count = 50;
            data.showTimeType = ShowTimeType_SS;// 时间显示风格
            data.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
            data.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;//
            data.labelShowingType = UILabelShowingType_01;//【换行模式】
            /// 计时器未开始【静态值】
            data.readyPlayValue.layerBorderWidth = 1;
            data.readyPlayValue.layerCornerRadius = JobsWidth(18);
            data.readyPlayValue.bgCor = JobsClearColor;
            data.readyPlayValue.layerBorderCor = JobsClearColor;
            data.readyPlayValue.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
            data.readyPlayValue.text = Title9;
            data.readyPlayValue.font = UIFontWeightMediumSize(JobsWidth(14));
            /// 计时器进行中【动态值】
            data.runningValue.bgCor = JobsClearColor;
            data.runningValue.text = JobsInternationalization(Title12);
            data.runningValue.layerBorderCor = JobsClearColor;
            data.runningValue.textCor = HEXCOLOR_ALPHA(0xAE8330, 1);
            data.runningValue.font = UIFontWeightMediumSize(JobsWidth(14));
            /// 计时器结束【静态值】
            data.endValue.bgCor = JobsClearColor;
        })).onClickBy(^(__kindof UIButton *x){
            @jobs_strongify(self)
            x.startTimer();//选择时机、触发启动
//            JobsLog(@"SSSSS = 获取验证码");
            if (self.objBlock) self.objBlock(x);
        }).heartBeatBy(^(id _Nullable data){
            if ([data isKindOfClass:UIButtonModel.class]) {
                UIButtonModel *model = (UIButtonModel *)data;
                JobsLog(@"❤️❤️❤️❤️❤️%f",model.timerManager.anticlockwiseTime);
            }
        });[self addSubview:_countDownBtn];
        [_countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-JobsWidth(120));
            make.top.equalTo(self).offset(JobsWidth(8));
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            make.width.mas_equalTo(self.countDownBtnWidth);
        }];
    }return _countDownBtn;
}

-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(id _Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"MMM = %@",x);
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
