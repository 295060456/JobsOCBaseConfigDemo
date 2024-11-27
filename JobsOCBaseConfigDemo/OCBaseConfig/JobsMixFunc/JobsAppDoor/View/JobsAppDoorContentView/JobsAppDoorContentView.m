//
//  JobsAppDoorContentView.m
//  My_BaseProj
//
//  Created by Jobs on 2020/12/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorContentView.h"
// 可以发现：（animateWithDuration + Masonry，动画参数设置无效）
// 用户名 和 密码 ，登录注册两个界面共用，只不过frame不一样
@interface JobsAppDoorContentView (){
    JobsAppDoorInputViewBaseStyle_7 *inputView_7;
}
/// UI
@property(nonatomic,strong)UILabel *titleLab;/// 标题
@property(nonatomic,strong)UIButton *abandonLoginBtn;/// 返回首页按钮
@property(nonatomic,strong)UIButton *toRegisterBtn;/// 去注册
@property(nonatomic,strong)UIButton *sendBtn;/// 登录 & 注册按钮 （本页面请求可以不用jobsAppDoorContentViewBlock回调）
@property(nonatomic,strong)UIButton *storeCodeBtn;/// 记住密码
@property(nonatomic,strong)UIButton *findCodeBtn;/// 忘记密码
/// Data
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*loginDoorInputViewBaseStyleModelMutArr;
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*registerDoorInputViewBaseStyleModelMutArr;
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyle *>*inputViewMutArr;

@end

@implementation JobsAppDoorContentView

