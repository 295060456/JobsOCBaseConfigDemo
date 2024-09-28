//
//  JobsIMShowVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/13.
//

#import "JobsIMShowVC.h"

@interface JobsIMShowVC ()

@property(nonatomic,strong)BaseButton *shareBtn;
@property(nonatomic,strong)JobsIMListView *listView;

@end

@implementation JobsIMShowVC

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
    {
        @jobs_weakify(self)
        self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
    //        data.add(JobsBarButtonItem(self.aboutBtn));
        });
        self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(JobsBarButtonItem(self.shareBtn));
        });
        self.makeNavByAlpha(1);
    }
    self.listView.alpha = 1;
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
#pragma mark —— 一些私有方法
-(UIViewModel *)makeData:(JobsIMListDataModel *)data{
    
    JobsIMChatInfoModel *chatInfoModel = JobsIMChatInfoModel.new;
    chatInfoModel.chatTextStr = data.contentStr;
    chatInfoModel.userNameStr = data.usernameStr;
    {
        JobsTimeModel *timeModel = self.makeSpecificTime;
        chatInfoModel.chatTextTimeStr = [NSString stringWithFormat:@"%ld:%ld:%ld",timeModel.currentHour,timeModel.currentMin,timeModel.currentSec];
    }
    chatInfoModel.userIconIMG = data.userHeaderIMG;
    chatInfoModel.identification = @"我是服务器";
    
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.data = chatInfoModel;
    return viewModel;
}
#pragma mark —— lazyLoad
-(JobsIMListView *)listView{
    if (!_listView) {
        _listView = JobsIMListView.new;
        @jobs_weakify(self)
        _listView.jobsRichViewByModel(nil);
        [_listView actionObjectBlock:^(JobsIMListDataModel *data) {
            @jobs_strongify(self)
            self.comingToPushVCByRequestParams(JobsIMVC.new,[self makeData:data]);
        }];
        [self.view addSubview:_listView];
        [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }
        }];
    }return _listView;
}

-(BaseButton *)shareBtn{
    if (!_shareBtn) {
        @jobs_weakify(self)
        _shareBtn = BaseButton.jobsInit()
            .bgColor(JobsWhiteColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(23 / 2))
            .jobsResetBtnImage(JobsBuddleIMG(@"⚽️PicResource", @"Others", nil, @"分享"))
            .onClick(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objectBlock) self.objectBlock(x);
                toast(JobsInternationalization(@"正在研发中...敬请期待"));
            }).onLongPressGesture(^(id data){
                NSLog(@"");
            });
        _shareBtn.width = JobsWidth(23);
        _shareBtn.height = JobsWidth(23);
    }return _shareBtn;
}

@end
