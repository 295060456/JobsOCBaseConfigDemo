//
//  RegisterContentView.m
//  Shooting
//
//  Created by Jobs on 2020/9/3.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "JobsAppDoorRegisterContentView.h"

@class JobsAppDoorDoorInputViewBaseStyle;

@interface JobsAppDoorRegisterContentView ()
/// UI
@property(nonatomic,strong)BaseButton *backToLoginBtn;// 返回登录
@property(nonatomic,strong)UILabel *titleLab;// 标题
@property(nonatomic,strong)BaseButton *sendBtn;// 注册按钮
/// Data
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyleModel *>*registerDoorInputViewBaseStyleModelMutArr;
@property(nonatomic,strong)NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;

@end

@implementation JobsAppDoorRegisterContentView

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
            }NSLog(@"通知传递过来的 = %@",notification.object);
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
#pragma mark —— JobsDoorInputViewProtocol
-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)getAppDoorInputViewBaseStyle{
    return self.registerDoorInputViewBaseStyleMutArr;
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock)jobsRichElementsInViewWithModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.backToLoginBtn.alpha = 0.7f;
        self.titleLab.alpha = 1;
        [self makeInputView];
        self.sendBtn.alpha = 1;
    };
}
#pragma mark —— 一些私有化方法
-(void)makeInputView{
    for (int i = 0; i < self.registerDoorInputViewBaseStyleModelMutArr.count; i++) {
        JobsAppDoorInputViewBaseStyle *inputViewBaseStyle = nil;
        {
            if (i == 0 || i == 1 || i == 2) {
                inputViewBaseStyle = [self dk:JobsAppDoorInputViewBaseStyle_3.class];
            }else if (i == 3){
                inputViewBaseStyle = [self dk:JobsAppDoorInputViewBaseStyle_1.class];
            }else if (i == 4){
                inputViewBaseStyle = [self dk:JobsAppDoorInputViewBaseStyle_4.class];
            }
            
        }
        inputViewBaseStyle.jobsRichElementsInViewWithModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);//进数据
        [self addSubview:inputViewBaseStyle];
        inputViewBaseStyle.Size = CGSizeMake(self.width - RegisterBtnWidth - JobsWidth(40), ThingsHeight);
        inputViewBaseStyle.centerX = self.titleLab.centerX;
        if (i == 0) {
            inputViewBaseStyle.top = self.titleLab.bottom + JobsWidth(20);//20是偏移量
        }else{
            if (self.registerDoorInputViewBaseStyleMutArr.count > i) {
                JobsAppDoorInputViewBaseStyle_3 *lastObj = (JobsAppDoorInputViewBaseStyle_3 *)self.registerDoorInputViewBaseStyleMutArr[i - 1];
                inputViewBaseStyle.top = lastObj.bottom + InputViewOffset;
            }
        }
        inputViewBaseStyle.layer.cornerRadius = ThingsHeight / 2;
    }
}

