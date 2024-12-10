# UIButton+UI

## 一、创建调用

### 1、<font color=red>**推荐用以下这两个**</font>。在自建APi之上再进行封装一层，更加的简洁

```objective-c
 -(BaseButton *)applyNowBtn{
     if(!_applyNowBtn){
         _applyNowBtn = BaseButton.jobsInit()
             .bgColor(JobsWhiteColor)
             .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
             .jobsResetImagePadding(1)
             .jobsResetBtnImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnBgImage(JobsIMG(@"APPLY NOW"))
             .jobsResetBtnTitleCor(JobsWhiteColor)
             .titleFont(UIFontWeightBoldSize(JobsWidth(12)))
             .jobsResetBtnTitle(JobsInternationalization(@"APPLY NOW"))
             .onClick(^(UIButton *x){
                 NSLog(@"");
             }).onLongPressGesture(^(id data){
                 NSLog(@"");
             });
         [self.bgImageView addSubview:_applyNowBtn];
         [_applyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.size.mas_equalTo(CGSizeMake(JobsWidth(99), JobsWidth(29)));
             make.right.equalTo(self.view).offset(JobsWidth(-166));
             make.bottom.equalTo(self.view).offset(JobsWidth(-127));
         }];
     }return _applyNowBtn;
 }
```

```objective-c
-(BaseButton *)playBtn{
    if(!_playBtn){
        _playBtn = BaseButton.initByStyle3(title,
                                  nil,
                                  JobsBlackColor,
                                  JobsIMG(@"弹窗取消按钮背景图"))
        .bgColor(JobsWhiteColor)
        .cornerRadiusValue(buttonModel.cornerRadiusValue)
        .onClick(^(UIButton *btn){
            btn.selected = !btn.selected;
            btn.jobsResetBtnBgImage(btn.selected ? JobsIMG(@"弹窗取消按钮背景图") : JobsIMG(@"弹窗取消按钮背景图"));
            
            btn.jobsResetBtnLayerBorderCor(HEXCOLOR(0xAE8330));/// 重设Btn的描边线段的颜色
            btn.jobsResetBtnLayerBorderWidth(0.5f);/// 重设Btn的描边线段的宽度
            btn.jobsResetBtnCornerRadiusValue(JobsWidth(8));/// 重设Btn的圆切角
            
        }).onLongPressGesture(^(id data){
            NSLog(@"");
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
                                     longPressGestureEventBlock:^(__kindof UIButton *x) {
           NSLog(@"按钮的长按事件触发");
           return nil;
       }
                                                clickEventBlock:^id(BaseButton *x){
           @jobs_strongify(self)
           if (self.objectBlock) self.objectBlock(x);
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









