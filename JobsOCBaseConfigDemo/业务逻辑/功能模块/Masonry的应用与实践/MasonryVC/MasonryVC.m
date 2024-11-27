//
//  MasonryVC.m
//  JobsOCBaseConfig
//
//  Created by Jobs Hi on 9/27/23.
//

#import "MasonryVC.h"

@interface MasonryVC ()
/// UI
@property(nonatomic,strong)MSMineView2 *view2;

@end

@implementation MasonryVC

- (void)dealloc{
    JobsRemoveNotification(self);
    NSLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
    }
    self.viewModel.backBtnTitleModel.text = JobsInternationalization(@"返回");
    self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
//    self.viewModel.textModel.text = JobsInternationalization(@"消息详情页");
    self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
    self.viewModel.textModel.font = UIFontWeightRegularSize(16);
    
    // 使用原则：底图有 + 底色有 = 优先使用底图数据
    // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
    // self.viewModel.bgImage = JobsIMG(@"内部招聘导航栏背景图");
    self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
//    self.viewModel.bgImage = JobsIMG(@"启动页SLOGAN");
    self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
    self.viewModel.navBgImage = JobsIMG(@"导航栏左侧底图");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JobsRandomColor;
    self.makeNavByAlpha(1);
    
//    [self demo1];
//    [self demo2];
//    [self demo3];
    [self demo4];
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
#pragma mark —— 一些私有方法
/// 不用Masonry，直接用frame来实现：根据字符串，一行4个元素，自动提行
-(void)demo1{
    // 设置标签容器的初始位置
    CGFloat containerX = 20;
    CGFloat containerY = 100;
    // 设置标签容器的宽度
    CGFloat containerWidth = self.view.frame.size.width - 2 * containerX;
    // 设置标签高度和间距
    __block CGFloat tagHeight = 30;
    __block CGFloat tagSpacing = 10;
    // 初始化当前行的x坐标和y坐标
    __block CGFloat currentX = containerX;
    __block CGFloat currentY = containerY;
    __block CGSize tagSize = CGSizeZero;
    // 遍历标签名称并创建标签
    for (NSString *tagName in jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable arr) {
        arr.add(JobsInternationalization(@"标签1"));
        arr.add(JobsInternationalization(@"标签2"));
        arr.add(JobsInternationalization(@"标签3"));
        arr.add(JobsInternationalization(@"标签4"));
        arr.add(JobsInternationalization(@"标签5"));
        arr.add(JobsInternationalization(@"标签6"));
        arr.add(JobsInternationalization(@"标签7"));
        arr.add(JobsInternationalization(@"标签8"));
        arr.add(JobsInternationalization(@"标签9"));
        arr.add(JobsInternationalization(@"标签10"));
    })) {
        self.view.addSubview(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.text = tagName;
            label.backgroundColor = JobsLightGrayColor;
            label.textAlignment = NSTextAlignmentCenter;
            label.layer.cornerRadius = 5.0;
            label.clipsToBounds = YES;
            // 根据标签文本计算标签宽度
            CGSize tagSize = [label sizeThatFits:CGSizeMake(containerWidth, tagHeight)];
            // 如果当前行放不下该标签，则换行
            if (currentX + tagSize.width > containerWidth) {
                currentX = containerX;
                currentY += tagHeight + tagSpacing;
            }label.frame = CGRectMake(currentX, currentY, tagSize.width, tagHeight);
        }));currentX += tagSize.width + tagSpacing;/// 更新当前行的x坐标
    }
}
/**

 用Masonry实现类似于UICollectionView的效果：
 1、父视图中的每一个子元素类似于UICollectionViewCell，我可以自定义这些元素的宽高
 2、可以统一的自定义定制每个元素之间的横向和纵向间距
 3、整个父容器的四个角必须紧贴元素，不能超出父视图容器
 4、然后实现横向等距离排布，与纵向等距离排布
 5、如果排布下来发现我之前自定义的间距会使得这些元素超出父容器，那么重新计算这个间距，使得子元素不超过父视图容器，并统一使用
 6、可以自定义元素的个数
 */
