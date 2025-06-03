# UIButton+UI

## 一、创建调用

### 1、<font color=red>**推荐用以下这两个**</font>。在自建APi之上再进行封装一层，更加的简洁

```objective-c
 -(UIButton *)mailBtn{
     if(!_mailBtn){
         @jobs_weakify(self)
         _mailBtn = BaseButton.jobsInit()
             .imageURL(@"".jobsUrl)
             .placeholderImage(JobsIMG(@"用户默认头像"))
             .options(SDWebImageRefreshCached)/// 强制刷新缓存
             .completed(^(UIImage * _Nullable image,
                          NSError * _Nullable error,
                          SDImageCacheType cacheType,
                          NSURL * _Nullable imageURL) {
                 if (error) {
                     JobsLog(@"图片加载失败: %@-%@", error,imageURL);
                 } else {
                     JobsLog(@"图片加载成功");
                 }
             }).onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 if (self.objBlock) self.objBlock(x);
             }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }).bgNormalLoad();
     }return _mailBtn;
 }
```

```objective-c
 -(UIButton *)valueBtn{
     if(!_valueBtn){
         @jobs_weakify(self)
         _valueBtn = BaseButton.jobsInit()
                          .bgColorBy(JobsWhiteColor)
                          .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                          .jobsResetImagePadding(1)
                          .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
                          .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
                          .jobsResetBtnTitleCor(JobsWhiteColor)
                          .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                          .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
                          .onClickBy(^(UIButton *x){
                              JobsLog(@"");
                          }).onLongPressGestureBy(^(id data){
                              JobsLog(@"");
                          });
     }return _valueBtn;
 }
```

```objective-c
 -(UIButton *)usrNameBtn{
     if(!_usrNameBtn){
         @jobs_weakify(self)
         _usrNameBtn = self.masonryBy(UIButton.jobsInit()
                                       .bgColorBy(JobsWhiteColor)
                                       .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
                                       .jobsResetImagePadding(1)
                                       .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
                                       .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
                                       .jobsResetBtnTitleCor(JobsWhiteColor)
                                       .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
                                       .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
                                       .onClickBy(^(UIButton *x){
                                           JobsLog(@"");
                                       }).onLongPressGestureBy(^(id data){
                                           JobsLog(@"");
                                       }),^(MASConstraintMaker *_Nonnull make){
             @jobs_strongify(self)
             make.top.equalTo(self.headIMGV);
             make.left.equalTo(self.headIMGV.mas_right).offset(JobsWidth(10));
             make.height.mas_equalTo(JobsWidth(16));
         });
         _usrNameBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
     }return _usrNameBtn;
 }
```

```objective-c
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         @jobs_weakify(self)
         _applyNowBtn = BaseButton.initByAttributedString(self.richTextWithDataConfigMutArr(jobsMakeMutArr(^(__kindof NSMutableArray <__kindof JobsRichTextConfig *>* _Nullable data) {
             data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[0];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }))
             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#BA9B77");
                 data1.targetString = self.richTextMutArr[1];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }))
             .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
                 @jobs_strongify(self)
                 data1.font = UIFontWeightRegularSize(14);
                 data1.textCor = JobsCor(@"#666666");
                 data1.targetString = self.richTextMutArr[2];
                 data1.paragraphStyle = self.jobsParagraphStyleCenter;
             }));
         }))).bgColorBy(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClickBy(^(UIButton *x){
                 @jobs_strongify(self)
                 x.selected = !x.selected;
                 if (self.objBlock) self.objBlock(x);
             }).onLongPressGestureBy(^(id data){
                 JobsLog(@"");
             });
     }return _applyNowBtn;
 }
```

```objective-c
 -(BaseButton *)registerBtn{
     if(!_registerBtn){
         _registerBtn = BaseButton.initByTextModel(jobsMakeTextModel(^(__kindof UITextModel * _Nullable data) {
             data.text = JobsInternationalization(@"REGISTER");
             data.textCor = JobsCor(@"#C90000");
             data.font = bayonRegular(JobsWidth(15));
         }))
         .bgColorBy(JobsWhiteColor)
         .onClickBy(^(UIButton *x){
             JobsLog(@"");
         }).onLongPressGestureBy(^(id data){
             JobsLog(@"");
         }).setLayerBy((jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
             data.layerCor = JobsCor(@"#C90000");
             data.jobsWidth = 1;
             data.cornerRadiusValue = JobsWidth(8);
         })));
     }return _registerBtn;
 }
```

