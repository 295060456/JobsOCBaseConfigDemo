# JhtBanner 的使用方式

```objective-c
-(JhtBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [[JhtBannerView alloc] initWithFrame:CGRectMake([NSObject measureSubview:JobsMainScreen_WIDTH() * 2 / 3 superview:JobsMainScreen_WIDTH()],
                                                                      JobsMainScreen_HEIGHT() - 98,
                                                                      JobsMainScreen_WIDTH() * 2 / 3,
                                                                      40)];
				_bannerView.JhtBannerCardViewSize = CGSizeMake(JobsMainScreen_WIDTH() * 2 / 9, 40);
        [self.view addSubview:_bannerView];
        // 假数据
        NSArray *array = @[@"拍摄 1 分钟",
                           @"拍摄 3 分钟",
                           @"拍摄 5 分钟",
                           @"拍摄 7 分钟",
                           @"拍摄 10 分钟"
                           ];
    
        [_bannerView setDataArr:array];//这个时候就设置了 UIPageControl
        _bannerView.bannerView.pageControl.hidden = YES;
        _bannerView.bannerView.isOpenAutoScroll = NO;
        
        [_bannerView.bannerView reloadData];
        
        @jobs_weakify(self)
        /** 滚动ScrollView内部卡片 */
        [_bannerView scrollViewIndex:^(id data) {
            @jobs_strongify(self)
        }];
        /** 点击ScrollView内部卡片 */
        [_bannerView clickScrollViewInsideCardView:^(id data) {
//            @jobs_strongify(self)
        }];
//
    }return _bannerView;
}
```



