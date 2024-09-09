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
@property(nonatomic,strong)BaseButton *toRegisterBtn;/// 去注册
@property(nonatomic,strong)UILabel *titleLab;/// 标题
@property(nonatomic,strong)BaseButton *abandonLoginBtn;/// 返回首页按钮
@property(nonatomic,strong)BaseButton *sendBtn;/// 登录
@property(nonatomic,strong)BaseButton *storeCodeBtn;/// 记住密码
@property(nonatomic,strong)BaseButton *findCodeBtn;/// 忘记密码
/// Data
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*loginDoorInputViewBaseStyleModelMutArr;
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyle *>*loginDoorInputViewBaseStyleMutArr;

@end

@implementation JobsAppDoorLoginContentView

- (void)dealloc {
    NSLog(@"%@",JobsLocalFunc);
}
#pragma mark - Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = Cor1;
        @jobs_weakify(self)
        [self addNotificationName:@"textFieldTag"
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            NSNotification *notification = (NSNotification *)arg;
            if([notification.object isKindOfClass:UITextField.class]){
                UITextField *b = notification.object;
                NSLog(@"木头 = %@",b.requestParams);
            }
            NSLog(@"通知传递过来的 = %@",notification.object);
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
        inputView.jobsRichElementsInViewWithModel(self.loginDoorInputViewBaseStyleModelMutArr[i]);
        @jobs_weakify(self)
        [inputView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(data);//data：监测输入字符回调 和 激活的textField
        }];

        [self addSubview:inputView];
        inputView.Size = CGSizeMake(self.width - self.toRegisterBtn.width - JobsWidth(40), ThingsHeight);
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
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
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
        _toRegisterBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                           background:nil
                                           buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                        textAlignment:NSTextAlignmentCenter
                                                     subTextAlignment:NSTextAlignmentCenter
                                                          normalImage:JobsIMG(@"用户名称")
                                                       highlightImage:nil
                                                      attributedTitle:nil
                                              selectedAttributedTitle:nil
                                                   attributedSubtitle:nil
                                                                title:Title2
                                                             subTitle:nil
                                                            titleFont:UIFontWeightMediumSize(13)
                                                         subTitleFont:nil
                                                             titleCor:nil
                                                          subTitleCor:nil
                                                   titleLineBreakMode:NSLineBreakByWordWrapping
                                                subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                  baseBackgroundColor:JobsBlackColor
                                                      backgroundImage:nil
                                                         imagePadding:JobsWidth(8)
                                                         titlePadding:JobsWidth(0)
                                                       imagePlacement:NSDirectionalRectEdgeTop
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
            [self endEditing:YES];
            if (self.objectBlock) self.objectBlock(x);
            return nil;
        }];
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
        _titleLab = UILabel.new;
        _titleLab.text = Title7;
        _titleLab.textColor = JobsWhiteColor;
        _titleLab.font = [UIFont systemFontOfSize:JobsWidth(20)
                                           weight:UIFontWeightRegular];
        [_titleLab sizeToFit];
        [self addSubview:_titleLab];
        _titleLab.centerX = (self.width - self.toRegisterBtn.width) / 2;
        _titleLab.top = JobsWidth(20);
    }return _titleLab;
}

