//
//  JobsWelcomeVC.m
//  Casino
//
//  Created by Jobs on 2021/12/15.
//

#import "JobsWelcomeVC.h"

@interface JobsWelcomeVC ()
// UI
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
// Data
@property(nonatomic,strong)NSMutableArray <NSString *>*dataMutArr;

@end

@implementation JobsWelcomeVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);;
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    {
        self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = JobsInternationalization(@"");
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsYellowColor;
    self.scrollView.jobsVisible = YES;
    self.pageControl.jobsVisible = YES;

    [self loadPhoto];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)loadPhoto{
    for (NSUInteger i = 0; i < self.dataMutArr.count; i++) {
        UIImageView * imageView = UIImageView.new;
        imageView.frame = CGRectMake(JobsMainScreen_WIDTH() * i, 0, JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT());
        //用SDWebImage下载图片
        NSString *imageName = JobsInternationalization(@"");
        if (i < 10) {
            imageName = [NSString stringWithFormat:@"启动页_0%lu",(unsigned long)i];
        }else{
            imageName = [NSString stringWithFormat:@"启动页_%ld",i];
        }
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataMutArr[i]] placeholderImage:JobsIMG(imageName)];
        [self.scrollView addSubview:imageView];
    }
}
#pragma mark —— UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 2.8){
        if (self.objectBlock) self.objectBlock(@1);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x < JobsMainScreen_WIDTH() * 0.5) {
        self.pageControl.currentPage = 0;
    }else if(self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 0.5 &&
             self.scrollView.contentOffset.x < JobsMainScreen_WIDTH() * 1.5){
        self.pageControl.currentPage = 1;
    }else if(self.scrollView.contentOffset.x > JobsMainScreen_WIDTH() * 1.5){
        self.pageControl.currentPage = 2;
    }else{}
}
#pragma mark —— lazyLoad
-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = UIPageControl.new;
        _pageControl.numberOfPages = 3;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = JobsRedColor;
        _pageControl.pageIndicatorTintColor = JobsWhiteColor;
        [self.view addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.bottom.offset(-JobsWidth(60));
        }];
    }return _pageControl;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView.alloc initWithFrame:UIScreen.mainScreen.bounds];
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake(0, 0);
        _scrollView.contentSize = CGSizeMake(JobsMainScreen_WIDTH() * 4, JobsMainScreen_HEIGHT());
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
    }return _scrollView;
}

-(NSMutableArray<NSString *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
        [_dataMutArr addObject:@"https://b-ssl.duitang.com/uploads/item/201503/25/20150325184145_SBu3J.jpeg"];
        [_dataMutArr addObject:@"https://b-ssl.duitang.com/uploads/item/201503/25/20150325184145_SBu3J.jpeg"];
        [_dataMutArr addObject:@"https://b-ssl.duitang.com/uploads/item/201503/25/20150325184145_SBu3J.jpeg"];
    }return _dataMutArr;
}

@end