-(void)dealloc{
    if (self.registerDoorInputViewBaseStyleMutArr.count) {
        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
        手机验证码.getCountDownBtn.timerDestroy();
    }
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = Cor2;
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        [self initialToRegisterBtn];
        [self initialTitleLab];
        [self makeInputView];
        [self initialSendBtn];
        [self initialAbandonLoginBtn];
        [self initialOthers];
    };
}
#pragma mark —— 网络请求
/// 获取手机验证码网络请求
-(void)getCellPhoneVerificationCodeWithCountry:(NSString *)country
                                         phone:(NSString *)phone{
//    if ([self checkTelePhoneNum:phone]) {
//        JobsNetworkingPrepare
//        RequestTool *config = RequestTool.new;
//        config.languageType = self.currentLanguageType;
//        RequestTool.setupPublicParametersBy(config);
    
//
//        NSDictionary *parameters = @{@"country":@"855",//暂时写死855
//                                     @"phone":phone};
//
//        [JobsNetworkingAPI requestApi:NSObject.authGetVerificationCodeGET.funcName
//                         parameters:parameters
//                       successBlock:^(JobsResponseModel *data) {
//            NSLog(@"用户获取短信验证码成功");
//            self.jobsToastSuccessMsg(JobsInternationalization(@"Verification send success"));
//        } failureBlock:^(id data) {
//            JobsNetworkingAPI.handleError(data);
//            JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
//            手机验证码.getCountDownBtn.timerDestroy();
//        }];
//    }else{
//        self.jobsToastErrMsg(JobsInternationalization(@"TelePhone Number Error"));
//        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
//        手机验证码.getCountDownBtn.timerDestroy();
//    }
}
#pragma mark —— 一些外部调用的方法
///  获取存储按钮
-(UIButton *)getStoreCodeBtn{
    return self.storeCodeBtn;
}
/// 去登录【外部调用】
-(void)animationToLogin{
    [self 一些UI的初始状态];
    for (int i = 0; i < self.loginDoorInputViewBaseStyleMutArr.count; i++) {
        JobsAppDoorInputViewBaseStyle *inputView = self.loginDoorInputViewBaseStyleMutArr[i];
        inputView.x = JobsWidth(20);
    }
    for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
         i < self.registerDoorInputViewBaseStyleModelMutArr.count;
         i++) {
        if (self.registerDoorInputViewBaseStyleMutArr.count > i) {
            JobsAppDoorInputViewBaseStyle *inputView = self.registerDoorInputViewBaseStyleMutArr[i];
            inputView.alpha = 0;
        }
    }
}
/// 去注册【外部调用】
-(void)animationToRegister{
    self.toRegisterBtn.selected = YES;
    [self animationChangeRegisterBtnFrame];
}
#pragma mark —— 一些私有方法
/// 手机验证码验证
-(BOOL)checkTelePhoneNum:(NSString *)phone{
    /// 不为空且全为整数
    if (isValue(phone) &&
        [phone isPureInt]) {
        return YES;
    }return NO;
}
/// 除了传入的textfield，其他的全部放弃第一响应者
-(void)allRise:(UITextField *)textfield{
    for (JobsAppDoorInputViewBaseStyle *appDoorInputViewBaseStyle in self.loginDoorInputViewBaseStyleMutArr) {
        if (textfield != appDoorInputViewBaseStyle.textField) {
            [appDoorInputViewBaseStyle.textField resignFirstResponder];
        }
    }
    
    for (JobsAppDoorInputViewBaseStyle *appDoorInputViewBaseStyle in self.registerDoorInputViewBaseStyleMutArr) {
        if (textfield != appDoorInputViewBaseStyle.textField) {
            [appDoorInputViewBaseStyle.textField resignFirstResponder];
        }
    }
}
/// Core
-(void)makeInputView{
    for (int i = 0; i < self.loginDoorInputViewBaseStyleModelMutArr.count; i++) {
        JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
        [self.inputViewMutArr addObject:inputView];
        [self.loginDoorInputViewBaseStyleMutArr addObject:inputView];
        inputView.jobsRichViewByModel(self.loginDoorInputViewBaseStyleModelMutArr[i]);
        @jobs_weakify(self)
        //【用户名 & 密码 输入回调，共享注册与登录两个界面】
        [inputView actionObjectBlock:^(UITextField *data) {
            @jobs_strongify(self)
            JobsAppDoorInputViewTFModel *textFieldInputModel = (JobsAppDoorInputViewTFModel *)data.requestParams;
            if ([textFieldInputModel.PlaceHolder isEqualToString:JobsInternationalization(@"User")]) {
                self.appDoorModel.userName = data.text;
            }else if ([textFieldInputModel.PlaceHolder isEqualToString:JobsInternationalization(@"Code")]){
                self.appDoorModel.password = data.text;
            }else{}
            if (self.objectBlock) self.objectBlock(self.appDoorModel);
            [self allRise:data];
        }];
        [self addSubview:inputView];
        inputView.sizer = CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight);
        inputView.x = JobsWidth(20);
        if (i == 0) {
            inputView.top = self.titleLab.bottom + JobsWidth(20);//20是偏移量
        }else if(i == 1){
            JobsAppDoorInputViewBaseStyle_3 *lastObj = (JobsAppDoorInputViewBaseStyle_3 *)self.loginDoorInputViewBaseStyleMutArr[i - 1];
            inputView.top = lastObj.bottom + InputViewOffset;
        }else{}
        inputView.layer.cornerRadius = ThingsHeight / 2;
        [self layoutIfNeeded];// 这句话不加，不刷新界面，placeHolder会出现异常
    }
}
/// 返回NO 登录按钮不可点击【可加入判断标准】
-(BOOL)checkLoginBtnCanBeUsed{
    return YES;
}
/// 返回NO 注册按钮不可点击【可加入判断标准】
-(BOOL)checkRegisterBtnCanBeUsed{
    return YES;
}
/// 一些需要通过点击状态改变状态的控件
/// 一些需要通过点击状态改变状态的控件【初始状态】
-(void)initialTitleLab{
    self.titleLab.text = Title7;
    self.titleLab.font = [UIFont systemFontOfSize:JobsWidth(20)
                                           weight:UIFontWeightRegular];
    self.titleLab.textColor = Cor4;
    [self.titleLab sizeToFit];//sizeToFit也会刷新UI造成UI错位，所以需要提前写
    self.titleLab.top = JobsWidth(20);
    self.titleLab.centerX = (self.width - self.toRegisterBtn.width) / 2;
}