-(UIButton *)abandonLoginBtn{
    if (!_abandonLoginBtn) {
        @jobs_weakify(self)
        _abandonLoginBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                             background:nil
                                             buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                          textAlignment:NSTextAlignmentCenter
                                                       subTextAlignment:NSTextAlignmentCenter
                                                            normalImage:nil
                                                         highlightImage:nil
                                                        attributedTitle:nil
                                                selectedAttributedTitle:nil
                                                     attributedSubtitle:nil
                                                                  title:Title4
                                                               subTitle:nil
                                                              titleFont:UIFontWeightSemiboldSize(15)
                                                           subTitleFont:nil
                                                               titleCor:JobsWhiteColor
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
            return nil;
        }];
        [_abandonLoginBtn buttonAutoWidthByFont];
        [self addSubview:_abandonLoginBtn];
        [_abandonLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.titleLab);
            make.height.mas_equalTo(JobsWidth(15));
            make.bottom.mas_equalTo(self).offset(-JobsWidth(30));
        }];
    }return _abandonLoginBtn;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                     buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:nil
                                                 highlightImage:nil
                                                attributedTitle:nil
                                        selectedAttributedTitle:nil
                                             attributedSubtitle:nil
                                                          title:Title7
                                                       subTitle:nil
                                                      titleFont:UIFontWeightSemiboldSize(15)
                                                   subTitleFont:nil
                                                       titleCor:JobsWhiteColor
                                                    subTitleCor:nil
                                             titleLineBreakMode:NSLineBreakByWordWrapping
                                          subtitleLineBreakMode:NSLineBreakByWordWrapping
                                            baseBackgroundColor:[JobsSystemPinkColor colorWithAlphaComponent:0.7]
                                                backgroundImage:nil
                                                   imagePadding:JobsWidth(0)
                                                   titlePadding:JobsWidth(0)
                                                 imagePlacement:NSDirectionalRectEdgeNone
                                     contentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter
                                       contentVerticalAlignment:UIControlContentVerticalAlignmentCenter
                                                  contentInsets:jobsSameDirectionalEdgeInsets(0)
                                              cornerRadiusValue:ThingsHeight / 2
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
            toast(x.titleForNormalState);
            return nil;
        }];
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
-(UIButton *)storeCodeBtn{
    if (!_storeCodeBtn) {
        @jobs_weakify(self)
        _storeCodeBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                          background:nil
                                          buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                       textAlignment:NSTextAlignmentCenter
                                                    subTextAlignment:NSTextAlignmentCenter
                                                         normalImage:JobsIMG(@"没有记住密码")
                                                      highlightImage:nil
                                                     attributedTitle:nil
                                             selectedAttributedTitle:nil
                                                  attributedSubtitle:nil
                                                               title:Title5
                                                            subTitle:nil
                                                           titleFont:UIFontWeightRegularSize(12)
                                                        subTitleFont:nil
                                                            titleCor:JobsWhiteColor
                                                         subTitleCor:nil
                                                  titleLineBreakMode:NSLineBreakByWordWrapping
                                               subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                 baseBackgroundColor:nil
                                                     backgroundImage:nil
                                                        imagePadding:JobsWidth(3)
                                                        titlePadding:JobsWidth(0)
                                                      imagePlacement:NSDirectionalRectEdgeLeading
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
            x.selected ? x.jobsResetBtnImage(JobsIMG(@"记住密码")) : x.jobsResetBtnImage(JobsIMG(@"没有记住密码"));
            return nil;
        }];
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

-(UIButton *)findCodeBtn{
    if (!_findCodeBtn) {
        @jobs_weakify(self)
        _findCodeBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                         background:nil
                                         buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                      textAlignment:NSTextAlignmentCenter
                                                   subTextAlignment:NSTextAlignmentCenter
                                                        normalImage:nil
                                                     highlightImage:nil
                                                    attributedTitle:nil
                                            selectedAttributedTitle:nil
                                                 attributedSubtitle:nil
                                                              title:Title3
                                                           subTitle:nil
                                                          titleFont:UIFontWeightRegularSize(12)
                                                       subTitleFont:nil
                                                           titleCor:Title3
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
            return nil;
        }];
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
        _loginDoorInputViewBaseStyleModelMutArr = NSMutableArray.array;
        
        JobsAppDoorInputViewBaseStyleModel *用户名 = JobsAppDoorInputViewBaseStyleModel.new;
        用户名.leftViewIMG = JobsIMG(@"用户名称");
        用户名.placeHolderStr = @"用户名";
        用户名.isShowDelBtn = YES;
        用户名.isShowSecurityBtn = NO;
        用户名.returnKeyType = UIReturnKeyDone;
        用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
        用户名.leftViewMode = UITextFieldViewModeAlways;
        [_loginDoorInputViewBaseStyleModelMutArr addObject:用户名];
        
        JobsAppDoorInputViewBaseStyleModel *密码 = JobsAppDoorInputViewBaseStyleModel.new;
        密码.leftViewIMG = JobsIMG(@"Lock");
        密码.placeHolderStr = @"密码";
        密码.isShowDelBtn = YES;
        密码.isShowSecurityBtn = YES;
        密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
        密码.unSelectedSecurityBtnIMG =JobsIMG(@"codeDecode");//开眼
        密码.returnKeyType = UIReturnKeyDone;
        密码.keyboardAppearance = UIKeyboardAppearanceAlert;
        密码.leftViewMode = UITextFieldViewModeAlways;
        [_loginDoorInputViewBaseStyleModelMutArr addObject:密码];
        
    }return _loginDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)loginDoorInputViewBaseStyleMutArr{
    if (!_loginDoorInputViewBaseStyleMutArr) {
        _loginDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    }return _loginDoorInputViewBaseStyleMutArr;
}

@end
