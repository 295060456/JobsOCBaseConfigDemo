//
//  LoginContentView.m
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorLoginContentView.h"

@interface JobsAppDoorLoginContentView ()
/// UI
Prop_strong()BaseButton *toRegisterBtn;/// 去注册
Prop_strong()UILabel *titleLab;/// 标题
Prop_strong()BaseButton *abandonLoginBtn;/// 返回首页按钮
Prop_strong()BaseButton *sendBtn;/// 登录
Prop_strong()BaseButton *storeCodeBtn;/// 记住密码
Prop_strong()BaseButton *findCodeBtn;/// 忘记密码
/// Data
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*loginDoorInputViewBaseStyleModelMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*loginDoorInputViewBaseStyleMutArr;

@end

@implementation JobsAppDoorLoginContentView

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark - Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = Cor1;
//        @jobs_weakify(self)
        [self addNotificationName:@"textFieldTag"
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
//            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:UITextField.class]){
                UITextField *b = notification.object;
                JobsLog(@"木头 = %@",b.requestParams);
            }JobsLog(@"通知传递过来的 = %@",notification.object);
        }];
    }return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— 一些私有化方法
-(void)makeInputView{
    for (int i = 0; i < self.loginDoorInputViewBaseStyleModelMutArr.count; i++) {
        JobsAppDoorInputViewBaseStyle_3 *inputView = JobsAppDoorInputViewBaseStyle_3.new;
        [self.loginDoorInputViewBaseStyleMutArr addObject:inputView];
        inputView.jobsRichViewByModel(self.loginDoorInputViewBaseStyleModelMutArr[i]);
        @jobs_weakify(self)
        [inputView actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if (self.objBlock) self.objBlock(data);//data：监测输入字符回调 和 激活的textField
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
#pragma mark —— JobsDoorInputViewProtocol
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)getAppDoorInputViewBaseStyle{
    return self.loginDoorInputViewBaseStyleMutArr;
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.toRegisterBtn.alpha = .7f;
        self.titleLab.alpha = 1;
        [self makeInputView];
        self.abandonLoginBtn.alpha = 1;
        self.sendBtn.alpha = 1;
        self.storeCodeBtn.alpha = 1;
        self.findCodeBtn.alpha = 1;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)toRegisterBtn{
    if (!_toRegisterBtn) {
        @jobs_weakify(self)
        _toRegisterBtn = BaseButton.initByStyleTop(Title2,
                                                   UIFontWeightMediumSize(13),
                                                   nil,
                                                   JobsIMG(@"用户名称"),
                                                   JobsWidth(8))
        .bgColorBy(JobsBlackColor)
        .onClickBy(^(UIButton *x){
            @jobs_strongify(self)
            [self endEditing:YES];
            if (self.objBlock) self.objBlock(x);
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        });
        _toRegisterBtn.makeNewLineShows(YES);
        [self addSubview:_toRegisterBtn];
        [_toRegisterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(self);
            make.width.mas_equalTo(btnWidth);
        }];
    }return _toRegisterBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.text = Title7;
            label.textColor = JobsWhiteColor;
            label.font = JobsFontRegular(JobsWidth(20));
            [label sizeToFit];
            self.addSubview(label);
            label.centerX = (self.width - self.toRegisterBtn.width) / 2;
            label.top = JobsWidth(20);
        });
    }return _titleLab;
}

-(BaseButton *)abandonLoginBtn{
    if (!_abandonLoginBtn) {
        @jobs_weakify(self)
        _abandonLoginBtn = BaseButton
            .initByStyle1(Title4,
                          UIFontWeightSemiboldSize(15),
                          JobsWhiteColor)
            .bgColorBy(JobsBlackColor)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [_abandonLoginBtn buttonAutoWidthByFont];
        [self addSubview:_abandonLoginBtn];
        [_abandonLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.titleLab);
            make.height.mas_equalTo(JobsWidth(15));
            make.bottom.mas_equalTo(self).offset(-JobsWidth(30));
        }];
    }return _abandonLoginBtn;
}

