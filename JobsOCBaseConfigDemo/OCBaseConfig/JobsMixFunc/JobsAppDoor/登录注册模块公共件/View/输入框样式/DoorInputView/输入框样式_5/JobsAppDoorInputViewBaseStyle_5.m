//
//  JobsAppDoorInputViewBaseStyle_5.m
//  DouDong-II
//
//  Created by Jobs on 2020/12/17.
//

#import "JobsAppDoorInputViewBaseStyle_5.h"

@interface JobsAppDoorInputViewBaseStyle_5 (){
    JobsDropDownListView *dropDownListView;
}
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UIButton *authCodeBtn;
Prop_strong()BaseButton *securityModeBtn;
Prop_strong()BaseButton *chooseBtn;
/// Data
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
Prop_copy()NSMutableArray <UIViewModel *>*jobsPageViewDataMutArr;
Prop_assign()CGSize chooseBtnSize;
Prop_strong()UIViewModel *chooseBtnViewModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_5
@synthesize thisViewSize = _thisViewSize;
-(void)dealloc{
    _authCodeBtn.timerDestroy();
    dropDownListView.dropDownListViewDisappear(nil);
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.thisViewSize = thisViewSize;
    }return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    // 指定描边
    [self setBorderWithColor:RGBA_COLOR(162, 162, 162, 0.2f)
                 borderWidth:1
                  borderType:UIBorderSideTypeBottom];
}
#pragma mark —— 一些私有方法
-(void)registerNotification{
    @jobs_weakify(self)
    [self addNotificationName:@"关闭电话号码区号选择器"
                        block:^(id _Nullable weakSelf,
                                id _Nullable arg) {
        @jobs_strongify(self)
        NSNotification *notification = (NSNotification *)arg;
        if([notification.object isKindOfClass:NSNumber.class]){
            NSNumber *b = notification.object;
            JobsLog(@"SSS = %d",b.boolValue);
        }
        if (self.style_5 == InputViewStyle_5_3) {
            self->dropDownListView.dropDownListViewDisappear(self.chooseBtn);
        }
    }];
}

-(void)configTextField{
    self.zyTextField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    self.zyTextField.background = self.doorInputViewBaseStyleModel.background;
    self.zyTextField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    self.zyTextField.textColor = self.doorInputViewBaseStyleModel.ZYtextColor;
    self.zyTextField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    self.zyTextField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    self.zyTextField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    self.zyTextField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment;
    self.zyTextField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset;
    self.zyTextField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX;
    self.zyTextField.text_offset = self.doorInputViewBaseStyleModel.offset;
    self.zyTextField.requestParams = self.textFieldInputModel;
    self.zyTextField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    self.zyTextField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    self.zyTextField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(305), JobsWidth(14 + 36 + 4));
    };
}
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.doorInputViewBaseStyleModel = doorInputViewBaseStyleModel ? : JobsAppDoorInputViewBaseStyleModel.new;
        [self registerNotification];
#warning 这里需要被修改
    //    self.chooseBtnSize = CGSizeMake([UIView widthByData:self.chooseBtnViewModel] + JobsWidth(10), JobsWidth(16));
        if (self.doorInputViewBaseStyleModel) {
            self.titleLab.alpha = 1;
            switch (self.style_5) {
                /// 带发送验证码按钮
                case InputViewStyle_5_1:{
                    self.authCodeBtn.alpha = 1;
                }break;
                /// 没有额外的UI控件
                case InputViewStyle_5_2:{
                    
                }break;
                /// 电话号码区号选择器
                case InputViewStyle_5_3:{
                    self.chooseBtn.alpha = 1;
                    self.textField.alpha = 1;
                }break;
                default:
                    break;
            }
            self.textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;/// ❎
            [self configTextField];
        }
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    return self.zyTextField;
}

-(NSString *_Nullable)textFieldValue{
    return self.zyTextField.text;
}