-(JobsAppDoorInputViewBaseStyle *)dk:(Class)cls{
    if ([cls isSubclassOfClass:JobsAppDoorInputViewBaseStyle.class]) {
        JobsAppDoorInputViewBaseStyle *inputView = cls.new;
        [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
        @jobs_weakify(self)
        [inputView actionObjectBlock:^(id data) {
            @jobs_strongify(self)
            if (self.objectBlock) self.objectBlock(data);
        }];return inputView;
    }return nil;
}
#pragma mark —— lazyLoad
-(BaseButton *)backToLoginBtn{
    if (!_backToLoginBtn) {
        @jobs_weakify(self)
        _backToLoginBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                            background:nil
                                            buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                         textAlignment:NSTextAlignmentCenter
                                                      subTextAlignment:NSTextAlignmentCenter
                                                           normalImage:JobsIMG(@"用户名称")
                                                        highlightImage:nil
                                                       attributedTitle:nil
                                               selectedAttributedTitle:nil
                                                    attributedSubtitle:nil
                                                                 title:Title1
                                                              subTitle:nil
                                                             titleFont:UIFontWeightMediumSize(13)
                                                          subTitleFont:nil
                                                              titleCor:nil
                                                           subTitleCor:nil
                                                    titleLineBreakMode:NSLineBreakByWordWrapping
                                                 subtitleLineBreakMode:NSLineBreakByWordWrapping
                                                   baseBackgroundColor:Cor1
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
            if (self.objectBlock) self.objectBlock(x);
            [self endEditing:YES];
            return nil;
        }];
        _backToLoginBtn.titleLabel.numberOfLines = 0;
        [self addSubview:_backToLoginBtn];
        [_backToLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
            make.width.mas_equalTo(btnWidth);
        }];
        [self layoutIfNeeded];
    }return _backToLoginBtn;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = UILabel.new;
        _titleLab.text = Title6;
        _titleLab.textColor = JobsWhiteColor;
        _titleLab.font = UIFontWeightRegularSize(20);
        [_titleLab sizeToFit];
        [self addSubview:_titleLab];
        _titleLab.centerX = (self.width + self.backToLoginBtn.width) / 2;
        _titleLab.top = 20;
    }return _titleLab;
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
                                                          title:Title6
                                                       subTitle:nil
                                                      titleFont:UIFontWeightRegularSize(16)
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
        [_sendBtn buttonAutoWidthByFont];
        _sendBtn.x = self.backToLoginBtn.width + JobsWidth(20);
        _sendBtn.Size = CGSizeMake(self.width - self.backToLoginBtn.width - JobsWidth(40), ThingsHeight);
        _sendBtn.bottom = JobsAppDoorContentViewRegisterHeight - JobsWidth(20);
        [self addSubview:_sendBtn];
    }return _sendBtn;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyleModel *> *)registerDoorInputViewBaseStyleModelMutArr{
    if (!_registerDoorInputViewBaseStyleModelMutArr) {
        _registerDoorInputViewBaseStyleModelMutArr = NSMutableArray.array;
        
        JobsAppDoorInputViewBaseStyleModel *用户名 = JobsAppDoorInputViewBaseStyleModel.new;
        用户名.leftViewIMG = JobsIMG(@"用户名称");
        用户名.placeHolderStr = @"用户名";
        用户名.isShowDelBtn = YES;
        用户名.isShowSecurityBtn = NO;
        用户名.returnKeyType = UIReturnKeyDone;
        用户名.keyboardAppearance = UIKeyboardAppearanceAlert;
        用户名.leftViewMode = UITextFieldViewModeAlways;
        [_registerDoorInputViewBaseStyleModelMutArr addObject:用户名];
        
        JobsAppDoorInputViewBaseStyleModel *密码 = JobsAppDoorInputViewBaseStyleModel.new;
        密码.leftViewIMG = JobsIMG(@"Lock");
        密码.placeHolderStr = @"密码";
        密码.isShowDelBtn = YES;
        密码.isShowSecurityBtn = YES;
        密码.returnKeyType = UIReturnKeyDone;
        密码.keyboardAppearance = UIKeyboardAppearanceAlert;
        密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
        密码.unSelectedSecurityBtnIMG = JobsIMG(@"codeDecode");//开眼
        密码.leftViewMode = UITextFieldViewModeAlways;
        [_registerDoorInputViewBaseStyleModelMutArr addObject:密码];
        
        JobsAppDoorInputViewBaseStyleModel *确认密码 = JobsAppDoorInputViewBaseStyleModel.new;
        确认密码.leftViewIMG = JobsIMG(@"Lock");
        确认密码.placeHolderStr = @"确认密码";
        确认密码.isShowDelBtn = YES;
        确认密码.isShowSecurityBtn = YES;
        确认密码.returnKeyType = UIReturnKeyDone;
        确认密码.keyboardAppearance = UIKeyboardAppearanceAlert;
        确认密码.selectedSecurityBtnIMG = JobsIMG(@"codeEncode");//闭眼
        确认密码.unSelectedSecurityBtnIMG =JobsIMG(@"codeDecode");//开眼
        确认密码.leftViewMode = UITextFieldViewModeAlways;
        [_registerDoorInputViewBaseStyleModelMutArr addObject:确认密码];
        
        JobsAppDoorInputViewBaseStyleModel *推广码 = JobsAppDoorInputViewBaseStyleModel.new;
        推广码.leftViewIMG = JobsIMG(@"推广码");
        推广码.placeHolderStr = @"手机验证码";
        推广码.isShowDelBtn = YES;
        推广码.isShowSecurityBtn = NO;
        推广码.returnKeyType = UIReturnKeyDone;
        推广码.keyboardAppearance = UIKeyboardAppearanceAlert;
        推广码.leftViewMode = UITextFieldViewModeAlways;
        [_registerDoorInputViewBaseStyleModelMutArr addObject:推广码];
        
        JobsAppDoorInputViewBaseStyleModel *图形验证码 = JobsAppDoorInputViewBaseStyleModel.new;
        图形验证码.leftViewIMG = JobsIMG(@"验证ICON");
        图形验证码.placeHolderStr = @"图形验证码";
        图形验证码.isShowDelBtn = YES;
        图形验证码.isShowSecurityBtn = NO;
        图形验证码.returnKeyType = UIReturnKeyDone;
        图形验证码.keyboardAppearance = UIKeyboardAppearanceAlert;
        图形验证码.leftViewMode = UITextFieldViewModeAlways;
        [_registerDoorInputViewBaseStyleModelMutArr addObject:图形验证码];
        
    }return _registerDoorInputViewBaseStyleModelMutArr;
}

-(NSMutableArray<JobsAppDoorInputViewBaseStyle *> *)registerDoorInputViewBaseStyleMutArr{
    if (!_registerDoorInputViewBaseStyleMutArr) {
        _registerDoorInputViewBaseStyleMutArr = NSMutableArray.array;
    }return _registerDoorInputViewBaseStyleMutArr;
}

@end
