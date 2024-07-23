# UIButton+UI

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

```objective-c
@property(nonatomic,strong)BaseButton *titleBtn;
@property(nonatomic,strong)NSMutableArray <NSString *>*richTextMutArr;
@property(nonatomic,strong)NSMutableArray <RichTextConfig *>*richTextConfigMutArr;
```

* <span style="color:red; font-weight:bold;">警告：</span>一旦采用**UIButtonConfiguration**创建的UIButton，其他用老式Api创建的UIButton会全部出现异常（例如：title不显示）因为全部渲染走**UIButtonConfiguration**。但是**UIButtonConfiguration**会很方便我们应对富文本的需求。

```objective-c
-(BaseButton *)titleBtn{
   if(!_titleBtn){
       @jobs_weakify(self)
       _titleBtn = [BaseButton.alloc jobsInitBtnByConfiguration:nil
                                                     background:nil
                                                 titleAlignment:UIButtonConfigurationTitleAlignmentAutomatic
                                                  textAlignment:NSTextAlignmentCenter
                                               subTextAlignment:NSTextAlignmentCenter
                                                    normalImage:nil
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
                                     longPressGestureEventBlock:^(id  _Nullable weakSelf,
                                                                  id  _Nullable arg) {
           NSLog(@"按钮的长按事件触发");
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
       _titleBtn.makeBtnLabelByShowingType(UILabelShowingType_03);
   }return _titleBtn;
}
```

```objective-c
-(NSMutableArray<NSString *> *)richTextMutArr{
   if (!_richTextMutArr) {
       _richTextMutArr = NSMutableArray.array;
       [_richTextMutArr addObject:JobsInternationalization(@"观看完整教学视频需支付")];
       [_richTextMutArr addObject:JobsInternationalization(@"99")];
       [_richTextMutArr addObject:JobsInternationalization(@"Mata值")];
   }return _richTextMutArr;
}

-(NSMutableArray<RichTextConfig *> *)richTextConfigMutArr{
   if (!_richTextConfigMutArr) {
       _richTextConfigMutArr = NSMutableArray.array;
       {
           RichTextConfig *config_01 = RichTextConfig.new;
           config_01.font = UIFontWeightRegularSize(14);
           config_01.textCor = JobsCor(@"#666666");
           config_01.targetString = self.richTextMutArr[0];
           config_01.paragraphStyle = self.jobsParagraphStyleCenter;
           [_richTextConfigMutArr addObject:config_01];
       }

       {
           RichTextConfig *config_02 = RichTextConfig.new;
           config_02.font = UIFontWeightRegularSize(14);
           config_02.textCor = JobsCor(@"#BA9B77");
           config_02.targetString = self.richTextMutArr[1];
           config_02.paragraphStyle = self.jobsParagraphStyleCenter;
           [_richTextConfigMutArr addObject:config_02];
       }

       {
           RichTextConfig *config_03 = RichTextConfig.new;
           config_03.font = UIFontWeightRegularSize(14);
           config_03.textCor = JobsCor(@"#666666");
           config_03.targetString = self.richTextMutArr[2];
           config_03.paragraphStyle = self.jobsParagraphStyleCenter;
           [_richTextConfigMutArr addObject:config_03];
       }
   }return _richTextConfigMutArr;
}
```

