# GDFadeView

```objective-c
self.addSubview(jobsMakeGDFadeView(^(__kindof GDFadeView * _Nullable view) {
    view.frame = CGRectMake(0, 0, JobsMainScreen_WIDTH(), 40);
    view.text = @"伟易博".tr;
    view.foreColor = JobsRedColor;
    view.backColor = JobsGrayColor;
    view.font = UIFontWeightRegularSize(JobsWidth(39));
    view.alignment = NSTextAlignmentCenter;
    view.center = CGPointMake(JobsMainScreen_WIDTH()/2, 64+100);
}).iPhoneFadeWithDuration(2));
```