-(void)initialSendBtn{
//        _sendBtn.backgroundColor = [KSystemPinkColor colorWithAlphaComponent:0.3];
    
    self.sendBtn.sizer = CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight);
    [self.sendBtn setBackgroundImage:JobsIMG(@"登录注册按钮背景图") forState:UIControlStateNormal];
    [self.sendBtn setBackgroundImage:JobsIMG(@"登录注册按钮背景图") forState:UIControlStateSelected];
    [self.sendBtn setTitleColor:Cor5
                       forState:UIControlStateNormal];
    [self.sendBtn setTitle:Title7
                  forState:UIControlStateNormal];
    self.sendBtn.titleLabel.font = [UIFont systemFontOfSize:JobsWidth(16)
                                                     weight:UIFontWeightRegular];
    [self.sendBtn.titleLabel sizeToFit];//必须先定Size，在依据Size刷新内部控件约束
    
    self.sendBtn.centerX = self.titleLab.centerX;
    self.sendBtn.bottom = JobsAppDoorContentViewLoginHeight - JobsWidth(50);

}
/// 返回首页
-(void)initialAbandonLoginBtn{
    self.abandonLoginBtn.height = JobsWidth(10);
    self.abandonLoginBtn.jobsResetBtnTitle(Title4);
    self.abandonLoginBtn.jobsResetBtnTitleCor(Cor3);
    self.abandonLoginBtn.titleLabel.font = [UIFont systemFontOfSize:JobsWidth(12)
                                                             weight:UIFontWeightSemibold];
    [self.abandonLoginBtn.titleLabel sizeToFit];
    self.abandonLoginBtn.adjustsImageSizeForAccessibilityContentSizeCategory = YES;
    
    self.abandonLoginBtn.bottom = JobsAppDoorContentViewLoginHeight - JobsWidth(20);
    self.abandonLoginBtn.centerX = self.sendBtn.centerX;
}

-(void)initialOthers{
    self.storeCodeBtn.alpha = 1;//存储登录信息
    self.findCodeBtn.alpha = 1;//找回密码
}

-(void)initialToRegisterBtn{
    self.toRegisterBtn.jobsResetBtnTitle(Title2);
    self.toRegisterBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(20));
}
/// 一些需要通过点击状态改变状态的控件【被选中状态】
-(void)selectTitleLab{
    self.titleLab.text = Title6;
    self.titleLab.centerX = (self.width + self.toRegisterBtn.width) / 2;
    self.titleLab.labelAutoWidthByFont();
}

-(void)selectSendBtn{
    self.sendBtn.centerX = self.titleLab.centerX;
    self.sendBtn.bottom = JobsAppDoorContentViewRegisterHeight - JobsWidth(50);
    [self.sendBtn setTitle:Title6
                  forState:UIControlStateNormal];
    [self.sendBtn buttonAutoWidthByFont];
}

-(void)selectAbandonLoginBtn{
    self.abandonLoginBtn.centerX = self.sendBtn.centerX;
    self.abandonLoginBtn.bottom = JobsAppDoorContentViewRegisterHeight - JobsWidth(20);
    self.abandonLoginBtn.alpha = 1;//返回首页
}

-(void)selectOthers{
    self.storeCodeBtn.alpha = 0;//存储登录信息
    self.findCodeBtn.alpha = 0;//找回密码
}

-(void)selectToRegisterBtn{
    [self.toRegisterBtn setTitle:Title1
                        forState:UIControlStateNormal];
}

-(void)一些UI的初始状态{
    [self initialTitleLab];
    [self initialSendBtn];
    [self initialAbandonLoginBtn];
    [self initialOthers];
    [self initialToRegisterBtn];
}

