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
@property(nonatomic,strong)UIButton *securityModeBtn;
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
    _textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
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
+(CGSize)viewSizeWithModel:(id _Nullable)model{
    return CGSizeMake(JobsWidth(305), JobsWidth(14 + 36 + 4));
}
/// 外层数据渲染
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
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

-(UIButton *)getSecurityModeBtn{
    return _securityModeBtn;
}
#pragma mark —— lazyLoad
-(UIButton *)securityModeBtn{
    if (!_securityModeBtn) {
        @jobs_weakify(self)
        _securityModeBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                             background:nil
                                             buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                          textAlignment:NSTextAlignmentCenter
                                                       subTextAlignment:NSTextAlignmentCenter
                                                            normalImage:self.doorInputViewBaseStyleModel.unSelectedSecurityBtnIMG ? : JobsBlueColor.image
                                                         highlightImage:nil
                                                        attributedTitle:nil
                                                selectedAttributedTitle:nil
                                                     attributedSubtitle:nil
                                                                  title:nil
                                                               subTitle:nil
                                                              titleFont:nil
                                                           subTitleFont:nil
                                                               titleCor:nil
                                                            subTitleCor:nil
                                                     titleLineBreakMode:NSLineBreakByWordWrapping
                                                  subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                    baseBackgroundColor:nil
                                                        backgroundImage:nil
                                                           imagePadding:JobsWidth(0)
                                                           titlePadding:JobsWidth(0)
                                                         imagePlacement:NSDirectionalRectEdgeNone
                                             contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                               contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                          contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                      cornerRadiusValue:JobsWidth(0)
                                                        roundingCorners:UIRectCornerAllCorners
                                                   roundingCornersRadii:CGSizeZero
                                                         layerBorderCor:nil
                                                            borderWidth:JobsWidth(0)
                                                          primaryAction:nil
                                             longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                            id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                        clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            x.selected = !x.selected;
            if(x.selected){
                x.jobsResetBtnImage(self.doorInputViewBaseStyleModel.selectedSecurityBtnIMG ? : JobsRedColor.image);
            }
            self.textField.secureTextEntry = x.selected;
            if (x.selected && !self.textField.isEditing) {
                self.textField.placeholder = self.doorInputViewBaseStyleModel.placeHolderStr;
            }return nil;
        }];
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
                                      clickEventBlock:nil];
        _authCodeBtn.normalTitle(JobsInternationalization(@"獲取驗證碼"));
//        @jobs_weakify(self)
        [_authCodeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
//            @jobs_strongify(self)
            x.startTimer();
            return nil;
        }];
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
        _authCodeBtn.cornerCutToCircleWithCornerRadius(25 / 2);
//        [_countDownBtn appointCornerCutToCircleByRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight
//                                                     cornerRadii:CGSizeMake(_countDownBtn.height / 2, _countDownBtn.height / 2)];

    }return _authCodeBtn;
}

-(BaseButton *)chooseBtn{
    if (!_chooseBtn) {
        @jobs_weakify(self)
        _chooseBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                       background:nil
                                       buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                    textAlignment:NSTextAlignmentCenter
                                                 subTextAlignment:NSTextAlignmentCenter
                                                      normalImage:self.chooseBtnViewModel.image
                                                   highlightImage:nil
                                                  attributedTitle:nil
                                          selectedAttributedTitle:nil
                                               attributedSubtitle:nil
                                                            title:self.chooseBtnViewModel.textModel.text
                                                         subTitle:nil
                                                        titleFont:self.chooseBtnViewModel.textModel.font
                                                     subTitleFont:nil
                                                         titleCor:self.chooseBtnViewModel.textModel.textCor
                                                      subTitleCor:nil
                                               titleLineBreakMode:NSLineBreakByWordWrapping
                                            subtitleLineBreakMode:NSLineBreakByWordWrapping
                                              baseBackgroundColor:nil
                                                  backgroundImage:nil
                                                     imagePadding:JobsWidth(8)
                                                     titlePadding:JobsWidth(0)
                                                   imagePlacement:NSDirectionalRectEdgeTrailing
                                       contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                         contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                    contentInsets:jobsSameDirectionalEdgeInsets(0)
                                                cornerRadiusValue:JobsWidth(0)
                                                  roundingCorners:UIRectCornerAllCorners
                                             roundingCornersRadii:CGSizeZero
                                                   layerBorderCor:nil
                                                      borderWidth:JobsWidth(0)
                                                    primaryAction:nil
                                       longPressGestureEventBlock:^id(id _Nullable weakSelf,
                                                                      id _Nullable arg) {
            NSLog(@"按钮的长按事件触发");
            return nil;
        }
                                                  clickEventBlock:^id(BaseButton *x){
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            x.selected = !x.selected;
            if (x.selected) {
                @jobs_weakify(self)
                self->dropDownListView = [self motivateFromView:x
                                  jobsDropDownListViewDirection:JobsDropDownListViewDirection_UP
                                                           data:self.jobsPageViewDataMutArr
                                             motivateViewOffset:0
                                                    finishBlock:^(UIViewModel *data) {
                    @jobs_strongify(self)
                    NSLog(@"data = %@",data);
                    NSLog(@"data = %@",data.data);
                    x.normalTitle([data.textModel.text stringByAppendingString:data.subTextModel.text]);
                }];
            }else{
                [self->dropDownListView dropDownListViewDisappear:x];
            }return nil;
        }];
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
        _chooseBtnViewModel = UIViewModel.new;
        _chooseBtnViewModel.textModel.text = JobsInternationalization(@"請選擇區號");
        _chooseBtnViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
        _chooseBtnViewModel.textModel.textLineSpacing = 0;
        _chooseBtnViewModel.textModel.font = UIFontWeightRegularSize(14);
        _chooseBtnViewModel.bgCor = JobsClearColor;
        _chooseBtnViewModel.jobsWidth = self.chooseBtnSize.width;
        _chooseBtnViewModel.subTextModel.text = JobsInternationalization(@"");
        _chooseBtnViewModel.image = JobsIMG(@"向下的箭头");
    }return _chooseBtnViewModel;
}