-(BaseButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModeBtn{
    if (!_securityModeBtn) {
        _securityModeBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
            .onClickBy(^(UIButton *x){
                if (self.objBlock) self.objBlock(x);
                x.selected = !x.selected;
                if(x.selected){
                    x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image);
                }
                self.textField.secureTextEntry = x.selected;
                if (x.selected && !self.textField.isEditing) {
                    self.textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
                }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        [self addSubview:_securityModeBtn];
        [_securityModeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(JobsWidth(40));
        }];
    }return _securityModeBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
            [self.addSubview(label) mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self);
                make.left.equalTo(self);
            }];
        });
    }
    _titleLab.text = self.doorInputViewBaseStyleModel.titleLabStr;
    _titleLab.font = self.doorInputViewBaseStyleModel.titleStrFont;
    _titleLab.makeLabelByShowingType(UILabelShowingType_03);
    return _titleLab;
}

-(UIButton *)authCodeBtn{
    if (!_authCodeBtn) {
        _authCodeBtn = UIButton.initByConfig(jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
            /// 一些通用的设置
            data.jobsSize = CGSizeMake(JobsWidth(120), JobsWidth(25));
            data.count = 3;
            data.showTimeType = ShowTimeType_SS;//时间显示风格
            data.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
            data.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;// 文本显示类型
            data.labelShowingType = UILabelShowingType_03;
            data.secondStr = JobsInternationalization(@"S");
            /// 计时器未开始【静态值】
            data.readyPlayValue.layerBorderWidth = 1;
            data.readyPlayValue.layerCornerRadius = 0;
            data.readyPlayValue.bgCor = JobsClearColor;
            data.readyPlayValue.layerBorderCor = JobsClearColor;
            data.readyPlayValue.textCor = HEXCOLOR(0xAE8330);
            data.readyPlayValue.text = JobsInternationalization(@"獲取驗證碼");
            data.readyPlayValue.font = UIFontWeightBoldSize(14);
            /// 计时器进行中【动态值】
            data.runningValue.bgCor = JobsClearColor;
            data.runningValue.layerBorderCor = JobsClearColor;
            data.runningValue.textCor = HEXCOLOR(0xAE8330);
            data.runningValue.text = JobsInternationalization(@"");
            /// 计时器结束【静态值】
            data.endValue.bgCor = JobsClearColor;
            data.endValue.layerBorderCor = JobsClearColor;
            data.endValue.textCor = HEXCOLOR(0xAE8330);
            data.endValue.text = JobsInternationalization(@"重新获取验证码");
        })).onClickBy(^(__kindof UIButton *_Nullable x){
            x.startTimer();
        }).heartBeatBy(^(id _Nullable data){
            if ([data isKindOfClass:UIButtonModel.class]) {
                UIButtonModel *model = (UIButtonModel *)data;
                JobsLog(@"❤️❤️❤️❤️❤️%f",model.timerManager.anticlockwiseTime);
            }
        }).setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.layerCor = HEXCOLOR(0xAE8330);
            data.jobsWidth = 0.5f;
            data.cornerRadiusValue = 25 / 2;
        }));
        [self.addSubview(_authCodeBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-JobsWidth(16));
            make.bottom.equalTo(self.textField);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(120), JobsWidth(25)));
        }];self.refresh();
    }return _authCodeBtn;
}

