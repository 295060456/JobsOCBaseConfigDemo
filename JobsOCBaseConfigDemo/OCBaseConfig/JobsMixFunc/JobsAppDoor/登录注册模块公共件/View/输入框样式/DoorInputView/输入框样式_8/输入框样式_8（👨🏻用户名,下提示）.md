#  输入框样式_8

```
    -(NSMutableArray<JobsAppDoorInputViewBaseStyle_8 *> *)inputViewMutArr{
        if (!_inputViewMutArr) {
            _inputViewMutArr = NSMutableArray.array;
            
            for (JobsAppDoorInputViewBaseStyleModel *model in self.dataMutArr) {
                JobsAppDoorInputViewBaseStyle_8 *inputView = JobsAppDoorInputViewBaseStyle_8.new;
                @jobs_weakify(self)
                [inputView actionObjBlock:^(UITextField *data) {
                    JobsAppDoorInputViewTFModel *textFieldInputModel = (JobsAppDoorInputViewTFModel *)data.requestParams;
                    @jobs_strongify(self)
                    if ([textFieldInputModel.PlaceHolder isEqualToString:@"User".tr]) {
                        self.account = textFieldInputModel.resString;
                    }else if ([textFieldInputModel.PlaceHolder isEqualToString:@"Code".tr]){
                        self.confirmPassword = textFieldInputModel.resString;
                    }else if ([textFieldInputModel.PlaceHolder isEqualToString:@"Confirm".tr]){
                        self.password = textFieldInputModel.resString;
                    }else if ([textFieldInputModel.PlaceHolder isEqualToString:@"Telephone Number (optional)".tr]){
                        self.phone = textFieldInputModel.resString;
                    }else{}
                }];
                
                inputView.jobsRichViewByModel(model);
                
                [self.view addSubview:inputView];
                [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(JobsAppDoorInputViewBaseStyle_8.viewSizeByModel(nil));
                    make.centerX.equalTo(self.view);
                    
                    NSInteger index = [self.dataMutArr indexOfObject:model];
                    if (index) {
                        JobsAppDoorInputViewBaseStyle_8 *InputView = (JobsAppDoorInputViewBaseStyle_8 *)self.inputViewMutArr.lastObject;
                        make.top.equalTo(InputView.mas_bottom).offset(JobsWidth(10));
                    }else{
                        make.top.equalTo(self.navigationBar.mas_bottom).offset(JobsWidth(10));
                    }
                }];
                
                [self.inputViewMutArr addObject:inputView];
            }
            
        }return _inputViewMutArr;
    }

```