```objective-c
-(BaseButton *)playBtn{
    if(!_playBtn){
        _playBtn = BaseButton.initByStyle3(title,
                                  nil,
                                  JobsBlackColor,
                                  JobsIMG(@"弹窗取消按钮背景图"))
        .bgColorBy(JobsWhiteColor)
        .cornerRadiusValueBy(buttonModel.cornerRadiusValueBy)
        .onClickBy(^(UIButton *btn){
            btn.selected = !btn.selected;
            btn.jobsResetBtnBgImage(btn.selected ? JobsIMG(@"弹窗取消按钮背景图") : JobsIMG(@"弹窗取消按钮背景图"));
            
            btn.jobsResetBtnLayerBorderCor(HEXCOLOR(0xAE8330));/// 重设Btn的描边线段的颜色
            btn.jobsResetBtnLayerBorderWidth(0.5f);/// 重设Btn的描边线段的宽度
            btn.jobsResetBtnCornerRadiusValue(JobsWidth(8));/// 重设Btn的圆切角
            
        }).onLongPressGestureBy(^(id data){
            JobsLog(@"");
        })
        .layerByBorderCor(HEXCOLOR(0xAE8330))
        .layerByBorderWidth(0.5f)
        .cornerCutToCircleWithCornerRadius(JobsWidth(8));
        self.contentView.addSubview(_playBtn);
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(16), JobsWidth(16)));
            make.center.equalTo(self.contentView);
        }];
    }return _playBtn;
}
```

### 2、自建APi。特别的冗长，不利于阅读和使用（不推荐）

* <span style="color:red; font-weight:bold;">警告：</span>一旦采用**UIButtonConfiguration**创建的UIButton，其他用老式Api创建的UIButton会全部出现异常（例如：title不显示）因为全部渲染走**UIButtonConfiguration**。但是**UIButtonConfiguration**会很方便我们应对富文本的需求。

```objective-c
-(BaseButton *)titleBtn{
   if(!_titleBtn){
       @jobs_weakify(self)
       _titleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                     buttonConfigTitleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    jobsResetBtnImage:nil
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
                                       highlightBackgroundImage:nil
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
                                                       selected:data.jobsSelected
                                                  primaryAction:nil
                                     longPressGestureEventBlock:^(__kindof UIButton *x) {
           JobsLog(@"按钮的长按事件触发");
           return nil;
       }
                                                clickEventBlock:^id(BaseButton *x){
           @jobs_strongify(self)
           if (self.objBlock) self.objBlock(x);
           return nil;
       }];
       [self addSubview:_titleBtn];
       [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.height.mas_equalTo(JobsWidth(72));
           make.top.equalTo(self).offset(JobsWidth(20));
           make.centerX.equalTo(self);
       }];
       _titleBtn.makeBtnTitleByShowingType(UILabelShowingType_03);
   }return _titleBtn;
}
```

## 其他

*  这些对齐方式可用于控制按钮内部文本和图像在按钮内的水平位置

```objective-c
 UIControlContentHorizontalAlignment 是一个枚举类型，用于定义控件中内容（例如文字或图像）在水平方向上的对齐方式。
 这个枚举通常用于控制UIButton等UI控件中内容的水平对齐方式。

 以下是UIControlContentHorizontalAlignment枚举的常见值和它们的含义：
 UIControlContentHorizontalAlignmentLeft：内容水平左对齐。
 UIControlContentHorizontalAlignmentCenter：内容水平居中对齐。
 UIControlContentHorizontalAlignmentRight：内容水平右对齐。
 UIControlContentHorizontalAlignmentFill：内容水平填充整个控件的宽度，通常用于将内容拉伸以填满整个控件。
```

*例如，你可以将按钮的内容水平居中对齐，以确保文本或图像在按钮的中心位置。*

* *调用示例*

```objective-c
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
 // 设置内容水平居中对齐
button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
```