-(BaseButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = BaseButton
            .initByStyle1(Title7,
                          UIFontWeightSemiboldSize(15),
                          JobsWhiteColor)
            .cornerRadiusValueBy(ThingsHeight / 2)
            .bgColorBy(JobsSystemPinkColor.colorWithAlphaComponentBy(.7f))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toast(x.titleForNormalState);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        [self addSubview:_sendBtn];
        [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight));
            make.centerX.equalTo(self.titleLab);
            make.bottom.mas_equalTo(self).offset(-JobsWidth(60));
        }];
        [self layoutIfNeeded];
    }return _sendBtn;
}
/// 记住登录成功的账号和密码
-(BaseButton *)storeCodeBtn{
    if (!_storeCodeBtn) {
        @jobs_weakify(self)
        _storeCodeBtn = BaseButton
            .initByStyleLeft(Title5,
                             UIFontWeightRegularSize(12),
                             JobsWhiteColor,
                             JobsIMG(@"没有记住密码"),
                             JobsWidth(3))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                x.selected = !x.selected;
                x.selected ? x.jobsResetBtnImage(JobsIMG(@"记住密码")) : x.jobsResetBtnImage(JobsIMG(@"没有记住密码"));
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            });
        _storeCodeBtn.selected = YES;// 默认记住密码
        [_storeCodeBtn buttonAutoWidthByFont];
        [self addSubview:_storeCodeBtn];
        [_storeCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            JobsAppDoorInputViewBaseStyle *inputView = (JobsAppDoorInputViewBaseStyle *)self.loginDoorInputViewBaseStyleMutArr.lastObject;
            make.left.equalTo(inputView).offset(JobsWidth(20));
            make.top.equalTo(inputView.mas_bottom).offset(JobsWidth(25));
        }];
        [self layoutIfNeeded];
    }return _storeCodeBtn;
}

-(BaseButton *)findCodeBtn{
    if (!_findCodeBtn) {
        @jobs_weakify(self)
        _findCodeBtn = BaseButton
            .initByStyle1(Title3,UIFontWeightRegularSize(12),JobsBlueColor)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            })
            .onLongPressGestureBy(^(id data){
            JobsLog(@"");
            });
        [_findCodeBtn buttonAutoWidthByFont];
        [self addSubview:_findCodeBtn];
        [_findCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            JobsAppDoorInputViewBaseStyle *inputView = (JobsAppDoorInputViewBaseStyle *)self.loginDoorInputViewBaseStyleMutArr.lastObject;
            make.right.equalTo(inputView).offset(-JobsWidth(20));
            make.top.equalTo(inputView.mas_bottom).offset(JobsWidth(20));
        }];
    }return _findCodeBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)loginDoorInputViewBaseStyleModelMutArr{
    if (!_loginDoorInputViewBaseStyleModelMutArr) {
        _loginDoorInputViewBaseStyleModelMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            JobsAppDoorInputViewBaseStyleModel *用户名 = JobsAppDoorInputViewBaseStyleModel.new;
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 用户名) {
                用户名.leftViewIMG = JobsIMG(@"用户名称");
                用户名.placeholder = @"用户名";
                用户名.isShowDelBtn = YES;
                用户名.isShowSecurityBtn = NO;
                用户名.returnKeyType = UIReturnKeyDone;
                用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
                用户名.leftViewMode = UITextFieldViewModeAlways;
            }));
            data.add(jobsMakeAppDoorInputViewBaseStyleModel(^(JobsAppDoorInputViewBaseStyleModel * _Nullable 密码) {
                密码.leftViewIMG = JobsIMG(@"Lock");
                密码.placeholder = @"密码";
                密码.isShowDelBtn = YES;
                密码.isShowSecurityBtn = YES;
                密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
                密码.unSelectedSecurityBtnIMG =JobsIMG(@"codeDecode");//开眼
                密码.returnKeyType = UIReturnKeyDone;
                密码.keyboardAppearance = UIKeyboardAppearanceAlert;
                密码.leftViewMode = UITextFieldViewModeAlways;
            }));
        });
    }return _loginDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)loginDoorInputViewBaseStyleMutArr{
    if (!_loginDoorInputViewBaseStyleMutArr) {
        _loginDoorInputViewBaseStyleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            
        });
    }return _loginDoorInputViewBaseStyleMutArr;
}

@end
