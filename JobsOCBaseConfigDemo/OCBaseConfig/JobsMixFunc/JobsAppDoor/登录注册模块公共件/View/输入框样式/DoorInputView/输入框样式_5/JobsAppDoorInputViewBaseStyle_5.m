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
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *authCodeBtn;
@property(nonatomic,strong)BaseButton *securityModeBtn;
@property(nonatomic,strong)ZYTextField *textField;
@property(nonatomic,strong)BaseButton *chooseBtn;
/// Data
@property(nonatomic,strong)JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;
@property(nonatomic,strong)ButtonTimerConfigModel *btnTimerConfigModel;
@property(nonatomic,strong)NSMutableArray <UIViewModel *>*jobsPageViewDataMutArr;
@property(nonatomic,assign)CGSize chooseBtnSize;
@property(nonatomic,strong)UIViewModel *chooseBtnViewModel;

@end

@implementation JobsAppDoorInputViewBaseStyle_5
@synthesize thisViewSize = _thisViewSize;
-(void)dealloc{
    _authCodeBtn.timerDestroy();
    [dropDownListView dropDownListViewDisappear:nil];
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
            NSLog(@"SSS = %d",b.boolValue);
        }
        if (self.style_5 == InputViewStyle_5_3) {
            [self->dropDownListView dropDownListViewDisappear:self.chooseBtn];
        }
    }];
}

-(void)configTextField{
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
    _textField.background = self.doorInputViewBaseStyleModel.background;
    _textField.keyboardType = self.doorInputViewBaseStyleModel.keyboardType;
    _textField.textColor = self.doorInputViewBaseStyleModel.ZYtextColor;
    _textField.useCustomClearButton = self.doorInputViewBaseStyleModel.useCustomClearButton;
    _textField.isShowDelBtn = self.doorInputViewBaseStyleModel.isShowDelBtn;
    _textField.rightViewOffsetX = self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8);// 删除按钮的偏移量
    _textField.placeHolderAlignment = self.doorInputViewBaseStyleModel.placeHolderAlignment;
    _textField.placeHolderOffset = self.doorInputViewBaseStyleModel.placeHolderOffset;
    _textField.leftViewOffsetX = self.doorInputViewBaseStyleModel.leftViewOffsetX;
    _textField.offset = self.doorInputViewBaseStyleModel.offset;
    _textField.requestParams = self.textFieldInputModel;
    _textField.placeholderColor = self.doorInputViewBaseStyleModel.placeholderColor;
    _textField.placeholderFont = self.doorInputViewBaseStyleModel.placeholderFont;
    _textField.fieldEditorOffset = self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50);
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.doorInputViewBaseStyleModel.keyboardEnable;
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsReturnCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
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
    return _textField;
}

-(NSString *_Nullable)textFieldValue{
    return _textField.text;
}

-(BaseButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— lazyLoad
-(BaseButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = BaseButton
            .initByNormalImage(self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image)
            .onClick(^(UIButton *x){
                if (self.objectBlock) self.objectBlock(x);
                x.selected = !x.selected;
                if(x.selected){
                    x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image);
                }
                self.textField.secureTextEntry = x.selected;
                if (x.selected && !self.textField.isEditing) {
                    self.textField.placeholder = self.doorInputViewBaseStyleModel.placeholder;
                }
        }).onLongPressGesture(^(id data){
            NSLog(@"");
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
        _titleLab = UILabel.new;
        _titleLab.textColor = self.doorInputViewBaseStyleModel.titleStrCor;
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
        }];
    }
    _titleLab.text = self.doorInputViewBaseStyleModel.titleLabStr;
    _titleLab.font = self.doorInputViewBaseStyleModel.titleStrFont;
    _titleLab.makeLabelByShowingType(UILabelShowingType_03);
    return _titleLab;
}

