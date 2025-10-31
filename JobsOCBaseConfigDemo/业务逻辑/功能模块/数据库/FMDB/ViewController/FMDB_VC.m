//
//  FMDB_VC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import "FMDB_VC.h"

@interface FMDB_VC ()

@end

@implementation FMDB_VC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
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
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = @"新首页的底图".img;
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = @"导航栏左侧底图".img;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    JobsFMDBMgr *dbManager = JobsFMDBMgr.sharedManager;
    /// 插入用户
    [dbManager insertUserWithName:@"Alice" age:25];
    [dbManager insertUserWithName:@"Bob" age:30];
    /// 获取所有用户
    NSArray *users = [dbManager fetchAllUsers];
    JobsLog(@"Users: %@", users);
    /// 更新用户
    if (users.count > 0) {
        NSDictionary *user = users[0];
        NSInteger userID = [user[@"id"] integerValue];
        [dbManager updateUserWithID:userID newName:@"Alice Smith" newAge:26];
    }
    /// 删除用户
    if (users.count > 1) {
        NSDictionary *user = users[1];
        NSInteger userID = [user[@"id"] integerValue];
        [dbManager deleteUserWithID:userID];
    }
    /// 获取更新后的用户列表
    users = [dbManager fetchAllUsers];
    JobsLog(@"Updated Users: %@", users);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    JobsLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    JobsLog(@"");
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



@end