-(void)一些UI点击以后的状态{
    [self selectTitleLab];
    [self selectSendBtn];
    [self selectAbandonLoginBtn];
    [self selectOthers];
    [self selectToRegisterBtn];
}
/// 去注册【内部调用】
-(void)p_animationToRegister{
    [self 一些UI点击以后的状态];
    for (int i = 0;
         i < self.loginDoorInputViewBaseStyleMutArr.count;
         i++) {
        JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)self.loginDoorInputViewBaseStyleMutArr[i];
        inputView.x += RegisterBtnWidth;
    }
    
    if (self.registerDoorInputViewBaseStyleMutArr.count) {//不是第一次
        for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
             i < self.registerDoorInputViewBaseStyleModelMutArr.count;
             i++) {
            JobsAppDoorInputViewBaseStyle *inputView = (JobsAppDoorInputViewBaseStyle *)self.registerDoorInputViewBaseStyleMutArr[i];
            inputView.alpha = 1;
        }return;
    }
    
    [self.registerDoorInputViewBaseStyleMutArr addObjectsFromArray:self.loginDoorInputViewBaseStyleMutArr];
    for (long i = self.loginDoorInputViewBaseStyleMutArr.count;
         i < self.registerDoorInputViewBaseStyleModelMutArr.count;
         i++) {

        JobsAppDoorInputViewBaseStyle *doorInputViewBaseStyle = nil;
        if (i == self.loginDoorInputViewBaseStyleMutArr.count) {// 确认密码
            JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
            doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
            [self addSubview:inputView];
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
            @jobs_weakify(self)
            [inputView actionObjectBlock:^(UITextField *data) {
                @jobs_strongify(self)
                UITextField *textField = (UITextField *)data;
                self.appDoorModel.confirmPassword = textField.text;
                if (self.objectBlock) self.objectBlock(self.appDoorModel);
                [self allRise:data];
            }];
        }else if (i == self.loginDoorInputViewBaseStyleMutArr.count + 1){// 手机号码
            inputView_7 = JobsAppDoorInputViewBaseStyle_7.new;
            doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView_7;
            [self addSubview:inputView_7];
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView_7];
            inputView_7.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
            @jobs_weakify(self)
            [inputView_7 actionObjectBlock:^(UITextField *data) {
                @jobs_strongify(self)
                UITextField *textField = (UITextField *)data;
                self.appDoorModel.tel = textField.text;
                if (self.objectBlock) self.objectBlock(self.appDoorModel);
                [self allRise:data];
            }];
        }else if (i == self.loginDoorInputViewBaseStyleMutArr.count + 2){// 手机验证码
            JobsAppDoorInputViewBaseStyle_1 *inputView = JobsAppDoorInputViewBaseStyle_1.new;
            doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
            [self addSubview:inputView];
            [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
            inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
            @jobs_weakify(self)
            [inputView actionObjectBlock:^(id data) {
                @jobs_strongify(self)
                if ([data isKindOfClass:UITextField.class]) {
                    UITextField *textField = (UITextField *)data;
                    self.appDoorModel.verificationCode = textField.text;
                    if (self.objectBlock) self.objectBlock(self.appDoorModel);
                    [self allRise:data];
                }else if ([data isKindOfClass:UIButton.class]){
                    [self getCellPhoneVerificationCodeWithCountry:nil
                                                            phone:self->inputView_7.textFieldValue];
                }else{}
            }];
        }else{}
        
        JobsAppDoorInputViewBaseStyle *lastObj = (JobsAppDoorInputViewBaseStyle *)self.registerDoorInputViewBaseStyleMutArr[i - 1];
        doorInputViewBaseStyle.top = lastObj.bottom + InputViewOffset;
        doorInputViewBaseStyle.sizer = CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight);
        doorInputViewBaseStyle.x = JobsWidth(20) + RegisterBtnWidth;
        doorInputViewBaseStyle.layer.cornerRadius = ThingsHeight / 2;
    }
}
/// 公共方法
-(void)animationCommon{
    if (self.objectBlock) self.objectBlock(self.toRegisterBtn);
    self.toRegisterBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeTop,JobsWidth(8));
    // 一些UI逻辑
    if (self.registerDoorInputViewBaseStyleMutArr.count == 5) {
        JobsAppDoorInputViewBaseStyle_3 *用户名 = (JobsAppDoorInputViewBaseStyle_3 *)self.registerDoorInputViewBaseStyleMutArr[0];
        JobsAppDoorInputViewBaseStyle_3 *密码 = (JobsAppDoorInputViewBaseStyle_3 *)self.registerDoorInputViewBaseStyleMutArr[1];
        JobsAppDoorInputViewBaseStyle_3 *确认密码 = (JobsAppDoorInputViewBaseStyle_3 *)self.registerDoorInputViewBaseStyleMutArr[2];
        JobsAppDoorInputViewBaseStyle_7 *手机号码 = (JobsAppDoorInputViewBaseStyle_7 *)self.registerDoorInputViewBaseStyleMutArr[3];
        JobsAppDoorInputViewBaseStyle_1 *手机验证码 = (JobsAppDoorInputViewBaseStyle_1 *)self.registerDoorInputViewBaseStyleMutArr[4];
        
        [用户名 changeTextFieldAnimationColor:self.toRegisterBtn.selected];
        [密码 changeTextFieldAnimationColor:self.toRegisterBtn.selected];
        [确认密码 changeTextFieldAnimationColor:self.toRegisterBtn.selected];
        [手机号码 changeTextFieldAnimationColor:self.toRegisterBtn.selected];
        [手机验证码 changeTextFieldAnimationColor:self.toRegisterBtn.selected];
        
        用户名.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor4;
        }));
        
        密码.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor4;
        }));
        
        确认密码.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.jobsWidth = 1;
            data.layerCor = Cor4;
        }));
    }
}
/// 核心方法
-(void)animationChangeRegisterBtnFrame{
    /*
     *    使用弹簧的描述时间曲线来执行动画 ,当dampingRatio == 1 时,动画会平稳的减速到最终的模型值,而不会震荡.
     *    小于1的阻尼比在达到完全停止之前会震荡的越来越多.
     *    如果你可以使用初始的 spring velocity 来 指定模拟弹簧末端的对象在加载之前移动的速度.
     *    他是一个单位坐标系统,其中2被定义为在一秒内移动整个动画距离.
     *    如果你在动画中改变一个物体的位置,你想在动画开始前移动到 100 pt/s 你会超过0.5,
     *    dampingRatio 阻尼
     *    velocity 速度
     */
    @jobs_weakify(self)
    [UIView animateWithDuration:0.7f
                          delay:0.1f
         usingSpringWithDamping:1
          initialSpringVelocity:0.1f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        @jobs_strongify(self)
        if (self.toRegisterBtn.selected) {//点击了“新用户注册”按钮，正在进入注册页面
            [self p_animationToRegister];
        }else{//点击了“返回登录”按钮，正在进入登录页面 初始状态
            [self animationToLogin];
        }
        [self animationCommon];
    } completion:nil];
}
#pragma mark —— lazyLoad
-(UIButton *)toRegisterBtn{
    if (!_toRegisterBtn) {
        _toRegisterBtn = UIButton.new;
        _toRegisterBtn.frame = CGRectMake(self.width - RegisterBtnWidth,
                                          0,
                                          RegisterBtnWidth,
                                          self.height);
        _toRegisterBtn.jobsResetBtnImage(JobsIMG(@"用户名称"));
        _toRegisterBtn.titleLabel.numberOfLines = 0;
        _toRegisterBtn.backgroundColor = Cor1;
        _toRegisterBtn.jobsResetBtnTitleCor(Cor3);
        _toRegisterBtn.titleLabel.font = UIFontWeightMediumSize(13);
        @jobs_weakify(self)
        [_toRegisterBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            [self endEditing:YES];
            [self animationChangeRegisterBtnFrame];
            return nil;
        }];
        [self addSubview:_toRegisterBtn];
    }return _toRegisterBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            self.addSubview(label);
        });
    }return _titleLab;
}