-(UIButton *)authCodeBtn{
    if (!_authCodeBtn) {
        _authCodeBtn = [UIButton.alloc initWithConfig:self.btnTimerConfigModel
                           longPressGestureEventBlock:nil
                                      clickEventBlock:^id(UIButton *_Nullable x){
            x.startTimer();
            return nil;
        }].layerByBorderCor(HEXCOLOR(0xAE8330))
            .layerByBorderWidth(0.5f)
            .cornerCutToCircleWithCornerRadius(25 / 2);
        
        [_authCodeBtn actionObjectBlock:^(id data) {
//            @jobs_strongify(self)
            if ([data isKindOfClass:TimerProcessModel.class]) {
                TimerProcessModel *model = (TimerProcessModel *)data;
                NSLog(@"❤️❤️❤️❤️❤️%f",model.data.anticlockwiseTime);
            }
        }];
        [self addSubview:_authCodeBtn];
        [_authCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-JobsWidth(16));
            make.bottom.equalTo(self.textField);
            make.size.mas_equalTo(self.btnTimerConfigModel.jobsSize);
        }];
        [self layoutIfNeeded];
    }return _authCodeBtn;
}

-(BaseButton *)chooseBtn{
    if (!_chooseBtn) {
        @jobs_weakify(self)
        _chooseBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.buttonConfigTitleAlignment = UIButtonConfigurationTitleAlignmentAutomatic;
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
        })).onClick(^(UIButton *x){
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            if (x.selected) {
                self->dropDownListView = [self motivateFromView:x
                                  jobsDropDownListViewDirection:JobsDropDownListViewDirection_UP
                                                           data:self.jobsPageViewDataMutArr
                                             motivateViewOffset:0
                                                    finishBlock:^(UIViewModel *data) {
                    NSLog(@"data = %@",data);
                    NSLog(@"data = %@",data.data);
                    x.jobsResetBtnTitle(data.textModel.text.add(data.subTextModel.text));
                }];
            }else{
                [self->dropDownListView dropDownListViewDisappear:x];
            }
        }).onLongPressGesture(^(id data){
            NSLog(@"");
        });
        [self addSubview:_chooseBtn];
        [_chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-JobsWidth(8));
            make.size.mas_equalTo(self.chooseBtnSize);
            make.left.equalTo(self).offset(JobsWidth(0));
        }];
    }return _chooseBtn;
}

-(ZYTextField *)textField{
    if (!_textField) {
        _textField = ZYTextField.new;
        _textField.delegate = self;
        @jobs_weakify(self)
        [_textField jobsTextFieldEventFilterBlock:^BOOL(NSString * _Nullable data) {
            @jobs_strongify(self)
            return self.returnBoolByIDBlock ? self.returnBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            self.securityModeBtn.jobsVisible = isValue(x) && self.doorInputViewBaseStyleModel.isShowSecurityBtn;/// 👁
            if ([x isContainsSpecialSymbolsString:nil]) {
                toast(JobsInternationalization(@"Do not enter special characters"));
            }else{
                if (self.objectBlock) self.objectBlock(self->_textField);
            }
        }];
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
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
        _textField.text = JobsInternationalization(@"");
    }return _textField;
}

-(UIViewModel *)chooseBtnViewModel{
    if (!_chooseBtnViewModel) {
        _chooseBtnViewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
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
        _jobsPageViewDataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.textModel.text = JobsInternationalization(@"+87");
                viewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
                viewModel.textModel.textLineSpacing = 0;
                viewModel.textModel.font = UIFontWeightRegularSize(14);
                viewModel.bgCor = JobsClearColor;
                viewModel.jobsWidth = self.chooseBtnSize.width;
                viewModel.subTextModel.text = JobsInternationalization(@"");
            }));
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
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

-(ButtonTimerConfigModel *)btnTimerConfigModel{
    if (!_btnTimerConfigModel) {
        _btnTimerConfigModel = jobsMakeButtonTimerConfigModel(^(__kindof ButtonTimerConfigModel * _Nullable data) {
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
        });
    }return _btnTimerConfigModel;
}

@end
