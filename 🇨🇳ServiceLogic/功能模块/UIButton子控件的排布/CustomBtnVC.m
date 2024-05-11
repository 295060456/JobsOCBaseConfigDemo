//
//  CustomBtnVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/4.
//

#import "CustomBtnVC.h"

@interface CustomBtnVC ()

@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *btn4;

@end

@implementation CustomBtnVC

- (void)dealloc{
    NSLog(@"%@",JobsLocalFunc);
    //    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = Internationalization(@"返回");
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//        self.viewModel.textModel.text = Internationalization(@"UIButton子控件的排布");
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
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
    
    [self setGKNav];
    [self setGKNavBackBtn];
    self.gk_navigationBar.jobsVisible = YES;
    
    self.btn1.alpha = 1;
    self.btn2.alpha = 1;
    self.btn3.alpha = 1;
    self.btn4.alpha = 1;
}
#pragma mark —— lazyLoad
-(UIButton *)btn1{
    if (!_btn1) {
        _btn1 = UIButton.new;
        _btn1.normalTitle = Internationalization(@"image左、label右【系统默认状态】");
        _btn1.normalImage = JobsIMG(@"Lock");
        _btn1.normalTitleColor = JobsWhiteColor;
        _btn1.titleFont = notoSansRegular(14);
        _btn1.backgroundColor = JobsCyanColor;
    
        [self.view addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(10);
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        }];
        
        [_btn1.imageView cornerCutToCircleWithCornerRadius:JobsWidth(1)];
        [_btn1.imageView layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
        /// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        [_btn1 makeBtnLabelByShowingType:UILabelShowingType_03];
        [_btn1 layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeLeading
                                  imagePadding:JobsWidth(8)];
    }return _btn1;
}

-(UIButton *)btn2{
    if (!_btn2) {
        _btn2 = UIButton.new;
        _btn2.normalTitle = Internationalization(@"image右、label左");
        _btn2.normalImage = JobsIMG(@"Lock");
        _btn2.normalTitleColor = JobsWhiteColor;
        _btn2.titleFont = notoSansRegular(14);
        _btn2.backgroundColor = JobsCyanColor;
        
        [self.view addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn1.mas_bottom).offset(10);
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        }];
        
        [_btn2.imageView cornerCutToCircleWithCornerRadius:JobsWidth(1)];
        [_btn2.imageView layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
        [_btn2 layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeTrailing
                                  imagePadding:JobsWidth(8)];
        /// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        [_btn2 makeBtnLabelByShowingType:UILabelShowingType_03];
    }return _btn2;
}

-(UIButton *)btn3{
    if (!_btn3) {
        _btn3 = UIButton.new;
        _btn3.normalTitle = Internationalization(@"image上，label下");
        _btn3.normalImage = JobsIMG(@"Lock");
        _btn3.normalTitleColor = JobsWhiteColor;
        _btn3.titleFont = notoSansRegular(14);
        _btn3.backgroundColor = JobsCyanColor;
        
        [self.view addSubview:_btn3];
        [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn2.mas_bottom).offset(10);
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        }];
        
        [_btn3.imageView cornerCutToCircleWithCornerRadius:JobsWidth(1)];
        [_btn3.imageView layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
        /// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        [_btn3 makeBtnLabelByShowingType:UILabelShowingType_03];
        [_btn3 layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeTop
                                  imagePadding:JobsWidth(8)];
    }return _btn3;
}

-(UIButton *)btn4{
    if (!_btn4) {
        _btn4 = UIButton.new;
        _btn4.normalTitle = Internationalization(@"image下，label上");
        _btn4.normalImage = JobsIMG(@"Lock");
        _btn4.normalTitleColor = JobsWhiteColor;
        _btn4.titleFont = notoSansRegular(14);
        _btn4.backgroundColor = JobsCyanColor;
        
        [self.view addSubview:_btn4];
        [_btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.btn3.mas_bottom).offset(10);
            make.centerX.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        }];
        
        [_btn4.imageView cornerCutToCircleWithCornerRadius:JobsWidth(1)];
        [_btn4.imageView layerBorderCor:HEXCOLOR(0xEEE2C8) andBorderWidth:JobsWidth(1)];
        /// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
        [_btn4 makeBtnLabelByShowingType:UILabelShowingType_03];
        [_btn4 layoutButtonWithEdgeInsetsStyle:NSDirectionalRectEdgeBottom
                                  imagePadding:JobsWidth(8)];
    }return _btn4;
}

@end
