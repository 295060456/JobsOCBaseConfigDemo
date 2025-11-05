//
//  TestBaseLabelVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/6/20.
//

#import "TestBaseLabelVC.h"

@interface TestBaseLabelVC ()
/// UI
Prop_strong()JobsBaseLabel *titleLab;
Prop_strong()BaseLabel *baseLabel;

@end

@implementation TestBaseLabelVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = @"启动页SLOGAN".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.makeNavByAlpha(1);
    
    self.titleLab.alpha = 1;
    self.baseLabel.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— LazyLoad
-(JobsBaseLabel *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsBaseLabel.new;
        _titleLab.jobsRichViewByModel(nil);
        _titleLab.getLabel.jobsOffsetY = JobsWidth(-2);
        _titleLab.getLabel.textColor = JobsWhiteColor;
        _titleLab.getLabel.font = UIFontWeightRegularSize(12);
        _titleLab.getLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(JobsWidth(100));
            make.left.equalTo(self.view).offset(JobsWidth(100));
            make.height.mas_equalTo(JobsWidth(26));
        }];

        [_titleLab.getLabel actionRetIDByGestureRecognizerBlock:^id(UIGestureRecognizer *data) {
            JobsLog(@"JobsBaseLabel的Tap手势");
            return @1;
        }];
        
        [_titleLab.getLabel actionRetIDByGestureRecognizerBlock:^id(UIGestureRecognizer *data) {
            JobsLog(@"JobsBaseLabel的LongPress手势");
            return @1;
        }];
    }
    _titleLab.getLabel.text = JobsInternationalization(@" 真人           ");
    _titleLab.getBgImageView.image = @"优惠活动背景图_真人".img;
    
    _titleLab.getLabel.makeLabelByShowingType(UILabelShowingType_03);
    [_titleLab.getLabel appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    return _titleLab;
}

-(BaseLabel *)baseLabel{
    if (!_baseLabel) {
        @jobs_weakify(self)
        _baseLabel = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.jobsOffsetX = JobsWidth(10);
            label.text = JobsInternationalization(@"测试 -BaseLabel-");
            label.backgroundColor = JobsCyanColor;
            [self.view addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(20));
                make.left.equalTo(self.view).offset(JobsWidth(100));
                make.height.mas_equalTo(JobsWidth(26));
            }];
            [label actionRetIDByGestureRecognizerBlock:^id(UIGestureRecognizer *data) {
                JobsLog(@"BaseLabel的Tap手势");
                return @1;
            }];
            [label actionRetIDByGestureRecognizerBlock:^id(UIGestureRecognizer *data) {
                JobsLog(@"BaseLabel的LongPress手势");
                return @1;
            }];
        });
    }return _baseLabel;
}

@end