-(BaseButton *)chooseBtn{
    if (!_chooseBtn) {
        @jobs_weakify(self)
        _chooseBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.buttonConfigurationTitleAlignment = UIButtonConfigurationTitleAlignmentAutomatic;
            data.textAlignment = NSTextAlignmentCenter;
            data.subTextAlignment = NSTextAlignmentCenter;
            data.normalImage = self.chooseBtnViewModel.image;
            data.title = self.chooseBtnViewModel.textModel.text;
            data.titleFont = self.chooseBtnViewModel.textModel.font;
            data.titleCor = self.chooseBtnViewModel.textModel.textCor;
            data.titleLineBreakMode = NSLineBreakByWordWrapping;
            data.subtitleLineBreakMode = NSLineBreakByWordWrapping;
            data.imagePadding = JobsWidth(8);
            data.imagePlacement = NSDirectionalRectEdgeTrailing;
            data.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            data.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            data.roundingCorners = UIRectCornerAllCorners;
        })).onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objBlock) self.objBlock(x);
            if (x.selected) {
                self->dropDownListView = [self motivateFromView:x
                                  jobsDropDownListViewDirection:JobsDropDownListViewDirection_UP
                                                           data:self.jobsPageViewDataMutArr
                                             motivateViewOffset:0
                                                    finishBlock:^(UIViewModel *data) {
                    JobsLog(@"data = %@",data);
                    JobsLog(@"data = %@",data.data);
                    x.jobsResetBtnTitle(data.textModel.text.add(data.subTextModel.text));
                }];
            }else{
                self->dropDownListView.dropDownListViewDisappear(x);
            }
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        [self.addSubview(_chooseBtn) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            make.size.mas_equalTo(self.chooseBtnSize);
            make.left.equalTo(self).offset(JobsWidth(0));
        }];
    }return _chooseBtn;
}
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = ZYTextField.new;
        _zyTextField.delegate = self;
        @jobs_weakify(self)
        [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(NSString * _Nullable data) {
            @jobs_strongify(self)
            return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            self.securityModeBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
            if (x.isContainsSpecialSymbolsString(nil)) {
                toast(JobsInternationalization(@"Do not enter special characters"));
            }else{
                if (self.objBlock) self.objBlock(self->_zyTextField);
            }
        }];
        [self.addSubview(_zyTextField) mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom);
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            if (self.style_5 == InputViewStyle_5_1) {
                make.right.equalTo(self.authCodeBtn.mas_left);
                make.left.equalTo(self.titleLab);
            }else if (self.style_5 == InputViewStyle_5_2){
                make.right.equalTo(self);
                make.left.equalTo(self.titleLab);
            }else if (self.style_5 == InputViewStyle_5_3){
                make.right.equalTo(self);
                make.left.equalTo(self.chooseBtn.mas_right).offset(JobsWidth(10));
            }else{}
        }];
    }
    if (self.doorInputViewBaseStyleModel.textModel.text.isDebugText) {
        _zyTextField.text = JobsInternationalization(@"");
    }return _zyTextField;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        @jobs_weakify(self)
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            @jobs_strongify(self)
            data.textModel.text = JobsInternationalization(@"請選擇區號");
            data.textModel.textCor = HEXCOLOR(0xC4C4C4);
            data.textModel.textLineSpacing = 0;
            data.textModel.font = UIFontWeightRegularSize(14);
            data.bgCor = JobsClearColor;
            data.jobsWidth = self.chooseBtnSize.width;
            data.subTextModel.text = JobsInternationalization(@"");
            data.image = JobsIMG(@"向下的箭头");
        });
    }return _chooseBtnViewModel;
}

-(NSMutableArray<UIViewModel *> *)jobsPageViewDataMutArr{
    if (!_jobsPageViewDataMutArr) {
        @jobs_weakify(self)
        _jobsPageViewDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                @jobs_strongify(self)
                viewModel.textModel.text = JobsInternationalization(@"+87");
                viewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
                viewModel.textModel.textLineSpacing = 0;
                viewModel.textModel.font = UIFontWeightRegularSize(14);
                viewModel.bgCor = JobsClearColor;
                viewModel.jobsWidth = self.chooseBtnSize.width;
                viewModel.subTextModel.text = JobsInternationalization(@"");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                @jobs_strongify(self)
                viewModel.textModel.text = JobsInternationalization(@"+88");
                viewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
                viewModel.textModel.textLineSpacing = 0;
                viewModel.textModel.font = UIFontWeightRegularSize(14);
                viewModel.bgCor = JobsClearColor;
                viewModel.jobsWidth = self.chooseBtnSize.width;
                viewModel.subTextModel.text = JobsInternationalization(@"");
            }));
        });
    }return _jobsPageViewDataMutArr;
}

@end