-(UIButton *)abandonLoginBtn{
    if (!_abandonLoginBtn) {
        _abandonLoginBtn = UIButton.new;
        @jobs_weakify(self)
        [_abandonLoginBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];[self addSubview:_abandonLoginBtn];
    }return _abandonLoginBtn;
}
/// 登录 或者 注册按钮
-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = UIButton.new;
        @jobs_weakify(self)
        [_sendBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            [self endEditing:YES];
            x.requestParams = self.appDoorModel;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
        [self addSubview:_sendBtn];
        _sendBtn.cornerCutToCircleWithCornerRadius(_sendBtn.height / 2);
    }return _sendBtn;
}
/// 记住登录成功的账号和密码
-(UIButton *)storeCodeBtn{
    if (!_storeCodeBtn) {
        _storeCodeBtn = UIButton.new;
        _storeCodeBtn.jobsResetBtnTitle(Title5);
        _storeCodeBtn.titleLabel.font = UIFontWeightRegularSize(10);
        _storeCodeBtn.selected = YES;// 默认记住密码
        _storeCodeBtn.jobsResetBtnImage(JobsIMG(@"没有记住密码"));
        _storeCodeBtn.selectedImage(JobsIMG(@"记住密码"));
        _storeCodeBtn.jobsResetBtnTitleCor(Cor4);
        _storeCodeBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
        _storeCodeBtn.titleLabel.adjustsFontForContentSizeCategory = YES;
        [self addSubview:_storeCodeBtn];
        [_storeCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)self.inputViewMutArr.lastObject;
            make.left.equalTo(inputView).offset(JobsWidth(20));
            make.top.equalTo(inputView.mas_bottom).offset(JobsWidth(25));
        }];
        [self layoutIfNeeded];
        _storeCodeBtn.jobsResetImagePlacement_Padding(NSDirectionalRectEdgeLeading,JobsWidth(3));
        @jobs_weakify(self)
        [_storeCodeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            x.selected = !x.selected;
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _storeCodeBtn;
}

