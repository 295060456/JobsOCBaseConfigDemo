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
@property(nonatomic,strong)NSMutableArray <JobsRichTextConfig *>*JobsRichTextConfigMutArr;
```

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
                                     longPressGestureEventBlock:^(id _Nullable weakSelf,
                                                                  id _Nullable arg) {
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

```objective-c
-(NSMutableArray<NSString *> *)richTextMutArr{
   if (!_richTextMutArr) {
       _richTextMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
           data.add(JobsInternationalization(@"观看完整教学视频需支付"));
           data.add(JobsInternationalization(@"99"));
           data.add(JobsInternationalization(@"Mata值"));
       });
   }return _richTextMutArr;
}

-(NSMutableArray<JobsRichTextConfig *> *)JobsRichTextConfigMutArr{
   if (!_JobsRichTextConfigMutArr) {
       @jobs_weakify(self)
       _JobsRichTextConfigMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
           data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
               @jobs_strongify(self)
               data1.font = UIFontWeightRegularSize(14);
               data1.textCor = JobsCor(@"#666666");
               data1.targetString = self.richTextMutArr[0];
               data1.paragraphStyle = self.jobsParagraphStyleCenter;
           }));
           data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
               @jobs_strongify(self)
               data1.font = UIFontWeightRegularSize(14);
               data1.textCor = JobsCor(@"#BA9B77");
               data1.targetString = self.richTextMutArr[1];
               data1.paragraphStyle = self.jobsParagraphStyleCenter;
           }));
           data.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data1) {
               @jobs_strongify(self)
               data1.font = UIFontWeightRegularSize(14);
               data1.textCor = JobsCor(@"#666666");
               data1.targetString = self.richTextMutArr[2];
               data1.paragraphStyle = self.jobsParagraphStyleCenter;
           }));
       });
   }return _JobsRichTextConfigMutArr;
}
```

