//
//  XZExcelVC.m
//  FM
//
//  Created by User on 8/5/24.
//  特别鸣谢 https://github.com/Mephsito23/iOS-Excel-

#import "JobsExcelVC.h"

@interface JobsExcelVC ()
/// UI
@property(nonatomic,strong)JobsExcelView *excelView;
/// Data

@end

@implementation JobsExcelVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        NSLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = JobsInternationalization(@"相关功能列表");
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    // self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    self.excelView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.gk_navigationBar.hidden = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— LazyLoad
-(JobsExcelView *)excelView{
    if(!_excelView){
        @jobs_weakify(self)
        _excelView = jobsMakeExcelView(^(__kindof JobsExcelView * _Nullable view) {
            @jobs_strongify(self)
            view.backgroundColor = JobsRedColor;
            [self.view addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.size.mas_equalTo(JobsExcelView.viewSizeByModel(nil));
            }];
            view.jobsRichViewByModel(jobsMakeExcelConfigureViewModel(^(JobsExcelConfigureViewModel * _Nullable data) {
                data.XZExcelH = JobsExcelView.viewSizeByModel(nil).height;
                data.XZExcelW = JobsExcelView.viewSizeByModel(nil).width;
                data.itemW = JobsWidth(80);
                data.topHeaderTitles = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
                    arr.add(JobsInternationalization(@"Order Time"));
                    arr.add(JobsInternationalization(@"Order No."));
                    arr.add(JobsInternationalization(@"Transaction Type"));
                    arr.add(JobsInternationalization(@"Amount"));
                    arr.add(JobsInternationalization(@"Method"));
                    arr.add(JobsInternationalization(@"Status"));
                });
                data.configureDataBy(nil);
            }));
        });
    }return _excelView;
}

@end
