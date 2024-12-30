#  输入框样式_1

```

    JobsAppDoorInputViewBaseStyle_1 *inputView = JobsAppDoorInputViewBaseStyle_1.new;
    doorInputViewBaseStyle = (JobsAppDoorInputViewBaseStyle *)inputView;
    [self addSubview:inputView];
    [self.registerDoorInputViewBaseStyleMutArr addObject:inputView];
    inputView.jobsRichViewByModel(self.registerDoorInputViewBaseStyleModelMutArr[i]);
    @jobs_weakify(self)
    [inputView actionObjBlock:^(id data) {
        @jobs_strongify(self)
        if ([data isKindOfClass:UITextField.class]) {
            UITextField *textField = (UITextField *)data;
            self.appDoorModel.verificationCode = textField.text;
            if (self.objBlock) self.objBlock(self.appDoorModel);
            [self allRise:data];
        }else if ([data isKindOfClass:UIButton.class]){
            [self getCellPhoneVerificationCodeWithCountry:nil
                                                    phone:self->inputView_7.getTextFieldValue];
        }else{}
    }];

```
