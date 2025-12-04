//
//  JobsTabBarCtrlDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 12/4/25.
//

#import "JobsTabBarCtrlDemoVC.h"

@interface JobsTabBarCtrlDemoVC ()

Prop_strong()JobsTabBarCtrl *tabCtrl;

@end

@implementation JobsTabBarCtrlDemoVC

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
    self.viewModel.backBtnTitleModel.text = @"返回".tr;
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
    self.viewModel.textModel.text = @"JobsTabBarCtrl@横滑 Demo（>5 个按钮）";
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

    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    self.makeNavByAlpha(1);

    // 配置 JobsTabBarCtrl（对应 Swift 里的链式调用）
    self.tabCtrl = [[[JobsTabBarCtrl alloc] init]
                    bySwipeEnabled:YES];
    [self.tabCtrl byHorizontalOnly:YES];
    [self.tabCtrl bySuppressChildVerticalScrolls:YES];
    if (@available(iOS 13.0, *)) {
        [self.tabCtrl byBarBackgroundColor:[UIColor secondarySystemBackgroundColor]];
    } else {
        [self.tabCtrl byBarBackgroundColor:[UIColor lightGrayColor]];
    }
    [self.tabCtrl byCustomBarHeight:nil];
    [self.tabCtrl byBarBottomOffset:0];
    [self.tabCtrl byBarBackgroundImage:nil];
    [self.tabCtrl byContentInset:UIEdgeInsetsMake(6, 12, 6, 12)];
    [self.tabCtrl byEqualSpacing:10];
    [self.tabCtrl byEqualVisibleRangeFrom:2 to:5];
    [self.tabCtrl byLockUnitToMaxEqualCount:YES];
    [self.tabCtrl byAutoRelayoutForBoundsChange:YES];

    @jobs_weakify(self)
    [self.tabCtrl onButtonsLayoutedWeakOwner:^(JobsTabBarCtrl *owner,
                                               NSArray<UIButton *> *btns) {
        if (btns.count > 2) {
            UIButton *centerBtn = btns[2];
            CGRect f = centerBtn.frame;
            f.origin.y -= 24.0;
            centerBtn.frame = f;
            centerBtn.layer.cornerRadius = 14.0;
            centerBtn.layer.masksToBounds = YES;
        }
    }];

    NSArray<UIButton *> *buttons = [self buildTabButtons];
    NSArray<UIViewController *> *controllers = [self buildControllers];

    [self.tabCtrl setDataSourceWithButtons:buttons controllers:controllers];

    [self addChildViewController:self.tabCtrl];
    [self.view addSubview:self.tabCtrl.view];
    self.tabCtrl.view.frame = self.view.bounds;
    [self.tabCtrl didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tabCtrl.view.frame = self.view.bounds;
}

#pragma mark - 构建按钮 / 控制器

