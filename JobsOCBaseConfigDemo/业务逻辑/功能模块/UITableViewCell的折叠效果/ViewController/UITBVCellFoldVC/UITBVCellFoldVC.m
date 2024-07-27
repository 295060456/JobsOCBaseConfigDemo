//
//  UITBVCellFoldVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 10/2/23.
//

#import "UITBVCellFoldVC.h"

@interface UITBVCellFoldVC ()
/// UI
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)MSCommentView *commentView;

@end

@implementation UITBVCellFoldVC

-(void)dealloc{
    JobsRemoveNotification(self);;
    NSLog(@"%@",JobsLocalFunc);
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
    //    self.viewModel.textModel.text = JobsInternationalization(@"消息详情页");
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
    self.view.backgroundColor = JobsWhiteColor;
    [self setGKNav];
    self.setGKNavBackBtn(nil);
    self.gk_navigationBar.jobsVisible = YES;
    self.titleLab.alpha = 1;
    self.commentView.alpha = 1;
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

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = UILabel.new;
        _titleLab.text = JobsInternationalization(@"评论");
        _titleLab.textColor = JobsCor(@"#333333");
        _titleLab.font = UIFontWeightBoldSize(18);
        [self.view addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(JobsWidth(15));
            make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(25));
            make.height.mas_equalTo(JobsWidth(20));
        }];
        _titleLab.makeLabelByShowingType(UILabelShowingType_03);
    }return _titleLab;
}

-(MSCommentView *)commentView{
    if(!_commentView){
        _commentView = MSCommentView.new;
        [_commentView richElementsInViewWithModel:nil];
        [self.view addSubview:_commentView];
        [_commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom);
            make.left.right.bottom.equalTo(self.view);
        }];
    }return _commentView;
}

@end
