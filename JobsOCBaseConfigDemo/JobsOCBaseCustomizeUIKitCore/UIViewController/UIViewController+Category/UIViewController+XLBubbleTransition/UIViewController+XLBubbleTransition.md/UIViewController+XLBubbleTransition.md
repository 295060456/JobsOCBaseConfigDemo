# UIViewController+XLBubbleTransition
## 转场动画的使用方法

```objective-c
self.xl_pushTranstion = [XLBubbleTransition transitionWithAnchorRect:self.postBtn.frame];
self.xl_popTranstion = [XLBubbleTransition transitionWithAnchorRect:self.postBtn.frame];
```

```objective-c
-(JobsSuspendBtn *)postBtn{
    if (!_postBtn) {
        _postBtn = JobsSuspendBtn.new;
        _postBtn.backgroundColor = JobsClearColor;
        [_postBtn setImage:JobsIMG(@"编辑")
                  forState:UIControlStateNormal];
        _postBtn.isAllowDrag = NO;//悬浮效果必须要的参数
        @jobs_weakify(self)
        self.view.vc = weak_self;
        [self.view addSubview:_postBtn];
        _postBtn.frame = CGRectMake(JobsMainScreen_WIDTH() - 43 - 34,
                                    JobsMainScreen_HEIGHT() - 84 - 34 - TabBarHeight() - BottomSafeAreaHeight(),
                                    34,
                                    34);
        [[_postBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof JobsSuspendBtn * _Nullable x) {
            @jobs_strongify(self)
            [UIViewController comingFromVC:self
                                      toVC:DDPostVC.new
                               comingStyle:ComingStyle_PUSH
                         presentationStyle:UIModalPresentationFullScreen//UIDevice.currentDevice.systemVersion.doubleValue >= 13.0 ? UIModalPresentationAutomatic : UIModalPresentationFullScreen
                             requestParams:nil
                  hidesBottomBarWhenPushed:YES
                                  animated:YES
                                   success:^(id data) {

            }];
        }];
    }return _postBtn;
}
```