- (NSArray<UIButton *> *)buildTabButtons {
    NSMutableArray<UIButton *> *arr = [NSMutableArray array];

    // 首页
    UIButton *home = [UIButton buttonWithType:UIButtonTypeSystem];
    [home setTitle:@"首页" forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [home setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    } else {
        [home setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [home setTitleColor:[UIColor systemRedColor] forState:UIControlStateSelected];
    home.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"house"];
        UIImage *s = [UIImage systemImageNamed:@"house.fill"];
        [home setImage:n forState:UIControlStateNormal];
        [home setImage:s forState:UIControlStateSelected];
    }
    home.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);

    // 这里没有像 Swift 链式那样处理 imagePlacement=top，
    // 你如果有 UIButton+布局 的 ObjC 分类，可以在这补一行。

    [arr addObject:home];

    // 优惠
    UIButton *discount = [UIButton buttonWithType:UIButtonTypeSystem];
    [discount setTitle:@"优惠" forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [discount setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    } else {
        [discount setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [discount setTitleColor:[UIColor systemRedColor] forState:UIControlStateSelected];
    discount.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"tag"];
        UIImage *s = [UIImage systemImageNamed:@"tag.fill"];
        [discount setImage:n forState:UIControlStateNormal];
        [discount setImage:s forState:UIControlStateSelected];
    }
    discount.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);
    [arr addObject:discount];

    // ¥99/月（原本用 JobsRichText 的那个，这里用简单的 attributedTitle 占位）
    UIButton *rich = [UIButton buttonWithType:UIButtonTypeSystem];

    NSMutableAttributedString *title =
    [[NSMutableAttributedString alloc] initWithString:@"¥99"
                                           attributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:10 weight:UIFontWeightSemibold],
        NSForegroundColorAttributeName: [UIColor systemRedColor]
    }];
    NSAttributedString *suffix =
    [[NSAttributedString alloc] initWithString:@" /月"
                                    attributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:12],
        NSForegroundColorAttributeName: [UIColor greenColor]
    }];
    [title appendAttributedString:suffix];
    [rich setAttributedTitle:title forState:UIControlStateNormal];

    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"creditcard"];
        UIImage *s = [UIImage systemImageNamed:@"creditcard.fill"];
        [rich setImage:n forState:UIControlStateNormal];
        [rich setImage:s forState:UIControlStateSelected];
    }
    rich.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);
    [arr addObject:rich];

    // 好友
    UIButton *friends = [UIButton buttonWithType:UIButtonTypeSystem];
    [friends setTitle:@"好友" forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [friends setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    } else {
        [friends setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [friends setTitleColor:[UIColor systemRedColor] forState:UIControlStateSelected];
    friends.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"person.2"];
        UIImage *s = [UIImage systemImageNamed:@"person.2.fill"];
        [friends setImage:n forState:UIControlStateNormal];
        [friends setImage:s forState:UIControlStateSelected];
    }
    friends.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);
    [arr addObject:friends];

    // 活动（原来是倒计时按钮，这里不展开 Timer 逻辑，只保留基础 UI）
    UIButton *activity = [UIButton buttonWithType:UIButtonTypeSystem];
    [activity setTitle:@"活动" forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [activity setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    } else {
        [activity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [activity setTitleColor:[UIColor systemRedColor] forState:UIControlStateSelected];
    activity.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"sparkles"];
        [activity setImage:n forState:UIControlStateNormal];
        [activity setImage:n forState:UIControlStateSelected];
    }
    activity.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);
    [arr addObject:activity];

    // 客服
    UIButton *service = [UIButton buttonWithType:UIButtonTypeSystem];
    [service setTitle:@"客服" forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [service setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    } else {
        [service setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [service setTitleColor:[UIColor systemRedColor] forState:UIControlStateSelected];
    service.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"message"];
        UIImage *s = [UIImage systemImageNamed:@"message.fill"];
        [service setImage:n forState:UIControlStateNormal];
        [service setImage:s forState:UIControlStateSelected];
    }
    service.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);
    [arr addObject:service];

    // 我的（无对应 VC，用来触发“请配置子控制器”）
    UIButton *mine = [UIButton buttonWithType:UIButtonTypeSystem];
    [mine setTitle:@"我的" forState:UIControlStateNormal];
    if (@available(iOS 13.0, *)) {
        [mine setTitleColor:[UIColor labelColor] forState:UIControlStateNormal];
    } else {
        [mine setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [mine setTitleColor:[UIColor systemRedColor] forState:UIControlStateSelected];
    mine.titleLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    if (@available(iOS 13.0, *)) {
        UIImage *n = [UIImage systemImageNamed:@"person.crop.circle"];
        UIImage *s = [UIImage systemImageNamed:@"person.crop.circle.fill"];
        [mine setImage:n forState:UIControlStateNormal];
        [mine setImage:s forState:UIControlStateSelected];
    }
    mine.contentEdgeInsets = UIEdgeInsetsMake(6, 10, 6, 10);
    [arr addObject:mine];

    return arr;
}

- (NSArray<UIViewController *> *)buildControllers {
    return @[
        ViewController_1.new,
        ViewController_2.new,
        ViewController_3.new,
        ViewController_4.new,
        ViewController_5.new,
    ];
}

@end