-(UIButton *)findCodeBtn{
    if (!_findCodeBtn) {
        _findCodeBtn = UIButton.new;
        _findCodeBtn.jobsResetBtnTitle(Title3);
        _findCodeBtn.titleLabel.font = UIFontWeightRegularSize(10);
        _findCodeBtn.jobsResetBtnTitleCor(Cor3);
        _findCodeBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
        _findCodeBtn.titleLabel.adjustsFontForContentSizeCategory = YES;
        [self addSubview:_findCodeBtn];
        [_findCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            JobsAppDoorInputViewBaseStyle_3 *inputView = (JobsAppDoorInputViewBaseStyle_3 *)self.inputViewMutArr.lastObject;
            make.right.equalTo(inputView).offset(-JobsWidth(20));
            make.top.equalTo(inputView.mas_bottom).offset(JobsWidth(20));
        }];
        @jobs_weakify(self)
        [_findCodeBtn jobsBtnClickEventBlock:^id(UIButton *x) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
    }return _findCodeBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)loginDoorInputViewBaseStyleModelMutArr{
    if (!_loginDoorInputViewBaseStyleModelMutArr) {
        _loginDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = JobsIMG(@"用户名称");
                用户名.placeholder = JobsInternationalization(@"User");
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.useCustomClearButton = YES;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
                用户名.placeholderColor = JobsWhiteColor;
                用户名.rightViewOffsetX = JobsWidth(10);
                用户名.placeHolderOffset = JobsWidth(35);
                用户名.offset = JobsWidth(0);
                if (self.readUserNameMutArr.count) {
                    用户名.inputStr = self.readUserNameMutArr[0];
                }
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = JobsIMG(@"Lock");
                密码.placeholder = JobsInternationalization(@"Code");
                密码.isShowDelBtn = YES;
                密码.isShowSecurityBtn = YES;
                密码.useCustomClearButton = YES;
                密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
                密码.unSelectedSecurityBtnIMG =JobsIMG(@"codeDecode");//开眼
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.leftViewMode = UITextFieldViewModeAlways;
                密码.placeholderColor = JobsWhiteColor;
                密码.rightViewOffsetX = -JobsWidth(8);
                密码.placeHolderOffset = JobsWidth(35);
                密码.offset = JobsWidth(0);
            }));
        });
    }return _loginDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)registerDoorInputViewBaseStyleModelMutArr{
    if (!_registerDoorInputViewBaseStyleModelMutArr) {
        _registerDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = JobsIMG(@"用户名称");
                用户名.placeholder = JobsInternationalization(@"User");
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.useCustomClearButton = YES;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
                用户名.inputStr = self.readUserInfo.userName;
                用户名.placeholderColor = JobsWhiteColor;
                用户名.rightViewOffsetX = -JobsWidth(25);
                用户名.placeHolderOffset = JobsWidth(35);
                用户名.offset = JobsWidth(0);
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = JobsIMG(@"Lock");
                密码.placeholder = JobsInternationalization(@"Code");
                密码.isShowDelBtn = YES;
                密码.isShowSecurityBtn = YES;
                密码.useCustomClearButton = YES;
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
                密码.unSelectedSecurityBtnIMG = JobsIMG(@"codeDecode");//开眼
                密码.leftViewMode = UITextFieldViewModeAlways;
                密码.placeholderColor = JobsWhiteColor;
                密码.rightViewOffsetX = -JobsWidth(8);
                密码.placeHolderOffset = JobsWidth(35);
                密码.offset = JobsWidth(0);
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 确认密码) {
                确认密码.leftViewIMG = JobsIMG(@"Lock");
                确认密码.placeholder = JobsInternationalization(@"Confirm");
                确认密码.isShowDelBtn = YES;
                确认密码.isShowSecurityBtn = YES;
                确认密码.useCustomClearButton = YES;
                确认密码.returnKeyType = UIReturnKeyDone;
                确认密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                确认密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
                确认密码.unSelectedSecurityBtnIMG = JobsIMG(@"codeDecode");//开眼
                确认密码.leftViewMode = UITextFieldViewModeAlways;
                确认密码.placeholderColor = JobsWhiteColor;
                确认密码.rightViewOffsetX = -JobsWidth(8);
                确认密码.placeHolderOffset = JobsWidth(35);
                确认密码.offset = JobsWidth(0);
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机号码) {
                手机号码.leftViewIMG = JobsIMG(@"手机号码");
                手机号码.placeholder = JobsInternationalization(@"Telephone");
                手机号码.isShowDelBtn = YES;
                手机号码.isShowSecurityBtn = NO;
                手机号码.useCustomClearButton = YES;
                手机号码.returnKeyType = UIReturnKeyDone;
                手机号码.keyboardAppearance = UIKeyboardAppearanceAlert;
                手机号码.leftViewMode = UITextFieldViewModeAlways;
                手机号码.placeholderColor = JobsWhiteColor;
                手机号码.keyboardType = UIKeyboardTypePhonePad;
                手机号码.placeHolderOffset = JobsWidth(35);
                手机号码.offset = JobsWidth(0);
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 手机验证码) {
                手机验证码.leftViewIMG = JobsIMG(@"验证ICON");
                手机验证码.placeholder = JobsInternationalization(@"Auth code");
                手机验证码.isShowDelBtn = YES;
                手机验证码.isShowSecurityBtn = NO;
                手机验证码.useCustomClearButton = YES;
                手机验证码.returnKeyType = UIReturnKeyDone;
                手机验证码.keyboardAppearance = UIKeyboardAppearanceAlert;
                手机验证码.leftViewMode = UITextFieldViewModeAlways;
                手机验证码.placeholderColor = JobsWhiteColor;
    //            手机验证码.offset = JobsWidth(0);
    //            手机验证码.placeHolderOffset = JobsWidth(35);
            }));
        });
    }return _registerDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)loginDoorInputViewBaseStyleMutArr{
    if (!_loginDoorInputViewBaseStyleMutArr) {
        _loginDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    }return _loginDoorInputViewBaseStyleMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)registerDoorInputViewBaseStyleMutArr{
    if (!_registerDoorInputViewBaseStyleMutArr) {
        _registerDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    }return _registerDoorInputViewBaseStyleMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)inputViewMutArr{
    if (!_inputViewMutArr) {
        _inputViewMutArr = NSMutableArray.array;
    }return _inputViewMutArr;
}

-(JobsAppDoorModel *)appDoorModel{
    if (!_appDoorModel) {
        _appDoorModel = JobsAppDoorModel.new;
    }return _appDoorModel;
}

@end
