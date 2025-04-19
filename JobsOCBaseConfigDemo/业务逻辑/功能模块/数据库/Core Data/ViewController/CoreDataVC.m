//
//  CoreDataVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs Hi on 2024/7/6.
//

#import "CoreDataVC.h"

@interface CoreDataVC ()

Prop_strong()NSManagedObjectContext *context;

@end

@implementation CoreDataVC

- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
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
    
    self.context = ((AppDelegate *)UIApplication.sharedApplication.delegate).persistentContainer.viewContext;
    /// 插入数据
    [self insertUserWithName:@"Alice" age:25];
    [self insertUserWithName:@"Bob" age:30];
    /// 获取所有用户
    NSArray *users = [self fetchAllUsers];
    JobsLog(@"Users: %@", users);
    /// 更新用户
    if (users.count > 0) {
        NSManagedObject *user = users[0];
        [self updateUser:user newName:@"Alice Smith" newAge:26];
    }
    /// 删除用户
    if (users.count > 1) {
        NSManagedObject *user = users[1];
        [self deleteUser:user];
    }
    /// 获取更新后的用户列表
    users = [self fetchAllUsers];
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
#pragma mark —— CoreData 的增删查改
/// 增加数据
- (void)insertUserWithName:(NSString *)name
                       age:(NSInteger)age {
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                                             inManagedObjectContext:self.context];
    [newUser setValue:name forKey:@"name"];
    [newUser setValue:@(age) forKey:@"age"];
    [self saveContext];
}
/// 查询数据
- (NSArray *)fetchAllUsers {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSError *error = nil;
    NSArray *result = [self.context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        JobsLog(@"Error fetching users: %@", error);
    }return result;
}
/// 更新/改正 数据
- (void)updateUser:(NSManagedObject *)user
           newName:(NSString *)newName
            newAge:(NSInteger)newAge {
    [user setValue:newName forKey:@"name"];
    [user setValue:@(newAge) forKey:@"age"];
    [self saveContext];
}
/// 删除数据
- (void)deleteUser:(NSManagedObject *)user {
    [self.context deleteObject:user];
    [self saveContext];
}
/// 对上下文进行保存
- (void)saveContext {
    NSError *error = nil;
    if (self.context.hasChanges && ![self.context save:&error]) {
        JobsLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
#pragma mark —— lazyLoad

@end
