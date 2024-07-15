//
//  GXCardViewDemoVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/7/6.
//

#import "GXCardViewDemoVC.h"

@interface GXCardViewDemoVC ()
/// UI
//@property(nonatomic,weak)IBOutlet GXCardView *cardView;
@property(nonatomic,strong)GXCardView *cardView;
@property(nonatomic,assign)NSInteger cellCount;

@end

@implementation GXCardViewDemoVC

- (void)dealloc{
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
//        self.viewModel.textModel.text = JobsInternationalization(@"GXCardViewDemo");
        self.viewModel.textModel.text = self.viewModel.textModel.attributedText.string;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");/// self.gk_navBackgroundImage 和 self.bgImageView
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);/// self.gk_navBackgroundColor 和 self.view.backgroundColor
    //    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    }
    
    self.cellCount = 10;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navigationBar.jobsVisible = YES;
    [self setGKNav];
    [self setGKNavBackBtn];
    self.view.backgroundColor = JobsRedColor;
    self.cardView.alpha = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_cardView reloadData];
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
#pragma mark —— GXCardViewDataSource
- (GXCardViewCell *)cardView:(GXCardView *)cardView
           cellForRowAtIndex:(NSInteger)index {
    GXCardItemDemoCell *cell = [cardView dequeueReusableCellWithIdentifier:@"GXCardViewCell"];
    cell.backgroundColor = JobsYellowColor;
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)index];
    cell.leftLabel.hidden = YES;
    cell.rightLabel.hidden = YES;
    cell.layer.cornerRadius = 12.0;
    return cell;
}

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return self.cellCount;
}
#pragma mark —— GXCardViewDelegate
- (void)cardView:(GXCardView *)cardView
didRemoveLastCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index {
    if (!cardView.isRepeat) {
        [cardView reloadDataAnimated:YES];
    }
}

- (void)cardView:(GXCardView *)cardView
   didRemoveCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index
       direction:(GXCardCellSwipeDirection)direction {
    NSLog(@"didRemoveCell forRowAtIndex = %ld, direction = %ld", index, direction);
    if (!cardView.isRepeat && index == 8) {
        self.cellCount = 15;
        [cardView reloadMoreDataAnimated:YES];
    }
}

- (void)cardView:(GXCardView *)cardView
  didDisplayCell:(GXCardViewCell *)cell
   forRowAtIndex:(NSInteger)index {
    NSLog(@"didDisplayCell forRowAtIndex = %ld", index);
}

- (void)cardView:(GXCardView *)cardView
     didMoveCell:(GXCardViewCell *)cell
    forMovePoint:(CGPoint)point
       direction:(GXCardCellSwipeDirection)direction {
    GXCardItemDemoCell *dcell = (GXCardItemDemoCell*)cell;
    
    dcell.leftLabel.hidden = !(direction == GXCardCellSwipeDirectionRight);
    dcell.rightLabel.hidden = !(direction == GXCardCellSwipeDirectionLeft);

    NSLog(@"move point = %@,  direction = %ld", NSStringFromCGPoint(point), direction);
}

- (IBAction)leftButtonClick:(id)sender {
    [self.cardView removeTopCardViewFromSwipe:GXCardCellSwipeDirectionLeft];
//    [self.cardView reloadDataFormIndex:2 animated:YES];
}

- (IBAction)rightButtonClick:(id)sender {
    [self.cardView removeTopCardViewFromSwipe:GXCardCellSwipeDirectionRight];
}
#pragma mark —— lazyLoad
-(GXCardView *)cardView{
    if (!_cardView) {
        _cardView = GXCardView.new;
        _cardView.dataSource = self;
        _cardView.delegate = self;
        _cardView.visibleCount = 5;
        _cardView.lineSpacing = 15.0;
        _cardView.interitemSpacing = 10.0;
        _cardView.maxAngle = 15.0;
        _cardView.maxRemoveDistance = 100.0;
    //    _cardView.isRepeat = YES; // 新加入
        [_cardView registerNib:[UINib nibWithNibName:NSStringFromClass(GXCardItemDemoCell.class) bundle:nil] forCellReuseIdentifier:@"GXCardViewCell"];
        
        [self.view addSubview:_cardView];
        [_cardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }return _cardView;
}

@end