-(void)demo2{
    // 创建父视图容器
    UIView *containerView = [UIView new];
    [self.view addSubview:containerView];
    
    // 设置父视图容器的背景色为红色
    containerView.backgroundColor = [UIColor redColor];
    
    // 设置父视图容器的约束
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(100, 20, 100, 20)); // 设置四个边界紧贴父视图
    }];
    
    [self.view layoutIfNeeded];
    NSLog(@"ddd = %f",CGRectGetWidth(containerView.frame));
    
    // 创建子元素数组
    NSMutableArray<UIView *> *itemViews = [NSMutableArray array];
    
    // 自定义子元素的宽高
    CGFloat itemWidth = 50.0; // 自行设定子元素的宽度
    CGFloat itemHeight = 60.0; // 自行设定子元素的高度
    
    // 自定义横向和纵向间距
    CGFloat horizontalSpacing = 10.0;
    CGFloat verticalSpacing = 10.0;
    
    // 自定义子元素的数量
    NSInteger itemCount = 19;
    
    // 计算每行每列的数量
    NSInteger columns = floor((CGRectGetWidth(containerView.frame) - horizontalSpacing) / (itemWidth + horizontalSpacing));
    NSInteger rows = ceil((CGFloat)itemCount / columns); // 确保行数能容纳所有子元素
    
    // 重新计算横向和纵向间距
    horizontalSpacing = (CGRectGetWidth(containerView.frame) - columns * itemWidth) / (columns - 1);
    verticalSpacing = (CGRectGetHeight(containerView.frame) - rows * itemHeight) / (rows - 1);
    
    for (NSInteger row = 0; row < rows; row++) {
        for (NSInteger column = 0; column < columns; column++) {
            NSInteger index = row * columns + column;
            
            if (index < itemCount) {
                UIView *itemView = [UIView new];
                itemView.backgroundColor = [UIColor blueColor]; // 子元素背景色为蓝色
                [containerView addSubview:itemView];
                [itemViews addObject:itemView];
                
                // 设置子元素的约束
                [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(@(itemWidth)); // 设置子元素宽度
                    make.height.equalTo(@(itemHeight)); // 设置子元素高度
                    
                    // 计算子元素的位置
                    make.left.equalTo(containerView.mas_left).offset(column * (itemWidth + horizontalSpacing));
                    make.top.equalTo(containerView.mas_top).offset(row * (itemHeight + verticalSpacing));
                }];
            }
        }
    }
}
/**
 
 用Masonry实现类似于UICollectionView的效果：
 1、父视图中的每一个子元素类似于UICollectionViewCell，我可以自定义这些元素的宽高（每个子元素的宽为30 ，高为50）
 2、可以统一的自定义定制每个元素之间的横向和纵向间距
 3、对于整个子元素来讲，不能超出父视图容器，这个是大前提
 4、对于父视图容器来讲，左上角和右上角必须紧贴元素。而左下角和右下角是不需要紧贴子元素，完全一个个自动排布而来
 4、实现横向等距离排布，与纵向等距离排布
 5、优先使用我之前自定义的纵向和横向间距，只有当超出父视图容器的时候，才会重新计算间距值，摒弃我之前自定义的间距值
 */
-(void)demo3{
    //Ai失败
}
/// Masonry 动画
-(void)demo4{
    self.view2.alpha = 1;
}
#pragma mark —— lazyLoad
-(MSMineView2 *)view2{
    if(!_view2){
        _view2 = MSMineView2.new;
        _view2.jobsRichViewByModel(nil);
        [self.view addSubview:_view2];
        // 移除第一个 _view2 的约束
        [self.view2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            // 添加第一个 _view2 的约束
            make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(28)));
            make.right.equalTo(self.view).offset(JobsWidth(-10));
            make.top.equalTo(self.view).offset(JobsWidth(12));
        }];
        // 告诉视图需要更新布局
        [self.view setNeedsUpdateConstraints];
        // 执行动画
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded]; // 让视图更新布局
        } completion:^(BOOL finished) {
            // 在动画完成后，切换到第二个 _view2 的约束
            [self.view2 mas_remakeConstraints:^(MASConstraintMaker *make) {
                // 添加第二个 _view2 的约束
                make.size.mas_equalTo(MSMineView2.viewSizeByModel(nil));
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.view).offset(JobsWidth(12));
            }];
            // 再次告诉视图需要更新布局
            [self.view setNeedsUpdateConstraints];
            // 再次执行动画
            [UIView animateWithDuration:0.5 animations:^{
                [self.view layoutIfNeeded]; // 让视图更新布局
            }];
        }];
        _view2.cornerCutToCircleWithCornerRadius(MSMineView2.viewSizeByModel(nil).height / 2);
    }return _view2;
}

@end
