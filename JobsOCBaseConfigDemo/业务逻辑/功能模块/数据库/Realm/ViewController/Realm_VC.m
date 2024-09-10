//
//  Realm_VC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import "Realm_VC.h"

@interface Realm_VC ()

@end

@implementation Realm_VC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.setupNavigationBarHidden = YES;
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(18);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.bgImage = JobsIMG(@"新首页的底图");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /// 插入数据
    [self insertUserWithName:@"Alice" age:25];
    [self insertUserWithName:@"Bob" age:30];
    /// 查询所有用户
    NSArray *users = self.fetchAllUsers;
    NSLog(@"Users: %@", users);
    /// 更新用户
    if (users.count > 0) {
        User_Realm *user = users[0];
        [self updateUser:user newName:@"Alice Smith" newAge:26];
    }
    /// 删除用户
    if (users.count > 1) {
        User_Realm *user = users[1];
        [self deleteUser:user];
    }
    /// 获取更新后的用户列表
    users = [self fetchAllUsers];
    NSLog(@"Updated Users: %@", users);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"");
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"");
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
#pragma mark —— Realm 的增删查改
/// 插入数据
- (void)insertUserWithName:(NSString *)name age:(NSInteger)age {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        User_Realm *newUser = User_Realm.new;
        newUser.name = name;
        newUser.age = age;
        [realm addObject:newUser];
    }];
}
/// 查询数据
- (NSArray *)fetchAllUsers {
    RLMResults<User_Realm *> *results = User_Realm.allObjects;
    NSMutableArray *users = NSMutableArray.array;
    for (User_Realm *user in results) {
        [users addObject:user];
    }return users;
}
/// 更新/改正 数据
- (void)updateUser:(User_Realm *)user
           newName:(NSString *)newName
            newAge:(NSInteger)newAge {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        user.name = newName;
        user.age = newAge;
    }];
}
/// 删除数据
- (void)deleteUser:(User_Realm *)user {
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm transactionWithBlock:^{
        [realm deleteObject:user];
    }];
}
#pragma mark —— lazyLoad

@end
