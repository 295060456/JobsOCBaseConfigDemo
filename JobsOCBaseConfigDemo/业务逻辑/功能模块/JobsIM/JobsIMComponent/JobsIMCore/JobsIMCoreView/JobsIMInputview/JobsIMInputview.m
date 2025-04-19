//
//  JobsIMInputview.m
//  JobsIM
//
//  Created by Jobs on 2020/11/10.
//

#import "JobsIMInputview.h"

@interface JobsIMInputview ()
/// UI
Prop_strong()UIImageView *imgView;
Prop_strong()JobsAdNoticeView *adNoticeView;
Prop_strong()BaseButton *sendBtn;
/// Data

@end

@implementation JobsIMInputview

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = JobsWhiteColor;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.sendBtn.alpha = 1;
        self.inputTextField.alpha = 1;
    };
}
/// 一些变化的UI
-(jobsByStringBlock _Nonnull)someChangeUIBy{
    @jobs_weakify(self)
    return ^(NSString *_Nullable string){
        @jobs_strongify(self)
        if (isValue(string)) {
            self.sendBtn.userInteractionEnabled = YES;
            self.sendBtn.enabled = YES;
            self.imgView.image = JobsIMG(@"输入框有值");
        }else{
            self.sendBtn.userInteractionEnabled = NO;
            self.sendBtn.enabled = NO;
            self.imgView.image = JobsIMG(@"输入框无值");
        }
    };
}
#pragma mark —— UITextFieldDelegate
/// 告诉委托人对指定的文本字段停止编辑
- (void)textFieldDidEndEditing:(ZYTextField *)textField{
    [textField isEmptyText];
}
/// 询问委托人文本字段是否应处理按下返回按钮
- (BOOL)textFieldShouldReturn:(ZYTextField *)textField{
    [self endEditing:YES];
    if (self.objBlock) self.objBlock(textField);
    return YES;
}
#pragma mark —— lazyLoad
-(BaseButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnBgImage(JobsCyanColor.image)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(JobsInternationalization(@"发送"))
            .jobsResetBtnCornerRadiusValue(JobsWidth(3))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                x.jobsResetBtnBgImage(JobsLightGrayColor.image);
                if (self.objBlock) self.objBlock(x);
                [self endEditing:YES];
                if (isValue(self.inputTextField.text)) {
                    self.playSoundEffect(@"Sound.wav");
                    if (self.objBlock) self.objBlock(self.inputTextField);
                }
                self.inputTextField.text = JobsInternationalization(@"");
                x.enabled = NO;
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        _sendBtn.userInteractionEnabled = NO;
        _sendBtn.enabled = NO;
        [_sendBtn setTitleColor:JobsWhiteColor forState:UIControlStateDisabled];
        [self addSubview:_sendBtn];
        [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(11);
            make.bottom.equalTo(self).offset(-11);
            make.right.equalTo(self).offset(-10);
            make.width.mas_equalTo(50);
        }];
    }return _sendBtn;
}

-(ZYTextField *)inputTextField{
    if (!_inputTextField) {
        @jobs_weakify(self)
        _inputTextField = jobsMakeZYTextField(^(ZYTextField * _Nullable textField) {
            @jobs_strongify(self)
            textField.placeHolderAlignment = NSTextAlignmentCenter;
            textField.placeholder = JobsInternationalization(@"在此输入需要发送的信息");
            textField.delegate = self;
            textField.leftView = self.imgView;
            textField.leftViewOffsetX = 20;
            textField.font = UIFontWeightMediumSize(12);
            textField.leftViewMode = UITextFieldViewModeAlways;
            textField.backgroundColor = HEXCOLOR(0xF4F4F4);
            textField.keyboardAppearance = UIKeyboardAppearanceAlert;
            textField.autocorrectionType = UITextAutocorrectionTypeNo;//自动纠错属性默认是yes，就会触发那个监听
            textField.inputAccessoryView = self.adNoticeView;
            textField.returnKeyType = UIReturnKeySend;
            [self addSubview:textField];
            [textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self.sendBtn);
                make.right.equalTo(self.sendBtn.mas_left).offset(-10);
                make.left.equalTo(self).offset(10);
            }];self.refresh();
            textField.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                @jobs_strongify(self)
                model.jobsWidth = .5f;
                model.layerCor = JobsWhiteColor;
                model.cornerRadiusValue = self->_inputTextField.mj_h / 2;
            }));
        });
        [[_inputTextField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
            return YES;
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"输入的字符为 = %@",x);
            self.someChangeUIBy(x);
        }];
    }return _inputTextField;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.image = JobsIMG(@"输入框无值");
        });
    }return _imgView;
}

-(JobsAdNoticeView *)adNoticeView{
    if (!_adNoticeView) {
        _adNoticeView = JobsAdNoticeView.new;
        _adNoticeView.sizer = JobsAdNoticeView.viewSizeByModel(nil);
        _adNoticeView.jobsRichViewByModel(nil);
    }return _adNoticeView;
}

@end
