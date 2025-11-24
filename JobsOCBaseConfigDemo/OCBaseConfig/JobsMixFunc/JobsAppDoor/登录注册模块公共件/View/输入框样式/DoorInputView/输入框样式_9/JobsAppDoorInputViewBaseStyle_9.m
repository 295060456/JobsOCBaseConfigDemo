//
//  JobsAppDoorInputViewBaseStyle_9.m
//  BaiShaEntertainmentProj
//
//  Created by Jobs on 2022/5/11.
//

#import "JobsAppDoorInputViewBaseStyle_9.h"

@interface JobsAppDoorInputViewBaseStyle_9 ()
/// UI
Prop_strong()UIButton <TimerProtocol>*countDownBtn;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

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
    self.zyTextField.leftView = UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG);
    self.zyTextField.leftViewMode = self.doorInputViewBaseStyleModel.leftViewMode;
    self.zyTextField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
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
    self.zyTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17);
    self.zyTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft;
    self.zyTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39);
    self.zyTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}

-(void)block:(ZYTextField *)textField value:(NSString *)value{
    
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
    return self.zyTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.zyTextField.text;
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
            make.width.mas_equalTo(self.countDownBtnWidth);
        }];
    }return _countDownBtn;
}
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
            JobsLog(@"MMM = %@",x);
            [self block:self->_zyTextField value:x];
        }];
        [self.addSubview(_zyTextField) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
//            make.right.equalTo(self.countDownBtn.mas_left);
        }];
    }return _zyTextField;
}

@end