-(NSMutableArray<UIViewModel *> *)jobsPageViewDataMutArr{
    if (!_jobsPageViewDataMutArr) {
        _jobsPageViewDataMutArr = NSMutableArray.array;

        {
            UIViewModel *jobsPageViewModel = UIViewModel.new;
            jobsPageViewModel.textModel.text = JobsInternationalization(@"+87");
            jobsPageViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
            jobsPageViewModel.textModel.textLineSpacing = 0;
            jobsPageViewModel.textModel.font = UIFontWeightRegularSize(14);
            jobsPageViewModel.bgCor = JobsClearColor;
            jobsPageViewModel.jobsWidth = self.chooseBtnSize.width;
            jobsPageViewModel.subTextModel.text = JobsInternationalization(@"");
            
            [_jobsPageViewDataMutArr addObject:jobsPageViewModel];
        }
        
        {
            UIViewModel *jobsPageViewModel = UIViewModel.new;
            jobsPageViewModel.textModel.text = JobsInternationalization(@"+88");
            jobsPageViewModel.textModel.textCor = HEXCOLOR(0xC4C4C4);
            jobsPageViewModel.textModel.textLineSpacing = 0;
            jobsPageViewModel.textModel.font = UIFontWeightRegularSize(14);
            jobsPageViewModel.bgCor = JobsClearColor;
            jobsPageViewModel.jobsWidth = self.chooseBtnSize.width;
            jobsPageViewModel.subTextModel.text = JobsInternationalization(@"");
            
            [_jobsPageViewDataMutArr addObject:jobsPageViewModel];
        }
        
    }return _jobsPageViewDataMutArr;
}

-(ButtonTimerConfigModel *)btnTimerConfigModel{
    if (!_btnTimerConfigModel) {
        _btnTimerConfigModel = ButtonTimerConfigModel.new;
        /// 一些通用的设置
        _btnTimerConfigModel.jobsSize = CGSizeMake(JobsWidth(120), JobsWidth(25));
        _btnTimerConfigModel.count = 3;
        _btnTimerConfigModel.showTimeType = ShowTimeType_SS;//时间显示风格
        _btnTimerConfigModel.countDownBtnType = TimerStyle_anticlockwise;// 时间方向
        _btnTimerConfigModel.cequenceForShowTitleRuningStrType = CequenceForShowTitleRuningStrType_tail;// 文本显示类型
        _btnTimerConfigModel.labelShowingType = UILabelShowingType_03;
        _btnTimerConfigModel.secondStr = JobsInternationalization(@"S");
        /// 计时器未开始【静态值】
        _btnTimerConfigModel.readyPlayValue.layerBorderWidth = 1;
        _btnTimerConfigModel.readyPlayValue.layerCornerRadius = 0;
        _btnTimerConfigModel.readyPlayValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.readyPlayValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.readyPlayValue.textCor = HEXCOLOR(0xAE8330);
        _btnTimerConfigModel.readyPlayValue.text = JobsInternationalization(@"獲取驗證碼");
        _btnTimerConfigModel.readyPlayValue.font = UIFontWeightBoldSize(14);
        /// 计时器进行中【动态值】
        _btnTimerConfigModel.runningValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.runningValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.runningValue.textCor = HEXCOLOR(0xAE8330);
        _btnTimerConfigModel.runningValue.text = JobsInternationalization(@"");
        /// 计时器结束【静态值】
        _btnTimerConfigModel.endValue.bgCor = JobsClearColor;
        _btnTimerConfigModel.endValue.layerBorderCor = JobsClearColor;
        _btnTimerConfigModel.endValue.textCor = HEXCOLOR(0xAE8330);
        _btnTimerConfigModel.endValue.text = JobsInternationalization(@"重新获取验证码");
        
    }return _btnTimerConfigModel;
}

@end
