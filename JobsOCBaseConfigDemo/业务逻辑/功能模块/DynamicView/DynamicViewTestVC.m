//
//  DynamicViewTestVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "DynamicViewTestVC.h"

@interface DynamicViewTestVC ()

@property(nonatomic,strong)UIImageView *gifImageView;
@property(nonatomic,strong)NSString *path;

@end

@implementation DynamicViewTestVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    JobsRemoveNotification(self);
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
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsYellowColor;
    self.setGKNav(nil);
    self.setGKNavBackBtn(nil);
    self.gifImageView.alpha = 1;
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
#pragma mark —— lazyLoad
-(UIImageView *)gifImageView{
    if (!_gifImageView) {
        _gifImageView = UIImageView.new;
        _gifImageView.image = self.image;
        [self.view addSubview:_gifImageView];
        [_gifImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _gifImageView;
}

-(NSString *)path{
    if (!_path) {
        _path = [NSBundle.mainBundle pathForResource:@"GIF大图"
                                              ofType:@"gif"];
    }return _path;
}
@synthesize data = _data;
-(NSData *)data{
    if (!_data) {
        _data = [NSData dataWithContentsOfFile:self.path];
    }return _data;
}
@synthesize image = _image;
-(UIImage *)image{
    if (!_image) {
        _image = [UIImage sd_imageWithGIFData:self.data];
    }return _image;
}


@end
